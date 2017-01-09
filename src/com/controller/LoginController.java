package com.controller;

import com.db.entity.Customer;
import com.model.MainModel;
import com.model.UserModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by xiaoqiang on 2016/12/29.
 */


@RequestMapping(value = "/login")
@Controller
public class LoginController {




    @Autowired
    private UserModel userModel;

    /**
     * 登录校验路由
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/login", method = {RequestMethod.GET,RequestMethod.POST})
    public String check(Model model, HttpServletRequest request, HttpServletResponse response) {


        String name= request.getParameter("name");
        String password=request.getParameter("password");


        boolean res = userModel.login(name,password);


        if (!res){


            model.addAttribute("suc",0);

            return "redirect:/login";

        }else {

            request.getSession().setAttribute("user",name);
            request.getSession().setAttribute("password",password);

            model.addAttribute("suc",1);
            model.addAttribute("username",name);


            return "redirect:/";
        }


    }

    /**
     * 注册用户
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/register", method = {RequestMethod.GET,RequestMethod.POST})
    public String register(Model model,HttpServletRequest request,HttpServletResponse response) {

        String userName= request.getParameter("username");
        String realName= request.getParameter("realname");
        String password=request.getParameter("password");
        Customer $customer=new Customer();

        $customer.setCusername(userName);
        $customer.setCrealname(realName);
        $customer.setCpassword(password);

        boolean res = userModel.register($customer);


        if (res){
            return "redirect:/login";
        }
        else {
            return "redirect:/register";
        }

    }

    /**
     * 修改用户信息
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/alter", method = {RequestMethod.GET,RequestMethod.POST})
    public String alter(Model model,HttpServletRequest request,HttpServletResponse response) {


        String userName= request.getParameter("username");
        String realName= request.getParameter("realname");
        String password=request.getParameter("password");
        Customer $customer=new Customer();

        $customer.setCusername(userName);
        $customer.setCrealname(realName);
        $customer.setCpassword(password);
        $customer.setCphone(request.getParameter("phone"));
        $customer.setCquestion(request.getParameter("question"));
        $customer.setCanswer(request.getParameter("answer"));
        $customer.setCaddress(request.getParameter("address"));
        $customer.setCemail(request.getParameter("email"));
        int $cid=Integer.parseInt(request.getParameter("cid"));
        $customer.setCid($cid);

        boolean res = userModel.change($customer);


            return "redirect:/user";

    }
}
