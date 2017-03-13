<%@ page language="java" contentType="text/html ; charset = UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<script src="bootstrap/js/bootstrap.min.js"></script>
		<title>首页</title>
		
	</head>
	<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-8 column">
				<h2 class="text-center">
					商户须知
				</h2>
				<p class="lead text-info">
					 产品上线步骤：
					 	<font size = "4">提交店铺信息->店铺审核通过->提交产品信息->产品审核通过->产品上架</font>
				</p>
				<p class="lead text-left text-warning">
					 <b>·</b>请尽快完善您的个人资料，<a href = "sellerNav/sellerInfo.jsp">编辑并提交您的商户信息</a>，供管理员审核。成功后，您的店铺方可上线。
				</p>
				<p class="lead text-left text-warning">
					 <b>·</b>在审核前，您仍可以<a href = "sellerTran/addGoods.jsp">添加您的商品</a>，不过产品不能上线。
				</p>
				<p class="lead text-left">
					 <b>·</b>如果您的店铺已通过审核，请忽略以上的提醒。
				</p>
				<p class="lead text-left text-warning">
					 <b>·</b>请遵守<a href = "sell	erNav/protocol.jsp" target = "_blank">《美团商家守则》</a>，否则将影响您店铺的使用。
				</p>
				<p class="lead text-left text-warning">
					 <b>·</b>如若您的产品需要帮助，可以<a href = "sellerNav/cooperation.jsp">申请广告位</a>。
				</p>
				<p class="lead text-left text-warning">
					 <b>·</b>如若任何问题，可以<a href = "sellerNav/newMessage.jsp">发消息</a>给我们。
				</p>
				
				<p class="text-success lead">
					 <b>·</b>美团全体员工在这里祝福您生活愉快。
				</p>
			</div>
		</div>
  	</div>
	</body>
</html>
