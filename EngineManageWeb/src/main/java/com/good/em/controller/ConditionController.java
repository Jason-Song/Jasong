package com.good.em.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import com.good.em.bean.ConditionPo;
import com.good.em.service.ConditionService;
import com.good.sys.MsgConstants;
import com.good.sys.WebUtils;
import com.good.sys.bean.LogonInfo;


@Controller
@RequestMapping("/em/wbWarehouse")
public class ConditionController {
    private static Logger logger = LoggerFactory.getLogger(ConditionController.class);
  
    @Autowired
    private ConditionService conditionService;
    
    @RequestMapping(value = "/condition", method = { RequestMethod.GET})
    public String toPage() throws Exception {
        return "/wbWarehouse/condition";
    }
    
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/conditionList", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public WebPageResult conditionList(WebRequest wr, HttpServletRequest request)
			throws Exception {
		// 获取排序信息
		HashMap<String, Object> condition = WebUtils.fillOrderParam(wr, null);
		// 设置查询条件
		condition.put("feature", request.getParameter("feature"));
		condition.put("condVal", request.getParameter("condVal"));
		condition.put("condType", request.getParameter("condType"));
		condition.put("condDesc", request.getParameter("condDesc"));
		condition.put("createUser", request.getParameter("createUser"));
		condition.put("crtStartTime", request.getParameter("crtStartTime"));
		condition.put("crtEndTime", request.getParameter("crtEndTime"));
		condition.put("lastUpdUser", request.getParameter("lastUpdUser"));
		condition.put("updStartTime", request.getParameter("updStartTime"));
		condition.put("updEndTime", request.getParameter("updEndTime"));

		// 获取翻页信息
		IPage page = WebUtils.getPageParam(wr);
		LogonInfo linfo = (LogonInfo) WebUtils.getLogInfo(request);
		List<ConditionPo> cond = conditionService.listCondition(linfo.getOperator(), condition, page);

		WebPageResult ret = new WebPageResult(cond);
		ret.setRecordsTotal(page.getTotalCount());
		ret.setRecordsFiltered(page.getTotalCount());

		return ret;
	}
    
	@RequestMapping(value = "/conditionAdd", method = { RequestMethod.POST })
	@ResponseBody
	public WebPageResult conditionAdd(ConditionPo condition,HttpServletRequest request) throws Exception {
		WebPageResult ret = new WebPageResult();
        try {
            LogonInfo linfo = (LogonInfo) WebUtils.getLogInfo(request);
            conditionService.addCondition(linfo.getOperator(), condition);
        } catch (Exception e) {
            logger.error(MsgConstants.E0000, e);
            ret.setRetcode(MsgConstants.E0000);
            ret.setMsg(e.getMessage());
        }
		return ret;
	}
	
	@RequestMapping(value = "/conditionEdit", method = { RequestMethod.POST })
	@ResponseBody
	public WebPageResult conditionEdit(ConditionPo condition,HttpServletRequest request) throws Exception {
		WebPageResult ret = new WebPageResult();
        try {
            LogonInfo linfo = (LogonInfo) WebUtils.getLogInfo(request);
            conditionService.editCondition(linfo.getOperator(), condition);
        } catch (Exception e) {
            logger.error(MsgConstants.E0000, e);
            ret.setRetcode(MsgConstants.E0000);
            ret.setMsg(e.getMessage());
        }
		return ret;
	}
    
    @RequestMapping(value = "/conditionDel", method = { RequestMethod.POST })
    @ResponseBody
    public WebPageResult conditionDel(@RequestBody ConditionPo[] conds, HttpServletRequest request) throws Exception {
        WebPageResult ret = new WebPageResult();
        try {
            LogonInfo linfo = (LogonInfo) WebUtils.getLogInfo(request);
            for (ConditionPo cond : conds) {
                conditionService.delCondition(linfo.getOperator(), cond);
            }
            ret.setMsg("成功删除" + conds.length + " 条记录!");
        } catch (Exception e) {
            logger.error(MsgConstants.E0000, e);
            ret.setRetcode(MsgConstants.E0000);
            ret.setMsg(e.getMessage());
        }

        return ret;
    }
	
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}
