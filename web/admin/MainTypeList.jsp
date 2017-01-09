
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*,utils.ConnDB"%>

<!DOCTYPE html>
<html>

	<head>
		<jsp:include page="../common/common_css.jsp" flush="true" />
		<%@ include file="CheckLogin.jsp"%>
	</head>

	<body class="no-skin">

		<div id="fakeLoader" style="display: none;"></div>


		<div class="main-content-inner">
			<!-- #section:basics/content.breadcrumbs -->
			<div class="breadcrumbs" id="breadcrumbs">
				<script type="text/javascript">
				try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
					
			
				function del(id){
				window.location.href="deleteMainType.jsp?deleteid="+id;
			}	
			
			function update(id){
				window.location.href="MainTypeDetail.jsp?type=edit&id="+id;
			}	
			function add(){
				window.location.href="MainTypeDetail.jsp?type=add";
			}
			
			
			</script>

				<ul class="breadcrumb">
					<li>
						<i class="ace-icon fa fa-home home-icon"></i>
						<a href="#">首页</a>
					</li>
					<li class="active">
						商品分类列表
					</li>
				</ul>
				<!-- /.breadcrumb -->
			</div>

			<div class="page-content">
				<div class="page-header">
					<a href="javascript:window.location.reload();"
						class="btn btn-sm btn-g-refresh"><i
						class="ace-icon fa fa-undo bigger-110"></i>刷新</a>
					<a href="javascript:add()" class="btn btn-sm btn-g-add"><i
						class="glyphicon glyphicon-plus bigger-110"></i>新增</a>
						<a href="javascript:delSelect('MainTypes')" class="btn btn-sm btn-g-del"><i
						class="ace-icon fa fa-trash-o bigger-120"></i>全选删除</a>
						
					<div class="pull-right">
						<form class="form-inline">
							<div class="form-group">
								<input id="name" type="text" placeholder="查询条件" class="form-control"
									data-filed="" data-bind="">
							</div>
							<a href="javascript:query()" class="btn btn-sm btn-g-query"
								data-bind="click:searchClick"><i
								class="glyphicon  glyphicon-search bigger-110"></i>查询</a>
								</form>
					</div>

				</div>
				<!-- /.page-header -->
				<form id="form">
				<div class="row">
					<div class="col-xs-12">
						<table id="grid-table"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th class="center">
										<label class="position-relative">
<input type="checkbox" class="ace" id="selAll" onclick="selectAll();" />

											<span class="lbl">全选</span>
										</label>
									</th>
									<th>
										id
									</th>
									<th>
										分类名称
									</th>
									<th>
										操作
									</th>
								</tr>
							</thead>

							<tbody>

								<%
									ConnDB db = new ConnDB();
									db.OpenConn();
									db.createStmt();
								String name = request.getParameter("name");
										String sql = "";
										if (name == null) {

											sql = "select * from main_type";

										} else {

											sql = "select * from main_type where t_type like '%" + name
													+ "%'";
										}
										sql=new String(sql.getBytes("ISO-8859-1"),"UTF-8");
									
									ResultSet rs = db.Query(sql);
									rs.last();
									int length = rs.getRow();

									if (length > 0) {

										rs.beforeFirst();

										while (rs.next()) {
								%>

								<tr class="">
									<td class="center">
										<label class="position-relative">
											<input type="checkbox" class="ace" name="checkAll" id="checkAll" onclick="setSelectAll();" value="<%=rs.getInt("t_id") %>"/>
											<span class="lbl"></span>
										</label>
									</td>
									<td>
										<%=rs.getInt("t_id")%>
									</td>
									<td>
										<span><%=rs.getString("t_type")%></span>
									</td>
									<td>
										<div class="btn-group">

											<button type="button" class="btn btn-xs btn-info" title="编辑"
												onclick="update(<%=rs.getInt("t_id")%>)">
												<i class="ace-icon fa fa-pencil bigger-120"></i>
											</button>

											<button type="button" class="btn btn-xs btn-danger" title="删除"
												onclick="del(<%=rs.getInt("t_id")%>)">
												<i class="ace-icon fa fa-trash-o bigger-120"></i>
											</button>
										</div>
									</td>
								</tr>
								<%
									}
								%>
							</tbody>
							<%
								} else {
							%>
							<tbody>
								<tr>
									<td colspan="1" class="center">
										没有数据
									</td>
								</tr>
							</tbody>
							<%
								}
								db.closeStmt();
								db.closeConn();
							%>
						</table>

						<div id="grid-pager">

						</div>

						<!-- PAGE CONTENT ENDS -->
					</div>
					<!-- /.col -->
				</div>
				</form>
				<!-- /.row -->

				<!--搜索条件框-->
				<div class="modal fade" id="searchForm" tabindex="-1" role="dialog"
					aria-labelledby="">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="exampleModalLabel">
									查询条件
								</h4>
							</div>
							<div class="modal-body">
								<form class="form-horizontal">
									<div class="form-group">
										<label class="col-sm-2 control-label" for="s_ttype">
											ttype
										</label>
										<div class="col-sm-9">
											<input type="text" id="s_ttype" placeholder="ttype"
												class="form-control" data-filed="s_ttype"
												data-bind="value:search().s_ttype">
										</div>
									</div>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default btn-sm">
									取消
								</button>
								<button type="button" class="btn btn-primary btn-sm">
									查询
								</button>
							</div>
						</div>
					</div>
				</div>
				<!--搜索条件框-->

			</div>
			<!-- /.page-content -->
		</div>
		<!-- /.main-content -->
		<jsp:include page="../common/common_js.jsp" flush="true" />
<script type="text/javascript">
		function query(){
				var name =$("input[id='name']").val();
				window.location.href="MainTypeList.jsp?name="+name;
			}
		</script>

	</body>

</html>



