package com.good.em.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public WebPageResult modelApply(WebRequest wr, HttpServletRequest request) throws Exception {   	
		WebPageResult ret = null;

		LogonInfo linfo = (LogonInfo) WebUtils.getLogInfo(request);
		try{
			ProduceModelPo produceModel = new ProduceModelPo();
			produceModel.setModelName(request.getParameter("modelName"));
			produceModel.setModelType(6);
			produceModel.setScene(Integer.parseInt(request.getParameter("sceneId")));
			produceModel.setPredictId(Integer.parseInt(request.getParameter("predictId")));
			produceModel.setModelNo(request.getParameter("modelNo"));
			
			List<String> msglist = kMeansAnalysisService.runApplyModel(produceModel, linfo.getOperator());
			ret = new WebPageResult(msglist);
			ret.setMsg("应用模型成功！");
		}catch(Exception e){
			ret.setMsg("应用模型失败！");
			e.printStackTrace();
			logger.error(MsgConstants.E0000, e);
		}
		
		return ret;
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
	
    @RequestMapping(value = "/modelNoList", method = { RequestMethod.POST, RequestMethod.GET })
    @ResponseBody
    public WebPageResult modelNoList(WebRequest wr, @RequestParam("fileId") String fileId) throws Exception {   	
    	List<String> list = kMeansAnalysisService.modelNoList(fileId);
    	WebPageResult ret = new WebPageResult(list);
    	
    	return ret;
    }
}
