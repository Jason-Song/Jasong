package com.good.sys.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.good.db.IPage;
import com.good.em.bean.ConditionPo;


public interface ConditionDao {

    public List<ConditionPo> listCondition(@Param("condition") Map<String,Object> param, @Param("page") IPage page);
        
    public void insertCondition(ConditionPo cond);
    
    public void updateCondition(ConditionPo cond);
    
    public void delCondition(ConditionPo cond);
    
}
