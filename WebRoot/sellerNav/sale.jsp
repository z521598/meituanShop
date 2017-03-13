<%@ page language="java" contentType = "text/html ; charset = UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script type = "text/javascript" src = "js/jquery-1.9.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <link href="css/sale.css" rel="stylesheet"/>
    <script type="text/javascript">
    </script>
    <title>销售统计</title>
  </head>
  <body>
	<div id = "start">
		<form action="orders/findByTime.action" method="post">
				起始时间：
				<input type="date" name="starttime" value="2016-01-01" />
				终止时间：
				<input type="date" name="overtime" value="2017-01-01" />
				&nbsp;&nbsp;&nbsp;
				<input type="submit" value="查询">
		</form>
	</div>
	<c:if test="${!empty result}">
	<div id = "show">
		<p class="text-success lead">
			您好，从
			<fmt:formatDate value="${start}"/>
			到
			<fmt:formatDate value="${over}"/>
			的时间段中,您店铺的情况如下： 
		</p>
		<p class="lead text-info">
			销售额：${allMoney} 元
		</p>
		<p class="lead text-info">
			销售详情
		</p>
			<table class="table table-hover table-striped" style = "margin-left : 80px;width :50%">
				<thead>
					<tr>
						<th>
							产品名字
						</th>
						<th>
							销售份数
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach  items="${result}" var="x">
					<tr>
						<td>${x.gname}</td>
						<td>${x.number}单</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
	</div>
	</c:if>
  </body>
</html>
