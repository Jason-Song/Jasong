package com.good.market.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.good.comm.web.WebPageResult;
import com.good.comm.web.WebRequest;
import com.good.db.IPage;
import com.good.market.bean.ScenePo;
import com.good.market.service.SceneService;
import com.good.sys.MsgConstants;
import com.good.sys.WebUtils;
import com.good.sys.bean.LogonInfo;


@Controller
@RequestMapping("/market/wbWarehouse")
public class SceneController {
    private static Logger logger = LoggerFactory.getLogger(SceneController.class);
  
    @Autowired
    private SceneService sceneService;
    
    @RequestMapping(value = "/scene", method = { RequestMethod.GET})
    public String toPage() throws Exception {
        return "/wbWarehouse/scene";
    }
    
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/sceneList", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public WebPageResult sceneList(WebRequest wr, HttpServletRequest request)
			throws Exception {
		// 获取排序信息
		HashMap<String, Object> condition = WebUtils.fillOrderParam(wr, null);
		// 设置查询条件
		condition.put("name", request.getParameter("name"));
		condition.put("sceneDesc", request.getParameter("sceneDesc"));
		condition.put("condName", request.getParameter("condName"));
		condition.put("strategyName", request.getParameter("strategyName"));
		condition.put("createUser", request.getParameter("createUser"));
		condition.put("crtStartTime", request.getParameter("crtStartTime"));
		condition.put("crtEndTime", request.getParameter("crtEndTime"));
		condition.put("lastUpdUser", request.getParameter("lastUpdUser"));
		condition.put("updStartTime", request.getParameter("updStartTime"));
		condition.put("updEndTime", request.getParameter("updEndTime"));

		// 获取翻页信息
		IPage page = WebUtils.getPageParam(wr);
		LogonInfo linfo = (LogonInfo) WebUtils.getLogInfo(request);
		List<ScenePo> cond = sceneService.listScene(linfo.getOperator(), condition, page);

		WebPageResult ret = new WebPageResult(cond);
		ret.setRecordsTotal(page.getTotalCount());
		ret.setRecordsFiltered(page.getTotalCount());

		return ret;
	}
    
	@RequestMapping(value = "/sceneAdd", method = { RequestMethod.POST })
	@ResponseBody
	public WebPageResult sceneAdd(ScenePo scene,HttpServletRequest request) throws Exception {
		WebPageResult ret = new WebPageResult();
        try {
            LogonInfo linfo = (LogonInfo) WebUtils.getLogInfo(request);
            sceneService.addScene(linfo.getOperator(), scene);
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
