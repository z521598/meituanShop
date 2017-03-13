<%@ page language="java" contentType="text/html ; charset = UTF-8" pageEncoding="UTF-8" errorPage="error.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="<%=basePath%>">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>美团后台管理系统</title>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
	<link href="css/main.css" type="text/css" rel="stylesheet" />
	<link href="css/adm.css" type="text/css" rel="stylesheet" />
	<script src="js/jquery-1.9.1.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="header">
		<label class="logo-title">美团管理员中心</label>
		<ul class="inline">
			<li>&nbsp;&nbsp;欢迎您,尊贵的管理员</li>
			<li class="dropdown">
			<a class="dropdown-toggle mymsg" data-toggle="dropdown" href="#">
				<img src="img/sellMain_images/32/168.png" />&nbsp;&nbsp;消息中心
				<b class="caret"></b>
			</a>
				<ul class="dropdown-menu">
					<li id = "message"><a href="javascript:void(0)" >消息列表</a></li>
					<li id = "newMsg"><a href="javascript:void(0)">发送新消息</a></li>
				</ul>
			</li>
			<li>
				<img src="img/sellMain_images/32/200.png" />&nbsp;&nbsp; 
				<a class="loginout" href="login.jsp">退出</a>
			</li>
		</ul>
	</div>

	<div class="nav">
		<ul class="breadcrumb">
			<li><img src="img/sellMain_images/32/5025_networking.png" /></li>
			<li>
				<a href="javascipt:void(0)" id = "home">首页</a> 
				<span class="divider">&gt;&gt;</span>
			</li>
			<li class="active" id = "active"></li>
		</ul>
	</div>


	<div class="container-fluid content">
		<div class="row-fluid">
			<div class="span2 content-left" style="overflow-y:scroll">		<!-- 滚动条 -->
				<div class="accordion">
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne"> 
								<img class="left-icon" src="img/sellMain_images/32/410.png" />
								<span class="left-title">业务管理</span>
							</a>
						</div>
						<div id="collapseOne" class="accordion-body collapse in">
						<!-- 
							<div class="accordion-inner"  id = "seller_appr">
								<img class="left-icon-child" src="img/sellMain_images/32/20130508035646751_easyicon_net_32.png" />
								<span class="left-body"> 商户审批</span>
							</div>
							<div class="accordion-inner" id = "goods_appr">
								<img class="left-icon-child"
									src="img/sellMain_images/32/449.png" /><span
									class="left-body"> 产品审批</span>

							</div>
						 -->
							<div class="accordion-inner" id = "advertisement">
								<img class="left-icon-child" src="img/sellMain_images/32/261.png" />
								<span class="left-body"> 广告管理</span>
							</div>
						</div>
						 
						<div class="accordion-heading">
							<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo"> 
							<img class="left-icon" src="img/sellMain_images/32/469.png" />
							<span class="left-title">信息管理</span>
							</a>
						</div>
						<div id="collapseTwo" class="accordion-body collapse in">
							<div class="accordion-inner"  id = "users">
								<img class="left-icon-child" src="img/sellMain_images/32/4992_user.png" />
								<span class="left-body"> 用户信息</span>
							</div>
							<div class="accordion-inner" id = "seller">
								<img class="left-icon-child"
									src="img/sellMain_images/32/20130508035646751_easyicon_net_32.png" /><span
									class="left-body"> 商户信息</span>
							</div>
							<div class="accordion-inner" id = "goods">
								<img class="left-icon-child" src="img/sellMain_images/32/449.png" />
								<span class="left-body"> 产品信息</span>
							</div>
							<div class="accordion-inner" id = "evaluate">
								<img class="left-icon-child" src="img/sellMain_images/32/120.png" />
								<span class="left-body"> 评论信息</span>
							</div>
						</div>
						
						<div class="accordion-heading">
							<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree"> 
							<img class="left-icon" src="img/sellMain_images/32/20130505030928375_easyicon_net_32.png" />
							<span class="left-title">明细统计</span>
							</a>
						</div>
						<div id="collapseThree" class="accordion-body collapse in">
							<div class="accordion-inner" id = "information">
								<img class="left-icon-child" src="img/sellMain_images/32/182.png" />
								<span class="left-body"> 信息一览</span>
							</div>
							<!-- 
							<div class="accordion-inner"  id = "users_info">
								<img class="left-icon-child" src="img/sellMain_images/32/4992_user.png" />
								<span class="left-body"> 用户统计</span>
							</div>
							<div class="accordion-inner" id = "seller_info">
								<img class="left-icon-child"
									src="img/sellMain_images/32/20130508035646751_easyicon_net_32.png" /><span
									class="left-body"> 商家统计</span>
							</div>
							 -->
							<div class="accordion-inner" id = "journalAccount">
								<img class="left-icon-child" src="img/sellMain_images/32/159.png" />
								<span class="left-body"> 流水明细</span>
							</div>
						</div>
						
						<div class="accordion-heading">
							<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseFour"> 
							<img class="left-icon" src="img/sellMain_images/32/233.png" />
							<span class="left-title">账户安全</span>
							</a>
						</div>
						<div id="collapseFour" class="accordion-body collapse in">
							<div class="accordion-inner" id = "updatePassword">
								<img class="left-icon-child" src="img/sellMain_images/32/243.png" />
								<span class="left-body"> 修改密码</span>
							</div>
							<div class="accordion-inner"  id = "addAdmin">
								<img class="left-icon-child" src="img/sellMain_images/32/128.png	" />
								<span class="left-body"> 添加管理</span>
							</div>
						</div>
						
					</div>
				</div>
			</div>
			<div class="span10 content-right" style = "overflow-y:hidden">

				<iframe src="adminNav/home.jsp" class="iframe" id = "ifr"></iframe>

			</div>
		</div>
	</div>
	<div class="clearfix"></div>
	<div class="foot"></div>
	<script src="js/adm.js"></script>
	<!-- 实现非关键js代码与jsp分离 -->
</body>
</html>

