package com.db.entity;

/**
 * Created by xiaoqiang on 2016/12/29.
 */
public class Idea {
    private int id;
    private String cname;
    private String cheader;
    private String newmessage;
    private String remessage;
    private String newtime;
    private String retime;
    private int pid;

    public int getId() {
        return id;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCheader() {
        return cheader;
    }

    public void setCheader(String cheader) {
        this.cheader = cheader;
    }

    public String getNewmessage() {
        return newmessage;
    }

    public void setNewmessage(String newmessage) {
        this.newmessage = newmessage;
    }

    public String getRemessage() {
        return remessage;
    }

    public void setRemessage(String remessage) {
        this.remessage = remessage;
    }

    public String getNewtime() {
        return newtime;
    }

    public void setNewtime(String newtime) {
        this.newtime = newtime;
    }

    public String getRetime() {
        return retime;
    }

    public void setRetime(String retime) {
        this.retime = retime;
    }

    @Override
    public String toString() {
        return "Idea{" +
                "id=" + id +
                ", cname='" + cname + '\'' +
                ", cheader='" + cheader + '\'' +
                ", newmessage='" + newmessage + '\'' +
                ", remessage='" + remessage + '\'' +
                ", newtime='" + newtime + '\'' +
                ", retime='" + retime + '\'' +
                ", pid=" + pid +
                '}';
    }
}
