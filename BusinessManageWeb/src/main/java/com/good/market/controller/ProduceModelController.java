package com.good.market.controller;

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
import com.good.market.service.ModelAnalysisService;
import com.good.market.service.ProduceModelService;
import com.good.sys.MsgConstants;
import com.good.sys.WebUtils;
import com.good.sys.bean.LogonInfo;


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
    public WebPageResult modelPredict(WebRequest wr, HttpServletRequest request) throws Exception {
        LogonInfo linfo = (LogonInfo) WebUtils.getLogInfo(request);
    	List<String> list = produceModelService.modelPredict(request,linfo.getOperator());
    	WebPageResult ret = new WebPageResult(list);
    	
    	return ret;
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
    
}
