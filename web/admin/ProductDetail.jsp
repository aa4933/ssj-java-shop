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
					document.getElementById("form").method="post";
					document.getElementById("form").action="SaveProduct.jsp?id="+id;
    				document.getElementById("form").submit();
				}
				function add(id){
					document.getElementById("form").method="post";
					document.getElementById("form").action="AddProduct.jsp?id="+id;
    				document.getElementById("form").submit();
				}
				
			</script>

				<ul class="breadcrumb">
					<li>
						<i class="ace-icon fa fa-home home-icon"></i>
						<a href="#">首页</a>
					</li>
					<li class="active">
						编辑商品
					</li>
				</ul>
				<!-- /.breadcrumb -->
			</div>

			<div class="page-content">
				<div class="page-header">
					<%
						String type = request.getParameter("type");
						String id = request.getParameter("id");
					%>

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
				<!-- /.page-header -->

				<div class="well">
					<div class="row">
						<div class="col-xs-12">

							<%
								if (type.equals("edit")) {
							%>

							<form id="form" role="form" enctype="multipart/form-data">


								<input type="hidden" id="id" name="id">

								<%
									ConnDB db = new ConnDB();
										db.OpenConn();
										db.createStmt();
										String sql = "select * from product where p_id=" + id;
										ResultSet rs = db.Query(sql);
										if (rs.next()) {
											String ptype = rs.getString("p_type");
								%>

								<div class="row">
									<div class="col-sm-6 no-margin-right">
										<label class="col-sm-2 control-label no-padding-right"
											for="ptype">
											商品类型:
										</label>
										<div class="col-sm-10">
											<SELECT name="ptype" class="col-sm-12">
												<%
													String sql1 = "select * from main_type";
															ConnDB db1 = new ConnDB();
															db1.OpenConn();
															db1.createStmt();

															ResultSet rs1 = db1.Query(sql1);

															while (rs1.next()) {
																String t_type = rs1.getString("t_type");
																String categoryname = rs1.getString(2);

																if (ptype.equals(t_type)) {
												%>
												<option value="<%=t_type%>" selected><%=categoryname%></option>
												<%
													} else {
												%>
												<option value="<%=t_type%>"><%=categoryname%></option>
												<%
													}
															}
												%>
											</SELECT>


										</div>
									</div>
									<div class="col-sm-6 no-margin-right">
										<label class="col-sm-2 control-label no-padding-right"
											for="pname">
											商品名称:
										</label>
										<div class="col-sm-10">
											<input type="text" id="pname" name="pname" placeholder="商品名称"
												class="col-sm-12" value=<%=rs.getString("p_name")%>>
										</div>
									</div>
								</div>
								<div class="hr hr-14 hr-dotted"></div>
								<div class="row">
									<div class="col-sm-6 no-margin-right">
										<label class="col-sm-2 control-label no-padding-right"
											for="pprice">
											商品价格:
										</label>
										<div class="col-sm-10">
											<input type="text" id="pprice" name="pprice"
												placeholder="商品价格" class="col-sm-12"
												value=<%=rs.getString("p_price")%>>
										</div>
									</div>
									<div class="col-sm-6 no-margin-right">
										<label class="col-sm-2 control-label no-padding-right"
											for="pquantity">
											商品数量:
										</label>
										<div class="col-sm-10">
											<input type="text" id="pquantity" name="pquantity"
												placeholder="商品数量" class="col-sm-12"
												value=<%=rs.getString("p_quantity")%>>
										</div>
									</div>
								</div>
								<div class="hr hr-14 hr-dotted"></div>
								<div class="row">
									<div class="col-sm-6 no-margin-right">
										<label class="col-sm-2 control-label no-padding-right"
											for="pimage">
											商品图片:
										</label>
										<div class="col-sm-10">
											<input type="hidden" id="pimage" name="pimage"
												 class="col-sm-12" value=<%=rs.getString("p_image")%>>
												<img alt="图片" src="../<%=rs.getString("p_image")%>">
												
											<input type="file" name="file1" size="30">

										</div>
									</div>
									<div class="col-sm-6 no-margin-right">
										<label class="col-sm-2 control-label no-padding-right"
											for="pdescription">
											描述信息:
										</label>
										<div class="col-sm-10">
											<input type="text" id="pdescription" name="pdescription"
												placeholder="描述信息" class="col-sm-12"
												value=<%=rs.getString("p_description")%>>
										</div>
									</div>
								</div>
								<div class="hr hr-14 hr-dotted"></div>
								<div class="row">
									<div class="col-sm-6 no-margin-right">
										<label class="col-sm-2 control-label no-padding-right"
											for="ptime">
											添加时间:
										</label>
										<div class="col-sm-10">

											<input type="text" readonly="readonly" style="cursor: hand"
												id="ptime" name="ptime" class="col-sm-11" size="15"
												onclick="HS_setDate(ptime)"
												value=<%=rs.getString("p_time")%>>
											<img src="../img/dateicon.jpg" onclick="HS_setDate(ptime)"
												width=20 height=20>

										</div>
									</div>
								</div>
								<div class="hr hr-14 hr-dotted"></div>
							</form>

							<%
								}
								} else {
							%>
							<form id="form" role="form" enctype="multipart/form-data" >

								<input type="hidden">
								<input type="hidden" id="id" name="id">
								<div class="row">
									<div class="col-sm-6 no-margin-right"s>
										<label class="col-sm-2 control-label no-padding-right"
											for="ptype">
											商品类型:
										</label>
										<div class="col-sm-10">
											<SELECT name="ptype" class="col-sm-12">
												<%
													String sql1 = "select * from main_type";
														ConnDB db1 = new ConnDB();
														db1.OpenConn();
														db1.createStmt();

														ResultSet rs1 = db1.Query(sql1);

														while (rs1.next()) {
															String t_type = rs1.getString("t_type");
												%>

												<option value="<%=t_type%>"><%=t_type%></option>
												<%
													}
												%>
											</SELECT>
										</div>
									</div>
									<div class="col-sm-6 no-margin-right" data-bind="visible:true">
										<label class="col-sm-2 control-label no-padding-right"
											for="pname">
											商品名称:
										</label>
										<div class="col-sm-10">
											<input type="text" id="pname" name="pname" placeholder="商品名称"
												class="col-sm-12">
										</div>
									</div>
								</div>
								<div class="hr hr-14 hr-dotted"></div>
								<div class="row">
									<div class="col-sm-6 no-margin-right" data-bind="visible:true">
										<label class="col-sm-2 control-label no-padding-right"
											for="pprice">
											商品价格:
										</label>
										<div class="col-sm-10">
											<input type="text" id="pprice" name="pprice"
												placeholder="商品价格" class="col-sm-12">
										</div>
									</div>
									<div class="col-sm-6 no-margin-right" data-bind="visible:true">
										<label class="col-sm-2 control-label no-padding-right"
											for="pquantity">
											商品数量:
										</label>
										<div class="col-sm-10">
											<input type="text" id="pquantity" name="pquantity"
												placeholder="商品数量" class="col-sm-12">
										</div>
									</div>
								</div>
								<div class="hr hr-14 hr-dotted"></div>
								<div class="row">
									<div class="col-sm-6 no-margin-right" data-bind="visible:true">
										<label class="col-sm-2 control-label no-padding-right"
											for="pimage">
											商品图片:
										</label>
										<div class="col-sm-10">


											<input type="text" id="pimage" name="pimage"
												placeholder="商品图片" class="col-sm-12">
											<input type="file" name="file1" size="30">
											
										</div>
									</div>
									<div class="col-sm-6 no-margin-right" data-bind="visible:true">
										<label class="col-sm-2 control-label no-padding-right"
											for="pdescription">
											描述信息:
										</label>
										<div class="col-sm-10">
											<input type="text" id="pdescription" name="pdescription"
												placeholder="描述信息" class="col-sm-12">
										</div>
									</div>
								</div>
								<div class="hr hr-14 hr-dotted"></div>
								<div class="row">
									<div class="col-sm-6 no-margin-right" data-bind="visible:true">
										<label class="col-sm-2 control-label no-padding-right"
											for="ptime">
											添加时间:
										</label>
										<div class="col-sm-10">
											<input type="text" readonly="readonly" style="cursor: hand"
												id="ptime" name="ptime" class="col-sm-11" size="15"
												onclick="HS_setDate(ptime)">
											<img src="../img/dateicon.jpg" onclick="HS_setDate(ptime)"
												width=20 height=20>
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

