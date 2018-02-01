package com.good.market.service;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import com.good.sys.ServiceException;
import com.good.sys.bean.Operator;

/**
 * XX管理服务
 *
 */
public interface KMeansFilterService {

    public Map<String,Object> runKMeansFilter(HttpServletRequest request,Operator oper) throws ServiceException;
        
}
