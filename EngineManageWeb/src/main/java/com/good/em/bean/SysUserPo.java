package com.good.em.bean;

import java.io.Serializable;

public class SysUserPo implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String userId;
	
	private String name;
    
    private String email;

    private String staffId;
	
	public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStaffId() {
        return staffId;
    }

    public void setStaffId(String staffId) {
        this.staffId = staffId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
