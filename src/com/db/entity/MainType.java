
package com.db.entity;


public class MainType {
    private int tid;
    private String ttype;

    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }

    public String getTtype() {
        return ttype;
    }

    public void setTtype(String ttype) {
        this.ttype = ttype;
    }

    @Override
    public String toString() {
        return "MainType [id=" + tid + ", type=" + ttype +  "]";
    }
}
