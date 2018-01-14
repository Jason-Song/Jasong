package com.good.em.service;

import java.util.List;
import java.util.Map;

import com.good.db.IPage;
import com.good.em.bean.StrategyPo;
import com.good.sys.ServiceException;
import com.good.sys.bean.Operator;

/**
 * XX管理服务
 *
 */
public interface StrategyService {

    public List<StrategyPo> listStrategy(Operator oper, Map<String,Object> condition, IPage page) throws ServiceException;
    
    public void addStrategy(Operator oper, StrategyPo strategy) throws ServiceException;
    
    public void editStrategy(Operator oper, StrategyPo strategy) throws ServiceException;
    
    public void delStrategy(Operator oper, StrategyPo strategy) throws ServiceException;
    
	public List<Map<String,String>> condList() throws ServiceException;

}
