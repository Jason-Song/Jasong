package com.good.sys.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.good.db.IPage;
import com.good.em.bean.TrainDataPo;


public interface TrainDataDao {

    public List<TrainDataPo> listTrainData(@Param("condition") Map<String,Object> param, @Param("page") IPage page);
        
    public void insertTrainData(TrainDataPo trainData);
    
    public List<Map<String,String>> unitList();
    
    public List<Map<String,String>> sceneList();

}
