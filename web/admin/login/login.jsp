
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<jsp:useBean id="admin" scope="session" class="bean.AdminBean"/> 


 
 
 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<script src="../../common/header.js"></script>

	</head>
	<script language="javascript">
	function loadimage() {
		document.getElementById("randImage").src = "image.jsp?" + Math.random();
		
	}
</script>

	<body class="login-layout blur-login">

		<div class="loginTop">
		
		</div>

		<div class="main-container">
			<div class="main-content">
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1">
						<div class="login-container">
							<div class="center">
								<h2>
									<i class="ace-icon fa fa-leaf green"></i>
									<span class="white" id="id-text2">系统登录</span>
								</h2>
							</div>
							<div class="space-6"></div>
							<div class="position-relative">
								<div id="login-box">
									<div>

										<form id="loginForm" style="margin: auto auto" method="post"
											action="checkLogin1.jsp">
											<fieldset>
												<input type="hidden" class="form-control"
													data-filed="tableName" data-bind="value:tableName" />
												<label class="row block clearfix">
													<div class="col-sm-12">
														<span class="col-sm-1 input-icon input-icon-left"><i
															class="ace-icon fa fa-user bigger-150"></i> </span>
														<input type="text" class="col-sm-12 form-control"
															placeholder="用户名" name="user" data-filed="tableName"
															data-bind="value:userName" />
													</div>
												</label>
												<label class="row block clearfix">
													<div class="col-sm-12">
														<span class="col-sm-1 input-icon input-icon-left"><i
															class="ace-icon fa fa-lock bigger-150"></i> </span>
														<input type="password" class="form-control col-sm-12"
															placeholder="密码" name="pass" data-filed="passwordOrigin" />
														<input type="hidden" class="form-control col-sm-6"
															placeholder="" name="pass" data-filed="password" />
													</div>
												</label>


												<label class="row block clearfix">
													<div class="col-sm-12">
														<input type="text" name="inputRand" size=6 />
														<img onclick=
	loadimage();
name="randImage" id="randImage"
															src="image.jsp" width="60" height="20" border="1">
														<a href="javascript:loadimage();"><font class=pt95>看不清点我</font>
														</a>

													</div>

												</label>
												<label class="row block clearfix">
													<div class="col-sm-12">
														<input type="submit"
															class=" btn btn-sm col-sm-12 btn-primary" value="系统登录">
													</div>
												</label>

												<div class="space-4"></div>
											</fieldset>
										</form>
									</div>
									<!-- /.widget-body -->
								</div>
								<!-- /.login-box -->
							</div>
							<!-- /.position-relative -->
						</div>
						<!-- /.login-container -->
					</div>
					<!-- /.col -->
					<div class="footer">
						<div class="footer-inner">
							<!-- #section:basics/footer -->
							<div class="footer-content">

							</div>
						</div>
					</div>
				</div>
				<!-- /.row -->
			</div>
			<!-- /.main-content -->
		</div>
		<!-- /.main-container -->

		<!-- basic scripts -->



		<title>系统登录</title>
	</body>
</html>
