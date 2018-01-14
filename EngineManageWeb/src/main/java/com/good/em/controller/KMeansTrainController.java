package com.good.em.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.good.comm.FileUtils;
import com.good.comm.web.WebPageResult;
import com.good.comm.web.WebRequest;
import com.good.db.IPage;
import com.good.em.bean.TrainDataPo;
import com.good.em.service.KMeansTrainService;
import com.good.em.service.TrainDataService;
import com.good.sys.MsgConstants;
import com.good.sys.WebUtils;
import com.good.sys.bean.LogonInfo;


@Controller
@RequestMapping("/em/kMeans")
public class KMeansTrainController {
    private static Logger logger = LoggerFactory.getLogger(KMeansTrainController.class);

    @Autowired
    private TrainDataService trainDataService;
    
    @Autowired
    private KMeansTrainService kMeansTrainService;
    
    @RequestMapping(value = "/trainData", method = { RequestMethod.GET})
    public String toPage() throws Exception {
        return "/kMeans/trainData";
    }
    
    @RequestMapping(value = "/modelById", method = { RequestMethod.GET })
    public ModelAndView modelById(@RequestParam("fileId") String fileId, HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/kMeans/modelById");
        mv.addObject("fileId", fileId);
        return mv;
    }
    
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/trainDataList", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public WebPageResult list(WebRequest wr, HttpServletRequest request)
			throws Exception {
		// 获取排序信息
		HashMap<String, Object> condition = WebUtils.fillOrderParam(wr, null);
		// 设置查询条件
		condition.put("model", 6);
		condition.put("fileName", request.getParameter("fileName"));
		condition.put("status", request.getParameter("status"));
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
    
    @RequestMapping(value = "/train", method = { RequestMethod.POST, RequestMethod.GET })
    @ResponseBody
    public void train(HttpServletRequest request, HttpServletResponse response) throws Exception {
        WebPageResult ret = new WebPageResult();
		LogonInfo linfo = (LogonInfo) WebUtils.getLogInfo(request);

        List<String> msglist = new ArrayList<String>();
        try {
        	msglist = kMeansTrainService.runKMeansTrain(request, linfo.getOperator());

			ret.setMsg("训练数据成功！");
			ret.setData(msglist);
       	} catch (Exception e) {
            logger.error(MsgConstants.E0000, e);
            ret.setRetcode(MsgConstants.E0000);
			ret.setMsg("训练数据失败！");
			ret.setData(msglist);
        }
    }
    
    @RequestMapping(value = "/applyModel", method = { RequestMethod.POST, RequestMethod.GET })
    @ResponseBody
    public WebPageResult applyModel(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	WebPageResult ret = new WebPageResult();
    	LogonInfo linfo = (LogonInfo) WebUtils.getLogInfo(request);
    	
    	List<String> msglist = new ArrayList<String>();
    	try {
    		msglist = trainDataService.runApplyModel(request, linfo.getOperator());
    		
    		ret.setMsg("应用模型成功！");
    		ret.setData(msglist);
    	} catch (Exception e) {
    		logger.error(MsgConstants.E0000, e);
    		ret.setRetcode(MsgConstants.E0000);
    		//ret.setData("111");
    		ret.setMsg("应用模型失败！");
    		ret.setData(msglist);
    	}
    	return ret;
    }
    
    @RequestMapping(value = "/trainDataAdd", method = { RequestMethod.POST, RequestMethod.GET })
    @ResponseBody
    public WebPageResult trainDataAdd(WebRequest wr, HttpServletRequest request) throws Exception {
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
			TrainDataPo trainData = new TrainDataPo();
			trainData.setFileName(fileName);
			trainData.setFileSize(String.valueOf(fileSize));
			//trainData.setUnit(fieldlist.get("unit"));
			trainData.setFileType(fieldlist.get("fileType"));
			trainData.setScene(Integer.parseInt(fieldlist.get("scene")));
			//预留扩展字段
			trainData.setExtra("");
			trainData.setFileDesc(fieldlist.get("fileDesc"));
			is = fileinfo.getInputStream();
			String hdfsName = trainDataService.uploadToHdfs(is);
			trainData.setHdfsName(hdfsName);
			trainData.setModel(6);
			trainDataService.addTrainData(linfo.getOperator(), trainData);
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
    
    @RequestMapping(value = "/downTrainFile", method = {RequestMethod.POST, RequestMethod.GET})
    public ResponseEntity<byte[]> downTrainFile(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String fileName = request.getServletContext().getRealPath("/template/kmeans_data.txt");
        File file = new File(fileName);
        HttpHeaders headers = new HttpHeaders();
        String fileNameN = new String("kmeans_data.txt".getBytes("UTF-8"), "iso-8859-1");// 为了解决中文名称乱码问题
        headers.setContentDispositionFormData("attachment", fileNameN);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.getFileContent(file), headers, HttpStatus.CREATED);
    }

    @RequestMapping(value = "/sceneList", method = { RequestMethod.POST, RequestMethod.GET })
    @ResponseBody
    public WebPageResult sceneList(WebRequest wr, HttpServletRequest request) throws Exception {
    	
    	List<Map<String,String>> list = trainDataService.sceneList();
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
