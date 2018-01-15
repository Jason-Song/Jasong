package com.good.market.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
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
import com.good.market.bean.ProductDataPo;
import com.good.market.service.ProductDataService;
import com.good.sys.MsgConstants;
import com.good.sys.WebUtils;
import com.good.sys.bean.LogonInfo;
import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;

@Controller
@RequestMapping("/market/rule")
public class ProductDataController {
    private static Logger logger = LoggerFactory.getLogger(ProductDataController.class);
  
    @Autowired
    private ProductDataService productDataService;
    
    @RequestMapping(value = "/ruleCalcu", method = { RequestMethod.GET})
    public String toPage() throws Exception {
        return "/rule/ruleCalcu";
    }
    
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/productDataList", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public WebPageResult list(WebRequest wr, HttpServletRequest request)
			throws Exception {
		// 获取排序信息
		HashMap<String, Object> condition = WebUtils.fillOrderParam(wr, null);
		// 设置查询条件
		condition.put("fileName", request.getParameter("fileName"));
		condition.put("filePos", request.getParameter("filePos"));
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
		List<ProductDataPo> productData = productDataService.listProductData(
				linfo.getOperator(), condition, page);

		WebPageResult ret = new WebPageResult(productData);
		ret.setRecordsTotal(page.getTotalCount());
		ret.setRecordsFiltered(page.getTotalCount());

		return ret;
	}
    
    @RequestMapping(value = "/predict", method = { RequestMethod.POST, RequestMethod.GET })
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
//          Channel channel=session.openChannel("shell");
            ChannelExec channel=(ChannelExec)session.openChannel("exec");
            channel.setCommand(command);


//          channel.setInputStream(System.in);
//          channel.setOutputStream(System.out);
//          InputStream in=channel.getInputStream();

            BufferedReader in = new BufferedReader(new InputStreamReader(channel.getInputStream()));

            channel.connect();

            String msg;

            while((msg = in.readLine()) != null){
                System.out.println(msg);
            }
            channel.disconnect();
            session.disconnect();
        
       	} catch (Exception e) {
            logger.error(MsgConstants.E0000, e);
            ret.setRetcode(MsgConstants.E0000);
        }
        return ret;
    }
    
    
    @RequestMapping(value = "/batchScreenAdd", method = { RequestMethod.POST, RequestMethod.GET })
    @ResponseBody
    public WebPageResult batchScreenAdd(WebRequest wr, HttpServletRequest request) throws Exception {
		WebPageResult ret = new WebPageResult();
		InputStream is = null;
		DiskFileItemFactory disk = new DiskFileItemFactory();
		ServletFileUpload up = new ServletFileUpload(disk);
		try {
			request.setCharacterEncoding("UTF-8");
			List<FileItem> list = up.parseRequest(request);
			FileItem fileinfo = list.get(0);
			Map<String, String> fieldlist = new HashMap<String, String>();
			for (FileItem po : list) {
				if (po.isFormField())
					fieldlist.put(po.getFieldName(), po.getString("UTF-8"));
			}
			String fileName = fileinfo.getName();
			long fileSize = fileinfo.getSize();
			LogonInfo linfo = (LogonInfo) WebUtils.getLogInfo(request);
			ProductDataPo productData = new ProductDataPo();
			productData.setFileName(fileName);
			productData.setFileSize(String.valueOf(fileSize));
			productData.setUnit(fieldlist.get("unit"));
			productData.setFileType(fieldlist.get("fileType"));
			//预留扩展字段
			productData.setExtra("");
			productData.setFileDesc(fieldlist.get("fileDesc"));
			is = fileinfo.getInputStream();
			String filePos = productDataService.uploadToHdfs(is);
			productData.setFilePos(filePos);
			productDataService.addProductData(linfo.getOperator(), productData);
			ret.setMsg("训练数据文件上传成功！");
		} catch(IOException e){
  	         e.printStackTrace();
  	         logger.error("训练数据文件上传失败！ ===>" + e.getMessage());  			 
		} catch (Exception e) {
			logger.error(MsgConstants.E0000, e);
			ret.setRetcode(MsgConstants.E0000);
			ret.setMsg(e.getMessage());
		} finally{
			try{
				is.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return ret;
    }
    
    @RequestMapping(value = "/productDataUpload", method = { RequestMethod.POST, RequestMethod.GET })
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
