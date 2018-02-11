package com.good.em.service;

import java.util.List;
import java.util.Map;

import com.good.em.bean.ProduceModelPo;
import com.good.sys.ServiceException;
import com.good.sys.bean.Operator;

/**
 * XX管理服务
 *
 */
public interface KMeansAnalysisService {
        			
	public Map<String,Object> getEuclidDistance(Map<String,Object> condition,Operator oper) throws ServiceException;
    
	public void runApplyModel(ProduceModelPo produceModel,Operator oper) throws ServiceException;

	public List<String> modelNoList(String fileId) throws ServiceException;
	
	public Map<String,Object> sceneFileInfo(String fileId) throws ServiceException;
	
	public Map<String,Object> resultInfo(String kMeansId) throws ServiceException;
	
}
