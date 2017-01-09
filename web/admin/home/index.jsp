<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="admin" scope="session" class="bean.AdminBean" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>首页</title>
		<script src="../../common/header.js"></script>
		<script src="../../common/footer.js"></script>
		<%@ include file="../CheckLogin.jsp"%>
	</head>
	<body class="no-skin">
		<!-- header -->
		<div id="common_header">
			<div id="navbar" class="navbar navbar-default">
				<script type="text/javascript">
	try {
		ace.settings.check('navbar', 'fixed')
	} catch (e) {
	}
</script>
				<div class="navbar-container" id="navbar-container">
					<!-- #section:basics/sidebar.mobile.toggle -->
					<button type="button" class="navbar-toggle menu-toggler pull-left"
						id="menu-toggler" data-target="#sidebar">
						<span class="sr-only">Toggle sidebar</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>

					<!-- /section:basics/sidebar.mobile.toggle -->
					<div class="navbar-header pull-left">
						<!-- #section:basics/navbar.layout.brand -->
						<a href="#" class="navbar-brand"> <small> <i
								class="fa fa-globe"></i>后台管理 </small> </a>

						<!-- /section:basics/navbar.layout.brand -->

						<!-- #section:basics/navbar.toggle -->

						<!-- /section:basics/navbar.toggle -->
					</div>

					<!-- #section:basics/navbar.dropdown -->
					<div class="navbar-buttons navbar-header pull-right"
						role="navigation" style="color: #ffffff;">
						<ul class="nav ace-nav">
							<!-- #section:basics/navbar.user_menu -->
							<li class="light-blue">
								<a data-toggle="dropdown" href="#" class="dropdown-toggle">
									
									<%
										if (admin.getHeader() == null) {
										%>
									<img class="nav-user-photo" alt=""
										src="../../img/avatar5.png" />
									<%
										} else {
									%>
									
									<img class="nav-user-photo" alt=""
										src="../../<%=admin.getHeader()%>" />
										<%
											}
										%>
										 <span class="user-info"> <small>欢迎,</small> <span
										id="userName"> <%=admin.getName()%> </span> </span> <i
									class="ace-icon fa fa-caret-down"></i> </a>

								<ul
									class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">


									<li>
										<a href="javascript:void(0)" target="_blank"> <i
											class="ace-icon fa fa-tag"></i> 技术支持 </a>
									</li>
									<li>
										<a href="../login/login.jsp"> <i
											class="ace-icon fa fa-power-off"></i> 退出 </a>
									</li>

								</ul>
							</li>
							<!-- /section:basics/navbar.user_menu -->
						</ul>
					</div>
					<!-- /section:basics/navbar.dropdown -->
				</div>
				<!-- /.navbar-container -->
			</div>
		</div>



		<div class="main-container" id="main-container">
			<script type="text/javascript">
	try {
		ace.settings.check('main-container', 'fixed')
	} catch (e) {
	}
