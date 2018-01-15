package com.good.market.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.good.db.IPage;
import com.good.market.bean.StrategyPo;


public interface StrategyDao {

    public List<StrategyPo> listStrategy(@Param("condition") Map<String,Object> param, @Param("page") IPage page);
        
    public void insertStrategy(StrategyPo strategy);
    
}
