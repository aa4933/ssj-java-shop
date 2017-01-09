package com.db.entity;

/**
 * Created by xiaoqiang on 2016/12/29.
 */
public class Product {

    private int pid;
    private String ptype;
    private String pname;
    private  float pprice;
    private  int pquantity;
    private String pimage;
    private String pdescription;
    private String ptime;

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPtype() {
        return ptype;
    }

    public void setPtype(String ptype) {
        this.ptype = ptype;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public float getPprice() {
        return pprice;
    }

    public void setPprice(float pprice) {
        this.pprice = pprice;
    }

    public int getPquantity() {
        return pquantity;
    }

    public void setPquantity(int pquantity) {
        this.pquantity = pquantity;
    }

    public String getPimage() {
        return pimage;
    }

    public void setPimage(String pimage) {
        this.pimage = pimage;
    }

    public String getPdescription() {
        return pdescription;
    }

    public void setPdescription(String pdescription) {
        this.pdescription = pdescription;
    }

    public String getPtime() {
        return ptime;
    }

    public void setPtime(String ptime) {
        this.ptime = ptime;
    }

    @Override
    public String toString() {
        return "Product{" +
                "pid=" + pid +
                ", ptype='" + ptype + '\'' +
                ", pname='" + pname + '\'' +
                ", pprice=" + pprice +
                ", pquantity=" + pquantity +
                ", pimage='" + pimage + '\'' +
                ", pdescription='" + pdescription + '\'' +
                ", ptime='" + ptime + '\'' +
                '}';
    }
}
