<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ page import="java.sql.*,java.util.*,utils.ConnDB"%>
<!DOCTYPE html>
<html>

	<head>
       <jsp:include page="../common/common_css.jsp" flush="true" /> 
	</head>
	
   <body class="no-skin">
   
	<div id="fakeLoader" style="display: none;"></div>
	
	<div class="main-content-inner">
		<!-- #section:basics/content.breadcrumbs -->
		<div class="breadcrumbs" id="breadcrumbs">
			<script type="text/javascript">
				try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
				
				function saveUpdate(id){
				
					if(checkPhone()){
					document.getElementById("form").method="post";
					document.getElementById("form").action="SaveCustomer.jsp?id="+id;
    				document.getElementById("form").submit();
    				}else{
    				alert("请输入正确的手机号！！");
    				
    				}
				}
				
				function checkPhone(){ 
    			var phone = document.getElementById('cphone').value;
    				if(!(/^1[34578]\d{9}$/.test(phone))){ 
        			alert("手机号码有误，请重填");  
       				 return false; 
   					 } 
   					 return true;
}
				
				
				function add(id){
					
					if(checkPhone()){
					document.getElementById("form").method="post";
					document.getElementById("form").action="AddCustomer.jsp?id="+id;
    				document.getElementById("form").submit();
    				}else{
    				alert("请输入正确的手机号！！");
    				
    				}
				}
			
			</script>
			
			<ul class="breadcrumb">
				<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">首页</a></li>
				<li class="active">客户信息</li>
			</ul>
			<!-- /.breadcrumb -->
		</div>
		
		<div class="page-content" >   
			<%
					String type = request.getParameter("type");
					String id = request.getParameter("id");
				%>
				<div class="page-header">
					<a href="javascript:void(0)" onclick="backClick()"
						class="btn btn-sm btn-info" title="返回上一页"><i
						class="glyphicon glyphicon-chevron-left bigger-110"></i>返回</a>
					<%
						if (type.equals("edit")) {
					%>
					<a href="javascript:void(0)" onclick="saveUpdate(<%=id%>)"
						class="btn btn-sm btn-g-save"><i
						class="ace-icon fa fa-floppy-o bigger-130"></i>保存</a>
					<%
						} else {
					%>
					<a href="javascript:void(0)" onclick="add(<%=id%>)"
						class="btn btn-sm btn-g-save"><i
						class="ace-icon fa fa-floppy-o bigger-130"></i>新增</a>
					<%
						}
					%>
				</div>
            
            <div class="well">
            	<div class="row">
				  <div class="col-xs-12">
			<%
								if (type.equals("edit")) {
							%>
				  
				  	  <form id="form" role="form" method="post" enctype="multipart/form-data">

		                    <input type="hidden"  >
		                    <input type="hidden" id="id" name="id">
							
						<%
									ConnDB db = new ConnDB();
										db.OpenConn();
										db.createStmt();
										String sql = "select * from Customer where c_id=" + id;
										ResultSet rs = db.Query(sql);
										if (rs.next()) {
								%>
							
						     <div class="row">	
						       	<div class="col-sm-6 no-margin-right" >		 	
									<label class="col-sm-2 control-label no-padding-right" for="cusername">
										用户名: 
									 </label>
									<div class="col-sm-10">
										<input type="text" id="cusername" name="cusername" placeholder="用户名" class="col-sm-12" value=<%=rs.getString("c_username")%>>
									</div>
							    </div>
						       	<div class="col-sm-6 no-margin-right" >		 	
									<label class="col-sm-2 control-label no-padding-right" for="crealname">
										真实姓名: 
									 </label>
									<div class="col-sm-10">
										<input type="text" id="crealname" name="crealname" placeholder="真实姓名" class="col-sm-12" value=<%=rs.getString("c_realname")%>>
									</div>
							    </div>
						     </div> 
							 <div class="hr hr-14 hr-dotted"></div>
						     <div class="row">	
						       	<div class="col-sm-6 no-margin-right" >		 	
									<label class="col-sm-2 control-label no-padding-right" for="cpassword">
										密码: 
									 </label>
									<div class="col-sm-10">
										<input type="text" id="cpassword" name="cpassword" placeholder="密码" class="col-sm-12" value=<%=rs.getString("c_password")%>>
									</div>
							    </div>
						       <div class="col-sm-6 no-margin-right">
										<label class="col-sm-2 control-label no-padding-right"
											for="cheader">
											头像:
										</label>
										<div class="col-sm-10">
											
											<img alt="头像" src="../<%=rs.getString("c_header")%>">
											<input type="hidden" id="cheader" name="cheader"
												placeholder="头像" class="col-sm-12"
												value=<%=rs.getString("c_header")%>>
												<input type="file" name="file1" size="30">
												
										</div>
									</div>
						     </div> 
							 <div class="hr hr-14 hr-dotted"></div>
						     <div class="row">	
						       	<div class="col-sm-6 no-margin-right" >		 	
									<label class="col-sm-2 control-label no-padding-right" for="cphone">
										电话号码: 
									 </label>
									<div class="col-sm-10">
										<input type="text" id="cphone" name="cphone" placeholder="电话号码" class="col-sm-12" value=<%=rs.getString("c_phone")%>>
									</div>
							    </div>
						       	<div class="col-sm-6 no-margin-right" >		 	
									<label class="col-sm-2 control-label no-padding-right" for="cquestion">
										问题: 
									 </label>
									<div class="col-sm-10">
										<input type="text" id="cquestion" name="cquestion" placeholder="问题" class="col-sm-12" value=<%=rs.getString("c_question")%>>
									</div>
							    </div>
						     </div> 
							 <div class="hr hr-14 hr-dotted"></div>
						     <div class="row">	
						       	<div class="col-sm-6 no-margin-right" >		 	
									<label class="col-sm-2 control-label no-padding-right" for="canswer">
										问题答案: 
									 </label>
									<div class="col-sm-10">
										<input type="text" id="canswer" name="canswer" placeholder="问题答案" class="col-sm-12" value=<%=rs.getString("c_answer")%>>
									</div>
							    </div>
						       	<div class="col-sm-6 no-margin-right" >		 	
									<label class="col-sm-2 control-label no-padding-right" for="caddress">
										地址: 
									 </label>
									<div class="col-sm-10">
										<input type="text" id="caddress" name="caddress" placeholder="地址" class="col-sm-12" value=<%=rs.getString("c_address")%>>
									</div>
							    </div>
						     </div> 
							 <div class="hr hr-14 hr-dotted"></div>
						     <div class="row">	
						       	<div class="col-sm-6 no-margin-right" >		 	
									<label class="col-sm-2 control-label no-padding-right" for="cemail">
										邮箱: 
									 </label>
									<div class="col-sm-10">
										<input type="text" id="cemail" name="cemail" placeholder="邮箱" class="col-sm-12" value=<%=rs.getString("c_email")%>>
									</div>
							    </div>
						       	<div class="col-sm-6 no-margin-right" >		 	
									<label class="col-sm-2 control-label no-padding-right" for="cmoney">
										账户余额: 
									 </label>
									<div class="col-sm-10">
										<input type="text" id="cmoney" name="cmoney" placeholder="账户余额" class="col-sm-12" value=<%=rs.getString("c_money")%>>
									</div>
							    </div>
						     </div> 
							 <div class="hr hr-14 hr-dotted"></div>
					 </form>
					 
							<%
								}
								} else {
							%>
							<form id="form" role="form" enctype="multipart/form-data">

		                    <input type="hidden"  >
		                    <input type="hidden" id="id" name="id">
						     <div class="row">	
						       	<div class="col-sm-6 no-margin-right" data-bind="visible:true">		 	
									<label class="col-sm-2 control-label no-padding-right" for="cusername">
										用户名: 
									 </label>
									<div class="col-sm-10">
										<input type="text" id="cusername" name="cusername" placeholder="用户名" class="col-sm-12">
									</div>
							    </div>
						       	<div class="col-sm-6 no-margin-right" data-bind="visible:true">		 	
									<label class="col-sm-2 control-label no-padding-right" for="crealname">
										真实姓名: 
									 </label>
									<div class="col-sm-10">
										<input type="text" id="crealname" name="crealname" placeholder="用户名" class="col-sm-12">
									</div>
							    </div>
						     </div> 
							 <div class="hr hr-14 hr-dotted"></div>
						     <div class="row">	
						       	<div class="col-sm-6 no-margin-right" data-bind="visible:true">		 	
									<label class="col-sm-2 control-label no-padding-right" for="cpassword">
										密码: 
									 </label>
									<div class="col-sm-10">
										<input type="text" id="cpassword" name="cpassword" placeholder="密码" class="col-sm-12">
									</div>
							    </div>
						       	<div class="col-sm-6 no-margin-right" data-bind="visible:true">		 	
									<label class="col-sm-2 control-label no-padding-right" for="cheader">
										头像: 
									 </label>
									<div class="col-sm-10">
										<input type="hidden" id="cheader" name="cheader" placeholder="头像" class="col-sm-12">
										<input type="file" name="file1" size="30">
									</div>
							    </div>
						     </div> 
							 <div class="hr hr-14 hr-dotted"></div>
						     <div class="row">	
						       	<div class="col-sm-6 no-margin-right" data-bind="visible:true">		 	
									<label class="col-sm-2 control-label no-padding-right" for="cphone">
										电话号码: 
									 </label>
									<div class="col-sm-10">
										<input type="text" id="cphone" name="cphone" placeholder="电话号码" class="col-sm-12">
									</div>
							    </div>
						       	<div class="col-sm-6 no-margin-right" data-bind="visible:true">		 	
									<label class="col-sm-2 control-label no-padding-right" for="cquestion">
										问题: 
									 </label>
									<div class="col-sm-10">
										<input type="text" id="cquestion" name="cquestion" placeholder="问题" class="col-sm-12">
									</div>
							    </div>
						     </div> 
							 <div class="hr hr-14 hr-dotted"></div>
						     <div class="row">	
						       	<div class="col-sm-6 no-margin-right" data-bind="visible:true">		 	
									<label class="col-sm-2 control-label no-padding-right" for="canswer">
										问题答案: 
									 </label>
									<div class="col-sm-10">
										<input type="text" id="canswer" name="canswer" placeholder="问题答案" class="col-sm-12">
									</div>
							    </div>
						       	<div class="col-sm-6 no-margin-right" data-bind="visible:true">		 	
									<label class="col-sm-2 control-label no-padding-right" for="caddress">
										地址: 
									 </label>
									<div class="col-sm-10">
										<input type="text" id="caddress" name="caddress" placeholder="地址" class="col-sm-12">
									</div>
							    </div>
						     </div> 
							 <div class="hr hr-14 hr-dotted"></div>
						     <div class="row">	
						       	<div class="col-sm-6 no-margin-right" data-bind="visible:true">		 	
									<label class="col-sm-2 control-label no-padding-right" for="cemail">
										邮箱: 
									 </label>
									<div class="col-sm-10">
										<input type="text" id="cemail" name="cemail" placeholder="邮箱" class="col-sm-12">
									</div>
							    </div>
						       	<div class="col-sm-6 no-margin-right" data-bind="visible:true">		 	
									<label class="col-sm-2 control-label no-padding-right" for="cmoney">
										账户余额: 
									 </label>
									<div class="col-sm-10">
										<input type="text" id="cmoney" name="cmoney" placeholder="账户余额" class="col-sm-12">
									</div>
							    </div>
						     </div> 
							 <div class="hr hr-14 hr-dotted"></div>
					 </form>
					 <%
								}
							%>
							
					 
					 
				  </div>
						

			   </div>
            </div>
		</div> 
		<!-- /.page-content -->
	</div>
	<!-- /.main-content -->
	<jsp:include page="../common/common_js.jsp" flush="true" /> 
	
	<!-- inline scripts related to this page -->
	<script type="text/javascript">

      
    </script>
    
  </body>
  
</html>

