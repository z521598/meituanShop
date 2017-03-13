<%@ page language="java" contentType = "text/html ; charset = UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	<link rel="stylesheet" type="text/css" href="css/page.css"/>
    <script type="text/javascript" src = "js/jquery-1.9.1.min.js"></script>
    <title>产品信息</title>
    <script type="text/javascript">
    	function changeState(gid,gstate){
    		$.post("goods/changeState.action",{"gid" : gid , "gstate" : gstate},function(sign){
    			if(sign == 1){
    				window.location.reload();	
    			}
    		});
    	}
    </script>
  </head>
  <body style = "background-color : #00BB99">
	<div class = "left">
	  	<table class = "solidTable">
	  	<tr>
	  		<td>商品编号</td>
	  		<td>商品名称</td>	
	  		<td>商品封面</td>
	  		<td>发布用户</td>
	  		<td>商品类别</td>
	  		<td>美团价格</td>
	  		<td>操作</td>
	  	</tr>
	  	<c:forEach items="${goods}" var = "everyGoods">
	  	<tr>
	  		<td>${everyGoods.gid}</td>
	  		<td>${everyGoods.gname}</td>
	  		<td><img alt = "无" src = "${everyGoods.gcover}" width = "40px" height = "30px"/></td>
	  		<td>${everyGoods.uid}</td>
	  		<td>
	  			<c:set var="x" value="${everyGoods.gtype}"/>
	  			<c:choose>
	  				<c:when test="${x == 1}">
	  					美食
	  				</c:when>
	  				<c:when test="${x == 2}">
	  					酒店
	  				</c:when>
	  				<c:when test="${x == 3}">
	  					快餐
	  				</c:when>
	  				<c:when test="${x == 4}">
	  					美发
	  				</c:when>
	  				<c:when test="${x == 5}">
	  					景点
	  				</c:when>
	  				<c:when test="${x == 6}">
	  					冷饮
	  				</c:when>
	  				<c:when test="${x == 7}">
	  					丽人
	  				</c:when>
	  				<c:when test="${x == 8}">
	  					健身
	  				</c:when>
	  			</c:choose>
	  		</td>
	  		<td>${everyGoods.gprice}</td>
	  		<td>
	  			<a href = "goods/findByGid.action?gid=${everyGoods.gid}" target="showOneGoods">查看</a>
	  			<c:set var="x" value="${everyGoods.gstate}"/>
	  			<c:choose>
	  				<c:when test="${x==0}">
	  					<a href = "javascript:void(0)" onclick="changeState(${everyGoods.gid},1)"><label style = "color : green">通过</label></a> 
	  					<a href = "javascript:void(0)" onclick="changeState(${everyGoods.gid},2)"><label style = "color : red">不通过</label></a>
	  				</c:when>
	  				<c:when test="${x==1}">
	  					<a href = "javascript:void(0)" onclick="changeState(${everyGoods.gid},3)"><label style = "color : grey">强制下架</label></a>
	  				</c:when>
	  				<c:when test="${x==2}">
	  					<label style = "color : grey">审核未通过</label>
	  				</c:when>
	  				<c:when test="${x==3}">
	  					<label style = "color : grey">已被下架</label>
	  					<a href = "javascript:void(0)" onclick="changeState(${everyGoods.gid},1)"><label style = "color : blue">解除封禁</label></a>
	  				</c:when>
	  			</c:choose>
	  			
	  		</td>
	  	</tr>
	  	</c:forEach>
	  </table>
	   <div id = "page">
	  	<a href="goods/findAllGoods.action?pageNum=0" style = "margin-left :20px">首页</a>||
		<a href="goods/findAllGoods.action?pageNum=${pageNum - 1}">上一页</a>||
		<a href="goods/findAllGoods.action?pageNum=${pageNum + 1}">下一页</a>||
		<a href="goods/findAllGoods.action?pageNum=${lastPage}">尾页</a>
  </div>
  </div>
  <div class = "right">
  	<iframe src = "" class = "ifr" name = "showOneGoods"></iframe>
  </div>
  </body>
</html>
