package com.good.market.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;


public interface ModelAnalysisDao {

	public Map<String, Object> getModelData(int fileId)throws Exception;

	public String getLineData(String fileId)throws Exception;

	public List<Map<String, Object>> getSelectData()throws Exception;
	
	public Map<String, Object> getSceneById(@Param("sceneId")String sceneId)throws Exception;

}
