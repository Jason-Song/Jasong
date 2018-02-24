package com.good.em.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/em/sys")
public class SysController {
    private static Logger logger = LoggerFactory.getLogger(SysController.class);

    
    @RequestMapping(value = "/denied", method = { RequestMethod.GET})
    public String toPage() throws Exception {
        return "/denied";
    }
    
//    @RequestMapping(value = "/logon", method = { RequestMethod.GET, RequestMethod.POST })
//    public String logonPage(HttpServletRequest request,HttpServletResponse response) throws Exception {
//        if (request.getHeader("x-requested-with") != null  
//                && request.getHeader("x-requested-with").equalsIgnoreCase(  
//                        "XMLHttpRequest")) { // ajax 处理  
//            response.setHeader("sessionstatus", "timeout");
//            response.setHeader("Content-Type", "application/json;charset=UTF-8");
//            PrintWriter out = response.getWriter();
//            out.print("{\"retcode\":\"E0008\",\"msg\":\"Session invalid,please relogon!\",\"url\":\"" + request.getContextPath() + "\"}");  
//            out.flush();
//            out.close();
//            return null;
//        } else {
//           return "/sys/logon";
//        }
//    }
    
//    @RequestMapping(value = "/modelById", method = { RequestMethod.GET })
//    public ModelAndView modelById(@RequestParam("fileId") String fileId, HttpServletRequest request) throws Exception {
//        ModelAndView mv = new ModelAndView();
//        mv.setViewName("/rule/modelById");
//        mv.addObject("fileId", fileId);
//        return mv;
//    }
    
}
