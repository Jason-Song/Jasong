package com.good.market.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.good.comm.enu.BizType;
import com.good.comm.enu.ExecuteResult;
import com.good.comm.enu.FunctionType;
import com.good.db.IPage;
import com.good.market.bean.TrainDataPo;
import com.good.sys.mapper.TrainDataDao;
import com.good.sys.mapper.UserBlDao;
import com.good.market.service.TrainDataService;
import com.good.sys.MsgConstants;
import com.good.sys.ServiceException;
import com.good.sys.bean.Operator;
import com.good.sys.service.AuditLogService;
import com.good.utils.TimeTool;


@Service
public class TrainDataServiceImpl implements TrainDataService {
	
    private static Logger logger = LoggerFactory.getLogger(TrainDataServiceImpl.class);

    @Autowired
    private TrainDataDao trainDataDao;
    
    @Autowired
    private UserBlDao userDao;
    
    @Autowired
    private AuditLogService logService;
    
    public List<TrainDataPo> listTrainData(Operator oper, Map<String,Object> condition, IPage page) throws ServiceException {
    	try{
    		return trainDataDao.listTrainData(condition,page);
	    } catch (Exception e) {
	        logger.error(MsgConstants.E0002, e);
	        throw new ServiceException(MsgConstants.E0002, e.getMessage());
	    }    
    }
    
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
            logService.addAuditLog(oper, BizType.MARKET, "addTrainData", "新增训练数据", trainData.getFileName(), FunctionType.INSERT, result);
        }
    }
   
}
