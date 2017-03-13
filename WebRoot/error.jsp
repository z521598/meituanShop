<%@ page language="java" contentType = "text/html ; charset = UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="bootstrap/js/bootstrap.min.js"></script>
    <title>错误信息</title>
  </head>
  <body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<p class="lead text-warning text-center">
					很抱歉，出错了。。。
				</p>
				<p class="lead text-warning text-center">
					错误信息：<%=exception.getMessage() %>
				</p>
			</div>
		</div>
	</div>
  </body>
</html>