<%@ page language="java" contentType = "text/html ; charset = UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <link rel = "stylesheet" type = "text/css" href = "../css/commonTable.css"/>
	<link rel = "stylesheet" type = "text/css" href = "../css/users_layout.css"/>
    <base href="<%=basePath%>">
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
    	function changeOrder(data,aid){
    		var newOrder = prompt("请您输入希望展示的相对顺序（必须为数字）：",data.innerHTML);
    			$.post("advertise/updateAorderByAid.action",{"aid":aid,"aorder":newOrder},function(sign){
        			if(sign == 1){
        				window.location.reload();
        			}
        		});
    	}
    </script>
    <title>广告管理</title>
  </head>
  <body style = "background-color : #00BB99;">
  <div class = "left">
  	<table class = "solidTable">
  	<tr>
  		<td>广告编号</td>
  		<td>商品编号</td>
  		<td>展示顺序</td>
  		<td>申请时间</td>	
  		<td>操作</td>
  	</tr>
  	<c:forEach items="${advertise}" var = "everyadvertise">
  	<tr>
		<td align = "center">${everyadvertise.aid }</td>	
		<td align = "center"><a href = "goods/findByGid.action?gid=${everyadvertise.gid}" target="showOne">${everyadvertise.gid}</a></td>	
		<td align = "center"><a href = "javascript:void(0)" onclick = "changeOrder(this,${everyadvertise.aid})">${everyadvertise.aorder }</a></td>	
		<td><fmt:formatDate value="${everyadvertise.applytime }" type="BOTH"/></td>	
  		<td>
  		<c:choose>
  			<c:when test="${everyadvertise.asign == 0}">
  				<a href = "advertise/updateAsign.action?asign=1&aid=${everyadvertise.aid}" style = "color : red">通过</a>
  			</c:when>
  			<c:when test="${everyadvertise.asign == 1}">
  				<a href = "advertise/updateAsign.action?asign=0&aid=${everyadvertise.aid}" style = "color : grey">下架</a>
  			</c:when>
  		</c:choose>
  			
  		</td>
  	</tr>
  	</c:forEach>
  </table>
  </div>
  <div class = "right">
  	<iframe src = "" class = "ifr" name = "showOne"></iframe>
  </div>
  </body>
</html>