package com.good.em.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.good.comm.web.WebPageResult;
import com.good.comm.web.WebRequest;
import com.good.db.IPage;
import com.good.em.bean.StrategyPo;
import com.good.em.service.StrategyService;
import com.good.sys.MsgConstants;
import com.good.sys.WebUtils;
import com.good.sys.bean.LogonInfo;


@Controller
@RequestMapping("/em/wbWarehouse")
public class StrategyController {
    private static Logger logger = LoggerFactory.getLogger(StrategyController.class);
  
    @Autowired
    private StrategyService strategyService;
    
    @RequestMapping(value = "/strategy", method = { RequestMethod.GET})
    public String toPage() throws Exception {
        return "/wbWarehouse/strategy";
    }
    
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/strategyList", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public WebPageResult strategyList(WebRequest wr, HttpServletRequest request)
			throws Exception {
		// 获取排序信息
		HashMap<String, Object> condition = WebUtils.fillOrderParam(wr, null);
		// 设置查询条件
		condition.put("condIds", request.getParameter("condIds"));
		condition.put("exeCode", request.getParameter("exeCode"));
		condition.put("exeDesc", request.getParameter("exeDesc"));
		condition.put("createUser", request.getParameter("createUser"));
		condition.put("crtStartTime", request.getParameter("crtStartTime"));
		condition.put("crtEndTime", request.getParameter("crtEndTime"));
		condition.put("lastUpdUser", request.getParameter("lastUpdUser"));
		condition.put("updStartTime", request.getParameter("updStartTime"));
		condition.put("updEndTime", request.getParameter("updEndTime"));

		// 获取翻页信息
		IPage page = WebUtils.getPageParam(wr);
		LogonInfo linfo = (LogonInfo) WebUtils.getLogInfo(request);
		List<StrategyPo> cond = strategyService.listStrategy(linfo.getOperator(), condition, page);

		WebPageResult ret = new WebPageResult(cond);
		ret.setRecordsTotal(page.getTotalCount());
		ret.setRecordsFiltered(page.getTotalCount());

		return ret;
	}
    
	@RequestMapping(value = "/strategyAdd", method = { RequestMethod.POST })
	@ResponseBody
	public WebPageResult strategyAdd(StrategyPo strategy,HttpServletRequest request) throws Exception {
		WebPageResult ret = new WebPageResult();
        try {
            LogonInfo linfo = (LogonInfo) WebUtils.getLogInfo(request);
            strategyService.addStrategy(linfo.getOperator(), strategy);
        } catch (Exception e) {
            logger.error(MsgConstants.E0000, e);
            ret.setRetcode(MsgConstants.E0000);
            ret.setMsg(e.getMessage());
        }
		return ret;
	}
	
	@RequestMapping(value = "/strategyEdit", method = { RequestMethod.POST })
	@ResponseBody
	public WebPageResult strategyEdit(StrategyPo strategy,HttpServletRequest request) throws Exception {
		WebPageResult ret = new WebPageResult();
        try {
            LogonInfo linfo = (LogonInfo) WebUtils.getLogInfo(request);
            strategyService.editStrategy(linfo.getOperator(), strategy);
        } catch (Exception e) {
            logger.error(MsgConstants.E0000, e);
            ret.setRetcode(MsgConstants.E0000);
            ret.setMsg(e.getMessage());
        }
		return ret;
	}
    
    @RequestMapping(value = "/strategyDel", method = { RequestMethod.POST })
    @ResponseBody
    public WebPageResult strategyDel(@RequestBody StrategyPo[] strategys, HttpServletRequest request) throws Exception {
        WebPageResult ret = new WebPageResult();
        try {
            LogonInfo linfo = (LogonInfo) WebUtils.getLogInfo(request);
            for (StrategyPo strategy : strategys) {
            	strategyService.delStrategy(linfo.getOperator(), strategy);
            }
            ret.setMsg("成功删除" + strategys.length + " 条记录!");
        } catch (Exception e) {
            logger.error(MsgConstants.E0000, e);
            ret.setRetcode(MsgConstants.E0000);
            ret.setMsg(e.getMessage());
        }

        return ret;
    }
    
    @RequestMapping(value = "/condList", method = { RequestMethod.POST, RequestMethod.GET })
    @ResponseBody
    public WebPageResult condList(WebRequest wr, HttpServletRequest request) throws Exception {

        List<Map<String,String>> list = strategyService.condList();
        WebPageResult ret = new WebPageResult(list);
        ret.setData(list);

        return ret;
    }
	
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}
