<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	String username = (String) session.getAttribute("username");

	if (username == null || username == "") {
		//如果不存在就返回登录界面
		response.sendRedirect("admin/login/login.jsp");
	} else {

	}
%>

