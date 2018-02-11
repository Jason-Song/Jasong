package com.good.market.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.good.sys.ServiceException;
import com.good.sys.bean.Operator;


/**
 * XX管理服务
 *
 */
public interface ProduceModelService {
    
    public void modelPredict(HttpServletRequest request,Operator oper) throws ServiceException;
    	
    public List<Map<String,String>> produceModelList(String sceneId);
    
    public Map<String,Object> getProductData(String fileId) throws ServiceException;
    
}
