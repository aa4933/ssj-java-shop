<%@ page language="java" import="java.util.*,java.sql.*,utils.ConnDB"
	pageEncoding="utf-8"%>
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

		<title>删除</title>

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
			int deleteid = Integer.parseInt(request.getParameter("deleteid"));
			ConnDB db1 = new ConnDB();
			db1.OpenConn();
			db1.createStmt();
			int result = db1.Update("delete from notice where n_id="+deleteid);
			if (result != 0) {
				out.println("<script>confirm('成功删除')</script>");
				response.sendRedirect("NoticeList.jsp");
				
			} else {
				out.println("<script>confirm('删除失败')</script>");

			}
		%>
	</body>
</html>
