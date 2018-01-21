package com.good.market.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.good.comm.web.WebPageResult;
import com.good.comm.web.WebRequest;
import com.good.db.IPage;
import com.good.market.bean.KMeansResultPo;
import com.good.market.service.KMeansResultService;
import com.good.sys.WebUtils;
import com.good.sys.bean.LogonInfo;


@Controller
@RequestMapping("/market/rule")
public class KMeansResultController {
    private static Logger logger = LoggerFactory.getLogger(KMeansResultController.class);
  
    @Autowired
    private KMeansResultService kMeansResultService;
    
    @RequestMapping(value = "/kMeansResult", method = { RequestMethod.GET})
    public String toPage() throws Exception {
        return "/rule/kMeansResult";
    }
    
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/kMeansList", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public WebPageResult kMeansList(WebRequest wr, HttpServletRequest request)
			throws Exception {
		// 获取排序信息
		HashMap<String, Object> condition = WebUtils.fillOrderParam(wr, null);
		// 设置查询条件
		condition.put("fileId", request.getParameter("fileId"));
		condition.put("trainRes", request.getParameter("trainRes"));
		condition.put("wssse", request.getParameter("wssse"));
		condition.put("performMin", request.getParameter("performMin"));
		condition.put("performMax", request.getParameter("performMax"));
		condition.put("createUser", request.getParameter("createUser"));
		condition.put("crtStartTime", request.getParameter("crtStartTime"));
		condition.put("crtEndTime", request.getParameter("crtEndTime"));

		// 获取翻页信息
		IPage page = WebUtils.getPageParam(wr);
		LogonInfo linfo = (LogonInfo) WebUtils.getLogInfo(request);
		List<KMeansResultPo> kMeansResult = kMeansResultService.listKMeansResult(linfo.getOperator(), condition, page);

		WebPageResult ret = new WebPageResult(kMeansResult);
		ret.setRecordsTotal(page.getTotalCount());
		ret.setRecordsFiltered(page.getTotalCount());

		return ret;
	}
    
    @RequestMapping(value = "/kMeansResultDel", method = { RequestMethod.POST })
    @ResponseBody
    public WebPageResult kMeansResultDel(@RequestBody KMeansResultPo[] kMeansResults, HttpServletRequest request) throws Exception {
        WebPageResult ret = new WebPageResult();

        return ret;
    }

}
