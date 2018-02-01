package com.good.em.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/em/sys")
public class SysController {
    private static Logger logger = LoggerFactory.getLogger(SysController.class);

    
    @RequestMapping(value = "/denied", method = { RequestMethod.GET})
    public String toPage() throws Exception {
        return "/denied";
    }
    
    @RequestMapping(value = "/sysLog", method = { RequestMethod.GET })
    public ModelAndView sysLog(HttpServletRequest request) throws Exception {
    	ModelAndView mv = new ModelAndView();
    	mv.setViewName("/screen");
    	return mv;
    }
    
    @RequestMapping(value = "/modelById", method = { RequestMethod.GET })
    public ModelAndView modelById(@RequestParam("fileId") String fileId, HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/rule/modelById");
        mv.addObject("fileId", fileId);
        return mv;
    }
    
}
