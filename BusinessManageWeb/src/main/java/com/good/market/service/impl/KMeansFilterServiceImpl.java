package com.good.market.service.impl;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.hadoop.conf.Configuration;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.good.comm.enu.BizType;
import com.good.comm.enu.ExecuteResult;
import com.good.comm.enu.FunctionType;
import com.good.db.IPage;
import com.good.market.bean.SysParamPo;
import com.good.market.bean.KMeansResultPo;
import com.good.market.bean.ScenePo;
import com.good.market.mapper.KMeansFilterDao;
import com.good.market.mapper.KMeansResultDao;
import com.good.market.mapper.SceneDao;
import com.good.market.mapper.UserBlDao;
import com.good.market.service.KMeansFilterService;
import com.good.market.service.KMeansResultService;
import com.good.market.service.SceneService;
import com.good.sys.MsgConstants;
import com.good.sys.ServiceException;
import com.good.sys.WebUtils;
import com.good.sys.bean.LogonInfo;
import com.good.sys.bean.Operator;
import com.good.sys.service.AuditLogService;
import com.good.utils.HdfsUtil;
import com.good.utils.RandomUtil;
import com.good.utils.TimeTool;
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
    private SysParamPo paramDao;
    
    @Autowired
    private AuditLogService logService;
    
    @Override
    public Map<String,Object> runKMeansFilter(HttpServletRequest request,Operator oper) throws ServiceException{
        List<String> filterList = new ArrayList<String>();
        List<String> clusterList = new ArrayList<String>();
        ExecuteResult result = ExecuteResult.UNKNOWN;
        Map<String,Object> condition = new HashMap<String,Object>();
        Map<String,Object> msgMap = new HashMap<String,Object>();
        
        LogonInfo linfo = (LogonInfo) WebUtils.getLogInfo(request);
        String userId = linfo.getOperator().getUserID();
        String resultId;
    	String filterRes;
    	String clusterNo;
    	String sceneName;
        try {
        	resultId = request.getParameter("resultId");
        	String filterArgs = request.getParameter("personNo")+":"+request.getParameter("distanceMax");
        	condition.put("resultId", resultId);
        	condition.put("filterArgs", filterArgs);

        	synchronized(this){
        		Map<String,Object> filterPath = kMeansFilterDao.getFilterPath(condition);
        		if(filterPath==null){
//        			List<String> msglist;
                	String username = paramDao.getParams("SPARK_CLIENT_USER", "EM").getParaValue();
            		String host = paramDao.getParams("SPARK_CLIENT_HOST", "EM").getParaValue();
            		String pubKeyPath = paramDao.getParams("SPARK_SSH_PUBKEY", "EM").getParaValue();
            		String filterRoot = paramDao.getParams("PRODUCE_FILTER_PATH", "EM").getParaValue();
//            		String preRoot = paramDao.getParams("TRAIN_PREDICT_PATH", "EM").getParaValue();
//            		String trainModelRoot = paramDao.getParams("TRAIN_MODEL_PATH", "EM").getParaValue();
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

                    JSch jsch = new JSch();

        			jsch.addIdentity(pubKeyPath);

        	        Session session=jsch.getSession(username, host, 22);//为了连接做准备
        	        session.setConfig("StrictHostKeyChecking", "no");
        	        session.connect();
        	        String command = "cd " + wbRoot + "sql/filter/KMeans;" + wbSpark + "spark-submit --class com.testspark.FilterKMeansResult FilterKMeansResult.jar "
        	        		+ request.getParameter("trainRes") + " " + filterRes + " " 
        	        		+ clusterNo + " " + filterArgs + " " + userId + " " + sceneId + " " + resultId;

        	        ChannelExec channel=(ChannelExec)session.openChannel("exec");
        	        logger.info(command);
        	        channel.setCommand(command);

        	        BufferedReader in = new BufferedReader(new InputStreamReader(channel.getInputStream()));
        	
        	        channel.connect();
        	        String msg;
        	        while((msg = in.readLine()) != null){
           	        	logger.info(msg);
           	        }

            	    in.close();  
        	        channel.disconnect();
        	        session.disconnect();
        		}else{
        			filterRes = (String)filterPath.get("filterRes");
        			clusterNo = (String)filterPath.get("clusterNo");
//        			sceneName = (String)filterPath.get("sceneName");
        		}
        	}
        	if(filterRes==null||filterRes==""||clusterNo==null||clusterNo=="")return null;
        	Configuration conf = new Configuration();
        	conf.set("fs.hdfs.impl", "org.apache.hadoop.hdfs.DistributedFileSystem");
        	InputStream filterIn = HdfsUtil.getFromHDFS(filterRes , conf);
        	
        	BufferedReader filterBuf = new BufferedReader(new InputStreamReader(filterIn));
        	String line;
        	while((line = filterBuf.readLine()) != null){
        		filterList.add(line);
            	logger.info(line);
        	}
        	filterIn.close();
        	filterBuf.close();
        	InputStream clusterIn = HdfsUtil.getFromHDFS(clusterNo , conf);
        	BufferedReader clusterBuf = new BufferedReader(new InputStreamReader(clusterIn));
        	line = "";
        	while((line = clusterBuf.readLine()) != null){
        		clusterList.add(line);
            	logger.info(line);
        	}
        	clusterIn.close();
        	clusterBuf.close();
        	msgMap.put("filterList", filterList);
        	msgMap.put("clusterList", clusterList);
//        	msgMap.put("sceneName", sceneName);

	        result = ExecuteResult.SUCCESS;
		} catch (JSchException e) {
			// TODO Auto-generated catch block
	        result = ExecuteResult.FAIL;
			e.printStackTrace();
		} catch (Exception ex){
	        result = ExecuteResult.FAIL;
			ex.printStackTrace();
		} finally {
            logService.addAuditLog(oper, BizType.EM, "runKMeansFilter", "调用KMeans结果过滤算法", resultId, FunctionType.NORMAL, result);
        }
        return msgMap;
    }
    
}
