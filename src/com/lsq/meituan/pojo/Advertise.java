package com.lsq.meituan.pojo;

import java.util.Date;

public class Advertise {
    private Integer aid;

    private Integer gid;

    private Integer aorder;

    private Date applytime;

    private Date atime;

    private Integer asign;

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public Integer getGid() {
        return gid;
    }

    public void setGid(Integer gid) {
        this.gid = gid;
    }

    public Integer getAorder() {
        return aorder;
    }

    public void setAorder(Integer aorder) {
        this.aorder = aorder;
    }

    public Date getApplytime() {
        return applytime;
    }

    public void setApplytime(Date applytime) {
        this.applytime = applytime;
    }

    public Date getAtime() {
        return atime;
    }

    public void setAtime(Date atime) {
        this.atime = atime;
    }

    public Integer getAsign() {
        return asign;
    }

    public void setAsign(Integer asign) {
        this.asign = asign;
    }
}