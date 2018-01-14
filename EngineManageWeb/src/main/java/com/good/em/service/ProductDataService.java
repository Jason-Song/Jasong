package com.good.em.service;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

import com.good.db.IPage;
import com.good.em.bean.ProductDataPo;
import com.good.sys.ServiceException;
import com.good.sys.bean.Operator;

/**
 * XX管理服务
 *
 */
public interface ProductDataService {

    public List<ProductDataPo> listProductData(Operator oper, Map<String,Object> condition, IPage page) throws ServiceException;
    
    public void addProductData(Operator oper, ProductDataPo productData) throws ServiceException;
    
    public String uploadToHdfs(InputStream is) throws ServiceException;
    
}
