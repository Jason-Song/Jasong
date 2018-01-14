package com.good.em.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.good.db.IPage;
import com.good.em.bean.TrainDataPo;
import com.good.sys.ServiceException;
import com.good.sys.bean.Operator;

/**
 * XX管理服务
 *
 */
public interface KMeansTrainService {
        			
	public List<String> runKMeansTrain(HttpServletRequest request,Operator oper) throws ServiceException;
    
    public List<String> runApplyModel(HttpServletRequest request,Operator oper) throws ServiceException;
	
}
