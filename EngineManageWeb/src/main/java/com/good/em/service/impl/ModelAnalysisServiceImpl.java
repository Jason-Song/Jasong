package com.good.em.service.impl;


import java.util.List; 
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.good.em.mapper.ModelAnalysisDao;
import com.good.em.service.ModelAnalysisService;


@Service
public class ModelAnalysisServiceImpl implements ModelAnalysisService {
	

    @Autowired
    private ModelAnalysisDao modelAnalysisDao;
    
    public Map<String, Object> getModelData(int fileId) throws Exception {
    		return modelAnalysisDao.getModelData(fileId);
    }

	public String getLineData(String fileId) throws Exception {
    		return modelAnalysisDao.getLineData(fileId);
	}

	public List<Map<String, Object>> getSelectData() throws Exception {
    		return modelAnalysisDao.getSelectData();
	}
    
}
