package com.good.sys.mapper;

import java.util.List;
import java.util.Map;


public interface ProduceModelDao {
        
    public List<Map<String,String>> produceModelList(String sceneId);
    
    public Map<String,Object> getProductData(String fileId);
    
    public Map<String,Object> getModelInfo(String modelId);

}
