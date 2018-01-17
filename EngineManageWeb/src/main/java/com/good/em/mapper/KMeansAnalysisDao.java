package com.good.em.mapper;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.good.em.bean.ProductModelPo;


public interface KMeansAnalysisDao {

	public Map<String,Object> getTrainRes(@Param("condition") Map<String,Object> condition)throws Exception;
	
	public List<Map<String,String>> getCenters(@Param("kmeansId") BigDecimal kmeansId)throws Exception;
	
    public List<String> modelNoList(@Param("fileId") String fileId);
	
    public Integer getModelId(int modelType)throws Exception;
    
    public void insertProductModel(ProductModelPo productModel)throws Exception;
    
    public void updateProductModel(ProductModelPo productModel)throws Exception;
    
}
