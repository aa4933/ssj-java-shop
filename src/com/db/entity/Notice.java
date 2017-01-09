package com.db.entity;

/**
 * Created by xiaoqiang on 2016/12/29.
 */
public class Notice {

    private int nid;
    private String nmessage;
    private String nadmin;
    private String nheader;
    private String ntime;

    public int getNid() {
        return nid;
    }

    public void setNid(int nid) {
        this.nid = nid;
    }

    public String getNmessage() {
        return nmessage;
    }

    public void setNmessage(String nmessage) {
        this.nmessage = nmessage;
    }

    public String getNadmin() {
        return nadmin;
    }

    public void setNadmin(String nadmin) {
        this.nadmin = nadmin;
    }

    public String getNheader() {
        return nheader;
    }

    public void setNheader(String nheader) {
        this.nheader = nheader;
    }

    public String getNtime() {
        return ntime;
    }

    public void setNtime(String ntime) {
        this.ntime = ntime;
    }

    @Override
    public String toString() {
        return "Notice{" +
                "nid=" + nid +
                ", nmessage='" + nmessage + '\'' +
                ", nadmin='" + nadmin + '\'' +
                ", nheader='" + nheader + '\'' +
                ", ntime='" + ntime + '\'' +
                '}';
    }
}
