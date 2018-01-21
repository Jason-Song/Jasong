package com.good.market.bean;

import java.io.Serializable;

public class KMeansResultPo implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 条件ID
	 */
	private Integer id;
	/**
	 * 场景名
	 */
	private Integer fileId;
	/**
	 * 场景描述
	 */
	private String trainRes;
	/**
	 * 条件名
	 */
	private String wssse;
	/**
	 * 模型性能
	 */
	private String performance;
	/**
	 * 模型参数
	 */
	private String modelArgs;
	/**
	 * 场景ID
	 */
	private Integer scene;
	/**
	 * 创建应用
	 */
	private String createApp;
    /**
     * 创建用户名
     */
    private String createUser;
	/**
	 * 创建时间
	 */
	private String createTime;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getFileId() {
		return fileId;
	}
	public void setFileId(Integer fileId) {
		this.fileId = fileId;
	}
	public String getTrainRes() {
		return trainRes;
	}
	public void setTrainRes(String trainRes) {
		this.trainRes = trainRes;
	}
	public String getWssse() {
		return wssse;
	}
	public void setWssse(String wssse) {
		this.wssse = wssse;
	}
	public String getPerformance() {
		return performance;
	}
	public void setPerformance(String performance) {
		this.performance = performance;
	}
	public String getModelArgs() {
		return modelArgs;
	}
	public void setModelArgs(String modelArgs) {
		this.modelArgs = modelArgs;
	}
	public Integer getScene() {
		return scene;
	}
	public void setScene(Integer scene) {
		this.scene = scene;
	}
	public String getCreateApp() {
		return createApp;
	}
	public void setCreateApp(String createApp) {
		this.createApp = createApp;
	}
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

}
