package com.good.market.bean;

import java.io.Serializable;

public class StrategyPo implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 策略ID
	 */
	private Integer id;
	/**
	 * 策略对应的条件ID
	 */
	private String condIds;
	/**
	 * 策略执行码
	 */
	private String exeCode;
	/**
	 * 策略描述
	 */
	private String exeDesc;
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
	public String getCondIds() {
		return condIds;
	}
	public void setCondIds(String condIds) {
		this.condIds = condIds;
	}
	public String getExeCode() {
		return exeCode;
	}
	public void setExeCode(String exeCode) {
		this.exeCode = exeCode;
	}
	public String getExeDesc() {
		return exeDesc;
	}
	public void setExeDesc(String exeDesc) {
		this.exeDesc = exeDesc;
	}

}
