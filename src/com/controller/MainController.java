package com.controller;

import com.db.entity.*;
import com.model.MainModel;
import com.model.ShopModel;
import com.model.UserModel;
import org.apache.log4j.chainsaw.Main;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @author caige  Date: 2016/7/13
 */
@RequestMapping(value = "/")
@Controller
public class MainController {

    @Autowired
    private MainModel mainModel;
    @Autowired
    private UserModel userModel;
    @Autowired
    private ShopModel shopModel;

    /**
     * 首页路由
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Model model, HttpServletRequest request, HttpServletResponse response) {

        ///校验登录
        String ses=(String)request.getSession().getAttribute("user");

        //映射基本信息
        List<MainType> res=mainModel.getMainType();
        List<Orderdetails> orderdetailses=shopModel.getAllCart(ses);

        model.addAttribute("res",res);
        model.addAttribute("cart",orderdetailses.size());
        if (ses!=null){
            model.addAttribute("suc",1);
            model.addAttribute("username",ses);
        }else {
            model.addAttribute("suc",0);
        }


        model.addAttribute("title","首页");
        return "/font/index";
    }

    /**
     * 购物车
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/cart", method = RequestMethod.GET)
    public String cart(Model model,HttpServletRequest request, HttpServletResponse response) {

        ///校验登录
        String ses=(String)request.getSession().getAttribute("user");

        //映射基本信息
        List<MainType> res=mainModel.getMainType();
        List<Orderdetails> orderdetailses=shopModel.getAllCart(ses);

        model.addAttribute("res",res);
        model.addAttribute("cart",orderdetailses.size());
        if (ses!=null){
            model.addAttribute("suc",1);
            model.addAttribute("username",ses);
        }else {
            model.addAttribute("suc",0);
        }

        ////

        List<Orderdetails> cart=shopModel.getAllCart(ses);

        model.addAttribute("carts",cart);

        model.addAttribute("title","购物车");
        return "/font/cart";
    }
    /**
     * 结算页面
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/balance", method = RequestMethod.GET)
    public String balance(Model model,HttpServletRequest request, HttpServletResponse response) {

        ///校验登录
        String ses=(String)request.getSession().getAttribute("user");

        //映射基本信息
        List<MainType> res=mainModel.getMainType();
        List<Orderdetails> orderdetailses=shopModel.getAllCart(ses);

        model.addAttribute("res",res);
        model.addAttribute("cart",orderdetailses.size());
        if (ses!=null){
            model.addAttribute("suc",1);
            model.addAttribute("username",ses);
        }else {
            model.addAttribute("suc",0);
        }

        ///
        List<Orderdetails> orderdetails= shopModel.getAllCart(ses);
        List<Payment> payments=mainModel.getPayment();

        model.addAttribute("order",orderdetails);
        model.addAttribute("payment",payments);


        model.addAttribute("title","结算");
        return "/font/balance";
    }
    /**
     * 登录
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model,HttpServletRequest request, HttpServletResponse response) {

        ///校验登录
        String ses=(String)request.getSession().getAttribute("user");

        //映射基本信息
        List<MainType> res=mainModel.getMainType();
        List<Orderdetails> orderdetailses=shopModel.getAllCart(ses);

        model.addAttribute("res",res);
        model.addAttribute("cart",orderdetailses.size());
        if (ses!=null){
            model.addAttribute("suc",1);
            model.addAttribute("username",ses);
        }else {
            model.addAttribute("suc",0);
        }

        model.addAttribute("title","登录／注册");
        return "/font/login";
    }

    /**
     * 注册
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register(Model model,HttpServletRequest request, HttpServletResponse response) {

        ///校验登录
        String ses=(String)request.getSession().getAttribute("user");

        //映射基本信息
        List<MainType> res=mainModel.getMainType();
        List<Orderdetails> orderdetailses=shopModel.getAllCart(ses);

        model.addAttribute("res",res);
        model.addAttribute("cart",orderdetailses.size());
        if (ses!=null){
            model.addAttribute("suc",1);
            model.addAttribute("username",ses);
        }else {
            model.addAttribute("suc",0);
        }


        model.addAttribute("title","注册");
        return "font/register";
    }

    /**
     * 单个产品简介
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/product", method = RequestMethod.GET)
    public String product(Model model,HttpServletRequest request, HttpServletResponse response) {

        ///校验登录
        String ses=(String)request.getSession().getAttribute("user");

        //映射基本信息
        List<MainType> res=mainModel.getMainType();
        List<Orderdetails> orderdetailses=shopModel.getAllCart(ses);

        model.addAttribute("res",res);
        model.addAttribute("cart",orderdetailses.size());
        if (ses!=null){
            model.addAttribute("suc",1);
            model.addAttribute("username",ses);
        }else {
            model.addAttribute("suc",0);
        }


        ///
        String id=request.getParameter("id");
        Product product=shopModel.getOneProduct(id);
        List<Idea> ideas=mainModel.getIdeaByPid(id);

        model.addAttribute("ideas",ideas);
        model.addAttribute("ideaNum",ideas.size());
        model.addAttribute("product",product);

        model.addAttribute("title","产品信息");
        return "/font/product";
    }

    /**
     * 所有商品
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/shop", method = RequestMethod.GET)
    public String shop(Model model,HttpServletRequest request, HttpServletResponse response) {

        ///校验登录
        String ses=(String)request.getSession().getAttribute("user");

        //映射基本信息
        List<MainType> res=mainModel.getMainType();
        List<Orderdetails> orderdetailses=shopModel.getAllCart(ses);

        model.addAttribute("res",res);
        model.addAttribute("cart",orderdetailses.size());
        if (ses!=null){
            model.addAttribute("suc",1);
            model.addAttribute("username",ses);
        }else {
            model.addAttribute("suc",0);
        }
        //映射分页信息
        Long number=shopModel.getProductNumber();
        Long pages;
        if (number%4==0){
            pages=number/4;
        }else {
            pages=(number/4)+1;
        }
        model.addAttribute("pages",pages);
        //
        String type=(String)request.getParameter("type");
        String page=(String)request.getParameter("page");

        model.addAttribute("page",page);

        int start =0;
        if (page!=null){
            start=(Integer.parseInt(page)-1)*4;
        }else{
            start=0;
        }

        //查找商品
        List<Product> products=shopModel.getProduct(type,start);

        model.addAttribute("products",products);

        model.addAttribute("title","商城");

        return "/font/shop";
    }

    /**
     * 用户信息详情表
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public String user(Model model,HttpServletRequest request, HttpServletResponse response) {

        ///校验登录
        String ses=(String)request.getSession().getAttribute("user");

        //映射基本信息
        List<MainType> res=mainModel.getMainType();
        List<Orderdetails> orderdetailses=shopModel.getAllCart(ses);

        model.addAttribute("res",res);
        model.addAttribute("cart",orderdetailses.size());
        if (ses!=null){
            model.addAttribute("suc",1);
            model.addAttribute("username",ses);

            Customer customer= userModel.getCustomer(ses);


            model.addAttribute("user",customer);

        }else {
            return "redirect:/";
        }



        model.addAttribute("title","用户信息");
        return "/font/user";
    }

    /**
     * 退出登录
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(Model model,HttpServletRequest request, HttpServletResponse response) {


        request.getSession().setAttribute("user",null);
        request.getSession().setAttribute("password",null);

        return "redirect:/";
    }
    /**
     * 支付成功
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/suc", method = RequestMethod.GET)
    public String suc(Model model,HttpServletRequest request, HttpServletResponse response) {

        ///校验登录
        String ses=(String)request.getSession().getAttribute("user");

        //映射基本信息
        List<MainType> res=mainModel.getMainType();
        List<Orderdetails> orderdetailses=shopModel.getAllCart(ses);

        model.addAttribute("res",res);
        model.addAttribute("cart",orderdetailses.size());
        if (ses!=null){
            model.addAttribute("suc",1);
            model.addAttribute("username",ses);
        }else {
            model.addAttribute("suc",0);
        }

        model.addAttribute("title","支付提示");
        return "/font/suc";
    }

    /**
     * 回复页面
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/reply", method = RequestMethod.GET)
    public String reply(Model model,HttpServletRequest request, HttpServletResponse response) {

        ///校验登录
        String ses=(String)request.getSession().getAttribute("user");

        //映射基本信息
        List<MainType> res=mainModel.getMainType();
        List<Orderdetails> orderdetailses=shopModel.getAllCart(ses);

        model.addAttribute("res",res);
        model.addAttribute("cart",orderdetailses.size());
        if (ses!=null){
            model.addAttribute("suc",1);
            model.addAttribute("username",ses);
        }else {
            model.addAttribute("suc",0);
        }

        String ideaId=request.getParameter("id");
        model.addAttribute("id",ideaId);

        return "/font/reply";
    }
}
