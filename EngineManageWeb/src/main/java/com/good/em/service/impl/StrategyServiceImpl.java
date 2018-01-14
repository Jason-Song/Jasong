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
import com.good.em.bean.StrategyPo;
import com.good.em.mapper.StrategyDao;
import com.good.em.mapper.UserBlDao;
import com.good.em.service.StrategyService;
import com.good.sys.MsgConstants;
import com.good.sys.ServiceException;
import com.good.sys.bean.Operator;
import com.good.sys.service.AuditLogService;
import com.good.utils.TimeTool;


@Service
public class StrategyServiceImpl implements StrategyService {
	
    private static Logger logger = LoggerFactory.getLogger(StrategyServiceImpl.class);

    @Autowired
    private StrategyDao strategyDao;
    
    @Autowired
    private UserBlDao userDao;
    
    @Autowired
    private AuditLogService logService;
    
    @Override
    public List<StrategyPo> listStrategy(Operator oper, Map<String,Object> condition, IPage page) throws ServiceException {
    	try{
    		return strategyDao.listStrategy(condition,page);
	    } catch (Exception e) {
	        logger.error(MsgConstants.E0002, e);
	        throw new ServiceException(MsgConstants.E0002, e.getMessage());
	    }    
    }
    
    @Override
    public void addStrategy(Operator oper, StrategyPo strategy) throws ServiceException {
        ExecuteResult result = ExecuteResult.UNKNOWN;
        Date nowDate = new Date();
        String now = TimeTool.paserString(nowDate, "yyyy-MM-dd HH:mm:ss");
        
        try {
            String userId = oper.getUserID();
            if(userId != null){
            	if(strategy.getCondIds() != null)strategy.setCondIds(","+strategy.getCondIds()+",");
            	else strategy.setCondIds("");
            	strategy.setCreateUser(userId);
            	strategy.setCreateTime(now);
            	strategyDao.insertStrategy(strategy);
	            result = ExecuteResult.SUCCESS;
            }else{
	            result = ExecuteResult.FAIL;
            }
        } catch (Exception e) {
            logger.error(MsgConstants.E0002, e);
            throw new ServiceException(MsgConstants.E0002, e.getMessage());
        }
        finally {
            logService.addAuditLog(oper, BizType.EM, "addStrategy", "新增策略", strategy.getExeDesc(), FunctionType.INSERT, result);
        }
    }
    
    @Override
    public void editStrategy(Operator oper, StrategyPo strategy) throws ServiceException {
    	ExecuteResult result = ExecuteResult.UNKNOWN;
    	Date nowDate = new Date();
    	String now = TimeTool.paserString(nowDate, "yyyy-MM-dd HH:mm:ss");
    	
    	try {
    		String userId = oper.getUserID();
    		if(userId != null){
            	strategy.setCondIds(","+strategy.getCondIds()+",");
    			strategy.setLastUpdUser(userId);
    			strategy.setLastUpdTime(now);
    			strategyDao.updateStrategy(strategy);
    			result = ExecuteResult.SUCCESS;
    		}else{
    			result = ExecuteResult.FAIL;
    		}
    	} catch (Exception e) {
    		logger.error(MsgConstants.E0002, e);
    		throw new ServiceException(MsgConstants.E0002, e.getMessage());
    	}
    	finally {
    		logService.addAuditLog(oper, BizType.EM, "editCondition", "编辑策略", strategy.getExeDesc(), FunctionType.UPDATE, result);
    	}
    }
    
    @Override
    public void delStrategy(Operator oper, StrategyPo strategy) throws ServiceException {
        ExecuteResult result = ExecuteResult.UNKNOWN;
        try {
        	strategyDao.delStrategy(strategy);
            result = ExecuteResult.SUCCESS;
        } finally {
            logService.addAuditLog(oper, BizType.EM, "delStrategy", "删除策略", '['+strategy.getId()+']'+strategy.getExeDesc(), FunctionType.DELETE, result);
        }
    }
   
    @Override
	public List<Map<String,String>> condList() throws ServiceException{
		List<Map<String,String>> conds = strategyDao.condList();
		return conds;
	}
}
