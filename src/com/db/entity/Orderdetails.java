package com.db.entity;

/**
 * Created by xiaoqiang on 2016/12/29.
 */
public class Orderdetails {

    private  int orderid;
    private int pid;
    private float pprice;
    private int pnumber;
    private int id;
    private String user;

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public float getPprice() {
        return pprice;
    }

    public void setPprice(float pprice) {
        this.pprice = pprice;
    }

    public int getPnumber() {
        return pnumber;
    }

    public void setPnumber(int pnumber) {
        this.pnumber = pnumber;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Orderdetails{" +
                "orderid=" + orderid +
                ", pid=" + pid +
                ", pprice=" + pprice +
                ", pnumber=" + pnumber +
                ", id=" + id +
                ", user='" + user + '\'' +
                '}';
    }
}
