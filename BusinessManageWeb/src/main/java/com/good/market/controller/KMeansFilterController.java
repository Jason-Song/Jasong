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
import com.good.market.service.KMeansFilterService;
import com.good.market.service.KMeansResultService;
import com.good.market.service.ModelAnalysisService;
import com.good.sys.MsgConstants;
import com.good.sys.WebUtils;
import com.good.sys.bean.LogonInfo;
import com.good.utils.LineReadUtil;


@Controller
@RequestMapping("/market/rule")
public class KMeansFilterController {
    private static Logger logger = LoggerFactory.getLogger(KMeansFilterController.class);

    @Autowired
    private ModelAnalysisService modelAnalysisService;
    
    @Autowired
    private KMeansFilterService kMeansFilterService;
    
    @Autowired
    private KMeansResultService kMeansResultService;
    
	@RequestMapping(value = "/kMeansFilter", method = { RequestMethod.POST,RequestMethod.GET })
	@ResponseBody
	public void kMeansFilter(WebRequest wr, HttpServletRequest request) throws Exception {
		LogonInfo linfo = (LogonInfo) WebUtils.getLogInfo(request);
        try {
        	kMeansFilterService.runSQLFilter(request, linfo.getOperator());
       	} catch (Exception e) {
            logger.error(MsgConstants.E0000, e);
        }
	}
	
	@RequestMapping(value = "/kMeansInfo", method = { RequestMethod.POST,RequestMethod.GET })
	@ResponseBody
	public WebPageResult kMeansInfo(WebRequest wr, @RequestParam("resultId") String resultId) throws Exception {
    	Map<String,Object> list = kMeansResultService.getKMeansResult(resultId);
    	WebPageResult ret = new WebPageResult(list);
    	
    	return ret;
	}
	
	@RequestMapping(value = "/monitor", method = { RequestMethod.POST,RequestMethod.GET })
	@ResponseBody
	public WebPageResult monitor(WebRequest wr, HttpServletRequest request) throws Exception {
		WebPageResult ret = new WebPageResult();
		LogonInfo linfo = (LogonInfo) WebUtils.getLogInfo(request);
		String rootPath = "/progress/"+linfo.getOperator().getUserID()+request.getParameter("trainRes");
    	ServletContext sc = request.getServletContext();
    	String file1name = sc.getRealPath(rootPath+"(1)");
    	String file2name = sc.getRealPath(rootPath+"(2)");
    	String file3name = sc.getRealPath(rootPath+"(3)");
	    File file1=new File(file1name);    
	    File file2=new File(file2name);    
	    File file3=new File(file3name);
	    boolean file1exist = file1.exists();
	    boolean file2exist = file2.exists();
	    boolean file3exist = file3.exists();
    	Map<String,Object> progress = new HashMap<String,Object>();
    	List<String> msgInfo = new ArrayList<String>();
	    if(!file1exist&&!file2exist&&!file3exist){ 
	    	msgInfo.add("正在连接慧脑引擎...");
	    	progress.put("march","0%");
	    	progress.put("msgInfo",msgInfo);
	    	progress.put("fileType", "0");
	    	progress.put("lineNo", "1");
	 		ret.setData(progress);
		 	return ret;     
	    }else if(!file1exist&&file2exist&&file3exist){
	    	msgInfo.add("加载数据...");
	    	progress.put("march","0%");
	    	progress.put("msgInfo",msgInfo);
	    	progress.put("fileType", "2");
	    	progress.put("lineNo", "1");
	 		ret.setData(progress);
	    }
	    int lineNo = Integer.parseInt(request.getParameter("lineNo"));
	    switch(request.getParameter("fileType")){
	    	case "1":
	    		if(file1exist){
			    	msgInfo = LineReadUtil.readAppointedLineNumber(file1, lineNo);
			    	progress.put("march","50%");
			    	progress.put("msgInfo",msgInfo);
			    	int index = msgInfo.size();
	    			int last = index-1;
	    			String lastLine = msgInfo.get(last);
	    			logger.info("file1==="+lastLine);
			    	if("OOF".equals(lastLine)){
			    		progress.put("fileType", "2");
			    		progress.put("lineNo", "1");
		    			msgInfo.remove(last);
			    	}else if("".equals(lastLine)&&index==1){
			    		progress.put("fileType", "1");
			    		progress.put("lineNo", "1");
			    	}else{
			    		progress.put("fileType", "1");
			    		progress.put("lineNo", lineNo + index);
			    	}
			 		ret.setData(progress);
			    }
	    		break;
	    	case "2":
	    		if(file2exist){
	    			msgInfo = LineReadUtil.readAppointedLineNumber(file2, lineNo);
	    			progress.put("march","80%");
	    			progress.put("msgInfo",msgInfo);
			    	int index = msgInfo.size();
	    			int last = index-1;
	    			String lastLine = msgInfo.get(last);
	    			logger.info("file2==="+lastLine);
			    	if("OOF".equals(lastLine)){
			    		progress.put("fileType", "3");
			    		progress.put("lineNo", "1");
		    			msgInfo.remove(last);
			    	}else if("".equals(lastLine)&&index==1){
			    		progress.put("fileType", "2");
			    		progress.put("lineNo", "1");
			    	}else{
			    		progress.put("fileType", "2");
			    		progress.put("lineNo", lineNo + index);
			    	}
	    			ret.setData(progress);
	    		}
	    		break;
	    	case "3":
	    		if(file3exist){
	    			msgInfo = LineReadUtil.readAppointedLineNumber(file3, lineNo);
	    			progress.put("msgInfo",msgInfo);
	    			int index = msgInfo.size();
	    			int last = index-1;
	    			String lastLine = msgInfo.get(last);
	    			logger.info("file3==="+lastLine);
	    			if("OOF".equals(lastLine)){
		    			progress.put("march","100%");
	    				progress.put("fileType", "4");
	    				progress.put("lineNo", "1");
		    			msgInfo.remove(last);
		    			if(file1exist)file1.delete();
		    			file2.delete();
		    			file3.delete();
	    			}else if("".equals(lastLine)&&index==1){
			    		progress.put("fileType", "3");
			    		progress.put("lineNo", "1");
			    	}else{
		    			progress.put("march","90%");	    				
	    				progress.put("fileType", "3");
	    				progress.put("lineNo", lineNo + index);
	    			}
	    			ret.setData(progress);
	    		}
	    		break;
	    	default:break;
	    }
	    
	 	return ret;
	}
	
	@RequestMapping(value = "/getCenters", method = { RequestMethod.POST, RequestMethod.GET })
    @ResponseBody
    public WebPageResult getCenters(WebRequest wr, @RequestParam("kMeansId") String kMeansId) throws Exception {   	
    	List<Map<String,String>> list = kMeansFilterService.getCenters(kMeansId);
    	logger.info(list.toString());
    	WebPageResult ret = new WebPageResult(list);
    	
    	return ret;
    }
	
	@RequestMapping(value = "/getSceneRowCol", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public WebPageResult getSceneRowCol(WebRequest wr, HttpServletRequest request) throws Exception {   	
		LogonInfo linfo = (LogonInfo) WebUtils.getLogInfo(request);
		WebPageResult ret = null;
		try{
			Map<String,Object> list = modelAnalysisService.getSceneRowCol(request.getParameter("sceneId"), linfo.getOperator());
			ret = new WebPageResult(list);
		}catch(Exception e) {
            logger.error(MsgConstants.E0000, e);
        }
		return ret;
	}

}
