package com.good.em.mapper;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import com.good.em.bean.ProduceModelPo;


public interface KMeansAnalysisDao {

	public Map<String,Object> getTrainRes(@Param("condition") Map<String,Object> condition)throws Exception;
	
	public List<Map<String,String>> getCenters(@Param("kmeansId") BigDecimal kmeansId)throws Exception;
	
    public List<String> modelNoList(@Param("fileId") String fileId);
    
    public Map<String,Object> sceneFileInfo(@Param("fileId") String fileId);

    public Map<String,Object> resultInfo(@Param("kMeansId") String kMeansId);
	
    public Integer getModelId(@Param("condition") Map<String,Object> condition)throws Exception;
    
    public void insertProduceModel(ProduceModelPo produceModel)throws Exception;
    
    public void updateProduceModel(ProduceModelPo produceModel)throws Exception;
    
}
