package com.good.em.bean;

import java.io.Serializable;

public class ConditionPo implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 条件ID
	 */
	private Integer id;
	/**
	 * 条件适用的数据特征
	 */
	private String feature;
	/**
	 * 条件值
	 */
	private String condVal;
	/**
	 * 条件类型
	 */
	private String condType;
	/**
	 * 条件描述
	 */
	private String condDesc;
	/**
	 * 创建用户
	 */
	private Integer createUser;
    /**
     * 创建用户名
     */
    private String crtUserName;
	/**
	 * 创建时间
	 */
	private String createTime;
	/**
	 * 最后修改用户
	 */
    private Integer lastUpdUser;
    /**
     * 最后修改用户名
     */
    private String updUserName;
    /**
     * 最后修改时间
     */
	private String lastUpdTime;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getFeature() {
		return feature;
	}
	public void setFeature(String feature) {
		this.feature = feature;
	}
	public String getCondVal() {
		return condVal;
	}
	public void setCondVal(String condVal) {
		this.condVal = condVal;
	}
	public String getCondType() {
		return condType;
	}
	public void setCondType(String condType) {
		this.condType = condType;
	}
	public String getCondDesc() {
		return condDesc;
	}
	public void setCondDesc(String condDesc) {
		this.condDesc = condDesc;
	}
	public Integer getCreateUser() {
		return createUser;
	}
	public void setCreateUser(Integer createUser) {
		this.createUser = createUser;
	}
	public String getCrtUserName() {
		return crtUserName;
	}
	public void setCrtUserName(String crtUserName) {
		this.crtUserName = crtUserName;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public Integer getLastUpdUser() {
		return lastUpdUser;
	}
	public void setLastUpdUser(Integer lastUpdUser) {
		this.lastUpdUser = lastUpdUser;
	}
	public String getUpdUserName() {
		return updUserName;
	}
	public void setUpdUserName(String updUserName) {
		this.updUserName = updUserName;
	}
	public String getLastUpdTime() {
		return lastUpdTime;
	}
	public void setLastUpdTime(String lastUpdTime) {
		this.lastUpdTime = lastUpdTime;
	}

}
