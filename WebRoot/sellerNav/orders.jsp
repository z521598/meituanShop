<%@page import="com.lsq.meituan.pojo.Orders"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType = "text/html ; charset = UTF-8" pageEncoding="UTF-8" errorPage="/error.jsp"%>
<!-- /error.jsp 代表根目录的文件 -->
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
	<link rel = "stylesheet" type = "text/css" href = "css/page.css"/>
    <title>订单管理</title>
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
    	function showTicket(){
    		var ticket = prompt("请输入美团券号码","");	
    		console.log(ticket);	
    		$.post("orders/updateByTicketAndSellerId.action",{"ticket":ticket},function(data){
    			if(data == 1){
    				alert("验证成功");
    				window.location.reload();
    			}else{
    				alert("美团码错误,验证失败");
    			}
    		});
    	}
    </script>
  </head>
  <body style = "background-color : #006699">
	<div class = "left">
	  	<input type = "button" onclick="showTicket()" value = "验证美团券" style = "margin: 20px 0px 0px 20px"/>
	  	<table class = "solidTable" style = "margin-top : 5px">
	  	<tr>
	  		<td>订单编号</td>
	  		<td>商品</td>
	  		<td>商品名称</td>
	  		<td>价格(元)</td>
	  		<td>下单时间</td>
	  		<td>状态</td>
	  	</tr>
	  	<c:if test="${empty orders}">
	  		<tr>
	  			<td colspan = "7">订单空空如也,不如去申请广告位吧
	  			<br/>
	  			<label  style = "color :red">让你的产品出现在App首页</label>
	  			<input type = "button" value = "点我去申请" onclick = "window.location.href = 'sellerNav/cooperation.jsp'"/>
	  			</td>
	  		</tr>
	  	</c:if>
	  	<c:if test="${!empty orders}">
	  		<c:forEach items="${orders}" var = "everyOrders">
	  	<tr>
	  		<td>${everyOrders.oid}</td>
	  		<td><img alt = "无" src = "${everyOrders.gcover}" width = "40px" height = "30px"/></td>
	  		<td>${everyOrders.gname}</td>
	  		<td>${everyOrders.gprice}</td>
	  		<td><fmt:formatDate type="BOTH" value="${everyOrders.ocreatetime}" pattern="yy-MM-dd hh:mm:ss"/></td>
	  		<td>
	  			<c:set var="x" value = "${everyOrders.osign}"/>
	  			<c:choose>
	  				<c:when test = "${x == 0}">
	  					<label style = "color : grey; font-size : 5px">未付款</label>
	  				</c:when>
	  				<c:when test = "${x == 1}">
	  					<label style = "color : #00BB99; font-size : 15px">待消费</label>
	  				</c:when>
	  				<c:when test = "${x == 2}">
	  					<label style = "color : #00BB99; font-size : 15px">待评价</label>
	  				</c:when>
	  				<c:when test = "${x == 3}">
	  					<label style = "color : grey; font-size : 5px">已取消</label>
	  				</c:when>
	  				<c:when test = "${x == 4}">
	  					<label style = "color : grey; font-size : 5px">已退款</label>
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
	  	<a href="orders/findBySellerId.action?pageNum=1" style = "margin-left :20px">首页</a>||
		<a href="orders/findBySellerId.action?pageNum=${pageNum - 1}">上一页</a>||
		<a href="orders/findBySellerId.action?pageNum=${pageNum + 1}">下一页</a>||
		<a href="orders/findBySellerId.action?pageNum=${lastPage}">尾页</a>
	  </div>
	  </c:if>
  </div>

  </body>
</html>
