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
import com.good.market.bean.KMeansResultPo;
import com.good.market.bean.ScenePo;
import com.good.market.mapper.KMeansResultDao;
import com.good.market.mapper.SceneDao;
import com.good.market.mapper.UserBlDao;
import com.good.market.service.KMeansResultService;
import com.good.market.service.SceneService;
import com.good.sys.MsgConstants;
import com.good.sys.ServiceException;
import com.good.sys.bean.Operator;
import com.good.sys.service.AuditLogService;
import com.good.utils.TimeTool;


@Service
public class KMeansResultServiceImpl implements KMeansResultService {
	
    private static Logger logger = LoggerFactory.getLogger(KMeansResultServiceImpl.class);

    @Autowired
    private KMeansResultDao kMeansResultDao;
    
    @Autowired
    private UserBlDao userDao;
    
    @Autowired
    private AuditLogService logService;
    
    @Override
    public List<KMeansResultPo> listKMeansResult(Operator oper, Map<String,Object> condition, IPage page) throws ServiceException {
    	try{
    		return kMeansResultDao.listKMeansResult(condition,page);
	    } catch (Exception e) {
	        logger.error(MsgConstants.E0002, e);
	        throw new ServiceException(MsgConstants.E0002, e.getMessage());
	    }    
    }
    
    @Override
    public Map<String,Object> getKMeansResult(String resultId) throws ServiceException {
    	try{
    		return kMeansResultDao.getKMeansResult(resultId);
    	} catch (Exception e) {
    		logger.error(MsgConstants.E0002, e);
    		throw new ServiceException(MsgConstants.E0002, e.getMessage());
    	}    
    }
    
}
