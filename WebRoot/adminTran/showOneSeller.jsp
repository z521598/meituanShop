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
    <title>商户信息</title>
  </head>
  <body>
	<table border = 1 cellspacing = 0>
  		<tbody>
  			<tr>
  				<td colspan = "2" rowspan = "4"><img src = "${oneStore.simage1}" alt = "暂未上传" width = "100px" height = "100px"/></td>
  				<td>
  				 	商户编号：${oneStore.sid }
  				</td>
  			</tr>
  			<tr>
  				<td>商户名称：${oneStore.stype}</td>
  			</tr>
  			<tr>
  				<td>
  					店铺固定电话:${oneStore.shomephone }
  				</td>
  			</tr> 			
  			<tr>
  				<td>
  					店铺评星:${oneStore.srating} <br/>
  				</td>
  			</tr>
  			<tr>
  				<td>
  					商户地址:
  				</td>
  				<td colspan = "2">
  					${oneStore.saddress }
  				</td>
  			</tr>
  			<tr>
  				<td>
  					营业许可证号：
  				</td>
  				<td colspan = "2">
  					${oneStore.spermit }
  				</td>
  			</tr>
  			<tr>
  				<td>法人代表姓名</td>
  				<td colspan = "2">${oneStore.sperson }</td>
  			</tr>
  			<tr>
  				<td>法人代表身份账号</td>
  				<td colspan = "2">${oneStore.spidcard }</td>
  			</tr>
  			<tr>
  				<td>审核提交时间</td>
  				<td colspan = "2"><fmt:formatDate value="${oneStore.suptime }" type = "BOTH" pattern="yy-MM-dd hh:mm:ss"/></td>
  			</tr>
  			<%--
  			<tr>
  				<td>审核通过时间</td>
  				<td colspan = "2"><fmt:formatDate value="${oneStore.spasstime }" type = "BOTH" pattern="yy-MM-dd hh:mm:ss"/></td>
  			</tr>
  			<tr>
  				<td>处理时间</td>
  				<td colspan = "2"><fmt:formatDate value="${oneStore.sdealtime }" type = "BOTH" pattern="yy-MM-dd hh:mm:ss"/></td>
  			</tr>
  			<tr>
  				<td>封禁开始时间</td>
  				<td colspan = "2"><fmt:formatDate value="${oneStore.ssealtime }" type = "BOTH" pattern="yy-MM-dd hh:mm:ss"/></td>
  			</tr>
  			 --%>
  			<tr>
  				<td colspan = "3">
  					店铺描述：${oneStore.sdescription }
  				</td>
  			</tr>
  		</tbody>
  	</table>	
  </body>
</html>