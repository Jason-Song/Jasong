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
	private String createUser;
	/**
	 * 创建时间
	 */
	private String createTime;
	/**
	 * 最后修改用户
	 */
    private String lastUpdUser;
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
