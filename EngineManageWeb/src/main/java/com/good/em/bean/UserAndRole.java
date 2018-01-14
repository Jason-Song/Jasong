package com.good.em.bean;

import java.io.Serializable;

public class UserAndRole implements Serializable {

	private static final long serialVersionUID = 1L;

	private String staffId;
	
	private String staffName;
	
	private String roleId;

    public String getStaffId() {
        return staffId;
    }

    public void setStaffId(String staffId) {
        this.staffId = staffId;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getStaffName() {
        return staffName;
    }

    public void setStaffName(String staffName) {
        this.staffName = staffName;
    }

}
