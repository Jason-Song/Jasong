package com.good.sys.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.good.em.bean.Role;
import com.good.em.bean.User;
import com.good.em.bean.UserAndRole;
import com.good.db.IPage;

public interface SystemManageDao {

    public List<User> listUser(@Param("condition") Map<String, Object> param, @Param("page") IPage page);

    public List<Role> listRole(@Param("condition") Map<String, Object> param, @Param("page") IPage page);

    public String getRoleName(String roleId);

    public List<UserAndRole> syncRole();

}
