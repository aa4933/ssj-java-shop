<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*,utils.ConnDB"%>
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

		<title>保存</title>

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
		request.setCharacterEncoding("utf-8");
			String payment =(String)request.getParameter("orderPayment");
			String address =(String)request.getParameter("orderAdress");
			String email =(String)request.getParameter("orderEmail");
			String user =(String)request.getParameter("orderUser");
			String time =(String)request.getParameter("orderTime");
			String sum =(String)request.getParameter("orderSum");
			
		
		
			int id = Integer.parseInt(request.getParameter("id"));
			ConnDB db1 = new ConnDB();
			db1.OpenConn();
			db1.createStmt();
			int result = db1.Update("update orders set "
			+"order_payment='"+payment+"',"
			+"order_address='"+address+"',"
			+"order_email='"+email+"',"
			+"order_user='"+user+"',"
			+"order_time='"+time+"',"
			+"order_sum="+sum		
			+" where order_id="+id);
			
			
			if (result != 0) {
				
				response.sendRedirect("OrdersList.jsp");
				
			} else {
				out.println("<script>confirm('失败')</script>");
				response.setHeader("Refresh", "0;URL=OrdersList.jsp");

			}
		%>
	</body>
</html>
