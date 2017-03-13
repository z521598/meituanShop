<%@ page language="java" contentType = "text/html ; charset = UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
    <title>首页</title>
    <script type="text/javascript">
    	$(function($){
    		var historyUser = $("#historyUser");
        	$.get("address/findHistorySum.action",function(sum){
        		historyUser.html(sum);
        	});
    	});
    </script>
  </head>
  <body style="background-color:#00BB99;margin-top:20px;margin-left:20px">
  	<h3 class="text-warning text-center" style = "color : #ffffff">
		总体实况
	</h3>
  	<p class="lead text-success text-left" style = "color : #ffffff">
		 目前在线用户数目	：<em>${activeUser}</em>
	</p>
	<p class="lead text-success text-left" style = "color : #ffffff">
		 历史访问用户总数	：<em id = "historyUser"></em>
	</p>
  </body>
</html>