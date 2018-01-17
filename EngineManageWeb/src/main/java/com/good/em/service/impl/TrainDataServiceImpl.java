package com.good.em.service.impl;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Date;
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
import com.good.em.bean.TrainDataPo;
import com.good.em.bean.SysParamPo;
import com.good.em.mapper.TrainDataDao;
import com.good.em.mapper.UserBlDao;
import com.good.em.service.TrainDataService;
import com.good.sys.MsgConstants;
import com.good.sys.ServiceException;
import com.good.sys.WebUtils;
import com.good.sys.bean.LogonInfo;
import com.good.sys.bean.Operator;
import com.good.sys.mapper.SystemParamDao;
import com.good.sys.service.AuditLogService;
import com.good.utils.HdfsUtil;
import com.good.utils.RandomUtil;
import com.good.utils.TimeTool;
import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;


@Service
public class TrainDataServiceImpl implements TrainDataService {
	
    private static Logger logger = LoggerFactory.getLogger(TrainDataServiceImpl.class);

    @Autowired
    private TrainDataDao trainDataDao;
    
    @Autowired
    private UserBlDao userDao;
    
	@Autowired
    private SystemParamDao paramDao;
    
    @Autowired
    private AuditLogService logService;
    
    @Override
    public List<TrainDataPo> listTrainData(Operator oper, Map<String,Object> condition, IPage page) throws ServiceException {
    	try{
    		return trainDataDao.listTrainData(condition,page);
	    } catch (Exception e) {
	        logger.error(MsgConstants.E0002, e);
	        throw new ServiceException(MsgConstants.E0002, e.getMessage());
	    }    
    }
    
    @Override
    public void addTrainData(Operator oper, TrainDataPo trainData) throws ServiceException {
        ExecuteResult result = ExecuteResult.UNKNOWN;
        Date nowDate = new Date();
        String now = TimeTool.paserString(nowDate, "yyyy-MM-dd HH:mm:ss");
        
        try {
            String userId = oper.getUserID();
            if(userId != null){
            	trainData.setUploadUser(userId);
            	trainData.setUploadTime(now);
	        	trainDataDao.insertTrainData(trainData);
	            result = ExecuteResult.SUCCESS;
            }else{
	            result = ExecuteResult.FAIL;
            }
        } catch (Exception e) {
            logger.error(MsgConstants.E0002, e);
            throw new ServiceException(MsgConstants.E0002, e.getMessage());
        }
        finally {
            logService.addAuditLog(oper, BizType.EM, "addTrainData", "新增训练数据", trainData.getFileName(), FunctionType.INSERT, result);
        }
    }

    @Override	
    public String uploadToHdfs(InputStream is) throws ServiceException{
    	Configuration conf = new Configuration();
    	conf.set("fs.hdfs.impl", "org.apache.hadoop.hdfs.DistributedFileSystem");
		String root = paramDao.getParams("TRAIN_UPLOAD_PATH", "EM").getParaValue();
		String hdfsName = RandomUtil.getRandomFileName();
		//上传文件到HDFS
		HdfsUtil.putToHDFS(is, root + hdfsName, conf);
    	return hdfsName;
    }
    
    @Override
    public List<String> runWbTrain(HttpServletRequest request,Operator oper) throws ServiceException{
        List<String> msglist = new ArrayList<String>();
        ExecuteResult result = ExecuteResult.UNKNOWN;

        String userId = oper.getUserID();
        try {
    		String username = paramDao.getParams("SPARK_CLIENT_USER", "EM").getParaValue();
    		String host = paramDao.getParams("SPARK_CLIENT_HOST", "EM").getParaValue();
    		String pubKeyPath = paramDao.getParams("SPARK_SSH_PUBKEY", "EM").getParaValue();
    		String upRoot = paramDao.getParams("TRAIN_UPLOAD_PATH", "EM").getParaValue();
    		String preRoot = paramDao.getParams("TRAIN_PREDICT_PATH", "EM").getParaValue();
    		SysParamPo sparkHome = paramDao.getParams("WB_SPARK_HOME", "EM");
			String wbSpark = "";
    		if(sparkHome!=null) wbSpark = sparkHome.getParaValue();
    		String wbRoot = paramDao.getParams("WB_ROOT_PATH", "EM").getParaValue();

    		String preName = RandomUtil.getRandomFileName();
    		String modelName = RandomUtil.getRandomFileName();

            JSch jsch = new JSch();

			jsch.addIdentity(pubKeyPath);

	        Session session=jsch.getSession(username, host, 22);//为了连接做准备
	        session.setConfig("StrictHostKeyChecking", "no");
	        session.connect();
	        String command = wbSpark + "bin/spark-submit --class com.testspark.RandomForestClassification " + wbRoot
	        		+ "ml/package/train/RandomForestClassification/RandomForestClassification.jar "
	        		+ upRoot + request.getParameter("hdfsName") + " " + request.getParameter("testRate") + " " 
	        		+ request.getParameter("classNum") + " " + request.getParameter("treeNum") + " " 
	        		+ request.getParameter("featureSubsetStrategy") + " " + request.getParameter("impurity") + " "
	        		+ request.getParameter("maxDepth") + " " + request.getParameter("maxBins") + " "
	        		+ preRoot + preName + " file://" + wbRoot + "ml/model/train/RandomForestClassification/"
	        		+ modelName + " " + request.getParameter("id") + " " + userId + " " + request.getParameter("t_scene");

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
            logService.addAuditLog(oper, BizType.EM, "addTrainData", "调用随机森林算法:", msglist.toString().substring(0,20), FunctionType.NORMAL, result);
        }
        return msglist;
    }
    
    @Override    
    public List<String> runApplyModel(HttpServletRequest request,Operator oper) throws ServiceException{
    	List<String> msglist = new ArrayList<String>();
    	ExecuteResult result = ExecuteResult.UNKNOWN;
    	
    	String userId = oper.getUserID();
    	try {
    		String modelName = RandomUtil.getRandomFileName();
    		String pubKeyPath = paramDao.getParams("SPARK_SSH_PUBKEY", "EM").getParaValue();
    		String username = paramDao.getParams("SPARK_CLIENT_USER", "EM").getParaValue();
    		String host = paramDao.getParams("SPARK_CLIENT_HOST", "EM").getParaValue();
    		String wbRoot = paramDao.getParams("WB_ROOT_PATH", "EM").getParaValue();

    		JSch jsch = new JSch();
    		
    		jsch.addIdentity(pubKeyPath);
    		
    		Session session=jsch.getSession(username, host, 22);//为了连接做准备
    		session.setConfig("StrictHostKeyChecking", "no");
    		session.connect();
    		String command = wbRoot + "ml/script/applyModel.sh RandomForestClassification " + request.getParameter("modelNo");
    		
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
    		logService.addAuditLog(oper, BizType.EM, "addTrainData", "调用随机森林算法:", msglist.toString().substring(0,20), FunctionType.NORMAL, result);
    	}
    	return msglist;
    }
    
    @Override	
	public List<Map<String,String>> unitList() throws ServiceException{
		List<Map<String,String>> units = trainDataDao.unitList();
		return units;
	}
    
    @Override	
    public List<Map<String,String>> sceneList() throws ServiceException{
    	List<Map<String,String>> scenes = trainDataDao.sceneList();
    	return scenes;
    }
   
}
