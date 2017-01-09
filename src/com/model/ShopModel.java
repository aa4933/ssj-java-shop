package com.model;

import com.db.JDBCUtils;
import com.db.entity.Count;
import com.db.entity.Customer;
import com.db.entity.Orderdetails;
import com.db.entity.Product;
import javafx.scene.input.DataFormat;
import org.springframework.stereotype.Service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by wuilly on 2017/1/2.
 */

@Service
public class ShopModel {
    /**
     * 根据条件获取商品信息
     * @param type
     * @return
     */
    public List<Product> getProduct(String type,int start){

        List<Product> products=null;

        if (type==null){

            String sql = "select * from product limit "+start+",4";

            products= JDBCUtils.queryForList(sql,Product.class);
        }else {
            String sql = "select * from product where p_type=? limit "+start+",4";

           products= JDBCUtils.queryForList(sql,Product.class,type);
        }



        return products;
    }

    /**
     * 获得产品总数
     * @return
     */
    public Long getProductNumber(){
        String sql="SELECT count(*) FROM product";

        Long number=JDBCUtils.getCount(sql);

        return number;
    }

    /**
     * 获得单个产品信息
     * @param id
     * @return
     */
    public Product getOneProduct(String id){
        String sql = "select * from product where p_id=?";

        //多条数据查询
        //  Object res= JDBCUtils.queryForList(sql,Customer.class);

        //一条数据查询
        Product res = JDBCUtils.queryForObject(sql, Product.class, id);

        return res;
    }

    /**
     * 加入购物车
     * @param product
     * @param user
     * @return
     */
    public boolean addCart(Product product , String user){
        String sql = "insert into orderdetails(p_id," +
                "p_price," +
                "p_number," +
                "order_id," +
                "user) " +
                "values(?,?,?,?,?)";
        int res = JDBCUtils.execute(sql, product.getPid(),product.getPprice(),1,0,user);

        if (res != 0) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 获得所有购物车信息
     * @param user
     * @return
     */
    public List<Orderdetails> getAllCart(String user){
        String sql="SELECT * FROM orderdetails WHERE user=? AND order_id=0";

        List<Orderdetails> orderdetailses=JDBCUtils.queryForList(sql,Orderdetails.class,user);

        return  orderdetailses;
    }

    /**
     * 支付插入订单表，生成订单
     * @param address
     * @param customer
     * @param sum
     * @param payment
     * @return
     */
    public int payAddOrder(String address,Customer customer,int sum ,String payment){
        String sql = "insert into orders(order_payment," +
                "order_address," +
                "order_email," +
                "order_user," +
                "order_time," +
                "order_sum) " +
                "values(?,?,?,?,?,?)";
        String checkSql="UPDATE orderdetails SET order_id=? WHERE user=? AND order_id=0";

        Date date=new Date();
        String year=String.format("%tY",date);
        String month=String.format("%tB",date);
        String day=String.format("%te",date);
        String time=year+"-"+month+"-"+day;



        int id=JDBCUtils.execute(sql,payment,address,customer.getCemail(),customer.getCusername(),time,sum);

        JDBCUtils.execute(checkSql,1,customer.getCusername());

        return id;
    }

}
