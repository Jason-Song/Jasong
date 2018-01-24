package com.good.em.service;

import java.util.List;
import javax.servlet.http.HttpServletRequest;

import com.good.sys.ServiceException;
import com.good.sys.bean.Operator;

/**
 * XX管理服务
 *
 */
public interface FPGrowthTrainService {
        			
	public List<String> runFPGrowthTrain(HttpServletRequest request,Operator oper) throws ServiceException;
    	
}
