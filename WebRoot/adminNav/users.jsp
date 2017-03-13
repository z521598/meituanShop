<%@page import="java.util.Date"%>
<%@page import="com.lsq.meituan.pojo.Users"%>
<%@page import="java.util.List"%>
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
    <title>用户管理</title>
    <script type="text/javascript" src = "js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
    	function changeSeal(uid,seal){
    		$.post("users/updateSealByUid.action",{"uid" : uid ,"uisseal" : seal},function(sign){
    			if(sign == 1){
    				window.location.reload();
    			}
    		});
    	
    	}
    </script>
  </head>
  <body style = "background-color : #00BB99;">
  <div class = "left">
  	<table class = "solidTable">
  	<tr>
  		<td>用户编号</td>
  		<td>头像</td>
  		<td>用户名</td>	
  		<td>姓名</td>
  		<td>性别</td>
  		<td>电话</td>
  		<td>最后一次登录时间</td>
  		<td>操作</td>
  	</tr> 
  	<c:forEach items="${users}" var = "everyuser">
  	<tr>
  		<td>${everyuser.uid}</td>
  		<td><img alt = "无" src = "${everyuser.uhead}" width = "40px" height = "30px"/></td>
  		<td>${everyuser.uusername}</td>
  		<td>${everyuser.uname}</td>
  		<td>${everyuser.usex}</td>
  		<td>${everyuser.utelephone}</td>
  		<td><fmt:formatDate type="BOTH" value="${everyuser.ulastlogtime}" pattern="yy-MM-dd hh:mm:ss"/></td>
  		<td>
  			<a href = "users/findUsersByUid.action?uid=${everyuser.uid}" target="showOneUsers">查看</a>
  			<c:set var="x" value="${everyuser.uisseal}"></c:set>
  			<c:choose>
  				<c:when test="${x == 0}">
  					<a href = "javascript:void(0)" onclick="changeSeal(${everyuser.uid},1)"><label style = "color : grey">封禁</label></a>
  				</c:when>
  				<c:when test="${x == 1}">
  					<a href = "javascript:void(0)" onclick="changeSeal(${everyuser.uid},0)">解禁</a>
  				</c:when>
  			</c:choose>
  			
  		</td>
  	</tr>
  	</c:forEach>
  </table>
  <div id = "page">
	  	<a href="users/findUsers12.action?pageNum=0" style = "margin-left :20px">首页</a>||
		<a href="users/findUsers12.action?pageNum=${pageNum - 1}">上一页</a>||
		<a href="users/findUsers12.action?pageNum=${pageNum + 1}">下一页</a>||
		<a href="users/findUsers12.action?pageNum=${lastPage}">尾页</a>
  </div>
  </div>
  <div class = "right">
  	<iframe src = "" class = "ifr" name = "showOneUsers"></iframe>
  </div>
    		

  </body>
</html>