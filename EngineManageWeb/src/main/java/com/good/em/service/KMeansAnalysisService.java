package com.good.em.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.good.em.bean.ProductModelPo;
import com.good.sys.ServiceException;
import com.good.sys.bean.Operator;

/**
 * XX管理服务
 *
 */
public interface KMeansAnalysisService {
        			
	public Map<String,Object> getEuclidDistance(Map<String,Object> condition,Operator oper) throws ServiceException;
    
	public List<String> runApplyModel(ProductModelPo productModel,Operator oper) throws ServiceException;

	public List<String> modelNoList(String fileId) throws ServiceException;

}
