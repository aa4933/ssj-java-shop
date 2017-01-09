package com.controller;

import com.db.entity.Customer;
import com.db.entity.MainType;
import com.db.entity.Orderdetails;
import com.db.entity.Product;
import com.model.MainModel;
import com.model.ShopModel;
import com.model.UserModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * Created by wuilly on 2016/12/29.
 */
@RequestMapping(value = "/shop")
@Controller
public class ShopController {

    @Autowired
    private MainModel mainModel;
    @Autowired
    private UserModel userModel;
    @Autowired
    private ShopModel shopModel;
    /**
     * @param model
     * @return "购物车"
     */
    @RequestMapping(value = "/cart", method = {RequestMethod.GET,RequestMethod.POST})
    public String cart(Model model, HttpServletRequest request, HttpServletResponse response) {

        ///校验登录
        String ses=(String)request.getSession().getAttribute("user");
        if (ses!=null){
            model.addAttribute("suc",1);
            model.addAttribute("username",ses);
        }else {

            return "redirect:/login";
        }


        //
        String id=request.getParameter("id");
        Product product=shopModel.getOneProduct(id);
        boolean bool=shopModel.addCart(product,ses);


        return "redirect:/cart";
    }

    /**
     * 支付
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/balance", method = {RequestMethod.GET,RequestMethod.POST})
    public String balance(Model model, HttpServletRequest request, HttpServletResponse response) {

        ///校验登录
        String ses=(String)request.getSession().getAttribute("user");
        if (ses!=null){
            model.addAttribute("suc",1);
            model.addAttribute("username",ses);
        }else {

            return "redirect:/login";
        }

        ///
        String address=request.getParameter("address");
        String payment=request.getParameter("payment");
        Customer customer=userModel.getCustomer(ses);
        List<Orderdetails> orderdetails= shopModel.getAllCart(ses);


        ///
        int result=userModel.pay(orderdetails,customer);
        if (result!=0){
            int id=shopModel.payAddOrder(address,customer,result,payment);
            if (id!=0){
                return "redirect:/suc";
            }
        }


        return "redirect:/cart";
    }

    /**
     * 提交新评价
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/comment", method = {RequestMethod.GET,RequestMethod.POST})
    public String comment(Model model, HttpServletRequest request, HttpServletResponse response) {

        ///校验登录
        String ses=(String)request.getSession().getAttribute("user");
        if (ses!=null){
            model.addAttribute("suc",1);
            model.addAttribute("username",ses);
        }else {

            return "redirect:/login";
        }

        //
        String pid=request.getParameter("pid");
        String message= null;
        try {
            message = new String(request.getParameter("comment").getBytes("ISO-8859-1"), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        mainModel.addIdea(pid,ses,message);

        return "redirect:/";
    }

    /**
     * 提交新评价
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/reply", method = {RequestMethod.GET,RequestMethod.POST})
    public String reply(Model model, HttpServletRequest request, HttpServletResponse response) {

        ///校验登录
        String ses=(String)request.getSession().getAttribute("user");
        if (ses!=null){
            model.addAttribute("suc",1);
            model.addAttribute("username",ses);
        }else {

            return "redirect:/login";
        }

        //
        String id=request.getParameter("id");
        String message= null;
        try {
            message = new String(request.getParameter("comment").getBytes("ISO-8859-1"), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        mainModel.updateIdea(id,ses,message);

        return "redirect:/";
    }

}
