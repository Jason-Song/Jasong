package com.good.em.bean;

import java.io.Serializable;

public class ProduceModelPo implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 模型ID
	 */
	private Integer id;
	/**
	 * 模型类型
	 */
	private Integer modelType;
	/**
	 * 模型名称
	 */
	private String modelName;
	/**
	 * 模型序列号
	 */
	private String modelNo;
	/**
	 * 预测结果文件ID
	 */
	private Integer predictId;
	/**
	 * 场景ID
	 */
	private Integer scene;
	/**
	 * 创建用户
	 */
	private String createUser;
	/**
	 * 创建时间
	 */
	private String createTime;
	/**
	 * 最后编辑人
	 */
    private String lastUpdUser;
    /**
     * 最后编辑时间
     */
	private String lastUpdTime;

	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getModelType() {
		return modelType;
	}
	public void setModelType(Integer modelType) {
		this.modelType = modelType;
	}
	public String getModelName() {
		return modelName;
	}
	public void setModelName(String modelName) {
		this.modelName = modelName;
	}
	public String getModelNo() {
		return modelNo;
	}
	public void setModelNo(String modelNo) {
		this.modelNo = modelNo;
	}
	public Integer getPredictId() {
		return predictId;
	}
	public void setPredictId(Integer predictId) {
		this.predictId = predictId;
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
	public String getLastUpdUser() {
		return lastUpdUser;
	}
	public void setLastUpdUser(String lastUpdUser) {
		this.lastUpdUser = lastUpdUser;
	}
	public String getLastUpdTime() {
		return lastUpdTime;
	}
	public void setLastUpdTime(String lastUpdTime) {
		this.lastUpdTime = lastUpdTime;
	}
	public Integer getScene() {
		return scene;
	}
	public void setScene(Integer scene) {
		this.scene = scene;
	}

}
