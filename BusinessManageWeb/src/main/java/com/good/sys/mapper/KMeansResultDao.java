package com.good.sys.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.good.db.IPage;
import com.good.market.bean.KMeansResultPo;
import com.good.sys.ServiceException;


public interface KMeansResultDao {

    public List<KMeansResultPo> listKMeansResult(@Param("condition") Map<String,Object> condition, @Param("page") IPage page);
    
    public Map<String,Object> getKMeansResult(@Param("resultId")String resultId) throws ServiceException;

}
