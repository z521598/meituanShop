<%@ page language="java" contentType = "text/html ; charset = UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<link href="../css/form.css" rel='stylesheet' type='text/css' />
  	<meta name="viewport" content="width=device-width, initial-scale=1">
    <base href="<%=basePath%>">
    <title>修改密码</title>
     <script type="text/javascript" src = "js/jquery-1.9.1.min.js"></script>
    <script type="application/x-javascript"> 
    addEventListener("load", function() { 
    
    	setTimeout(hideURLbar, 1000); 
    
    }, false); 
    function hideURLbar(){
    	
    	window.scrollTo(0,1000); 
    
    } 
    function test(){
    	var newp = $("#newp").val();
    	var renewp = $("#renewp").val();
    	var oldp = $("#oldp").val();
    	if(!(newp == renewp)){
    		$("#msg").html("<label style = 'color : red ;size : 20px'>两次密码不一致</label>");
    		return false;
    	}else if(oldp != "${activeSeller.upassword}"){
    		$("#msg").html("<label style = 'color : red ;size : 20px'>密码错误</label>");
    		return false
    	}else{
    		return true;
    	}
    	}
    </script>
  </head>
  <body style = "background : #00BB99">
	<div class="main">
		<div class="clear">${msg}</div>
		<form action="users/updateAminByUid.action" method="post">
		    <div class="clear"> </div>
		    <div class="lable-2">
   				<input type = "hidden" name = "uid" value = "${admin.uid}"/>
		   		<input type="password" name = "upassword" id = "newp" placeholder = "新密码" >
		    	<input type="password" id = "renewp" placeholder = "确认新密码" >
		    	<input type="password" id = "oldp" placeholder = "旧密码">
			</div>
			<div class="clear"> </div>
			<div class="submit">
				<input type="submit" value="确认修改" >
			</div>
			<div class="clear"> </div>
		</form>
	</div> 
</body>
</html>