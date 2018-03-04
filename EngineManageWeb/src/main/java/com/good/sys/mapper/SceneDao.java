package com.good.sys.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.good.db.IPage;
import com.good.em.bean.ScenePo;


public interface SceneDao {

    public List<ScenePo> listScene(@Param("condition") Map<String,Object> param, @Param("page") IPage page);
        
    public void insertScene(ScenePo scene);
    
    public void updateScene(ScenePo scene);
    
}
