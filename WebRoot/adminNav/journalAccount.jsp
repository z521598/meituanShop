<%@page import="com.lsq.meituan.pojo.Orders"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType = "text/html ; charset = UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <link rel = "stylesheet" type = "text/css" href = "css/commonTable.css"/>
	<link rel = "stylesheet" type = "text/css" href = "css/users_layout.css"/>
	<link rel = "stylesheet" type = "text/css" href = "css/page.css"/>
	
    <title>订单管理</title>
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
    	
    </script>
  </head>
  <body style = "background-color : #00BB99">
	<div class = "left">
		<div style = "margin : 20px 20px">
			<form action="orders/findAll.action" method="post">
					起始时间：
					<input type="date" name="starttime" value="2016-01-01" />
					终止时间：
					<input type="date" name="overtime" value="2017-01-01" />
					&nbsp;&nbsp;&nbsp;
					<input type="submit" value="查询">
			</form>
	  	</div>
	  	<c:if test="${!empty orders}">
	  		<label style = "margin-left :20px;color:#ffffff">您好,尊敬的管理员,从${start}到${over}的流水账单如下：</label>
	  	<table class = "solidTable" style = "margin-top : 5px">
	  	<tr>
	  		<td>订单编号</td>
	  		<td>商品</td>
	  		<td>商品名称</td>
	  		<td>价格(元)</td>
	  		<td>购买用户ID</td>
	  		<td>下单时间</td>
	  		<td>状态</td>
	  	</tr>
	  		<c:forEach items="${orders}" var = "everyOrders">
	  	<tr>
	  		<td>${everyOrders.oid}</td>
	  		<td><img alt = "无" src = "${everyOrders.gcover}" width = "40px" height = "30px"/></td>
	  		<td>${everyOrders.gname}</td>
	  		<td>${everyOrders.gprice}</td>
	  		<td><a href = "users/findUsersByUid.action?uid=${everyOrders.uid}" target="showOneOrders">${everyOrders.uid}</a></td>
	  		<td><fmt:formatDate type="BOTH" value="${everyOrders.ocreatetime}" pattern="yy-MM-dd hh:mm:ss"/></td>
	  		<td>
	  			<c:set var="x" value = "${everyOrders.osign}"/>
	  			<c:choose>
	  				<c:when test = "${x == 0}">
	  					<label style = "color : grey; font-size : 10px">未付款</label>
	  				</c:when>
	  				<c:when test = "${x == 1}">
	  					<label style = "color : #00BB99; font-size : 15px">待消费</label>
	  				</c:when>
	  				<c:when test = "${x == 2}">
	  					<label style = "color : #00BB99; font-size : 15px">待评价</label>
	  				</c:when>
	  				<c:when test = "${x == 3}">
	  					<label style = "color : grey; font-size : 10px">已取消</label>
	  				</c:when>
	  				<c:when test = "${x == 4}">
	  					<label style = "color : grey; font-size : 10px">已退款</label>
	  				</c:when>
	  				<c:when test = "${x == 5}">
	  					<label style = "color : #00BB99; font-size : 15px">已评价</label>
	  				</c:when>
	  			</c:choose>
	  		</td>
	  	</tr>
	  	</c:forEach>
	  	</c:if>
	  </table>
	  <c:if test="${!empty orders}">
	  <div id = "page">
	  	<a href="orders/findAll.action?pageNum=1&starttime=${start }&overtime=${over }" style = "margin-left :20px">首页</a>||
		<a href="orders/findAll.action?pageNum=${pageNum - 1}&starttime=${start}&overtime=${over}">上一页</a>||
		<a href="orders/findAll.action?pageNum=${pageNum + 1}&starttime=${start}&overtime=${over}">下一页</a>||
		<a href="orders/findAll.action?pageNum=${lastPage}&starttime=${start}&overtime=${over}">尾页</a>
	  </div>
	  </c:if>
  </div>
  <div class = "right">
  	<iframe src = "" class = "ifr" name = "showOneOrders"></iframe>
  </div>
  </body>
</html>
