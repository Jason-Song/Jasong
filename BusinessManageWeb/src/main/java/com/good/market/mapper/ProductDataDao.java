package com.good.market.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.good.db.IPage;
import com.good.market.bean.ProductDataPo;


public interface ProductDataDao {

    public List<ProductDataPo> listProductData(@Param("condition") Map<String,Object> param, @Param("page") IPage page);
        
    public void insertProductData(ProductDataPo productData);
    
}
