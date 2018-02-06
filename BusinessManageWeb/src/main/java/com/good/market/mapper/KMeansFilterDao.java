package com.good.market.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;


public interface KMeansFilterDao {

    public Map<String,Object> getFilterPath(@Param("condition") Map<String,Object> param);
    
	public List<Map<String,String>> getCenters(@Param("kMeansId")String kMeansId)throws Exception;

}
