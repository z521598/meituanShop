<%@page import="com.lsq.meituan.pojo.Users"%>
<%@ page language="java" contentType = "text/html ; charset = UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<link rel="stylesheet" type="text/css" href = "../css/cooperation.css"/>
    <base href="<%=basePath%>">
    <title>美团合作</title>
    <script type = "text/javascript" src = "js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
    	$.get("goods/findByUidForAjax.action",function(data){
			var arr = eval("("+data+")");			
			var goods = $("#goods");
			for (var i in arr){
				var opt = $("<option></option>");
				opt.text(arr[i].gname);
	  			opt.attr("value",arr[i].gid);
	  			goods.append(opt);
			}
		});
    });
	function sub(){
		var gid = $("#goods").val();
		$.post("advertise/addAdvertise.action",{"gid":gid},function(sign){
			if(sign == 1){
				alert("请求已发生，等待审核");
			}else{
				alert("请求重复");
			}
		});
	}
    </script>
  </head>
  <body>
	<fieldset>
		<legend>开发者资料</legend>
		组长：郎世权。<BR/>
		组员：迟全超，关雪，马铭泽，杨晨晨，李政辉，祝嘉
		<br/>
		微信：lsq576506402
	</fieldset>
	<hr/>
	<fieldset>
		<legend>美团合作</legend>
		想让你的产品大卖吗？想让你的产品出现在美团App首页吗？<br/>
		若有需要,选取您的商品进行申请。<br/>
			<select id = "goods" name = "gid"></select>
			&nbsp;&nbsp;&nbsp;
			<input type = "button" onclick="sub()" value = "确认申请"/>
	</fieldset>
  </body>
</html>
