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
import com.good.market.bean.StrategyPo;
import com.good.market.mapper.StrategyDao;
import com.good.market.mapper.UserBlDao;
import com.good.market.service.StrategyService;
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
    
    public List<StrategyPo> listStrategy(Operator oper, Map<String,Object> condition, IPage page) throws ServiceException {
    	try{
    		return strategyDao.listStrategy(condition,page);
	    } catch (Exception e) {
	        logger.error(MsgConstants.E0002, e);
	        throw new ServiceException(MsgConstants.E0002, e.getMessage());
	    }    
    }
    
    public void addStrategy(Operator oper, StrategyPo strategy) throws ServiceException {
        ExecuteResult result = ExecuteResult.UNKNOWN;
        Date nowDate = new Date();
        String now = TimeTool.paserString(nowDate, "yyyy-MM-dd HH:mm:ss");
        
        try {
            Integer userId = userDao.list(oper.getUserID());
            if(userId != null){
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
            logService.addAuditLog(oper, BizType.MARKET, "addCondition", "新增条件", strategy.getExeDesc(), FunctionType.INSERT, result);
        }
    }
   
}
