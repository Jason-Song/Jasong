package com.good.market.mapper;

import java.util.Map;
import org.apache.ibatis.annotations.Param;


public interface KMeansFilterDao {

    public Map<String,Object> getFilterPath(@Param("condition") Map<String,Object> param);
        
}
