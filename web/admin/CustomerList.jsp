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
	try {
		ace.settings.check('breadcrumbs', 'fixed')
	} catch (e) {
	}
			function del(id){
				window.location.href="deleteCustomers.jsp?deleteid="+id;
			}
			
			function update(id){
				window.location.href="CustomerDetail.jsp?type=edit&id="+id;
			}	
			function add(){
				window.location.href="CustomerDetail.jsp?type=add";
			}
			function query(){
				var name =$("input[id='name']").val();
				window.location.href="CustomerList.jsp?name="+name;
			}
			
				</script>

				<ul class="breadcrumb">
					<li>
						<i class="ace-icon fa fa-home home-icon"></i>
						<a href="#">首页</a>
					</li>
					<li class="active">
						客户列表
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
					<a href="javascript:delSelect('Customers')"
						class="btn btn-sm btn-g-del"><i
						class="ace-icon fa fa-trash-o bigger-120"></i>全选删除</a>

					<div class="pull-right">
						<form class="form-inline">
							<div class="form-group">
								<input id="name" name="name" type="text" placeholder="真实姓名"
									class="form-control">
							</div>
							<a href="javascript:query()" class="btn btn-sm btn-g-query"><i
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
												<input type="checkbox" class="ace" id="selAll"
													onclick="selectAll();" />

												<span class="lbl">全选</span>
											</label>

										</th>
										<th>
											id
										</th>
										<th>
											用户名
										</th>
										<th>
											真实姓名
										</th>
										<th>
											密码
										</th>
										<th>
											头像
										</th>
										<th>
											电话号码
										</th>
										<th>
											余额
										</th>
										<th>
											问题
										</th>
										<th>
											问题答案
										</th>
										<th>
											地址
										</th>
										<th>
											邮箱
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
										request.setCharacterEncoding("utf-8");
										String name = request.getParameter("name");
										String sql = "";
										if (name == null) {

											sql = "select * from Customer";

										} else {

											sql = "select * from Customer where c_realname like '%" + name
													+ "%'";
										}
										sql = new String(sql.getBytes("ISO-8859-1"), "UTF-8");
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
												<input type="checkbox" class="ace" name="checkAll"
													id="checkAll" onclick="setSelectAll();"
													value="<%=rs.getInt("c_id")%>" />
												<span class="lbl"></span>
											</label>
										</td>
										<td>
											<%=rs.getInt("c_id")%>
										</td>
										<td>
											<%=rs.getString("c_username")%>
										</td>
										<td>
											<%=rs.getString("c_realname")%>
										</td>
										
										<td>
											<span><%=rs.getString("c_password")%></span>
										</td>
										<td>
											<img alt="头像" src="../<%=rs.getString("c_header")%>">
										
										</td>
										<td>
											<span><%=rs.getString("c_phone")%></span>
										</td>
										<td>

											<span><%=rs.getFloat("c_money")%></span>
										</td>
										<td>
											<span><%=rs.getString("c_question")%></span>
										</td>
										<td>
											<span><%=rs.getString("c_answer")%></span>
										</td>
										<td>
											<span><%=rs.getString("c_address")%></span>
										</td>
										<td>

											<span><%=rs.getString("c_email")%></span>
										</td>
										<td>
											<div class="btn-group">

												<button type="button" class="btn btn-xs btn-info"
													title="编辑" onclick="update(<%=rs.getInt("c_id")%>)">
													<i class="ace-icon fa fa-pencil bigger-120"></i>
												</button>

												<button type="button" class="btn btn-xs btn-danger"
													title="删除" onclick="del(<%=rs.getInt("c_id")%>)">
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
										<td colspan="12" class="center">
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

			</div>
			<!-- /.page-content -->
		</div>
		<!-- /.main-content -->
		<jsp:include page="../common/common_js.jsp" flush="true" />

	</body>

</html>



