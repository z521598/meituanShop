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
	<script src="bootstrap/js/bootstrap.min.js"></script>
    <title>商户新建消息</title>
  </head>
  <body>
   <div class="container">
	<div class="row clearfix" style = "margin-top :40px">
		<div class="col-md-12 column">
			<div class="alert alert-dismissable alert-info">
				<div>
					<center><span><strong><h3>新建消息</h3></strong></span></center>
				</div>
				<div>
					<span><strong>---有什么想对我们说的，写在下面吧</strong></span>
				</div>
			</div>
			<form action="message/addMessageForSeller.action" method="post">
			<input type="hidden" name = "uusername" value="${activeSeller.uusername }"/>
			<h2>
				<div class="form-group">
					<input type="text" class="form-control" name = "mtitle" placeholder = "标题"/>
				</div>
			</h2>
			<p>
				<textarea cols = "20" rows = "3" name = "mcontent" style = "width : 100%;height : 40%">
					
				</textarea>
			</p>
			<button type="submit" class="btn btn-primary btn-lg">发送</button>
			</form>
		</div>
	</div>
</div>
  </body>
</html>