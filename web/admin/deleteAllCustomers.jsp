<%@ page language="java" import="java.util.*,java.sql.*"
	pageEncoding="UTF-8"%>
<%@page import="utils.ConnDB;"%>
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

		<title>删除多个</title>

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
			String deleteids[] = request.getParameterValues("checkAll");
			int i = 0;
			String deleteid = "";
			for (i = 0; i < deleteids.length; i++) {
				deleteid += deleteids[i];
				if (i != deleteids.length - 1)
					deleteid += ",";
			}
			ConnDB db = new ConnDB();
			db.OpenConn();
			db.createStmt();
			String sql = "delete from customer where c_id  in(" + deleteid + ")";//定义SQL语句
			int result = db.Update(sql);

			if (result != 0) {
				response.sendRedirect("CustomerList.jsp");//执行插入成功跳转
			} else {
				response.sendRedirect("CustomerList.jsp");//执行插入失败跳转
			}
		%>
	</body>
</html>