</script>

			<!-- left nav -->
			<div id="sidebar" class="sidebar responsive">
				<ul class="nav nav-list jrootmenu">
					<li id="homeLi" class="active">
						<a href="../CustomerList.jsp" target="mainFrame"> <i
							class="menu-icon fa fa-desktop"></i> <span class="menu-text">
								查看首页 </span> </a>
						<b class="arrow"></b>
					</li>

					<li class="">
						<a href="#" class="dropdown-toggle"> <i
							class="menu-icon fa fa-pencil-square-o"></i> <span
							class="menu-text">客户管理</span> <b class="arrow fa fa-angle-down"></b>
						</a>
						<b class="arrow"></b>

						<ul class="submenu">
							<li class="">
								<a href="../CustomerList.jsp" target="mainFrame"> <i
									class="menu-icon fa fa-caret-right"></i> 查看/编辑所有客户资料 </a>
								<b class="arrow"></b>
							</li>
							

						</ul>
					</li>
					<li class="">
						<a href="#" class="dropdown-toggle"> <i
							class="menu-icon fa fa-list"></i> <span class="menu-text">商品管理</span>
							<b class="arrow fa fa-angle-down"></b> </a>
						<b class="arrow"></b>

						<ul class="submenu">
							<li class="">
								<a href="../ProductList.jsp" target="mainFrame"> <i
									class="menu-icon fa fa-caret-right"></i> 商品列表 </a>
								<b class="arrow"></b>
							</li>
							
							<li class="">
								<a href="../ProductDetail.jsp?type=add" target="mainFrame">
									<i class="menu-icon fa fa-caret-right"></i> 添加商品 </a>
								<b class="arrow"></b>
							</li>

							<!--<li class="">
							<a href="../admin/YuJingTongZhiList.html"  target="mainFrame"> 
								<i class="menu-icon fa fa-caret-right"></i>预警指标
							</a> 
							<b class="arrow"></b>
						</li>-->
						</ul>
					</li>
					<li class="">
						<a href="#" class="dropdown-toggle"> <i
							class="menu-icon fa fa-tag"></i> <span class="menu-text">订单管理</span>
							<b class="arrow fa fa-angle-down"></b> </a>
						<b class="arrow"></b>

						<ul class="submenu">
							<li class="">
								<a href="../OrdersList.jsp" target="mainFrame"> <i
									class="menu-icon fa fa-caret-right"></i> 订单列表 </a>
								<b class="arrow"></b>
							</li>
							
						</ul>
					</li>
					
					<li class="">
						<a href="#" class="dropdown-toggle"> <i
							class="menu-icon fa fa-tag"></i> <span class="menu-text">支付方式管理</span>
							<b class="arrow fa fa-angle-down"></b> </a>
						<b class="arrow"></b>

						<ul class="submenu">
							<li class="">
								<a href="../PaymentList.jsp" target="mainFrame"> <i
									class="menu-icon fa fa-caret-right"></i> 支付方式列表 </a>
								<b class="arrow"></b>
							</li>
							
						</ul>
					</li>
					
					<li class="">
						<a href="#" class="dropdown-toggle"> <i
							class="menu-icon fa fa-file-o"></i> <span class="menu-text">商品分类管理</span>
							<b class="arrow fa fa-angle-down"></b> </a>
						<b class="arrow"></b>

						<ul class="submenu">
							<li class="">
								<a href="../MainTypeList.jsp" target="mainFrame"> <i
									class="menu-icon fa fa-caret-right"></i> 分类列表 </a>
								<b class="arrow"></b>
							</li>
							<li class="">
								<a href="../MainTypeDetail.jsp?type=add" target="mainFrame">
									<i class="menu-icon fa fa-caret-right"></i>添加分类 </a>
								<b class="arrow"></b>
							</li>
						</ul>
					</li>
					<li class="">
						<a href="#" class="dropdown-toggle"> <i
							class="menu-icon fa fa-cog"></i> <span class="menu-text">公告/反馈管理</span>
							<b class="arrow fa fa-angle-down"></b> </a>
						<b class="arrow"></b>

						<ul class="submenu">
							<li class="">
								<a href="../NoticeList.jsp" target="mainFrame"> <i
									class="menu-icon fa fa-caret-right"></i>公告列表 </a>
								<b class="arrow"></b>
							</li>
							<li class="">
								<a href="../NoticeDetail.jsp?type=add" target="mainFrame"> <i
									class="menu-icon fa fa-caret-right"></i>发布公告 </a>
								<b class="arrow"></b>
							</li>

						</ul>
					</li>

				</ul>

				<!-- /.nav-list -->

				<!-- #section:basics/sidebar.layout.minimize -->
				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<i class="ace-icon fa fa-angle-double-left"
						data-icon1="ace-icon fa fa-angle-double-left"
						data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>

				<!-- /section:basics/sidebar.layout.minimize -->
				<script type="text/javascript">
	try {
		ace.settings.check('sidebar', 'collapsed')
	} catch (e) {
	}
</script>
			</div>

			<!--<div class="main-content">
			<iframe name="mainFrame" id="mainFrame" frameborder="0"
				src="home.html" 
				style="margin: 0 auto; width: 100%; height: 100%;z-index:100;position: relative;"></iframe>
				
			<div class="modal-backdrop fade hidden"></div>																	
		</div>-->

			<div class="main-content">
				<iframe name="mainFrame" id="mainFrame" frameborder="0"
					src="../CustomerList.jsp"
					style="margin: 0 auto; width: 100%; z-index: 100; position: relative;"></iframe>

				<!--<div class="modal-backdrop fade hidden"></div>	-->
			</div>

			<!-- footer -->
			<div class="footer">
				<div class="footer-inner">
					<div class="footer-content">
						<span class="bigger-120"> <span class="blue bolder">简易购物系统</span>
							&nbsp; &copy; 2016-2017 </span>

					</div>
				</div>
			</div>
			<!-- /section:basics/footer -->
			<a href="#" id="btn-scroll-up"
				class="btn-scroll-up btn btn-sm btn-inverse"> <i
				class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i> </a>

		</div>


		<script>
	function loginFrame() {
		var mainFrame = document.getElementById("mainFrame");
		var bheight = document.documentElement.clientHeight;
		mainFrame.style.width = '100%';
		mainFrame.style.height = (bheight) + 'px';
	}
	loginFrame();

	window.onresize = function() {
		loginFrame();
	}
</script>


		<script>
	$(function() {
		$("ul.submenu li").click(function() {
			$("ul.submenu li").removeClass('active');
			$(this).addClass('active');
			$("#homeLi").removeClass('active');
		});
		$("#homeLi").click(function() {
			$("#homeLi").addClass('active');
			$("ul.submenu li").removeClass('active');
		});
		if (config.runMode == 'production') {
			$("#colRuleTest").addClass('hidden');
		}

	})
</script>

	</body>
</html>
