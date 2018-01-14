package com.good.em.service.impl;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.hadoop.conf.Configuration;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.good.comm.enu.BizType;
import com.good.comm.enu.ExecuteResult;
import com.good.comm.enu.FunctionType;
import com.good.db.IPage;
import com.good.em.bean.ProductDataPo;
import com.good.em.mapper.ProductDataDao;
import com.good.em.mapper.UserBlDao;
import com.good.em.service.ProductDataService;
import com.good.sys.MsgConstants;
import com.good.sys.ServiceException;
import com.good.sys.bean.Operator;
import com.good.sys.mapper.SystemParamDao;
import com.good.sys.service.AuditLogService;
import com.good.utils.HdfsUtil;
import com.good.utils.RandomUtil;
import com.good.utils.TimeTool;


@Service
public class ProductDataServiceImpl implements ProductDataService {
	
    private static Logger logger = LoggerFactory.getLogger(ProductDataServiceImpl.class);

    @Autowired
    private ProductDataDao productDataDao;
    
    @Autowired
    private UserBlDao userDao;
    
    @Autowired
    private AuditLogService logService;
    @Autowired
    private SystemParamDao paramDao;
    
    @Override
    public List<ProductDataPo> listProductData(Operator oper, Map<String,Object> condition, IPage page) throws ServiceException {
    	try{
    		return productDataDao.listProductData(condition,page);
	    } catch (Exception e) {
	        logger.error(MsgConstants.E0002, e);
	        throw new ServiceException(MsgConstants.E0002, e.getMessage());
	    }    
    }
    
    @Override
    public void addProductData(Operator oper, ProductDataPo productData) throws ServiceException {
        ExecuteResult result = ExecuteResult.UNKNOWN;
        Date nowDate = new Date();
        String now = TimeTool.paserString(nowDate, "yyyy-MM-dd HH:mm:ss");
        
        try {
            String userId = oper.getUserID();
            if(userId != null){
            	productData.setUploadUser(userId);
            	productData.setUploadTime(now);
	        	productDataDao.insertProductData(productData);
	            result = ExecuteResult.SUCCESS;
            }else{
	            result = ExecuteResult.FAIL;
            }
        } catch (Exception e) {
            logger.error(MsgConstants.E0002, e);
            throw new ServiceException(MsgConstants.E0002, e.getMessage());
        }
        finally {
            logService.addAuditLog(oper, BizType.EM, "addProductData", "新增业务数据", productData.getFileName(), FunctionType.INSERT, result);
        }
    }

	public String uploadToHdfs(InputStream is) throws ServiceException {
		Configuration conf = new Configuration();
    	conf.set("fs.hdfs.impl", "org.apache.hadoop.hdfs.DistributedFileSystem");
		String root = paramDao.getParams("TRAIN_PREDICT_PATH", "EM").getParaValue();
		String hdfsName = RandomUtil.getRandomFileName();
		//上传文件到HDFS
		HdfsUtil.putToHDFS((FileInputStream)is, root + hdfsName, conf);
    	return hdfsName;
	}
   
}
