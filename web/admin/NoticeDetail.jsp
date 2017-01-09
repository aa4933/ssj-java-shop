<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*,utils.ConnDB"%>
<jsp:useBean id="admin" scope="session" class="bean.AdminBean" />
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
					document.getElementById("form").action="SaveNotice.jsp?id="+id;
    				document.getElementById("form").submit();
				}
				function add(id){
					document.getElementById("form").method="post";
					document.getElementById("form").action="AddNotice.jsp?id="+id;
    				document.getElementById("form").submit();
				}
			</script>

				<ul class="breadcrumb">
					<li>
						<i class="ace-icon fa fa-home home-icon"></i>
						<a href="#">首页</a>
					</li>
					<li class="active">
						编辑公告
					</li>
				</ul>
				<!-- /.breadcrumb -->
			</div>

			<div class="page-content">
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
				<!-- /.page-header -->

				<div class="well">
					<div class="row">
						<div class="col-xs-12">

							<%
								if (type.equals("edit")) {
							%>

							<form id="form" role="form">

								<input type="hidden">
								<input type="hidden" id="id" name="id">

								<%
									ConnDB db = new ConnDB();
										db.OpenConn();
										db.createStmt();
										String sql = "select * from notice where n_id=" + id;
										ResultSet rs = db.Query(sql);
										if (rs.next()) {
								%>

								<div class="row">
									<div class="col-sm-6 no-margin-right">
										<label class="col-sm-2 control-label no-padding-right"
											for="nmessage">
											公告信息:
										</label>
										<div class="col-sm-10">
											<input type="text" id="nmessage" name="nmessage"
												placeholder="公告信息" class="col-sm-12"
												value=<%=rs.getString("n_message")%>>
										</div>
									</div>
									<div class="col-sm-6 no-margin-right">
										<label class="col-sm-2 control-label no-padding-right"
											for="nadmin">
											发布者:
										</label>
										<div class="col-sm-10">
											<input type="text" id="nadmin" name="nadmin"
												placeholder="发布者" class="col-sm-12"
												value=<%=rs.getString("n_admin")%>>
										</div>
									</div>
								</div>
								<div class="hr hr-14 hr-dotted"></div>
								<div class="row">
									
									<div class="col-sm-6 no-margin-right">
										<label class="col-sm-2 control-label no-padding-right"
											for="ntime">
											发布时间:
										</label>
										<div class="col-sm-10">
											<input type="text" readonly="readonly" style="cursor: hand"
												id="ntime" name="ntime" class="col-sm-8" size="15"
												onclick="HS_setDate(ntime)"
												value="<%=rs.getString("n_time")%>">
											<img src="../img/dateicon.jpg" onclick="HS_setDate(ntime)"
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
							<form id="form" role="form">

								<input type="hidden">
								<input type="hidden" id="id" name="id">
								<div class="row">
									<div class="col-sm-6 no-margin-right" data-bind="visible:true">
										<label class="col-sm-2 control-label no-padding-right"
											for="nmessage">
											公告信息:
										</label>
										<div class="col-sm-10">
											<input type="text" id="nmessage" name="nmessage"
												placeholder="公告信息" class="col-sm-12">
										</div>
									</div>
									<div class="col-sm-6 no-margin-right" data-bind="visible:true">
										<label class="col-sm-2 control-label no-padding-right"
											for="nadmin">
											发布者:
										</label>
										<div class="col-sm-10">
											<input type="text" id="nadmin" name="nadmin" readonly="readonly"
												placeholder="发布者" class="col-sm-12" value="<%=admin.getName() %>">
										</div>
									</div>
								</div>
								<div class="hr hr-14 hr-dotted"></div>
								<div class="row">
									
									<div class="col-sm-6 no-margin-right" data-bind="visible:true">
										<label class="col-sm-2 control-label no-padding-right"
											for="ntime">
											发布时间:
										</label>
										<div class="col-sm-10">
											<input type="text" readonly="readonly" style="cursor: hand"
												id="n_time" name="n_time" class="col-sm-8" size="15"
												onclick="HS_setDate(n_time)">
											<img src="../img/dateicon.jpg" onclick="HS_setDate(n_time)"
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

