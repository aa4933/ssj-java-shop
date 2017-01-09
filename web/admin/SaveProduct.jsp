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
			
			request.setCharacterEncoding("UTF-8");
			String type = (String) upload.getRequest().getParameter("ptype");
		
			
			String name = (String) upload.getRequest().getParameter("pname");
			
			
			String price = (String) upload.getRequest().getParameter("pprice");
		
			String quantity = (String) upload.getRequest().getParameter("pquantity");
		
			String image = (String) upload.getRequest().getParameter("pimage");
		
			
			String description = (String) upload.getRequest().getParameter("pdescription");
			
			String time = (String) upload.getRequest().getParameter("ptime");
			
			int id = Integer.parseInt(request.getParameter("id"));
			String filename="";
			
			if(upload.getFiles().getFile(0).getSize()==0){
			
				filename=upload.getRequest().getParameter("pimage");
			}else{
				System.out.println(upload.getFiles().getFile(0).getFileName());
			  filename= "upload/"
					+ upload.getFiles().getFile(0).getFileName();
			}
			
			
			ConnDB db1 = new ConnDB();
			db1.OpenConn();
			db1.createStmt();
			int result = db1.Update("update product set " + "p_type='" + type
					+ "'," + "p_name='" + name + "'," + "p_price='" + price
					+ "'," + "p_quantity='" + quantity + "'," + "p_image='"
					+ filename + "'," + "p_description='" + description + "',"
					+ "p_time='" + time + "'" + "where p_id=" + id);
			if (result != 0) {
			
				response.sendRedirect("ProductList.jsp");

			} else {
				out.println("<script>confirm('失败')</script>");
				response.setHeader("Refresh", "0;URL=ProductList.jsp");
			}
		%>
	</body>
</html>
