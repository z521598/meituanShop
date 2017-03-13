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
  	<base href="<%=basePath%>">
  	<link rel = "stylesheet" type = "text/css" href = "css/commonTable.css"/>
	<link rel = "stylesheet" type = "text/css" href = "css/users_layout.css"/>
	<link rel="stylesheet" type="text/css" href="css/page.css"/>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<!-- 
    <meta http-equiv="refresh" content="20">   
     -->
    <script type="text/javascript" src = "js/jquery-1.9.1.min.js"></script>
   	<script src="bootstrap/js/bootstrap.min.js"></script>
    <title>产品信息</title>
    <script type="text/javascript">
    	function showContent(mcontent,uusername,mid){
    		alert("来自用户"+uusername+"的消息："+"\n"+mcontent);
    		$.post("message/updateState.action",{"mid":mid},function(sign){
    			if(sign == 1){
    				window.location.href = "message/findAll.action";
    			}
    		});
    	}
    </script>
  </head>
  <body>
	  <div class="container">
		<div class="row clearfix" style = "margin-top:30px">
			<div class="col-md-12 column">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>
								编号
							</th>
							<th>
								发件人
							</th>
							<th>
								标题
							</th>
							<th>
								发件时间
							</th>
						</tr>
					</thead>
					<tbody>
					<!-- success,error,info,warning -->
					<c:forEach var="m" items="${message }">
						<tr onclick = "showContent('${m.mcontent}','${m.uusername }',${m.mid })" 
						<c:if test = "${m.msign == 0}"> 
						class="success"
						</c:if>
						>
							<td>${m.mid }</td>
							<td>${m.uusername }</td>
							<td>${m.mtitle }</td>
							<td><fmt:formatDate value="${m.usertime }" type="BOTH"/></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div id = "page">
		  	<a href="message/findAll.action?pageNum=0" style = "margin-left :20px">首页</a>||
			<a href="message/findAll.action?pageNum=${pageNum - 1}">上一页</a>||
			<a href="message/findAll.action?pageNum=${pageNum + 1}">下一页</a>||
			<a href="message/findAll.action?pageNum=${lastPage}">尾页</a>
 		</div>
	</div>
  </body>
</html>
