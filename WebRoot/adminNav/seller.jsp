<%@ page language="java" contentType = "text/html ; charset = UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <title>商户管理</title>
    <script type="text/javascript">
    	function changeState(sid,ssign){
    		$.post("store/updateSsignBySid.action",{"sid" : sid , "ssign" : ssign},function(sign){
    			if(sign == 1){
    				window.location.reload();
    			}
    		});
    	}
    </script>
  </head>
  <body>
  <body style = "background-color : #00BB99;">
  <div class = "left">
  	<table class = "solidTable">
  	<tr>
  		<td>店铺编号</td>
  		<td>店铺图片</td>
  		<td>商户电话</td>
  		<td>商户地址</td>	
  		<td>法人代表</td>
  		<td>操作</td>
  	</tr>
  	<c:forEach items="${sellers}" var = "everyseller">
  	<tr>
  		<td>${everyseller.sid}</td>
  		<td><img alt = "无" src = "${everyseller.simage1}" width = "40px" height = "30px"/></td>
  		<td>${everyseller.shomephone}</td>
  		<td>${everyseller.saddress}</td>
  		<td>${everyseller.sperson}</td>
  		<td align = "center">
  			<a href = "store/findSellerBySid.action?sid=${everyseller.sid}" target="showOneSeller">查看</a>
  			<c:set var = "x" value="${everyseller.ssign}"></c:set>
  			<c:choose>
  				<c:when test="${x == 0}">
  					<a href = "javascript:void(0)" onclick = "changeState(${everyseller.sid},1)"><label style = "color : green">通过</label></a>
  					<a href = "javascript:void(0)" onclick = "changeState(${everyseller.sid},2)"><label style = "color : red">不通过</label></a>
  				</c:when>
  				<c:when test="${x == 1}">
  					<a href = "javascript:void(0)" onclick = "changeState(${everyseller.sid},3)"><label style = "color : grey">封禁</label></a>
  				</c:when>
  				<c:when test="${x == 2}">
  					<label style = "color : grey">已处理,未通过</label>
  				</c:when>
  				<c:when test="${x == 3}">
  					<a href = "javascript:void(0)" onclick = "changeState(${everyseller.sid},1)">解禁</a>
  				</c:when>
  				
  			</c:choose>
  			
  		</td>
  	</tr>
  	</c:forEach>
  </table>
   <div id = "page">
	  	<a href="store/findAllSeller.action?pageNum=0" style = "margin-left :20px">首页</a>||
		<a href="store/findAllSeller.action?pageNum=${pageNum - 1}">上一页</a>||
		<a href="store/findAllSeller.action?pageNum=${pageNum + 1}">下一页</a>||
		<a href="store/findAllSeller.action?pageNum=${lastPage}">尾页</a>
  </div>
  </div>
  <div class = "right">
  	<iframe src = "" class = "ifr" name = "showOneSeller"></iframe>
  </div>
  </body>
</html>