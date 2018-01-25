package com.good.market.service;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

import com.good.db.IPage;
import com.good.market.bean.ScenePo;
import com.good.sys.ServiceException;
import com.good.sys.bean.Operator;

/**
 * XX管理服务
 *
 */
public interface SceneService {

    public List<ScenePo> listScene(Operator oper, Map<String,Object> condition, IPage page) throws ServiceException;
    
    public void addScene(Operator oper, ScenePo scene) throws ServiceException;
    
    public void editScene(Operator oper, ScenePo scene) throws ServiceException;

    public String uploadToHdfs(InputStream is) throws ServiceException;

}
