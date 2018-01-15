package com.good.market.bean;

import java.io.Serializable;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class SysParamPo implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    /**
     * 参数ID
     */
    private String paraId;
    /**
     * 参数类型
     */
    private String paraRank;

    /**
     * 参数值
     */
    private String paraValue;

    /**
     * 备注
     */
    private String remark;
    /**
     * 创建人
     */
    private String crtUser;
    /**
     * 创建时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private java.util.Date crtTime;
    /**
     * 最后修改人
     */
    private String updUser;
    /**
     * 最后修改时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private java.util.Date updTime;
    /**
     * EXT
     */
    private String ext;

    public String getParaId() {
        return paraId;
    }

    public void setParaId(String paraId) {
        this.paraId = paraId;
    }

    public String getParaRank() {
        return paraRank;
    }

    public void setParaRank(String paraRank) {
        this.paraRank = paraRank;
    }

    public String getParaValue() {
        return paraValue;
    }

    public void setParaValue(String paraValue) {
        this.paraValue = paraValue;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * @return 创建人
     */
    public String getCrtUser() {
        return crtUser;
    }

    /**
     * @param createUser
     *            创建人
     */
    public void setCrtUser(String createUser) {
        this.crtUser = createUser;
    }

    /**
     * @return 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public java.util.Date getCrtTime() {
        return crtTime;
    }

    /**
     * @param createTime
     *            创建时间
     */
    public void setCrtTime(java.util.Date createTime) {
        this.crtTime = createTime;
    }

    /**
     * @return 最后修改人
     */
    public String getUpdUser() {
        return updUser;
    }

    /**
     * @param updUser
     *            最后修改人
     */
    public void setUpdUser(String updUser) {
        this.updUser = updUser;
    }

    /**
     * @return 最后修改时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public java.util.Date getUpdTime() {
        return updTime;
    }

    /**
     * @param updTime
     *            最后修改时间
     */
    public void setUpdTime(java.util.Date updTime) {
        this.updTime = updTime;
    }

    /**
     * @return EXT
     */
    public String getExt() {
        return ext;
    }

    /**
     * @param ext
     *            EXT
     */
    public void setExt(String ext) {
        this.ext = ext;
    }
}
