package com.good.em.service.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.good.comm.enu.BizType;
import com.good.comm.enu.ExecuteResult;
import com.good.comm.enu.FunctionType;
import com.good.em.bean.SysParamPo;
import com.good.em.mapper.TrainDataDao;
import com.good.em.mapper.UserBlDao;
import com.good.em.service.FPGrowthTrainService;
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
public class FPGrowthTrainServiceImpl implements FPGrowthTrainService {
	
    private static Logger logger = LoggerFactory.getLogger(FPGrowthTrainServiceImpl.class);

    @Autowired
    private TrainDataDao trainDataDao;
    
    @Autowired
    private UserBlDao userDao;
    
	@Autowired
    private SystemParamDao paramDao;
    
    @Autowired
    private AuditLogService logService;
    
    @Override
    public List<String> runFPGrowthTrain(HttpServletRequest request,Operator oper) throws ServiceException{
        List<String> msglist = new ArrayList<String>();
        ExecuteResult result = ExecuteResult.UNKNOWN;

        LogonInfo linfo = (LogonInfo) WebUtils.getLogInfo(request);
        String userId = linfo.getOperator().getUserID();
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

    		String preName = RandomUtil.getRandomFileName();
    		String modelName = RandomUtil.getRandomFileName();
    		String freqName = RandomUtil.getRandomFileName();

            JSch jsch = new JSch();

			jsch.addIdentity(pubKeyPath);

	        Session session=jsch.getSession(username, host, 22);//为了连接做准备
	        session.setConfig("StrictHostKeyChecking", "no");
	        session.connect();
	        String sceneId = request.getParameter("t_scene");
	        String command = "cd " + wbRoot + "ml/package/train/FPGrowth;" + wbSpark + "spark-submit --class com.testspark.WbFPGrowth FPGrowth.jar "
	        		+ upRoot + request.getParameter("hdfsName") + " " + request.getParameter("minSupport") + " " 
	        		+ request.getParameter("minConfidence") + " " + request.getParameter("numPartitions") + " "  
	        		+ trainModelRoot + sceneId + "/FPGrowth/" + modelName + " " + preRoot + preName + " " 
	        		+ request.getParameter("id") + " " + userId + " " + sceneId + " " + preRoot + "freq" + freqName;

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
	        result = ExecuteResult.SUCCESS;
		} catch (JSchException e) {
			// TODO Auto-generated catch block
	        result = ExecuteResult.FAIL;
			e.printStackTrace();
		} catch (Exception ex){
	        result = ExecuteResult.FAIL;
			ex.printStackTrace();
		} finally {
            logService.addAuditLog(oper, BizType.EM, "runFPGrowthTrain", "调用FPGrowth算法", msglist.toString().substring(0,20), FunctionType.NORMAL, result);
        }
        return msglist;
    }
    
}
