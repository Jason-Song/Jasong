package com.good.market.service.impl;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.good.comm.enu.BizType;
import com.good.comm.enu.ExecuteResult;
import com.good.comm.enu.FunctionType;
import com.good.market.bean.SysParamPo;
import com.good.market.mapper.ProduceModelDao;
import com.good.market.mapper.UserBlDao;
import com.good.market.service.ProduceModelService;
import com.good.sys.ServiceException;
import com.good.sys.bean.Operator;
import com.good.sys.mapper.SystemParamDao;
import com.good.sys.service.AuditLogService;
import com.good.utils.RandomUtil;
import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;


@Service
public class ProduceModelServiceImpl implements ProduceModelService {
	
    private static Logger logger = LoggerFactory.getLogger(ProduceModelServiceImpl.class);

    @Autowired
    private ProduceModelDao produceModelDao;
    
    @Autowired
    private UserBlDao userDao;
    
    @Autowired
    private AuditLogService logService;
    
	@Autowired
    private SystemParamDao paramDao;
    
    @Override
    public List<String> modelPredict(HttpServletRequest request,Operator oper) throws ServiceException{
		List<String> msglist = new ArrayList<String>();
		ExecuteResult result = ExecuteResult.UNKNOWN;
		
	    String preName = RandomUtil.getRandomFileName();		
		String userId = oper.getUserID();
		try {
    		String username = paramDao.getParams("SPARK_CLIENT_USER", "EM").getParaValue();
    		String host = paramDao.getParams("SPARK_CLIENT_HOST", "EM").getParaValue();
    		String pubKeyPath = paramDao.getParams("SPARK_SSH_PUBKEY", "EM").getParaValue();
    		String upRoot = paramDao.getParams("PRODUCE_UPLOAD_PATH", "EM").getParaValue();
    		String preRoot = paramDao.getParams("PRODUCE_PREDICT_PATH", "EM").getParaValue();
    		String produceModelRoot = paramDao.getParams("PRODUCE_MODEL_PATH", "EM").getParaValue();
    		SysParamPo sparkHome = paramDao.getParams("WB_SPARK_HOME", "EM");
			String wbSpark = "";
    		if(sparkHome!=null) wbSpark = sparkHome.getParaValue()+"bin/";
    		String wbRoot = paramDao.getParams("WB_ROOT_PATH", "EM").getParaValue();
    		
    		int modelType = Integer.parseInt(request.getParameter("modelType"));
    		String command = "";
    		String sceneId = request.getParameter("sceneId");
    		switch(modelType){
    			case 6:
    				command = "cd " + wbRoot + "ml/package/produce/KMeans;" + wbSpark 
	        			+ "spark-submit --class com.testspark.WbKMeans KMeans.jar " + upRoot 
	        			+ request.getParameter("hdfsName") + " " + preRoot + preName + " " 
	        			+ request.getParameter("fileId") + " " + userId + " "
	        			+ sceneId +" " + produceModelRoot + sceneId + "/KMeans";
	    			break;
    			default:
    				break;
    		}
    		logger.info(command);

			JSch jsch = new JSch();
			jsch.addIdentity(pubKeyPath);
    		Session session=jsch.getSession(username, host, 22);//为了连接做准备
    		session.setConfig("StrictHostKeyChecking", "no");
    		session.connect();
    		
    		ChannelExec channel=(ChannelExec)session.openChannel("exec");
    		channel.setCommand(command);
    		
    		BufferedReader in = new BufferedReader(new InputStreamReader(channel.getInputStream()));
   
    		channel.connect();
    		String msg;
    		while((msg = in.readLine()) != null){
    			//logger.info(msg);
    			msglist.add(msg);
    		}
    		
    		in.close();  
    		channel.disconnect();
    		session.disconnect();
			
			result = ExecuteResult.SUCCESS;
		} catch (JSchException e) {
			// TODO Auto-generated catch block
			result = ExecuteResult.FAIL;
			e.printStackTrace();
		} catch (Exception ex){
			result = ExecuteResult.FAIL;
			ex.printStackTrace();
		} finally {
			logService.addAuditLog(oper, BizType.MARKET, "modelPredict", "模型预测", preName , FunctionType.NORMAL, result);
		}
		return msglist;
    }
    
    @Override
    public List<Map<String,String>> produceModelList(String sceneId){
    	return produceModelDao.produceModelList(sceneId);
    }
    
    @Override
    public Map<String,Object> getProductData(String fileId) throws ServiceException{
    	return produceModelDao.getProductData(fileId);
    }

}
