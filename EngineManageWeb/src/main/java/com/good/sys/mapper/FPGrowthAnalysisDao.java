package com.good.sys.mapper;


import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;


public interface FPGrowthAnalysisDao {

	public Map<String,Object> getTrainRes(@Param("condition") Map<String,Object> condition)throws Exception;
	
    public List<String> modelNoList(@Param("fileId") String fileId);
//    
//    public Map<String,Object> sceneFileInfo(@Param("fileId") String fileId);
//	
//    public Integer getModelId(@Param("condition") Map<String,Object> condition)throws Exception;
//    
//    public void insertProduceModel(ProduceModelPo produceModel)throws Exception;
//    
//    public void updateProduceModel(ProduceModelPo produceModel)throws Exception;
    
}
