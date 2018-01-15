package com.good.market.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;


@Repository
public interface ModelAnalysisDao {
	@Select("select  TRAIN_NO as TRAIN,TEST_NO as TEST,CLASS_NO as CLASSNO,MATRIX as MATRIX,MODEL_TREE as TREE from T_PREDICT_INDEX where file_id=#{fileId}")
    public Map<String, Object> getModelData(int fileId)throws Exception;
	@Select("select ACCURACY from T_PREDICT_INDEX where FILE_ID=#{fileId}")
	public String getLineData(String fileId)throws Exception;
	@Select("select id,(id||'['||file_name||']') as idAndName from T_TRAIN_DATA")
	public List<Map<String, Object>>getSelectData()throws Exception;
            
}
