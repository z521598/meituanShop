<%@ page language="java" contentType="text/html ; charset = UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="<%=basePath%>">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>美团商家后台管理系统</title>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
	<link href="css/main.css" type="text/css" rel="stylesheet" />
	<link href="css/selm.css" type="text/css" rel="stylesheet" />
	<script src="js/jquery-1.9.1.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="header">
		<img class="logo" src="img/sellMain_images/logo.png" /> <label class="logo-title">商家中心</label>
		<ul class="inline">
			<li><img src="${activeSeller.uhead}" height = "32px" width = "32px"/>&nbsp;&nbsp;欢迎您,${activeSeller.uname}</li>
			<li class="dropdown">
				<a class="dropdown-toggle mymsg" data-toggle="dropdown" href="#">
					<img src="img/sellMain_images/32/168.png" />&nbsp;&nbsp;消息中心
					<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li id = "message"><a href="javascript:void(0)">消息列表</a></li>
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
			<li><a href="javascipt:void(0)" id = "home">首页</a> <span class="divider">&gt;&gt;</span></li>
			<li class="active"></li>
		</ul>
	</div>



	<div class="container-fluid content">
		<div class="row-fluid">
			<div class="span2 content-left" style="overflow-y:hidden">
				<div class="accordion">
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne"> 
								<img class="left-icon" src="img/sellMain_images/32/410.png" />
								<span class="left-title">业务管理</span>
							</a>
						</div>
						<div id="collapseOne" class="accordion-body collapse in">
							<div class="accordion-inner"  id = "orders">
								<img class="left-icon-child" src="img/sellMain_images/32/161.png" />
								<span class="left-body"> 订单管理</span>
							</div>
							<div class="accordion-inner" id = "goods">
								<img class="left-icon-child" src="img/sellMain_images/32/449.png" />
								<span class="left-body"> 产品管理</span>

							</div>
							<div class="accordion-inner" id = "evaluate">
								<img class="left-icon-child" src="img/sellMain_images/32/120.png" />
								<span class="left-body"> 评价信息</span>
							</div>
						</div>

						<div class="accordion-heading">
							<a class="accordion-toggle" data-toggle="collapse"
								data-parent="#accordion2" href="#collapseTwo"> 
								<img class="left-icon" src="img/sellMain_images/32/20130505030928375_easyicon_net_32.png" />
								<span class="left-title">销售明细</span>
							</a>
						</div>
						<div id="collapseTwo" class="accordion-body collapse in">
						<!-- 
							<div class="accordion-inner"  id = "journalAccount">
								<img class="left-icon-child" src="img/sellMain_images/32/159.png" />
								<span class="left-body"> 流水明细</span>
							</div>
						 -->
							<div class="accordion-inner" id = "sale">
								<img class="left-icon-child" src="img/sellMain_images/32/261.png" />
									<span class="left-body"> 销售统计</span>
							</div>
							<div class="accordion-inner" id = "storeInfor">
								<img class="left-icon-child" src="img/sellMain_images/32/219.png" />
								<span class="left-body"> 门店信息</span>
							</div>
						</div>

						<div class="accordion-heading">
							<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree"> 
								<img class="left-icon" src="img/sellMain_images/32/4992_user.png" />
								<span class="left-title">个人信息</span>
							</a>
						</div>
						<div id="collapseThree" class="accordion-body collapse in">
							<div class="accordion-inner" id = "sellerInfo">
								<img class="left-icon-child" src="img/sellMain_images/32/469.png" />
								<span class="left-body"> 信息管理</span>
							</div>
							<div class="accordion-inner" id = "sellerKey">
								<img class="left-icon-child" src="img/sellMain_images/32/233.png" />
								<span class="left-body"> 账户安全</span>

							</div>
							<div class="accordion-inner" id = "cooperation">
								<img class="left-icon-child" src="img/sellMain_images/32/20130508035646751_easyicon_net_32.png" />
								<span class="left-body"> 美团合作</span>

							</div>
						</div>

					</div>
				</div>
			</div>
			<div class="span10 content-right" style = "overflow-y:hidden">

				<iframe src="sellerNav/home.jsp" class="iframe" id = "ifr"></iframe>

			</div>
		</div>
	</div>
	<div class="clearfix"></div>
	<div class="foot"></div>
	<script src="js/selm.js"></script>
</body>
</html>

