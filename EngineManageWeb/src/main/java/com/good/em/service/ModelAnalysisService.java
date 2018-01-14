package com.good.em.service;

import java.util.List;
import java.util.Map;


/**
 * XX管理服务
 *
 */
public interface ModelAnalysisService {
	public Map<String, Object> getModelData(int fileId)throws Exception;
	
	public String getLineData(String fileId)throws Exception;
	
	public List<Map<String, Object>>getSelectData()throws Exception;
        
}
