package com.good.market.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.good.comm.web.WebPageResult;
import com.good.comm.web.WebRequest;
import com.good.market.service.ModelAnalysisService;
import com.good.market.service.ProduceModelService;
import com.good.sys.MsgConstants;
import com.good.sys.WebUtils;
import com.good.sys.bean.LogonInfo;
import com.good.utils.LineReadUtil;


@Controller
@RequestMapping("/market/rule")
public class ProduceModelController {
    private static Logger logger = LoggerFactory.getLogger(ProduceModelController.class);
  
    @Autowired
    private ModelAnalysisService modelAnalysisService;
    
    @Autowired
    private ProduceModelService produceModelService;
    
    @RequestMapping(value = "/produceModel", method = { RequestMethod.GET})
    public String toPage() throws Exception {
        return "/rule/produceModel";
    }
    
    @RequestMapping(value = "/modelPredict", method = { RequestMethod.POST, RequestMethod.GET })
    @ResponseBody
    public void modelPredict(WebRequest wr, HttpServletRequest request) throws Exception {
        LogonInfo linfo = (LogonInfo) WebUtils.getLogInfo(request);
        try {
        	produceModelService.modelPredict(request,linfo.getOperator());
       	} catch (Exception e) {
            logger.error(MsgConstants.E0000, e);
        }
    }
    
    @RequestMapping(value = "/produceModelList", method = { RequestMethod.POST, RequestMethod.GET })
    @ResponseBody
    public WebPageResult produceModelList(WebRequest wr, HttpServletRequest request) throws Exception {
    	List<Map<String,String>> list = produceModelService.produceModelList(request.getParameter("sceneId"));
    	WebPageResult ret = new WebPageResult(list);
    	
    	return ret;
    }
    
	@RequestMapping(value = "/fileList", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public WebPageResult fileList(){
		List<Map<String, Object>> dataList;
		WebPageResult ret =null;
		try {
			dataList = modelAnalysisService.getSelectData();
			ret = new WebPageResult(dataList);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(MsgConstants.E0000, e);
            ret.setRetcode(MsgConstants.E0000);
		}
		return ret;
	}
	
	@RequestMapping(value = "/getProductData", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public WebPageResult getProductData(@RequestParam("fileId") String fileId){
		WebPageResult ret =null;
		try {
			Map<String, Object> productData = produceModelService.getProductData(fileId);
			ret = new WebPageResult(productData);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(MsgConstants.E0000, e);
			ret.setRetcode(MsgConstants.E0000);
		}
		return ret;
	}
	
	@RequestMapping(value = "/calcuMonitor", method = { RequestMethod.POST,RequestMethod.GET })
	@ResponseBody
	public WebPageResult calcuMonitor(WebRequest wr, HttpServletRequest request) throws Exception {
		WebPageResult ret = new WebPageResult();
		LogonInfo linfo = (LogonInfo) WebUtils.getLogInfo(request);
		String rootPath = "/progress/"+linfo.getOperator().getUserID()+request.getParameter("trainRes");
    	ServletContext sc = request.getServletContext();
    	String filename = sc.getRealPath(rootPath);
	    File file=new File(filename);    
	    boolean fileexist = file.exists();
    	Map<String,Object> progress = new HashMap<String,Object>();
    	List<String> msgInfo = new ArrayList<String>();
	    if(!fileexist){ 
	    	msgInfo.add("正在连接慧脑引擎...");
	    	progress.put("msgInfo",msgInfo);
	    	progress.put("fileType", "0");
	    	progress.put("march","1%");
	    	progress.put("lineNo", "1");
	 		ret.setData(progress);
		 	return ret;     
	    }
	    int lineNo = Integer.parseInt(request.getParameter("lineNo"));

		if(fileexist){
	    	msgInfo = LineReadUtil.readAppointedLineNumber(file, lineNo);
	    	progress.put("msgInfo",msgInfo);
	    	int index = msgInfo.size();
			int last = index-1;
			String lastLine = msgInfo.get(last);
//			logger.info("msgInfo==="+msgInfo.toString());
	    	if("OOF".equals(lastLine)){
	    		progress.put("fileType", "2");
    			msgInfo.remove(last);
    			if(fileexist)file.delete();
	    	}else if(!"".equals(lastLine)||index!=1){
	    		progress.put("fileType", "1");
	    		progress.put("lineNo", lineNo + index);
	    	}else{
	    		progress.put("fileType", "1");
	    		progress.put("lineNo", "1");
	    	}
	    	logger.info("lineNo======"+progress.get("lineNo"));
	 		ret.setData(progress);
	    }
	    
	 	return ret;
	}
    
}
