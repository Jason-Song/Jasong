package com.good.market.mapper;

import java.util.List;
import java.util.Map;


public interface ModelAnalysisDao {

	public Map<String, Object> getModelData(int fileId)throws Exception;

	public String getLineData(String fileId)throws Exception;

	public List<Map<String, Object>> getSelectData()throws Exception;
            
}
