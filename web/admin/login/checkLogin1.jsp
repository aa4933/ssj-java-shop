<%@ page language="java" import="java.util.*,java.sql.*"
	pageEncoding="utf-8"%>
	<%@ page import="utils.ConnDB" %>
	<jsp:useBean id="admin" scope="session" class="bean.AdminBean"/> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>用户验证</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>
	<body>
		
		<%
			
			
			
		    String username = request.getParameter("user");
			String pwd = request.getParameter("pass");
			String rand = (String)session.getAttribute("rand"); 
            String input = request.getParameter("inputRand"); 
		if(rand.equals(input)){ 
		
			ConnDB conn =new ConnDB();
			conn.OpenConn();
			conn.createStmt();
			String sql="select * from admin where a_name='"+username+"'and a_pass='"+pwd+"'";
			
			 ResultSet rs =conn.Query(sql);
			

			if (rs.next()) {

				session.setAttribute("username", username);
				
				admin.setId(rs.getInt("a_id"));
				admin.setName(rs.getString("a_name"));				
				admin.setPass(rs.getString("a_pass"));				
				admin.setHeader(rs.getString("a_header"));				
				admin.setPhone(rs.getString("a_phone"));				
				admin.setEmail(rs.getString("a_email"));				
				
				out.println("<script>alert('恭喜你，登录成功!')</script>");
				response.setHeader("Refresh", "0;URL=../home/index.jsp");
			} else {
			out.println("<script>alert('账号或密码错误!')</script>");
				response.setHeader("Refresh", "0;URL=login.jsp");
				
			}
		}
		else{
			out.print("<script>alert('请输入正确的验证码！');location.href='admin/login/login.jsp';</script>"); 		
		}
		
			
		%>

	</body>
</html>
