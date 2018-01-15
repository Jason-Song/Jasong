package com.good.market.service;

import java.util.List;
import java.util.Map;

import com.good.db.IPage;
import com.good.market.bean.StrategyPo;
import com.good.sys.ServiceException;
import com.good.sys.bean.Operator;

/**
 * XX管理服务
 *
 */
public interface StrategyService {

    public List<StrategyPo> listStrategy(Operator oper, Map<String,Object> condition, IPage page) throws ServiceException;
    
    public void addStrategy(Operator oper, StrategyPo cond) throws ServiceException;
    
}
