package com.good.em.service.impl;

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
import com.good.em.bean.ConditionPo;
import com.good.sys.mapper.ConditionDao;
import com.good.sys.mapper.UserBlDao;
import com.good.em.service.ConditionService;
import com.good.sys.MsgConstants;
import com.good.sys.ServiceException;
import com.good.sys.bean.Operator;
import com.good.sys.service.AuditLogService;
import com.good.utils.TimeTool;


@Service
public class ConditionServiceImpl implements ConditionService {
	
    private static Logger logger = LoggerFactory.getLogger(ConditionServiceImpl.class);

    @Autowired
    private ConditionDao conditionDao;
    
    @Autowired
    private UserBlDao userDao;
    
    @Autowired
    private AuditLogService logService;
    
    @Override
    public List<ConditionPo> listCondition(Operator oper, Map<String,Object> condition, IPage page) throws ServiceException {
    	try{
    		return conditionDao.listCondition(condition,page);
	    } catch (Exception e) {
	        logger.error(MsgConstants.E0002, e);
	        throw new ServiceException(MsgConstants.E0002, e.getMessage());
	    }    
    }
    
    @Override
    public void addCondition(Operator oper, ConditionPo condition) throws ServiceException {
        ExecuteResult result = ExecuteResult.UNKNOWN;
        Date nowDate = new Date();
        String now = TimeTool.paserString(nowDate, "yyyy-MM-dd HH:mm:ss");
        
        try {
            Integer userId = userDao.list(oper.getUserID());
            if(userId != null){
            	condition.setCreateUser(userId);
            	condition.setCreateTime(now);
            	conditionDao.insertCondition(condition);
	            result = ExecuteResult.SUCCESS;
            }else{
	            result = ExecuteResult.FAIL;
            }
        } catch (Exception e) {
            logger.error(MsgConstants.E0002, e);
            throw new ServiceException(MsgConstants.E0002, e.getMessage());
        }
        finally {
            logService.addAuditLog(oper, BizType.EM, "addCondition", "新增条件", condition.getCondDesc(), FunctionType.INSERT, result);
        }
    }
    
    @Override
    public void editCondition(Operator oper, ConditionPo condition) throws ServiceException {
    	ExecuteResult result = ExecuteResult.UNKNOWN;
    	Date nowDate = new Date();
    	String now = TimeTool.paserString(nowDate, "yyyy-MM-dd HH:mm:ss");
    	
    	try {
    		Integer userId = userDao.list(oper.getUserID());
    		if(userId != null){
    			condition.setLastUpdUser(userId);
    			condition.setLastUpdTime(now);
    			conditionDao.updateCondition(condition);
    			result = ExecuteResult.SUCCESS;
    		}else{
    			result = ExecuteResult.FAIL;
    		}
    	} catch (Exception e) {
    		logger.error(MsgConstants.E0002, e);
    		throw new ServiceException(MsgConstants.E0002, e.getMessage());
    	}
    	finally {
    		logService.addAuditLog(oper, BizType.EM, "editCondition", "编辑条件", condition.getCondDesc(), FunctionType.UPDATE, result);
    	}
    }
    
    @Override
    public void delCondition(Operator oper, ConditionPo cond) throws ServiceException {
        ExecuteResult result = ExecuteResult.UNKNOWN;
        try {
            conditionDao.delCondition(cond);
            result = ExecuteResult.SUCCESS;
        } finally {
            logService.addAuditLog(oper, BizType.EM, "delCondition", "删除条件", '['+cond.getId()+']'+cond.getCondDesc(), FunctionType.DELETE, result);
        }
    }
}
