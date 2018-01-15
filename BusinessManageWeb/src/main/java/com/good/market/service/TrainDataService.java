package com.good.market.service;

import java.util.List;
import java.util.Map;

import com.good.db.IPage;
import com.good.market.bean.TrainDataPo;
import com.good.sys.ServiceException;
import com.good.sys.bean.Operator;

/**
 * XX管理服务
 *
 */
public interface TrainDataService {

    public List<TrainDataPo> listTrainData(Operator oper, Map<String,Object> condition, IPage page) throws ServiceException;
    
    public void addTrainData(Operator oper, TrainDataPo trainData) throws ServiceException;
    
}
