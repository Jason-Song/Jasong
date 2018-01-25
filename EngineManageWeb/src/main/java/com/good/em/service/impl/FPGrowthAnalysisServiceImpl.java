package com.good.em.service.impl;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
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
import com.good.em.mapper.FPGrowthAnalysisDao;
import com.good.em.mapper.KMeansAnalysisDao;
import com.good.em.service.FPGrowthAnalysisService;
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
public class FPGrowthAnalysisServiceImpl implements FPGrowthAnalysisService {
	
    private static Logger logger = LoggerFactory.getLogger(FPGrowthAnalysisServiceImpl.class);

    @Autowired
    private FPGrowthAnalysisDao fPGrowthAnalysisDao;
    
    @Autowired
    private KMeansAnalysisDao kMeansAnalysisDao;
    
	@Autowired
    private SystemParamDao paramDao;
    
    @Autowired
    private AuditLogService logService;
    
    @Override
    public Map<String,Object> getFrequentRes(Map<String,Object> condition,Operator oper) throws ServiceException{
        List<String> freq = new ArrayList<String>();
        List<String> pre = new ArrayList<String>();
        List<String> rule = new ArrayList<String>();
        ExecuteResult result = ExecuteResult.UNKNOWN;
        Map<String,Object> res = new HashMap<String,Object>();
        String rulePath="";
        try {
        	Map<String,Object> trainRes = fPGrowthAnalysisDao.getTrainRes(condition);
        	//BigDecimal kmeansId = (BigDecimal)trainRes.get("ID");
        	String path = (String)trainRes.get("TRAIN_RES");
        	rulePath = (String)trainRes.get("RULE_RES");
        	String[] freqRes = path.split("\\|");
        	//List<Map<String,String>> centers = kMeansAnalysisDao.getCenters(kmeansId);
        	Configuration conf = new Configuration();
        	conf.set("fs.hdfs.impl", "org.apache.hadoop.hdfs.DistributedFileSystem");
        	
        	InputStream freqIn = HdfsUtil.getFromHDFS(freqRes[0] , conf);
        	BufferedReader freqBuf = new BufferedReader(new InputStreamReader(freqIn));
        	String line = "";
        	while((line = freqBuf.readLine()) != null){
        		freq.add(line);
            	//logger.info(line);
        	}
        	freqIn.close();
        	freqBuf.close();
        	InputStream preIn = HdfsUtil.getFromHDFS(freqRes[1] , conf);
        	BufferedReader preBuf = new BufferedReader(new InputStreamReader(preIn));
        	line = "";
        	while((line = preBuf.readLine()) != null){
        		pre.add(line);
        		//logger.info(line);
        	}
        	preIn.close();
        	preBuf.close();
        	InputStream ruleIn = HdfsUtil.getFromHDFS(rulePath , conf);
        	BufferedReader ruleBuf = new BufferedReader(new InputStreamReader(ruleIn));
        	line = "";
        	while((line = ruleBuf.readLine()) != null){
        		rule.add(line);
        		//logger.info(line);
        	}
        	ruleIn.close();
        	ruleBuf.close();

        	res.put("freq", freq);
        	res.put("pre", pre);
        	res.put("rule", rule);
        	res.put("trainRes", trainRes);
	        result = ExecuteResult.SUCCESS;
		} catch (Exception ex){
	        result = ExecuteResult.FAIL;
			ex.printStackTrace();
		} finally {
            logService.addAuditLog(oper, BizType.EM, "getFrequentRes", "获取频次、预测结果、频次模型", rulePath, FunctionType.QUERY, result);
        }
        return res;
    }
    
    @Override  
    public List<String> runApplyModel(ProduceModelPo produceModel,Operator oper) throws ServiceException{
    	List<String> msglist = new ArrayList<String>();
    	ExecuteResult result = ExecuteResult.UNKNOWN;
        Date nowDate = new Date();
        String now = TimeTool.paserString(nowDate, "yyyy-MM-dd HH:mm:ss");
        Map<String,Object> condition=new HashMap<String,Object>();
        
    	String userId = oper.getUserID();
    	try {
    		String pubKeyPath = paramDao.getParams("SPARK_SSH_PUBKEY", "EM").getParaValue();
    		String username = paramDao.getParams("SPARK_CLIENT_USER", "EM").getParaValue();
    		String host = paramDao.getParams("SPARK_CLIENT_HOST", "EM").getParaValue();
    		String wbRoot = paramDao.getParams("WB_ROOT_PATH", "EM").getParaValue();
    		String produceModelRoot = paramDao.getParams("PRODUCE_MODEL_PATH", "EM").getParaValue();
    		String trainModelRoot = paramDao.getParams("TRAIN_MODEL_PATH", "EM").getParaValue();

    		JSch jsch = new JSch();
    		
    		jsch.addIdentity(pubKeyPath);
    		synchronized(this){
	    		Session session=jsch.getSession(username, host, 22);//为了连接做准备
	    		session.setConfig("StrictHostKeyChecking", "no");
	    		session.connect();
	    		int sceneId = produceModel.getScene();
	    		String command = "cd " + wbRoot + "ml/script;./applyModel.sh FPGrowth " 
	    					+ produceModel.getModelNo() + " " + sceneId + " " + trainModelRoot + " "
	    					+ produceModelRoot;
	    		
	    		ChannelExec channel=(ChannelExec)session.openChannel("exec");
	    		logger.info(command);
	    		channel.setCommand(command);
	    		
	    		BufferedReader in = new BufferedReader(new InputStreamReader(channel.getInputStream()));
	    		
	    		channel.connect();
	    		String msg;
	    		while((msg = in.readLine()) != null){
	    			logger.info(msg);
	    			msglist.add(msg);
	    		}
	    		
	    		in.close();  
	    		channel.disconnect();
	    		session.disconnect();
	    		condition.put("modelType", 9);
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
    		logService.addAuditLog(oper, BizType.EM, "runApplyModel", "应用FPGrowth模型", produceModel.getModelNo(), FunctionType.NORMAL, result);
    	}
    	return msglist;
    }
    
	public List<String> modelNoList(String fileId) throws ServiceException{
		return fPGrowthAnalysisDao.modelNoList(fileId);
	}
	
//	public Map<String,Object> sceneFileInfo(String fileId) throws ServiceException{
//		return kMeansAnalysisDao.sceneFileInfo(fileId);
//	}
	
}
