package com.good.sys.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.good.db.IPage;
import com.good.em.bean.StrategyPo;


public interface StrategyDao {

    public List<StrategyPo> listStrategy(@Param("condition") Map<String,Object> param, @Param("page") IPage page);
        
    public void insertStrategy(StrategyPo strategy);
    
    public void updateStrategy(StrategyPo strategy);
    
    public void delStrategy(StrategyPo strategy);
    
    public List<Map<String,String>> condList();
    
}
