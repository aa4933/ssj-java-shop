package com.db.entity;

/**
 * Created by xiaoqiang on 2016/12/29.
 */
public class Customer {
    private int cid;
    private String crealname;
    private String cpassword;
    private String cheader;
    private String cphone;
    private String cquestion;
    private String canswer;
    private String caddress;
    private String cemail;
    private  String cusername;
    private float cmoney;


    public String getCusername() {
        return cusername;
    }

    public void setCusername(String cusername) {
        this.cusername = cusername;
    }

    public float getCmoney() {
        return cmoney;
    }

    public void setCmoney(float cmoney) {
        this.cmoney = cmoney;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getCrealname() {
        return crealname;
    }

    public void setCrealname(String crealname) {
        this.crealname = crealname;
    }

    public String getCpassword() {
        return cpassword;
    }

    public void setCpassword(String cpassword) {
        this.cpassword = cpassword;
    }

    public String getCheader() {
        return cheader;
    }

    public void setCheader(String cheader) {
        this.cheader = cheader;
    }

    public String getCphone() {
        return cphone;
    }

    public void setCphone(String cphone) {
        this.cphone = cphone;
    }

    public String getCquestion() {
        return cquestion;
    }

    public void setCquestion(String cquestion) {
        this.cquestion = cquestion;
    }

    public String getCanswer() {
        return canswer;
    }

    public void setCanswer(String canswer) {
        this.canswer = canswer;
    }

    public String getCaddress() {
        return caddress;
    }

    public void setCaddress(String caddress) {
        this.caddress = caddress;
    }

    public String getCemail() {
        return cemail;
    }

    public void setCemail(String cemail) {
        this.cemail = cemail;
    }


    @Override
    public String toString() {
        return "Customer{" +
                "cid=" + cid +
                ", crealname='" + crealname + '\'' +
                ", cpassword='" + cpassword + '\'' +
                ", cheader='" + cheader + '\'' +
                ", cphone='" + cphone + '\'' +
                ", cquestion='" + cquestion + '\'' +
                ", canswer='" + canswer + '\'' +
                ", caddress='" + caddress + '\'' +
                ", cemail='" + cemail + '\'' +
                ", cusername='" + cusername + '\'' +
                ", cmoney=" + cmoney +
                '}';
    }
}
