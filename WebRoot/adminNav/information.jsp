<%@ page language="java" contentType = "text/html ; charset = UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <!-- 
    <link href="//cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
     -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <title>信息一览</title>
    <script type="text/javascript" src = "js/jquery-1.9.1.min.js"></script>
  	<style>
  		#bottom{clear ：both; margin-left : 35%; font-family : '微软雅黑' ; color : grey}
  	</style>
  </head>
  <body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-4 column">
			<h3 class="text-center text-info">
				用户排行
			</h3>
			<table class="table">
				<thead>
					<tr>
						<th>
							用户名
						</th>
						<th>
							消费额
						</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="u" items="${users}">
					<tr class="warning">
						<td>
							${u.gname }
						</td>
						<td>
							${u.number }元
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-md-4 column">
			<h3 class="text-info text-center">
				商户排行
			</h3>
			<table class="table">
				<thead>
					<tr>
						<th>
							商户名
						</th>
						<th>
							销售额
						</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="u" items="${stores}">
					<tr class="info">
						<td>
							${u.gname }
						</td>
						<td>
							${u.number }元
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-md-4 column">
			<h3 class="text-info text-center">
				产品排行
			</h3>
			<table class="table">
				<thead>
					<tr>
						<th>
							产品名称
						</th>
						<th>
							交易额
						</th>
						<th>
							交易量
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="u" items="${goods}">
					<tr class="success">
						<td>
							${u.gname }
						</td>
						<td>
							${u.count }元
						</td>
						<td>
							${u.number }份
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<div id = "bottom">
	本排行来自过去一年内所有成功的交易的数据
</div>
  </body>
</html>