package com.good.market.service;

import java.util.List;
import java.util.Map;

import com.good.db.IPage;
import com.good.market.bean.KMeansResultPo;
import com.good.sys.ServiceException;
import com.good.sys.bean.Operator;

/**
 * XX管理服务
 *
 */
public interface KMeansResultService {

    public List<KMeansResultPo> listKMeansResult(Operator oper, Map<String,Object> condition, IPage page) throws ServiceException;
    
    public Map<String,Object> getKMeansResult(String resultId) throws ServiceException;

}
