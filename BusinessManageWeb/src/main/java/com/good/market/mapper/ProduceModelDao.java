package com.good.market.mapper;

import java.util.List;
import java.util.Map;


public interface ProduceModelDao {
        
    public List<Map<String,String>> produceModelList();
    
    public Map<String,Object> getProductData(String fileId);

}
