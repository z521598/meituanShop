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
  	<link rel = "stylesheet" type = "text/css" href = "../css/commonTable.css"/>
	<link rel = "stylesheet" type = "text/css" href = "../css/users_layout.css"/>
    <base href="<%=basePath%>">
    <script type="text/javascript" src = "js/jquery-1.9.1.min.js"></script>
    <title>产品管理</title>
    <script type="text/javascript">
    	function ChangeState(gid,ios){
    		$.post("goods/upGoods.action",{"gid":gid,"isonsale" : ios},function(sign){
    			if(sign == 1){
    				window.location.reload();
    			}
    		});
    	}
    </script>
  </head>
  
  <body style = "background-color : #006699">
	<div class = "left">
	  	<table class = "solidTable">
	  	<tr>
	  		<td>商品编号</td>
	  		<td>商品封面</td>
	  		<td>商品名称</td>
	  		<td>商品库存</td>	
	  		<td>适用人数</td>
	  		<td>商品类别</td>
	  		<td>原价格</td>
	  		<td>美团价格</td>
	  		<td>操作</td>
	  	</tr>
	  	<c:forEach items="${goods}" var = "everyGoods">
	  	<tr>
	  		<td>${everyGoods.gid}</td>
	  		<td><img alt = "无" src = "${everyGoods.gcover}" width = "40px" height = "30px"/></td>
	  		<td>${everyGoods.gname}</td>
	  		<td>${everyGoods.gnum}</td>
	  		<td>${everyGoods.gpersonnum}</td>
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
	  		<td>${everyGoods.goldprice}</td>
	  		<td>${everyGoods.gprice}</td>
	  		<td>
	  			<a href = "goods/findByGid.action?gid=${everyGoods.gid}" target="showOneGoods">查看</a>
	  			<c:set var="x" value="${everyGoods.gstate}"/>
	  			<c:if test="${x==0}">
	  				<label style = "color : #00BB99">待审核</label>
	  			</c:if>
	  			<c:if test="${x==1}">
		  			<c:choose>
		  				<c:when test="${everyGoods.isonsale == 0}">
		  					<a href = "javascript:void(0)" onclick = "ChangeState(${everyGoods.gid},1)">上架</a>
		  				</c:when>
		  				<c:when test="${everyGoods.isonsale == 1}">
		  					<a href = "javascript:void(0)" onclick = "ChangeState(${everyGoods.gid},0)" style = "color :grey">下架</a>
		  				</c:when>
		  			</c:choose>
	  			</c:if>
	  			<c:if test="${x==2}">
					<label style = "color : #ff0000">被强制下架</label>
	  			</c:if>
	  			
	  		</td>
	  	</tr>
	  	</c:forEach>
	  </table>
	  &nbsp;
	  <input type = "button" onclick="location.href = 'sellerTran/addGoods.jsp'" value = "添加新产品"/>
  </div>
  <div class = "right">
  	<iframe src = "" class = "ifr" name = "showOneGoods"></iframe>
  </div>
  </body>
</html>
