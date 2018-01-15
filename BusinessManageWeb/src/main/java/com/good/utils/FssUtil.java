package com.good.utils;

import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.bill99.inf.fss.client.Clients;
import com.bill99.inf.fss.client.FssClient;
import com.bill99.inf.fss.client.FssException;
import com.good.amloa.bean.Amlupload;
import com.good.amloa.util.ACMS;
import com.good.amloa.util.WebDownloadFile;

public class FssUtil {

    private static Logger logger = LoggerFactory.getLogger(FssUtil.class);

    /**
     * FSS文件上传
     */
    @SuppressWarnings("unchecked")
    public static List<Amlupload> uploadFile(HttpServletRequest request, HttpServletResponse reponse) throws Exception {
        InputStream in = null;
        try {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setHeaderEncoding("UTF-8");
            if (!ServletFileUpload.isMultipartContent(request)) {
                return null;
            }
            List<FileItem> list = upload.parseRequest(request);
            List<Amlupload> beanAll = new ArrayList<Amlupload>();
            for (FileItem item : list) {
                Amlupload bean = new Amlupload();
                String value = null;
                String filename = null;
                if (item.isFormField()) {
                    String name = item.getFieldName();
                    value = item.getString("UTF-8");
                    logger.info(name + "=" + value);
                    bean.setReportId(value.replaceAll("'", ""));
                } else {
                    // 得到上传的文件名称
                    filename = item.getName();
                    if (filename == null || filename.trim().equals("")) {
                        continue;
                    }
                    // 从文件路径中截取文件名称
                    filename = filename.substring(filename.lastIndexOf(File.separator) + 1);
                    // 如果系统为Linux系统，但文件在windows系统上导致无法从文件路径中截取到文件名称
                    if (filename.indexOf("/") > 0 || filename.indexOf("\\") > 0) {
                        filename = filename.substring(filename.lastIndexOf("\\") + 1);
                    }
                    // 获取item中的上传文件的输入流
                    in = item.getInputStream();
                    logger.info("上传的文件名称:" + filename);

                    // FSS 文件存储服务server
                    String fssServerSites = ACMS.getFss_Server();
                    if (fssServerSites.equals("") || fssServerSites == null) {
                        logger.error(".....获取fss地址失败!");
                        try {
                            throw new Exception(".....获取fss地址失败!");
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    } else {
                        logger.error(".....获取fss地址成功!");
                    }
                    // FSS 文件存储服务
                    String fileId = UUID.randomUUID().toString().replace("-", "");
                    try {
                        Clients.configServers(fssServerSites);
                        FssClient fssClient = Clients.getFssClient();
                        fileId = fssClient.upload("app-aml-ky", in, filename, null, -1L, null);
                        logger.info("######################  FSS 文件存储服务 fileId: " + fileId);
                        logger.info(".....文件上传FSS服务成功 ");
                    } catch (FssException e) {
                        e.printStackTrace();
                    } finally {
                        if (in != null) {
                            in.close();
                        }
                    }

                    // 删除处理文件上传时生成的临时文件
                    item.delete();

                    bean.setFileId(fileId);
                    bean.setUploadName(filename);
                    bean.setUploadTime(new Date());
                }
                beanAll.add(bean);
            }
            list.clear();
            return beanAll;
        } catch (Exception e) {
            logger.info(".....文件上传FSS服务成失败");
            e.printStackTrace();
        }
        return null;
    }

    /**
     * FSS文件下载
     * 
     * @param fileId
     *            文件id
     * @param displayName
     *            路径
     * @return
     */
    public static String downloadFile(HttpServletResponse response, String fileId, String displayName) {
        // FSS 文件存储服务server
        String fssServerSites = ACMS.getFss_Server();
        if (StringUtils.isEmpty(fssServerSites)) {
            logger.error(".....获取fss地址失败!");
            try {
                throw new Exception(".....获取fss地址失败!");
            } catch (Exception e) {
                e.printStackTrace();
            }

        } else {
            logger.info(".....获取fss地址成功!");
        }

        // FSS 文件存储服务
        try {
            Clients.configServers(fssServerSites);
            FssClient fssClient = Clients.getFssClient();
            // 从FSS下载到本地
            fssClient.downloadFile("app-aml-ky", fileId, displayName, null);
            logger.info("Fss下载到本地成功！");
            // 从页面上下载
            WebDownloadFile.downloadFile(response, new File(displayName), displayName);
            logger.info("下载到页面成功！");
            if (StringUtils.isNotEmpty(displayName)) {
                new File(displayName).delete();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 删除FSS上的文件
     */
    public static void delete(String fileId) {
        // FSS 文件存储服务server
        String fssServerSites = ACMS.getFss_Server();
        if (StringUtils.isEmpty(fssServerSites)) {
            logger.error(".....获取fss地址失败!");
            try {
                throw new Exception(".....获取fss地址失败!");
            } catch (Exception e) {
                e.printStackTrace();
            }

        } else {
            logger.error(".....获取fss地址成功!");
        }

        // FSS 文件存储服务
        try {
            Clients.configServers(fssServerSites);
            FssClient fssClient = Clients.getFssClient();
            // 从FSS下载到本地
            fssClient.delete("app-aml-ky", fileId);
            logger.info(".....删除FSS上的文件成功 ");
        } catch (Exception e) {
            e.printStackTrace();
            logger.info(".....删除FSS上的文件失败 ");
        }
    }

}