package com.good.sys.mapper;

import org.apache.ibatis.annotations.Param;

import com.good.em.bean.SysParamPo;

public interface SystemParamDao {

    public SysParamPo getParams(@Param("paraid") String paraId, @Param("rank") String rank);
	
}
