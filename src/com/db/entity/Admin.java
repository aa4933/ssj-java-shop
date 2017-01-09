package com.db.entity;


public class Admin {
    private int aid;
    private String aname;
    private String apass;
    private String aheader;
    private String aphone;
    private String aemail;


    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }

    public String getApass() {
        return apass;
    }

    public void setApass(String apass) {
        this.apass = apass;
    }

    public String getAheader() {
        return aheader;
    }

    public void setAheader(String aheader) {
        this.aheader = aheader;
    }

    public String getAphone() {
        return aphone;
    }

    public void setAphone(String aphone) {
        this.aphone = aphone;
    }

    public String getAemail() {
        return aemail;
    }

    public void setAemail(String aemail) {
        this.aemail = aemail;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "aid=" + aid +
                ", aname='" + aname + '\'' +
                ", apass='" + apass + '\'' +
                ", aheader='" + aheader + '\'' +
                ", aphone='" + aphone + '\'' +
                ", aemail='" + aemail + '\'' +
                '}';
    }
}
