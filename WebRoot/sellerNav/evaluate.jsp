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
    		var cresponse = prompt("请输入您的回复","");
    		$.post("comment/addResponse.action",{"cid" : cid,"cresponse" : cresponse},function(sign){
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
	  		<td>评论编号</td>
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
	  	<c:if test="${empty comment}">
	  		<tr>
	  			<td colspan = "7">评论空空如也,不如去申请广告位吧
	  			<br/>
	  			<label  style = "color :red">让你的产品出现在App首页</label>
	  			<input type = "button" value = "点我去申请" onclick = "window.location.href = 'sellerNav/cooperation.jsp'"/>
	  			</td>
	  		</tr>
	  	</c:if>
	  	<c:if test="${!empty comment}">
	  	<c:forEach items="${comment}" var = "everyComment">
	  	<tr>
	  		<td>${everyComment.cid}</td>
	  		<td><a href = "goods/findByGid.action?gid=${everyComment.gid}" target="showOne">${everyComment.gid}</a></td>
	  		<td>${everyComment.rating}</td>
	  		<td>${everyComment.ccontent}</td>
	  		<td>${everyComment.cresponse}</td>
	  		<td>
	  			<c:if test="${empty everyComment.cresponse}">
	  				  <a href = "javascript:void(0)" onclick = "delCom(${everyComment.cid})">回复</a>
	  			</c:if>
	  			<c:if test="${!empty everyComment.cresponse}">
	  					<label style = "color : grey">已回复</label>
	  			</c:if>
	  		</td>
	  	</tr>
	  	</c:forEach>
	  	</c:if>
	  </table>
	   <div id = "page">
	  	<a href="comment/findByUid.action?pageNum=0" style = "margin-left :20px">首页</a>||
		<a href="comment/findByUid.action?pageNum=${pageNum - 1}">上一页</a>||
		<a href="comment/findByUid.action?pageNum=${pageNum + 1}">下一页</a>||
		<a href="comment/findByUid.action?pageNum=${lastPage}">尾页</a>
  </div>
  </div>
  <div class = "right">
  	<iframe src = "" class = "ifr" name = "showOne"></iframe>
  </div>

  </body>
</html>