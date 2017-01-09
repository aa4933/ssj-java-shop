<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*,utils.ConnDB,com.jspsmart.upload.*"%>
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
			SmartUpload upload = new SmartUpload();
			upload.initialize(pageContext);
			upload.setMaxFileSize(100000);
			upload.setAllowedFilesList("jpg,JPG,gif,png");
			upload.setDeniedFilesList("exe,bat,jsp,js,htm,html");
			upload.upload();
			upload.save("/upload");
			
			request.setCharacterEncoding("utf-8");
			String type = (String) upload.getRequest().getParameter("ptype");
			
			String name = (String) upload.getRequest().getParameter("pname");
			
			String price = (String) upload.getRequest().getParameter("pprice");
			
			String quantity = (String) upload.getRequest().getParameter("pquantity");
			
			String image = (String) upload.getRequest().getParameter("pimage");
			
			String description = (String) upload.getRequest().getParameter("pdescription");
			String time = (String) upload.getRequest().getParameter("ptime");
			
			
			String filename = "upload/"
					+ upload.getFiles().getFile(0).getFileName();
			
			
			ConnDB db1 = new ConnDB();
			db1.OpenConn();
			db1.createStmt();
			int result = db1
					.Update("insert into product(p_type,p_name,p_price,p_quantity,p_image,p_description,p_time) values( "
							+ "'"
							+ type
							+ "',"
							+ "'"
							+ name
							+ "',"
							+ "'"
							+ price
							+ "',"
							+ "'"
							+ quantity
							+ "',"
							+ "'"
							+ filename
							+ "',"
							+ "'"
							+ description
							+ "',"
							+ "'"
							+ time + "')");
			if (result != 0) {
				
				response.sendRedirect("ProductList.jsp");

			} else {
				out.println("<script>confirm('失败')</script>");
				response.setHeader("Refresh", "0;URL=ProductList.jsp");
			}
		%>
	</body>
</html>
