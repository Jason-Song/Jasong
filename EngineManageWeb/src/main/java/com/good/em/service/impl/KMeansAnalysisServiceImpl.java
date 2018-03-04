package com.good.em.service.impl;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.hadoop.conf.Configuration;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.good.comm.enu.BizType;
import com.good.comm.enu.ExecuteResult;
import com.good.comm.enu.FunctionType;
import com.good.em.bean.ProduceModelPo;
import com.good.sys.mapper.KMeansAnalysisDao;
import com.good.em.service.KMeansAnalysisService;
import com.good.sys.ServiceException;
import com.good.sys.bean.Operator;
import com.good.sys.mapper.SystemParamDao;
import com.good.sys.service.AuditLogService;
import com.good.utils.HdfsUtil;
import com.good.utils.TimeTool;
import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;


@Service
public class KMeansAnalysisServiceImpl implements KMeansAnalysisService {
	
    private static Logger logger = LoggerFactory.getLogger(KMeansAnalysisServiceImpl.class);

    @Autowired
    private KMeansAnalysisDao kMeansAnalysisDao;
    
	@Autowired
    private SystemParamDao paramDao;
    
    @Autowired
    private AuditLogService logService;
    
    @Override
    public Map<String,Object> getEuclidDistance(Map<String,Object> condition,Operator oper) throws ServiceException{
        List<String> msglist = new ArrayList<String>();
        ExecuteResult result = ExecuteResult.UNKNOWN;
        Map<String,Object> res = new HashMap<String,Object>();
        try {
        	Map<String,Object> trainRes = kMeansAnalysisDao.getTrainRes(condition);
        	String kmeansId = trainRes.get("ID").toString();
        	String path = (String)trainRes.get("TRAIN_RES");
        	List<Map<String,String>> centers = kMeansAnalysisDao.getCenters(kmeansId);
        	Configuration conf = new Configuration();
        	conf.set("fs.hdfs.impl", "org.apache.hadoop.hdfs.DistributedFileSystem");
        	InputStream in = HdfsUtil.getFromHDFS(path , conf);
        	
        	BufferedReader buf = new BufferedReader(new InputStreamReader(in));
        	String line = "";
        	while((line = buf.readLine()) != null){
        		msglist.add(line);
            	//logger.info(line);
        	}
        	res.put("distances", msglist);
        	res.put("centers", centers);
        	res.put("trainRes", trainRes);
    	    in.close();
    	    buf.close();
	        result = ExecuteResult.SUCCESS;
		} catch (Exception ex){
	        result = ExecuteResult.FAIL;
			ex.printStackTrace();
		} finally {
            logService.addAuditLog(oper, BizType.EM, "getEuclidDistance", "获取欧式距离数据", msglist.toString().substring(0,20), FunctionType.QUERY, result);
        }
        return res;
    }
    
    @Override    
    public void runApplyModel(ProduceModelPo produceModel,Operator oper) throws ServiceException{
    	ExecuteResult result = ExecuteResult.UNKNOWN;
        Date nowDate = new Date();
        String now = TimeTool.paserString(nowDate, "yyyy-MM-dd HH:mm:ss");
        Map<String,Object> condition=new HashMap<String,Object>();
        
    	String userId = oper.getUserID();
    	String file1name = produceModel.getRandom();
    	try {
    		String pubKeyPath = paramDao.getParams("SPARK_SSH_PUBKEY", "EM").getParaValue();
    		String username = paramDao.getParams("SPARK_CLIENT_USER", "EM").getParaValue();
    		String host = paramDao.getParams("SPARK_CLIENT_HOST", "EM").getParaValue();
    		String wbRoot = paramDao.getParams("WB_ROOT_PATH", "EM").getParaValue();
    		String produceModelRoot = paramDao.getParams("PRODUCE_MODEL_PATH", "EM").getParaValue();
    		String trainModelRoot = paramDao.getParams("TRAIN_MODEL_PATH", "EM").getParaValue();
    		
    		File file1 = new File(file1name);
 	        if(!file1.exists()){
 	        	Boolean flag1 = file1.createNewFile();
 	        	logger.info("创建进度条数据文件："+flag1.toString());
 	        	if(!flag1)return;
 	        }
 	        
    		JSch jsch = new JSch();
    		jsch.addIdentity(pubKeyPath);
    		synchronized(this){
	    		Session session=jsch.getSession(username, host, 22);//为了连接做准备
	    		session.setConfig("StrictHostKeyChecking", "no");
	    		session.connect();
	    		int sceneId = produceModel.getScene();
	    		String command = "cd " + wbRoot + "ml/script;./applyHdfsModel.sh KMeans " 
	    					+ produceModel.getModelNo() + " " + sceneId + " " + trainModelRoot + " "
	    					+ produceModelRoot;
	    		
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
	    		condition.put("modelType", 6);
	    		condition.put("sceneId", sceneId);
	    		Integer modelId = kMeansAnalysisDao.getModelId(condition);
	    		if(modelId != null && modelId.intValue()>0){
	    			produceModel.setLastUpdUser(userId);
	    			produceModel.setLastUpdTime(now);
	    			produceModel.setId(modelId);
	    			kMeansAnalysisDao.updateProduceModel(produceModel);
	    		}else{
	    			produceModel.setCreateUser(userId);
	    			produceModel.setCreateTime(now);
	    			kMeansAnalysisDao.insertProduceModel(produceModel);
	    		}
    		}
    		result = ExecuteResult.SUCCESS;
    	} catch (JSchException e) {
    		// TODO Auto-generated catch block
    		result = ExecuteResult.FAIL;
    		e.printStackTrace();
    	} catch (Exception ex){
    		result = ExecuteResult.FAIL;
    		ex.printStackTrace();
    	} finally {
    		logService.addAuditLog(oper, BizType.EM, "runApplyModel", "应用KMeans模型", produceModel.getModelNo(), FunctionType.NORMAL, result);
    	}
    }
    
	public List<String> modelNoList(String fileId) throws ServiceException{
		return kMeansAnalysisDao.modelNoList(fileId);
	}
	
	public Map<String,Object> sceneFileInfo(String fileId) throws ServiceException{
		return kMeansAnalysisDao.sceneFileInfo(fileId);
	}
	
	public Map<String,Object> resultInfo(String kMeansId) throws ServiceException{
		return kMeansAnalysisDao.resultInfo(kMeansId);
	}
	
}
