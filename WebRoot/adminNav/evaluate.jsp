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
	<link rel="stylesheet" type="text/css" href="../css/page.css"/>
    <base href="<%=basePath%>">
    <title>评价管理</title>
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
    	function delCom(cid){
    		$.post("comment/deleteCom.action",{"cid" : cid},function(sign){
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
	  		<td>评论编号</td>
	  		<td>用户ID</td>
	  		<td>商品ID</td>
	  		<td>评星</td>	
	  		<td>用户评论</td>
	  		<td>商户回复</td>
	  		<!-- 
	  		<td>评价时间</td>
	  		<td>回复时间</td>
	  		 -->
	  		<td>操作</td>
	  	</tr>
	  	<c:forEach items="${comment}" var = "everyComment">
	  	<tr>
	  		<td>${everyComment.cid}</td>
	  		<td><a href = "users/findUsersByUid.action?uid=${everyComment.uid}" target="showOne">${everyComment.uid}</a></td>
	  		<td><a href = "goods/findByGid.action?gid=${everyComment.gid}" target="showOne">${everyComment.gid}</a></td>
	  		<td>${everyComment.rating}</td>
	  		<td width = "100px">${everyComment.ccontent}</td>
	  		<td width = "100px">${everyComment.cresponse}</td>
	  		<td>
	  			<a href = "javascript:void(0)" onclick = "delCom(${everyComment.cid})">删除</a>
	  		</td>
	  	</tr>
	  	</c:forEach>
	  </table>
	    <div id = "page">
	  	<a href="comment/findAll.action?pageNum=0" style = "margin-left :20px">首页</a>||
		<a href="comment/findAll.action?pageNum=${pageNum - 1}">上一页</a>||
		<a href="comment/findAll.action?pageNum=${pageNum + 1}">下一页</a>||
		<a href="comment/findAll.action?pageNum=${lastPage}">尾页</a>
  </div>
  </div>
  <div class = "right">
  	<iframe src = "" class = "ifr" name = "showOne"></iframe>
  </div>

  </body>
</html>