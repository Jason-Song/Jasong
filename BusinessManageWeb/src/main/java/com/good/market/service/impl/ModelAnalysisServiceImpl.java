package com.good.market.service.impl;


import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List; 
import java.util.Map;

import org.apache.hadoop.conf.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.good.comm.enu.BizType;
import com.good.comm.enu.ExecuteResult;
import com.good.comm.enu.FunctionType;
import com.good.market.mapper.ModelAnalysisDao;
import com.good.market.service.ModelAnalysisService;
import com.good.sys.bean.Operator;
import com.good.sys.mapper.SystemParamDao;
import com.good.sys.service.AuditLogService;
import com.good.utils.HdfsUtil;


@Service
public class ModelAnalysisServiceImpl implements ModelAnalysisService {
	
    @Autowired
    private SystemParamDao paramDao;
    
    @Autowired
    private AuditLogService logService;
    
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
    
	@Override
	public Map<String,Object> getSceneRowCol(String sceneId,Operator oper)throws Exception{
        List<String> collist = new ArrayList<String>();
        List<String> rowlist = new ArrayList<String>();
        ExecuteResult result = ExecuteResult.UNKNOWN;
        Map<String,Object> res = new HashMap<String,Object>();
        try {
        	String scenePath = paramDao.getParams("SCENE_UPLOAD_PATH", "EM").getParaValue();
        	Map<String,Object> sceneRes = modelAnalysisDao.getSceneById(sceneId);
        	if(sceneRes==null){
        		res.put("rows", rowlist);
            	res.put("columns", collist);
    	        result = ExecuteResult.FAIL;
            	return res;
        	}
        	String condName = (String)sceneRes.get("COND_NAME");
        	String shortRow = (String)sceneRes.get("SHORT_ROW");
        	Configuration conf = new Configuration();
        	conf.set("fs.hdfs.impl", "org.apache.hadoop.hdfs.DistributedFileSystem");
        	if(condName==""||condName==null){
        		String columnName = (String)sceneRes.get("COLUMN_NAME");
        		if(columnName!=""&&columnName!=null){
        			InputStream colIn = HdfsUtil.getDirectFromHDFS(scenePath+columnName , conf);
                	BufferedReader colBuf = new BufferedReader(new InputStreamReader(colIn));
                	String line = "";
                	while((line = colBuf.readLine()) != null){
                		collist.add(line);
                	}
                	colIn.close();
                	colBuf.close();
        		}           	
        	}else{
        		String[] columns = condName.split(",");
        		for(int i=1;i<columns.length-1;i++){
            		collist.add(columns[i]);
        		}
        	}
        	if(shortRow==""||shortRow==null){
        		String rowName = (String)sceneRes.get("ROW_NAME");
        		if(rowName!=""&&rowName!=null){
        			InputStream rowIn = HdfsUtil.getDirectFromHDFS(scenePath+rowName , conf);
                	BufferedReader rowBuf = new BufferedReader(new InputStreamReader(rowIn));
                	String line = "";
                	while((line = rowBuf.readLine()) != null){
                		rowlist.add(line);
                	}
                	rowIn.close();
                	rowBuf.close();
        		}            	
        	}else{
        		String[] rows = shortRow.split(",");
        		for(int i=1;i<rows.length-1;i++){
            		rowlist.add(rows[i]);
        		}
        	}
        	
        	res.put("rows", rowlist);
        	res.put("columns", collist);
	        result = ExecuteResult.SUCCESS;
		} catch (Exception ex){
	        result = ExecuteResult.FAIL;
			ex.printStackTrace();
		} finally {
            logService.addAuditLog(oper, BizType.MARKET, "getSceneRowCol", "获取场景行列名称", sceneId, FunctionType.QUERY, result);
        }
        return res;
	}
}
