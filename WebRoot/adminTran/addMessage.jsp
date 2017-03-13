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
	<script type="text/javascript">
		$(function(){
			$.get("users/findAllUusername.action",function(data){
				var arr = eval("("+data+")");
				var select = $("#username");
				for(var i = 0; i < arr.length ; i++){
					var opt = $("<option>"+arr[i]+"</option>");
					select.append(opt);
				}
			});
		});
		
		function addUser(){
			var users = $("#users");
			var usersValue = users.val();
			var userValue = $("#username").val();
			if(!(userValue == "请选择")){
				users.val(usersValue+userValue+";");
			}
		}
	</script>
    <title>管理员新建消息</title>
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
					<span><strong>---尊贵的管理员，您想发给谁？</strong></span>
					<font color = "red">${msg }</font>
				</div>
			</div>
			<form action="message/addMessageForAdmin.action" method="post" enctype="application/x-www-form-urlencoded">
			<h2>
				<div class="form-group">
					<input type="text" class="form-control" name = "uusernames" id = "users" placeholder = "收件人" readonly="readonly"/>
					<select id = "username">
						<option>请选择</option>
					</select>
					<button type="button" class="btn" onclick = "addUser()">添加</button>
				</div>
			</h2>
			<h2>
				<div class="form-group">
					<input type="text" class="form-control" name = "mtitle" placeholder = "标题"/>
				</div>
			</h2>
			<p>
				<textarea cols = "20" rows = "3" name = "mcontent" style = "width : 100%;height : 35%">
					
				</textarea>
			</p>
			<button type="submit" class="btn btn-primary btn-lg">发送</button>
			</form>
		</div>
	</div>
</div>
  </body>
</html>