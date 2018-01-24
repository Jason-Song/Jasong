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
public interface FPGrowthAnalysisService {
        			
	public Map<String,Object> getFrequentRes(Map<String,Object> condition,Operator oper) throws ServiceException;
    
	public List<String> runApplyModel(ProduceModelPo produceModel,Operator oper) throws ServiceException;

	public List<String> modelNoList(String fileId) throws ServiceException;
	
	//public Map<String,Object> sceneFileInfo(String fileId) throws ServiceException;
	
}
