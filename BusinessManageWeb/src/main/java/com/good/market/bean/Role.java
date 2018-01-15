package com.good.market.bean;

import java.io.Serializable;

public class Role implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer rid;
	private String roleId;
	private String roleName;
	private String roleDescribe;
	private String modifyUser;
	private String modifyData;
	private String staffId;
	
	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getStaffId() {
        return staffId;
    }

    public void setStaffId(String staffId) {
        this.staffId = staffId;
    }

    public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleDescribe() {
		return roleDescribe;
	}

	public void setRoleDescribe(String roleDescribe) {
		this.roleDescribe = roleDescribe;
	}

	public String getModifyUser() {
		return modifyUser;
	}

	public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public void setModifyUser(String modifyUser) {
		this.modifyUser = modifyUser;
	}

	public String getModifyData() {
		return modifyData;
	}

	public void setModifyData(String modifyData) {
		this.modifyData = modifyData;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Role [roleId=" + roleId + ", roleName=" + roleName + ", roleDescribe=" + roleDescribe + ", modifyUser="
				+ modifyUser + ", modifyData=" + modifyData + ", staffId=" + staffId + "]";
	}

}
