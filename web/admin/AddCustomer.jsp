<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*,utils.ConnDB"%>
<%@ page import="com.jspsmart.upload.SmartUpload" %>
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
			String name = (String) upload.getRequest().getParameter("cusername");
			String realname = (String) upload.getRequest().getParameter("crealname");
			String password = (String) upload.getRequest().getParameter("cpassword");
			//String header = (String) upload.getRequest().getParameter("cheader");
			String phone = (String) upload.getRequest().getParameter("cphone");
			String question = (String) upload.getRequest().getParameter("cquestion");
			String answer = (String) upload.getRequest().getParameter("canswer");
			String address = (String) upload.getRequest().getParameter("caddress");
			String email = (String) upload.getRequest().getParameter("cemail");
			
			float money=Float.parseFloat(upload.getRequest().getParameter("cmoney"));
			
			String filename="";
			
			if(upload.getFiles().getFile(0).getSize()==0){
			
				filename=upload.getRequest().getParameter("cheader");
			}else{
				
			  filename= "upload/"
					+ upload.getFiles().getFile(0).getFileName();
			}
			
			ConnDB db1 = new ConnDB();
			db1.OpenConn();
			db1.createStmt();

			String sql = "insert into customer(c_username,c_realname,c_password,c_header,c_phone,c_question,c_email,c_answer,c_address,c_money) values( "
					+ "'"
					+ name
					+ "',"
					+ "'"
					+ realname
					+ "',"
					+ "'"
					+ password
					+ "',"
					+ "'"
					+ filename
					+ "',"
					+ "'"
					+ phone
					+ "',"
					+ "'"
					+ question
					+ "',"
					+ "'"
					+ answer
					+ "'," 
					+ "'" + address 
					+ "'," + "'" 
					+ email + "',"+money+")";
			System.out.println(sql);
			int result = db1.Update(sql);
			if (result != 0) {

				response.sendRedirect("CustomerList.jsp");

			} else {
				out.println("<script>confirm('失败')</script>");
				response.setHeader("Refresh", "0;URL=CustomerList.jsp");
			}
		%>
	</body>
</html>
