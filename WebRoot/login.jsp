<%@ page language="java" contentType="text/html ; charset = UTF-8" pageEncoding="UTF-8" errorPage="error.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录页面</title>
   	<link rel="stylesheet" type="text/css" href="css/login.css" />
   	<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
  	<script type="text/javascript">
  		//控件绑定事件应当写在$(function(){})方法内部,即html页面加载结束后触发.
  		$(function(){
  			//动态提交form表单
  			$("#sub2").on("click",function(){
  	  			var f = $("form");
  	  			f.attr("action","users/adminLogin.action");
  	  			f.submit();
  	  		});
  			//单击输入之后,清楚登录错误信息
  			$("#name").on("click",function(){
  				$("#wrongMsg").empty();		
  			});
  			
  			$("#pwd").on("click",function(){
  				$("#fpwd").empty();		
  			});
  			
			//验证用户名密码不能为空
  			$("form").on("submit",function(){
  				var name = $("#name").val().trim();
  				var pwd = $("#pwd").val().trim();
				if(name == ""){
					$("#wrongMsg").text("用户名不能为空");
	  				return false;	
				}if(pwd == "") {
					$("#fpwd").text("密码不能为空");
	  				return false;	
				}else{
					return true;
				}
			});
			
			
  		});
  		
  		
  	
  	</script>
  </head>
  <body>
    <form action = "users/sellerLogin.action" method="post" id="slick-login">
        <label for="username">username</label>
        <input type="text" id = "name" name="uusername" class="placeholder" placeholder="用户名">
        <font id = "wrongMsg" color = "red" size = "2">${wrongMsg}</font>
        <label for="password">password</label>
        <input type="password" id = "pwd" name="upassword" class="placeholder" placeholder="密码">
        <font id = "fpwd" color = "red" size = "2"></font>
        <br/>
        <input type="submit" value="商家入口">
        <input type="button" value="管理员入口" id = "sub2" >
    </form>
	</body>
 
</html>
