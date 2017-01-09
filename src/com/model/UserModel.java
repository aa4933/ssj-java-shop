package com.model;

import com.db.JDBCUtils;
import com.db.entity.*;
import org.hibernate.dialect.CUBRIDDialect;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by xiaoqiang on 2016/12/29.
 */


@Service
public class UserModel {

    /**
     * 判断密码账号是否正确
     *
     * @param name
     * @param password
     * @return boolean
     */
    public boolean login(String name, String password) {

        String sql = "select * from Customer where c_username=?";

        //多条数据查询
        //  Object res= JDBCUtils.queryForList(sql,Customer.class);

        //一条数据查询
        Customer res = JDBCUtils.queryForObject(sql, Customer.class, name);

        //增删改
        //  JDBCUtils.execute();


        if (res == null) {
            return false;
        }
        if (name.equals(res.getCusername()) && password.equals(res.getCpassword())) {

            return true;
        } else {
            return false;

        }

    }

    /**
     * 获取一条用户信息
     *
     * @param name
     * @return
     */
    public Customer getCustomer(String name) {

        String sql = "select * from Customer where c_username=?";

        //多条数据查询
        //  Object res= JDBCUtils.queryForList(sql,Customer.class);

        //一条数据查询
        Customer res = JDBCUtils.queryForObject(sql, Customer.class, name);

        return res;


    }

    /**
     * 用户注册功能
     *
     * @param customer：用户信息对象
     * @return boolean
     */
    public boolean register(Customer customer) {

        String checkSql="SELECT * FROM customer where c_username=?";

        Customer customerCheck=JDBCUtils.queryForObject(checkSql,Customer.class,customer.getCusername());



        if (customerCheck!=null){
            return false;
        }



        String sql = "insert into Customer(c_username,c_realname,c_password,c_header,c_phone,c_question,c_answer,c_address,c_email,c_money) " +
                "values(?,?,?,?,?,?,?,?,?,?)";
        int res = JDBCUtils.execute(sql, customer.getCusername(), customer.getCrealname(), customer.getCpassword(),
                customer.getCheader(), customer.getCphone(), customer.getCquestion(), customer.getCanswer(),
                customer.getCaddress(), customer.getCemail(), customer.getCmoney());

        if (res != 0) {
            return true;
        } else {
            return false;
        }

    }

    /**
     * 用户改密码
     *
     * @param customer：用户信息对象
     * @return
     */
    public boolean change(Customer customer) {


        String sql = "update customer set c_username=?," +
                "c_realname=?," +
                "c_password=?," +
                "c_phone=?," +
                "c_question=?," +
                "c_answer=?," +
                "c_address=?," +
                "c_email=?" +
                "where c_id=?";

        int res = JDBCUtils.execute(sql,
                customer.getCusername(),
                customer.getCrealname(),
                customer.getCpassword(),
                customer.getCphone(),
                customer.getCquestion(),
                customer.getCanswer(),
                customer.getCaddress(),
                customer.getCemail(),
                customer.getCid()
        );

        System.out.print(res);

        if (res != 0) {
            return true;
        } else {
            return false;
        }

    }

    /**
     * 支付扣钱
     * @param orderdetails
     * @param customer
     * @return
     */
    public int pay(List<Orderdetails> orderdetails, Customer customer){

        int sum=0;
        for (Orderdetails i:orderdetails) {
            sum=sum+(int)i.getPprice();
        }

        int res=(int)customer.getCmoney()-sum;
        if (res>0){

            String sql= "UPDATE customer SET c_money=? WHERE c_id=?";
            JDBCUtils.execute(sql,res,customer.getCid());
            return sum;
        }

        return 0;
    }
}
