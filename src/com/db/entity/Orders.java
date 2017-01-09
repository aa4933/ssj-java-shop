package com.db.entity;

/**
 * Created by xiaoqiang on 2016/12/29.
 */
public class Orders {

    private int orderid;
    private String  orderpayment;
    private String orderaddress;
    private String orderemail;
    private String orderuser;
    private String ordertime;
    private float ordersum;

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public String getOrderpayment() {
        return orderpayment;
    }

    public void setOrderpayment(String orderpayment) {
        this.orderpayment = orderpayment;
    }

    public String getOrderaddress() {
        return orderaddress;
    }

    public void setOrderaddress(String orderadress) {
        this.orderaddress = orderadress;
    }

    public String getOrderemail() {
        return orderemail;
    }

    public void setOrderemail(String orderemail) {
        this.orderemail = orderemail;
    }

    public String getOrderuser() {
        return orderuser;
    }

    public void setOrderuser(String orderuser) {
        this.orderuser = orderuser;
    }

    public String getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(String ordertime) {
        this.ordertime = ordertime;
    }

    public float getOrdersum() {
        return ordersum;
    }

    public void setOrdersum(float ordersum) {
        this.ordersum = ordersum;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "orderid=" + orderid +
                ", orderpayment='" + orderpayment + '\'' +
                ", orderadress='" + orderaddress + '\'' +
                ", orderemail='" + orderemail + '\'' +
                ", orderuser='" + orderuser + '\'' +
                ", ordertime='" + ordertime + '\'' +
                ", ordersum=" + ordersum +
                '}';
    }
}
