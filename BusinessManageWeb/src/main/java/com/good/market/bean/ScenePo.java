package com.good.market.bean;

import java.io.Serializable;

public class ScenePo implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 条件ID
	 */
	private Integer id;
	/**
	 * 场景名
	 */
	private String name;
	/**
	 * 场景描述
	 */
	private String sceneDesc;
	/**
	 * 条件名
	 */
	private String condName;
	/**
	 * 策略名
	 */
	private String strategyName;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSceneDesc() {
		return sceneDesc;
	}
	public void setSceneDesc(String sceneDesc) {
		this.sceneDesc = sceneDesc;
	}
	public String getCondName() {
		return condName;
	}
	public void setCondName(String condName) {
		this.condName = condName;
	}
	public String getStrategyName() {
		return strategyName;
	}
	public void setStrategyName(String strategyName) {
		this.strategyName = strategyName;
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
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

}
