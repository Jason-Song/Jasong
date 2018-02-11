package com.good.em.service;

import java.util.List;
import javax.servlet.http.HttpServletRequest;

import com.good.sys.ServiceException;
import com.good.sys.bean.Operator;

/**
 * XX管理服务
 *
 */
public interface KMeansTrainService {
        			
	public void runKMeansTrain(HttpServletRequest request,Operator oper) throws ServiceException;
    	
}
