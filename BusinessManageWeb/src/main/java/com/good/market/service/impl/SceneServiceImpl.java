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
import com.good.market.bean.ScenePo;
import com.good.market.mapper.SceneDao;
import com.good.market.mapper.UserBlDao;
import com.good.market.service.SceneService;
import com.good.sys.MsgConstants;
import com.good.sys.ServiceException;
import com.good.sys.bean.Operator;
import com.good.sys.service.AuditLogService;
import com.good.utils.TimeTool;


@Service
public class SceneServiceImpl implements SceneService {
	
    private static Logger logger = LoggerFactory.getLogger(SceneServiceImpl.class);

    @Autowired
    private SceneDao sceneDao;
    
    @Autowired
    private UserBlDao userDao;
    
    @Autowired
    private AuditLogService logService;
    
    public List<ScenePo> listScene(Operator oper, Map<String,Object> condition, IPage page) throws ServiceException {
    	try{
    		return sceneDao.listScene(condition,page);
	    } catch (Exception e) {
	        logger.error(MsgConstants.E0002, e);
	        throw new ServiceException(MsgConstants.E0002, e.getMessage());
	    }    
    }
    
    public void addScene(Operator oper, ScenePo scene) throws ServiceException {
        ExecuteResult result = ExecuteResult.UNKNOWN;
        Date nowDate = new Date();
        String now = TimeTool.paserString(nowDate, "yyyy-MM-dd HH:mm:ss");
        
        try {
            String userId = oper.getUserID();
            if(userId != null){
            	scene.setCreateUser(userId);
            	scene.setCreateTime(now);
            	sceneDao.insertScene(scene);
	            result = ExecuteResult.SUCCESS;
            }else{
	            result = ExecuteResult.FAIL;
            }
        } catch (Exception e) {
            logger.error(MsgConstants.E0002, e);
            throw new ServiceException(MsgConstants.E0002, e.getMessage());
        }
        finally {
            logService.addAuditLog(oper, BizType.MARKET, "addScene", "新增场景", scene.getName(), FunctionType.INSERT, result);
        }
    }
   
}
