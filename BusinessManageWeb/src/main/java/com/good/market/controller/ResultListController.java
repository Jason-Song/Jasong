package com.good.market.controller;

import java.util.ArrayList;
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
import org.springframework.web.servlet.ModelAndView;

import com.good.comm.web.WebPageResult;
import com.good.market.service.ModelAnalysisService;
import com.good.sys.MsgConstants;


@Controller
@RequestMapping("/market/rule")
public class ResultListController {
    private static Logger logger = LoggerFactory.getLogger(ResultListController.class);
  
    @Autowired
    private ModelAnalysisService modelAnalysisService;
    
    @RequestMapping(value = "/resultList", method = { RequestMethod.GET})
    public String toPage() throws Exception {
        return "/rule/resultList";
    }
      
    @RequestMapping(value = "/kMeansResultList", method = { RequestMethod.GET })
    public ModelAndView kMeansResult(HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/rule/kMeansResult");
        return mv;
    }
    
    @RequestMapping(value = "/randomForestResultList", method = { RequestMethod.GET })
    public ModelAndView randomForestResult(HttpServletRequest request) throws Exception {
    	ModelAndView mv = new ModelAndView();
    	mv.setViewName("/rule/randomForestResult");
    	return mv;
    }
    
}
