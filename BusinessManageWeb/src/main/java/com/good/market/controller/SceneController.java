package com.good.market.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.DiskFileUpload;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.good.comm.FileUtils;
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
    
	@RequestMapping(value = "/sceneEdit", method = { RequestMethod.POST })
	@ResponseBody
	public WebPageResult sceneEdit(WebRequest wr,HttpServletRequest request) throws Exception {
		WebPageResult ret = new WebPageResult();
		ScenePo scene = new ScenePo();
        try {
        	scene.setId(Integer.parseInt(request.getParameter("e_id")));
        	scene.setName(request.getParameter("e_name"));
        	scene.setStrategyName(request.getParameter("e_strategyName"));
        	scene.setCondName(request.getParameter("e_condName"));
        	scene.setShortRow(request.getParameter("e_shortRow"));
        	scene.setSceneDesc(request.getParameter("e_sceneDesc"));
            LogonInfo linfo = (LogonInfo) WebUtils.getLogInfo(request);
            sceneService.editScene(linfo.getOperator(), scene);
        } catch (Exception e) {
            logger.error(MsgConstants.E0000, e);
            ret.setRetcode(MsgConstants.E0000);
            ret.setMsg(e.getMessage());
        }
		return ret;
	}
    
    @RequestMapping(value = "/sceneAdd", method = { RequestMethod.POST, RequestMethod.GET })
    @ResponseBody
    public WebPageResult trainDataAdd(WebRequest wr, HttpServletRequest request) throws Exception {
		WebPageResult ret = new WebPageResult();
		InputStream is1 = null;
		InputStream is2 = null;
		DiskFileItemFactory disk = new DiskFileItemFactory();
		ServletFileUpload up = new ServletFileUpload(disk);
		try {
			request.setCharacterEncoding("UTF-8");
			List<FileItem> list = up.parseRequest(request);
			FileItem file1 = list.get(0);
			FileItem file2 = list.get(1);
			Map<String, String> fieldlist = new HashMap<String, String>();
			for (FileItem po : list) {
				if (po.isFormField())
					fieldlist.put(po.getFieldName(), po.getString("UTF-8"));
			}
			ScenePo scene = new ScenePo();
			if(file1.getSize()>0){
				is1 = file1.getInputStream();
				String hdfs1Name = sceneService.uploadToHdfs(is1);
				scene.setColumnName(hdfs1Name);
			}
			if(file2.getSize()>0){
				is2 = file2.getInputStream();
				String hdfs2Name = sceneService.uploadToHdfs(is2);
				scene.setRowName(hdfs2Name);
			}
			LogonInfo linfo = (LogonInfo) WebUtils.getLogInfo(request);

			scene.setName(fieldlist.get("name"));
			scene.setSceneDesc(fieldlist.get("sceneDesc"));
			scene.setStrategyName(fieldlist.get("strategyName"));
			scene.setCondName(fieldlist.get("condName"));
			scene.setShortRow(fieldlist.get("shortRow"));
			
			sceneService.addScene(linfo.getOperator(), scene);
			ret.setMsg("操作成功！");
		} catch(IOException e){
  	         e.printStackTrace();
  	         logger.error("操作失败！ ===>" + e.getMessage());  			 
		} catch (Exception e) {
			logger.error(MsgConstants.E0000, e);
			ret.setRetcode(MsgConstants.E0000);
			ret.setMsg(e.getMessage());
		} finally{
			try{
				if(is1!=null)is1.close();
				if(is2!=null)is2.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return ret;
    }
    
    @RequestMapping(value = "/downTrainFile", method = {RequestMethod.POST, RequestMethod.GET})
    public ResponseEntity<byte[]> downTrainFile(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String fileName = request.getServletContext().getRealPath("/template/row_column.txt");
        File file = new File(fileName);
        HttpHeaders headers = new HttpHeaders();
        String fileNameN = new String("row_column.txt".getBytes("UTF-8"), "iso-8859-1");// 为了解决中文名称乱码问题
        headers.setContentDispositionFormData("attachment", fileNameN);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.getFileContent(file), headers, HttpStatus.CREATED);
    }
    
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}
