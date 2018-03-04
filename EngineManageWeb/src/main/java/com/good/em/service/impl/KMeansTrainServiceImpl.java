package com.good.em.service.impl;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.good.comm.enu.BizType;
import com.good.comm.enu.ExecuteResult;
import com.good.comm.enu.FunctionType;
import com.good.em.bean.SysParamPo;
import com.good.sys.mapper.TrainDataDao;
import com.good.sys.mapper.UserBlDao;
import com.good.em.service.KMeansTrainService;
import com.good.sys.ServiceException;
import com.good.sys.WebUtils;
import com.good.sys.bean.LogonInfo;
import com.good.sys.bean.Operator;
import com.good.sys.mapper.SystemParamDao;
import com.good.sys.service.AuditLogService;
import com.good.utils.RandomUtil;
import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;


@Service
public class KMeansTrainServiceImpl implements KMeansTrainService {
	
    private static Logger logger = LoggerFactory.getLogger(KMeansTrainServiceImpl.class);

    @Autowired
    private TrainDataDao trainDataDao;
    
    @Autowired
    private UserBlDao userDao;
    
	@Autowired
    private SystemParamDao paramDao;
    
    @Autowired
    private AuditLogService logService;
    
    @Override
    public void runKMeansTrain(HttpServletRequest request,Operator oper) throws ServiceException{
        ExecuteResult result = ExecuteResult.UNKNOWN;

        LogonInfo linfo = (LogonInfo) WebUtils.getLogInfo(request);
        String userId = linfo.getOperator().getUserID();

		String preName = RandomUtil.getRandomFileName();
		String modelName = RandomUtil.getRandomFileName();
    	String marchPath = "/progress/"+userId + request.getParameter("random");
    	ServletContext sc = request.getServletContext();
    	String file1name = sc.getRealPath(marchPath);
        try {
    		String username = paramDao.getParams("SPARK_CLIENT_USER", "EM").getParaValue();
    		String host = paramDao.getParams("SPARK_CLIENT_HOST", "EM").getParaValue();
    		String pubKeyPath = paramDao.getParams("SPARK_SSH_PUBKEY", "EM").getParaValue();
    		String upRoot = paramDao.getParams("TRAIN_UPLOAD_PATH", "EM").getParaValue();
    		String preRoot = paramDao.getParams("TRAIN_PREDICT_PATH", "EM").getParaValue();
    		String trainModelRoot = paramDao.getParams("TRAIN_MODEL_PATH", "EM").getParaValue();
    		SysParamPo sparkHome = paramDao.getParams("WB_SPARK_HOME", "EM");
			String wbSpark = "";
    		if(sparkHome!=null) wbSpark = sparkHome.getParaValue()+"bin/";
    		String wbRoot = paramDao.getParams("WB_ROOT_PATH", "EM").getParaValue();

    		File file1 = new File(file1name);
 	        if(!file1.exists()){
 	        	Boolean flag1 = file1.createNewFile();
 	        	logger.info("创建进度条数据文件："+flag1.toString());
 	        	if(!flag1)return;
 	        }
    		
            JSch jsch = new JSch();
			jsch.addIdentity(pubKeyPath);

	        Session session=jsch.getSession(username, host, 22);//为了连接做准备
	        session.setConfig("StrictHostKeyChecking", "no");
	        session.connect();
	        String sceneId = request.getParameter("t_scene");
	        String command = "cd " + wbRoot + "ml/package/train/KMeans;" + wbSpark + "spark-submit --class com.testspark.WbKMeans KMeans.jar "
	        		+ upRoot + request.getParameter("hdfsName") + " " + request.getParameter("numClusters") + " " 
	        		+ request.getParameter("numIterations") + " " + trainModelRoot + sceneId + "/KMeans/"
	        		+ modelName + " " + preRoot + preName + " " + request.getParameter("id") + " " + userId + " " + sceneId;

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
	        result = ExecuteResult.SUCCESS;
		} catch (JSchException e) {
			// TODO Auto-generated catch block
	        result = ExecuteResult.FAIL;
			e.printStackTrace();
		} catch (Exception ex){
	        result = ExecuteResult.FAIL;
			ex.printStackTrace();
		} finally {
            logService.addAuditLog(oper, BizType.EM, "runKMeansTrain", "调用KMeans算法", preName, FunctionType.NORMAL, result);
        }
    }
    
}
