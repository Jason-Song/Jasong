package com.good.market.bean;

import java.io.Serializable;

public class ModelAnalysisPo implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * ID
	 */
	private Integer id;
	/**
	 * 数据源文件ID
	 */
	private String fileId;
	/**
	 * 训练结果文件路径
	 */
	private String trainRes;
	/**
	 * 准确率
	 */
	private String accuracy;
	/**
	 * 训练样本数
	 */
	private Integer trainNo;
	/**
	 * 测试样本数
	 */
	private Integer testNo;
	/**
	 * 性能指标
	 */
	private String performance;
	/**
	 * 创建应用
	 */
	private String createApp;
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
	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	public String getTrainRes() {
		return trainRes;
	}
	public void setTrainRes(String trainRes) {
		this.trainRes = trainRes;
	}
	public String getAccuracy() {
		return accuracy;
	}
	public void setAccuracy(String accuracy) {
		this.accuracy = accuracy;
	}
	public Integer getTrainNo() {
		return trainNo;
	}
	public void setTrainNo(Integer trainNo) {
		this.trainNo = trainNo;
	}
	public Integer getTestNo() {
		return testNo;
	}
	public void setTestNo(Integer testNo) {
		this.testNo = testNo;
	}
	public String getPerformance() {
		return performance;
	}
	public void setPerformance(String performance) {
		this.performance = performance;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getCreateApp() {
		return createApp;
	}
	public void setCreateApp(String createApp) {
		this.createApp = createApp;
	}

}
