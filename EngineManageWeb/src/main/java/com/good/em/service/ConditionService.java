package com.good.em.service;

import java.util.List;
import java.util.Map;

import com.good.db.IPage;
import com.good.em.bean.ConditionPo;
import com.good.sys.ServiceException;
import com.good.sys.bean.Operator;

/**
 * XX管理服务
 *
 */
public interface ConditionService {

    public List<ConditionPo> listCondition(Operator oper, Map<String,Object> condition, IPage page) throws ServiceException;
    
    public void addCondition(Operator oper, ConditionPo cond) throws ServiceException;

    public void editCondition(Operator oper, ConditionPo cond) throws ServiceException;
    
    public void delCondition(Operator oper, ConditionPo cond) throws ServiceException;

}
