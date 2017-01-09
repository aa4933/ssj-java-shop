package com.model;


import com.db.JDBCUtils;
import com.db.entity.Idea;
import com.db.entity.MainType;
import com.db.entity.Orderdetails;
import com.db.entity.Payment;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class MainModel {
    /**
     * 获得所有user信息
     *
     * @return Object
     */
    public Object getUser() {
        //如何注入jdbc类，而不是new
        String sql = "select * from customer";

        Object res = JDBCUtils.queryForList(sql, Orderdetails.class);

        return res;
    }

    /**
     * 获得所有类型信息
     *
     * @return Object
     */
    public List<MainType> getMainType() {
        String sql = "SELECT * FROM main_type";

        List<MainType> mainTypes = JDBCUtils.queryForList(sql, MainType.class);

        return mainTypes;
    }

    /**
     * 获得所有支付类型
     * @return
     */
    public List<Payment> getPayment(){

        String sql="SELECT * FROM payment";

        List<Payment> payments=JDBCUtils.queryForList(sql,Payment.class);
        return  payments;
    }

    /**
     * 通过产品找到相应的评价信息
     * @param id
     * @return
     */
    public List<Idea> getIdeaByPid(String id){
        String sql="SELECT * FROM idea WHERE p_id=?";

        List<Idea> ideas=JDBCUtils.queryForList(sql,Idea.class,id);

        return  ideas;
    }

    /**
     * 对产品作出新评价
     * @param pid
     * @return
     */
    public int addIdea(String pid,String user,String message){
        String sql = "insert into idea(c_name," +
                "new_message," +
                "new_time," +
                "p_id) " +
                "values(?,?,?,?)";

        Date date=new Date();
        String year=String.format("%tY",date);
        String month=String.format("%tB",date);
        String day=String.format("%te",date);
        String time=year+"年"+month+day+"日";

        int res=JDBCUtils.execute(sql,user,message,time,pid);

        return res;
    }

    /**
     * 回复评价
     * @param id
     * @param message
     * @return
     */
    public int updateIdea(String id,String user,String message){
        String sql = "UPDATE idea SET c_header=?,re_message=?,re_time=? WHERE id=?";

        Date date=new Date();
        String year=String.format("%tY",date);
        String month=String.format("%tB",date);
        String day=String.format("%te",date);
        String time=year+"年"+month+day+"日";

        int res=JDBCUtils.execute(sql,user,message,time,id);

        return res;
    }

}
