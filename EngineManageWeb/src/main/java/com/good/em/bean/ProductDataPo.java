package com.good.em.bean;

import java.io.Serializable;

public class ProductDataPo implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 文件ID
	 */
	private Integer id;
	/**
	 * 本地文件名
	 */
	private String fileName;
	/**
	 * 文件位置
	 */
	private String filePos;
	/**
	 * 文件类型
	 */
	private String fileType;
	/**
	 * 文件大小
	 */
	private String fileSize;
	/**
	 * 文件描述
	 */
	private String fileDesc;
	/**
	 * 扩展字段
	 */
	private String extra;
	/**
	 * 部门
	 */
    private String unit;
    /**
     * 上传用户
     */
	private String uploadUser;
	/**
	 * 上传时间
	 */
	private String uploadTime;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	public String getFileDesc() {
		return fileDesc;
	}
	public void setFileDesc(String fileDesc) {
		this.fileDesc = fileDesc;
	}
	public String getExtra() {
		return extra;
	}
	public void setExtra(String extra) {
		this.extra = extra;
	}
	public String getUploadUser() {
		return uploadUser;
	}
	public void setUploadUser(String uploadUser) {
		this.uploadUser = uploadUser;
	}
	public String getUploadTime() {
		return uploadTime;
	}
	public void setUploadTime(String uploadTime) {
		this.uploadTime = uploadTime;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getFilePos() {
		return filePos;
	}
	public void setFilePos(String filePos) {
		this.filePos = filePos;
	}

}
