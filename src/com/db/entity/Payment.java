package com.db.entity;

/**
 * Created by xiaoqiang on 2016/12/29.
 */
public class Payment {

    private int payid;
    private String paypayment;
    private String msg;

    public int getPayid() {
        return payid;
    }

    public void setPayid(int payid) {
        this.payid = payid;
    }

    public String getPaypayment() {
        return paypayment;
    }

    public void setPaypayment(String paypayment) {
        this.paypayment = paypayment;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    @Override
    public String toString() {
        return "Payment{" +
                "payid=" + payid +
                ", paypayment='" + paypayment + '\'' +
                ", msg='" + msg + '\'' +
                '}';
    }
}
