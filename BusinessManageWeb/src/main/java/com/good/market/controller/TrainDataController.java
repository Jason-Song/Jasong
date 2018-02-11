package com.good.market.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
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
import com.good.market.bean.TrainDataPo;
import com.good.market.service.TrainDataService;
import com.good.sys.MsgConstants;
import com.good.sys.WebUtils;
import com.good.sys.bean.LogonInfo;
import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;

@Controller
@RequestMapping("/market/rule")
public class TrainDataController {
    private static Logger logger = LoggerFactory.getLogger(TrainDataController.class);
  
    @Autowired
    private TrainDataService trainDataService;
    
    @RequestMapping(value = "/trainData", method = { RequestMethod.GET})
    public String toPage() throws Exception {
        return "/rule/trainData";
    }
    
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/trainDataList", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public WebPageResult trainDataList(WebRequest wr, HttpServletRequest request)
			throws Exception {
		// 获取排序信息
		HashMap<String, Object> condition = WebUtils.fillOrderParam(wr, null);
		// 设置查询条件
		condition.put("fileName", request.getParameter("fileName"));
		condition.put("hdfsName", request.getParameter("hdfsName"));
		condition.put("fileType", request.getParameter("fileType"));
		condition.put("sizeMin", request.getParameter("sizeMin"));
		condition.put("sizeMax", request.getParameter("sizeMax"));
		condition.put("fileDesc", request.getParameter("fileDesc"));
		condition.put("extra", request.getParameter("extra"));
		condition.put("uploadUser", request.getParameter("uploadUser"));
		condition.put("upStartTime", request.getParameter("upStartTime"));
		condition.put("upEndTime", request.getParameter("upEndTime"));

		// 获取翻页信息
		IPage page = WebUtils.getPageParam(wr);
		LogonInfo linfo = (LogonInfo) WebUtils.getLogInfo(request);
		List<TrainDataPo> trainData = trainDataService.listTrainData(
				linfo.getOperator(), condition, page);

		WebPageResult ret = new WebPageResult(trainData);
		ret.setRecordsTotal(page.getTotalCount());
		ret.setRecordsFiltered(page.getTotalCount());

		return ret;
	}
    
    @RequestMapping(value = "/randomForest/check", method = { RequestMethod.POST, RequestMethod.GET })
    @ResponseBody
    public WebPageResult check(WebRequest wr, HttpServletRequest request) throws Exception {
        WebPageResult ret = new WebPageResult();
        LogonInfo linfo = (LogonInfo) WebUtils.getLogInfo(request);
        try {
//        	Map<String,String> outmap = manualScreenService.getApiForHttp(linfo.getOperator(),request);
//    		if(outmap==null || outmap.isEmpty())ret.setMsg(WebServicePo.WEB_ERROR);
//    		else{
//    			if(Integer.parseInt(outmap.get("retcode"))>0 && "0".equals(outmap.get("ErrorCode"))){
//    				manualScreenService.updAssignTo(linfo.getOperator(),outmap.get("systemId"));
//    			}
//    			ret.setData(outmap);
//    		}
            JSch jsch = new JSch();
            String pubKeyPath = "C:/Users/ASUS/.ssh/id_rsa";
            jsch.addIdentity(pubKeyPath);

            String username = "hadoop";
            String host = "CDH1";
            Session session=jsch.getSession(username, host, 22);//为了连接做准备
            session.setConfig("StrictHostKeyChecking", "no");
            session.connect();
            String command = "ls";
            ChannelExec channel=(ChannelExec)session.openChannel("exec");
            channel.setCommand(command);

            BufferedReader in = new BufferedReader(new InputStreamReader(channel.getInputStream()));

            channel.connect();
            String msg;
            StringBuilder shellinfo = new StringBuilder();
            while((msg = in.readLine()) != null){
                logger.info(msg);
                shellinfo.append(msg);
            }
            channel.disconnect();
            session.disconnect();
            ret.setData(msg);
       	} catch (Exception e) {
            logger.error(MsgConstants.E0000, e);
            ret.setRetcode(MsgConstants.E0000);
        }
        return ret;
    }
    
    @RequestMapping(value = "/trainDataUpload", method = { RequestMethod.POST, RequestMethod.GET })
    @ResponseBody
    public WebPageResult upload(WebRequest wr, HttpServletRequest request) throws Exception {

    	return null;
    }
    
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}
