package com.good.em.service;


import com.good.sys.ServiceException;
import com.good.sys.bean.Operator;


/**
 * XX管理服务
 *
 */
public interface RandomForestService {
	
	  public void uploadToHdfs(Operator oper,String systemId) throws ServiceException;

}
