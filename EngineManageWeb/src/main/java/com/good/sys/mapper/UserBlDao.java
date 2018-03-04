package com.good.sys.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
import com.good.db.IPage;
import com.good.em.bean.SysUserPo;

public interface UserBlDao {

    public Integer list(String loginName);

    public List<SysUserPo> getUsers(@Param("condition")Map<String, Object> condition, IPage page);
    
    public Integer minUser();
    
    public Integer minClient();

    public List<SysUserPo> getUsersInfo(@Param("condition")Map<String, Object> condition);

}
