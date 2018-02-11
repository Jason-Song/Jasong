package com.good.em.controller;

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
import com.good.em.bean.ProduceModelPo;
import com.good.em.service.KMeansAnalysisService;
import com.good.em.service.ModelAnalysisService;
import com.good.sys.MsgConstants;
import com.good.sys.WebUtils;
import com.good.sys.bean.LogonInfo;
import com.good.sys.bean.Operator;
import com.good.utils.LineReadUtil;


@Controller
@RequestMapping("/em/kMeans")
public class KMeansAnalysisController {
    private static Logger logger = LoggerFactory.getLogger(KMeansAnalysisController.class);
  
    @Autowired
    private ModelAnalysisService modelAnalysisService;
    
    @Autowired
    private KMeansAnalysisService kMeansAnalysisService;
    
    @RequestMapping(value = "/modelAnalysis", method = { RequestMethod.GET})
    public String toPage() throws Exception {
        return "/kMeans/modelAnalysis";
    }
	
	@RequestMapping(value = "/getLineData", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
    public WebPageResult getLineData(WebRequest wr,HttpServletRequest request) {
		HashMap<String, Object> condition = WebUtils.fillOrderParam(wr, null);
		// 设置查询条件
		condition.put("fileId", request.getParameter("fileId"));
		condition.put("modelNo", request.getParameter("modelNo"));
		WebPageResult ret = null;
		try {
			LogonInfo linfo = (LogonInfo) WebUtils.getLogInfo(request);
			Map<String,Object> distances = kMeansAnalysisService.getEuclidDistance(condition, linfo.getOperator());
	
			ret = new WebPageResult(distances);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(MsgConstants.E0000, e);
		}
		return ret;
    }
	
	@RequestMapping(value = "/modelApply", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public void modelApply(WebRequest wr, HttpServletRequest request) throws Exception {   	
		LogonInfo linfo = (LogonInfo) WebUtils.getLogInfo(request);
		Operator oper = linfo.getOperator();
		try{
			ProduceModelPo produceModel = new ProduceModelPo();
			produceModel.setModelName(request.getParameter("modelName"));
			produceModel.setModelType(6);
			produceModel.setScene(Integer.parseInt(request.getParameter("sceneId")));
			produceModel.setPredictId(Integer.parseInt(request.getParameter("predictId")));
			produceModel.setModelNo(request.getParameter("modelNo"));
	    	String marchPath = "/progress/"+oper.getUserID() + request.getParameter("random");
	    	ServletContext sc = request.getServletContext();
	    	String file1name = sc.getRealPath(marchPath);
			produceModel.setRandom(file1name);
			kMeansAnalysisService.runApplyModel(produceModel, oper);
		}catch(Exception e){
			e.printStackTrace();
			logger.error(MsgConstants.E0000, e);
		}	
	}
	
	@RequestMapping(value = "/getSelectData", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public WebPageResult getSelectData(){
		List<Map<String, Object>> dataList;
		WebPageResult ret =null;
		try {
			dataList = modelAnalysisService.getSelectData("6");
			ret = new WebPageResult(dataList);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(MsgConstants.E0000, e);
            ret.setRetcode(MsgConstants.E0000);
		}
		return ret;
	}
	
	@RequestMapping(value = "/sceneFileInfo", method = { RequestMethod.POST, RequestMethod.GET })
    @ResponseBody
    public WebPageResult sceneFileInfo(WebRequest wr, @RequestParam("fileId") String fileId) throws Exception {   	
    	Map<String,Object> list = kMeansAnalysisService.sceneFileInfo(fileId);
    	WebPageResult ret = new WebPageResult(list);
    	
    	return ret;
    }
	
	@RequestMapping(value = "/resultInfo", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public WebPageResult resultInfo(WebRequest wr, @RequestParam("kMeansId") String kMeansId) throws Exception {   	
		Map<String,Object> list = kMeansAnalysisService.resultInfo(kMeansId);
		WebPageResult ret = new WebPageResult(list);
		
		return ret;
	}
	
	@RequestMapping(value = "/applyMonitor", method = { RequestMethod.POST,RequestMethod.GET })
	@ResponseBody
	public WebPageResult applyMonitor(WebRequest wr, HttpServletRequest request) throws Exception {
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
	    	progress.put("lineNo", "1");
	 		ret.setData(progress);
		 	return ret;     
	    }
	    int lineNo = Integer.parseInt(request.getParameter("lineNo"));

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
    		progress.put("lineNo", lineNo);
    	}
    	
    	logger.info("lineNo======"+progress.get("lineNo"));
 		ret.setData(progress);
	    
	 	return ret;
	}
	
    @RequestMapping(value = "/modelNoList", method = { RequestMethod.POST, RequestMethod.GET })
    @ResponseBody
    public WebPageResult modelNoList(WebRequest wr, @RequestParam("fileId") String fileId) throws Exception {   	
    	List<String> list = kMeansAnalysisService.modelNoList(fileId);
    	WebPageResult ret = new WebPageResult(list);
    	
    	return ret;
    }
}
