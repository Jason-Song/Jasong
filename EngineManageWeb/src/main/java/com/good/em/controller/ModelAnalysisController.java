package com.good.em.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.good.comm.web.WebPageResult;
import com.good.em.service.ModelAnalysisService;
import com.good.sys.MsgConstants;


@Controller
@RequestMapping("/em/rule")
public class ModelAnalysisController {
    private static Logger logger = LoggerFactory.getLogger(ModelAnalysisController.class);
  
    @Autowired
    private ModelAnalysisService modelAnalysisService;
    
    @RequestMapping(value = "/modelAnalysis", method = { RequestMethod.GET})
    public String toPage() throws Exception {
        return "/rule/modelAnalysis";
    }
    
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/modelDataList", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public WebPageResult modelDataList(String fileId)
			throws Exception {
		WebPageResult ret = null;
		if(fileId!=null&&fileId!=""){
			List<Map<String,Object>>dataList=new ArrayList<>();
			 Map<String,Object>mapTrain=new HashMap<>();
			 Map<String,Object>mapTest=new HashMap<>();
			 Map<String, Object> numMap=modelAnalysisService.getModelData(Integer.parseInt(fileId));
			 ret = new WebPageResult(dataList);
			 if(numMap!=null){
				String[] modelstr = numMap.get("MODEL").toString().split("/");
				mapTrain.put("name", "训练样本数");
				mapTrain.put("num", numMap.get("TRAIN"));
				mapTrain.put("matrix", numMap.get("MATRIX"));
				mapTrain.put("tree", numMap.get("TREE"));
				mapTrain.put("classno", numMap.get("CLASSNO"));
				mapTrain.put("modelno", modelstr[modelstr.length-1]);
				mapTest.put("name", "测试样本数");
				mapTest.put("num", numMap.get("TEST"));
				dataList.add(mapTrain);
				dataList.add(mapTest);
			 }
		}
		return ret;
	}
	
	@RequestMapping(value = "/getLineData", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
    public WebPageResult getLineData(String fileId) {
		System.out.println("fileId"+fileId);
		Map<String, List<Double>>dataMap=new HashMap<>();
		List<Double>dataOne=new ArrayList<>();
		List<Double>dataTwo=new ArrayList<>();
		List<Double>dataThree=new ArrayList<>();
		WebPageResult ret =null;
		if(fileId!=null&&fileId!=""){
		try {
			String accuracy=modelAnalysisService.getLineData(fileId);
			System.out.println("accuracy="+accuracy);
			//String A=accuracy.substring(accuracy.indexOf("("));
			String[] vectors= accuracy.split("Vector\\(");
			//System.out.println(A);
			String[] R=vectors[1].split("\\),");
			for(int i=R.length-1;i>=0;i--){
				String d1=R[i].replace("(","");
				String d2=d1.replace(")","");
				String[] D=d2.split(",");
				dataOne.add(Double.parseDouble(D[0]));
				dataTwo.add(Double.parseDouble(D[1]));
				dataThree.add(Double.parseDouble(D[2]));
			}
			dataMap.put("准确率", dataOne);
			dataMap.put("召回率", dataTwo);
			dataMap.put("F1", dataThree);
			ret = new WebPageResult(dataMap);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(MsgConstants.E0000, e);
            ret.setRetcode(MsgConstants.E0000);
		}
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
			dataList = modelAnalysisService.getSelectData();
			ret = new WebPageResult(dataList);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(MsgConstants.E0000, e);
            ret.setRetcode(MsgConstants.E0000);
		}
		return ret;
	}
}
