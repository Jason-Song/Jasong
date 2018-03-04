package com.good.market.service.impl;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.hadoop.conf.Configuration;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.good.comm.enu.BizType;
import com.good.comm.enu.ExecuteResult;
import com.good.comm.enu.FunctionType;
import com.good.market.bean.SysParamPo;
import com.good.sys.mapper.KMeansFilterDao;
import com.good.sys.mapper.UserBlDao;
import com.good.market.service.KMeansFilterService;
import com.good.sys.ServiceException;
import com.good.sys.WebUtils;
import com.good.sys.bean.LogonInfo;
import com.good.sys.bean.Operator;
import com.good.sys.mapper.SystemParamDao;
import com.good.sys.service.AuditLogService;
import com.good.utils.HdfsUtil;
import com.good.utils.RandomUtil;
import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;


@Service
public class KMeansFilterServiceImpl implements KMeansFilterService {
	
    private static Logger logger = LoggerFactory.getLogger(KMeansFilterServiceImpl.class);

    @Autowired
    private KMeansFilterDao kMeansFilterDao;
    
    @Autowired
    private UserBlDao userDao;
    
    @Autowired
    private SystemParamDao paramDao;
    
    @Autowired
    private AuditLogService logService;
    
    @Override
    public void runSQLFilter(HttpServletRequest request,Operator oper) throws ServiceException{
        ExecuteResult result = ExecuteResult.UNKNOWN;
        Map<String,Object> condition = new HashMap<String,Object>();
        
        LogonInfo linfo = (LogonInfo) WebUtils.getLogInfo(request);
        String userId = linfo.getOperator().getUserID();
        String resultId = "";
    	String filterRes;
    	String clusterNo;
    	String trainRes = request.getParameter("trainRes");
    	String marchPath = "/progress/"+userId + trainRes.substring(trainRes.lastIndexOf("/")+1);
    	ServletContext sc = request.getServletContext();
    	String file1name = sc.getRealPath(marchPath+"(1)");
    	String file2name = sc.getRealPath(marchPath+"(2)");
    	String file3name = sc.getRealPath(marchPath+"(3)");

        try {
        	resultId = request.getParameter("resultId");
        	String filterArgs = request.getParameter("filterArgs");
        	condition.put("resultId", resultId);
        	condition.put("filterArgs", filterArgs);
        	synchronized(this){
        		Map<String,Object> filterPath = kMeansFilterDao.getFilterPath(condition);

        		if(filterPath==null){
                	String username = paramDao.getParams("SPARK_CLIENT_USER", "EM").getParaValue();
            		String host = paramDao.getParams("SPARK_CLIENT_HOST", "EM").getParaValue();
            		String pubKeyPath = paramDao.getParams("SPARK_SSH_PUBKEY", "EM").getParaValue();
            		String filterRoot = paramDao.getParams("SQL_FILTER_PATH", "EM").getParaValue();
            		SysParamPo sparkHome = paramDao.getParams("WB_SPARK_HOME", "EM");
        			String wbSpark = "";
            		if(sparkHome!=null) wbSpark = sparkHome.getParaValue()+"bin/";
            		String wbRoot = paramDao.getParams("WB_ROOT_PATH", "EM").getParaValue();

            		String filterName = RandomUtil.getRandomFileName();
            		String clusterName = RandomUtil.getRandomFileName();
            		String sceneId = request.getParameter("sceneId");
            		String dataRoot = filterRoot + sceneId +"/KMeans/";
            		filterRes = dataRoot + filterName;
            		clusterNo = dataRoot + clusterName;
        	        File file1 = new File(file1name);
        	        if(!file1.exists()){
        	        	Boolean flag1 = file1.createNewFile();
        	        	logger.info("flag1=="+flag1.toString());
        	        	if(!flag1)return;
        	        }
                    JSch jsch = new JSch();

        			jsch.addIdentity(pubKeyPath);

        	        Session session=jsch.getSession(username, host, 22);//为了连接做准备
        	        session.setConfig("StrictHostKeyChecking", "no");
        	        session.connect();
        	        String command = "cd " + wbRoot + "sql/filter/KMeans;" + wbSpark + "spark-submit --class com.testspark.FilterKMeansResult FilterKMeansResult.jar "
        	        		+ trainRes + "/part-00000 " + filterRes + " " 
        	        		+ clusterNo + " " + filterArgs + " " + userId + " " + sceneId + " " + resultId;

        	        ChannelExec channel=(ChannelExec)session.openChannel("exec");
        	        logger.info(command);
        	        channel.setCommand(command);

        	        BufferedReader in = new BufferedReader(new InputStreamReader(channel.getInputStream()));
        	        OutputStream os = new FileOutputStream(file1name);
        	        
        	        channel.connect();
        	        String msg;
        	        while((msg = in.readLine()) != null){
           	        	logger.info(msg);
           	        	os.write((msg+"\n").getBytes());
           	        }
        	        os.write("OOF".getBytes());
        	        logger.info("os结束OOF");
        	        os.flush();
        	        os.close();
            	    in.close();  
        	        channel.disconnect();
        	        session.disconnect();
        		}else{
        			filterRes = (String)filterPath.get("FILTERRES");
        			clusterNo = (String)filterPath.get("CLUSTERNO");
        		}
        	}

        	if(filterRes==null||"".equals(filterRes)||clusterNo==null||"".equals(clusterNo))return;
	        File file2 = new File(file2name);
	        if(!file2.exists()){
	        	Boolean flag2 = file2.createNewFile();
	        	logger.info("flag2=="+flag2.toString());
	        	if(!flag2)return;
	        }
        	Configuration conf = new Configuration();
        	conf.set("fs.hdfs.impl", "org.apache.hadoop.hdfs.DistributedFileSystem");
        	InputStream filterIn = HdfsUtil.getFromHDFS(filterRes , conf);

        	BufferedReader filterBuf = new BufferedReader(new InputStreamReader(filterIn));
	        OutputStream filterOs = new FileOutputStream(file2name);

        	String line;
        	while((line = filterBuf.readLine()) != null){
        		filterOs.write((line+"\n").getBytes());
        	}
        	filterOs.write("OOF".getBytes());
        	filterOs.flush();
        	filterOs.close();
        	filterIn.close();
        	filterBuf.close();
	        File file3 = new File(file3name);
	        if(!file3.exists()){
	        	Boolean flag3 = file3.createNewFile();
	        	logger.info("flag3=="+flag3.toString());
	        	if(!flag3)return;
	        }
	        
        	InputStream clusterIn = HdfsUtil.getFromHDFS(clusterNo , conf);
        	BufferedReader clusterBuf = new BufferedReader(new InputStreamReader(clusterIn));
	        OutputStream clusterOs = new FileOutputStream(file3name);

        	line = "";
        	while((line = clusterBuf.readLine()) != null){
        		clusterOs.write((line+"\n").getBytes());
        	}
        	clusterOs.write("OOF".getBytes());
        	clusterOs.flush();
        	clusterOs.close();
        	clusterIn.close();
        	clusterBuf.close();

	        result = ExecuteResult.SUCCESS;
		} catch (JSchException e) {
			// TODO Auto-generated catch block
	        result = ExecuteResult.FAIL;
			e.printStackTrace();
		} catch (Exception ex){
	        result = ExecuteResult.FAIL;
			ex.printStackTrace();
		} finally {
            logService.addAuditLog(oper, BizType.MARKET, "runKMeansFilter", "调用KMeans结果过滤算法", resultId, FunctionType.NORMAL, result);
        }
    }
    
    @Override
	public List<Map<String, String>> getCenters(String kMeansId) throws Exception {
		return kMeansFilterDao.getCenters(kMeansId);
	}
	
}
