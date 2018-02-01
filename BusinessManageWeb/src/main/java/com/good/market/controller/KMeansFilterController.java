package com.good.market.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.good.comm.web.WebPageResult;
import com.good.comm.web.WebRequest;
import com.good.market.service.KMeansFilterService;
import com.good.sys.MsgConstants;
import com.good.sys.WebUtils;
import com.good.sys.bean.LogonInfo;


@Controller
@RequestMapping("/market/rule")
public class KMeansFilterController {
    private static Logger logger = LoggerFactory.getLogger(KMeansFilterController.class);
  
    @Autowired
    private KMeansFilterService kMeansFilterService;
    
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/kMeansFilter", method = { RequestMethod.POST,RequestMethod.GET })
	@ResponseBody
	public WebPageResult kMeansFilter(WebRequest wr, HttpServletRequest request)
			throws Exception {
		WebPageResult ret = null;
		LogonInfo linfo = (LogonInfo) WebUtils.getLogInfo(request);

        Map<String,Object> msglist = new HashMap<String,Object>();
        try {
        	msglist = kMeansFilterService.runKMeansFilter(request, linfo.getOperator());
            ret = new WebPageResult(msglist);
			ret.setMsg("获取数据成功！");
       	} catch (Exception e) {
            logger.error(MsgConstants.E0000, e);
            ret.setRetcode(MsgConstants.E0000);
			ret.setMsg("获取数据失败！");
        }
		return ret;
	}

}
