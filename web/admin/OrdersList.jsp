
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
				window.location.href="deleteOrders.jsp?deleteid="+id;
			}	
			
			function update(id){
				window.location.href="OrdersDetail.jsp?type=edit&id="+id;
			}	
			function add(){
				window.location.href="OrdersDetail.jsp?type=add";
			}
			
			</script>

				<ul class="breadcrumb">
					<li>
						<i class="ace-icon fa fa-home home-icon"></i>
						<a href="#">首页</a>
					</li>
					<li class="active">
						订单列表
					</li>
				</ul>
				<!-- /.breadcrumb -->
			</div>

			<div class="page-content" data-model="listModel">
				<div class="page-header">
					<a href="javascript:window.location.reload();"
						class="btn btn-sm btn-g-refresh"><i
						class="ace-icon fa fa-undo bigger-110"></i>刷新</a>
					<a href="javascript:add()" class="btn btn-sm btn-g-add"><i
						class="glyphicon glyphicon-plus bigger-110"></i>新增</a>
						<a href="javascript:delSelect('Orders')" class="btn btn-sm btn-g-del"><i
						class="ace-icon fa fa-trash-o bigger-120"></i>全选删除</a>
					<div class="pull-right">
						<form class="form-inline">
							<div class="form-group">
								<input type="text" id="name" name ="name" placeholder="订购者" class="form-control"
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
											<input type="checkbox" class="ace" id="selAll"
												onclick="selectAll();" />

											<span class="lbl">全选</span>
										</label>
									</th>
									<th>
										id
									</th>
									<th>
										支付方式
									</th>
									<th>
										地址
									</th>
									<th>
										邮箱
									</th>
									<th>
										订购者
									</th>
									<th>
										订购时间
									</th>
									<th>
										总价值
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

											sql = "select * from Orders";

										} else {

											sql = "select * from Orders where order_user like '%" + name
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
											<input type="checkbox" class="ace" name="checkAll"
												id="checkAll" onclick="setSelectAll();"
												value="<%=rs.getInt("order_id")%>" />

											<span class="lbl"></span>
										</label>
									</td>
									<td>
										<%=rs.getInt("order_id")%>
									</td>

									<td>
										<%=rs.getString("order_payment")%>

									</td>
									<td>
										<%=rs.getString("order_address")%>

									</td>
									<td>
										<%=rs.getString("order_email")%>

									</td>
									<td>
										<%=rs.getString("order_user")%>

									</td>
									<td>
										<%=rs.getString("order_time")%>

									</td>
									<td>
										<%=rs.getFloat("order_sum")%>
									</td>
									<td>
										<div class="btn-group">

											<button type="button" class="btn btn-xs btn-info" title="编辑"
												onclick="update(<%=rs.getInt("order_id")%>)">
												<i class="ace-icon fa fa-pencil bigger-120"></i>
											</button>

											<button type="button" class="btn btn-xs btn-danger" title="删除"
												onclick="del(<%=rs.getInt("order_id")%>)">
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
										<label class="col-sm-2 control-label" for="s_orderPayment">
											支付方式
										</label>
										<div class="col-sm-9">
											<input type="text" id="s_orderPayment" placeholder="支付方式"
												class="form-control" data-filed="s_orderPayment"
												data-bind="value:search().s_orderPayment">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="s_orderAdress">
											地址
										</label>
										<div class="col-sm-9">
											<input type="text" id="s_orderAdress" placeholder="地址"
												class="form-control" data-filed="s_orderAdress"
												data-bind="value:search().s_orderAdress">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="s_orderEmail">
											邮箱
										</label>
										<div class="col-sm-9">
											<input type="text" id="s_orderEmail" placeholder="邮箱"
												class="form-control" data-filed="s_orderEmail"
												data-bind="value:search().s_orderEmail">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="s_orderUser">
											订购者
										</label>
										<div class="col-sm-9">
											<input type="text" id="s_orderUser" placeholder="订购者"
												class="form-control" data-filed="s_orderUser"
												data-bind="value:search().s_orderUser">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="s_orderTime">
											订购时间
										</label>
										<div class="col-sm-9">
											<input type="text" id="s_orderTime" placeholder="订购时间"
												class="form-control" data-filed="s_orderTime"
												data-bind="value:search().s_orderTime">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="s_orderSum">
											总价值
										</label>
										<div class="col-sm-9">
											<input type="text" id="s_orderSum" placeholder="总价值"
												class="form-control" data-filed="s_orderSum"
												data-bind="value:search().s_orderSum">
										</div>
									</div>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default btn-sm"
									data-dismiss="modal">
									取消
								</button>
								<button type="button" class="btn btn-primary btn-sm"
									data-bind="click:searchClick">
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
				window.location.href="OrdersList.jsp?name="+name;
			}
		</script>

	</body>

</html>



