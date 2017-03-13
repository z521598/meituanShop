<%@ page language="java" contentType = "text/html ; charset = UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <link href="css/showUserTable.css" type = "text/css" rel="stylesheet"/>
    <title>用户信息</title>
  </head>
  <body>
  
  	<table border = 1 cellspacing = 0>
  		<tbody>
  			<tr>
  				<td colspan = "2" rowspan = "4"><img src = "${oneUser.uhead}" alt = "暂未上传" width = "100px" height = "100px"/></td>
  				<td>
  				 	${oneUser.uid }&nbsp;${oneUser.uname}&nbsp;${oneUser.usex}	
  				</td>
  			</tr>
  			<tr>
  				<td>
  					账号:${oneUser.uusername }
  				</td>
  			</tr>
  			<tr>
  				<td>
  					密码:${oneUser.upassword} <br/>
  				</td>
  			</tr>
  			<tr>
  				<td>
  					 积分：${oneUser.credit }
  				</td>
  			</tr>
  			<tr>
  				<td>邮箱</td>
  				<td colspan = "2">${oneUser.uemail }</td>
  			</tr>
  			<tr>
  				<td>手机号码</td>
  				<td colspan = "2">${oneUser.utelephone }</td>
  			</tr>
  			<tr>
  				<td>邮箱</td>
  				<td colspan = "2">${oneUser.uemail }</td>
  			</tr>
  			<tr>
  				<td>地址</td>
  				<td colspan = "2">${oneUser.uaddress }</td>
  			</tr>
  			<tr>
  				<td>注册时间</td>
  				<td colspan = "2"><fmt:formatDate value="${oneUser.uregisttime }" type = "BOTH" pattern="yy-MM-dd hh:mm:ss"/></td>
  			</tr>
  			<tr>
  				<td>最后登录时间</td>
  				<td colspan = "2"><fmt:formatDate value="${oneUser.ulastlogtime }" type = "BOTH" pattern="yy-MM-dd hh:mm:ss"/></td>
  			</tr>
  			<tr>
  				<td>最后登录地点</td>
  				<td colspan = "2"><fmt:formatDate value="${oneUser.ulastlogaddress }" type = "BOTH" pattern="yy-MM-dd hh:mm:ss"/></td>
  			</tr>
  			<tr>
  				<td>封禁时间</td>
  				<td colspan = "2"><fmt:formatDate value="${oneUser.usealtime }" type = "BOTH" pattern="yy-MM-dd hh:mm:ss"/></td>
  			</tr>
  	
  		</tbody>
  	</table>	
  </body>
</html>