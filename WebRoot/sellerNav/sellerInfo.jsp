<%@ page language="java" contentType = "text/html ; charset = UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <title>信息管理</title>
    <script type = "text/javascript" src = "js/jquery-1.9.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <link href="css/sellerInfo.css" rel="stylesheet"/>
    <script type="text/javascript">
   
    /*
  	 *@author : lsq
	 *@title : removeChildrenById
	 *@date : 2016-07-27
	 *@description : 根据id清除元素内所有子元素
  	 */
  	 function removeChildrenById(id){
  	 	$("#"+id).empty();
  	 }
    //地址的三级联动
  	$(document).ready(function(){
  		$("#province2").load("address/findProvince.action",function(data){
  		var arr = eval("("+data+")");
  		var sel = $("#province2");
  		for(var i in arr){
  			var opt = $("<option></option>");
  			opt.text(arr[i][2]);
  			opt.attr("value",arr[i][1]);
  			sel.append(opt);
  		}
  		showCity();
  	});
  		 //选项卡
  	    $("#tabs a").click(function (e) {
  	    	e.preventDefault();
  	    	$(this).tab('show');
  	    	showProvince();
  	    });	
  		 
  		
  	});
	function showProvince(){
	  		$.get("address/findProvince.action",function(data){
	  			removeChildrenById("city2");
	  			var arr = eval("("+data+")");
		  		var sel = $("#province2");
		  		for(var i in arr){
		  			var opt = $("<option></option>");
		  			opt.text(arr[i][2]);
		  			opt.attr("value",arr[i][1]);
		  			sel.append(opt);
	  			}
	  			showTown();
	  		});
	  		showCity();
		
	}
  	function showCity(){
  		var proCode = $("#province2").val();
  		$.post("address/findCityOrTownById.action",{"proCode":proCode},function(data){
  			removeChildrenById("city2");
  			var cit = $("#city2");
  			var arr = eval("("+data+")");
  			for(var i in arr){
  			var opt = $("<option></option>");
  			opt.text(arr[i][2]);
  			opt.attr("value",arr[i][1]);
  			cit.append(opt);
  			}
  			showTown();
  		});
  	}
  	
  	function showTown(){
  		var citCode = $("#city2").val();
  		$.post("address/findCityOrTownById.action?citCode="+citCode,function(data){
  			removeChildrenById("town2");
  			var tow = $("#town2");
  			var arr = eval("("+data+")");
  			for(var i in arr){
  			var opt = $("<option></option>");
  			opt.text(arr[i][2]);
  			opt.attr("value",arr[i][1]);
  			tow.append(opt);
  			}
  		});
  	
  	}
    </script>
  </head>
  
  <body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="tabbable" id="tabs-641506">
				<ul class="nav nav-tabs" id = "tabs">
					<li class="active">
						 <a href="#panel-356940" data-toggle="tab">个人资料</a>
					</li>
					<li>
						 <a href="#panel-484783" data-toggle="tab">商户资料</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="panel-356940">
<!-- 个人资料 -->
					  	<form action="users/updateUsersById.action" method="post" enctype="multipart/form-data">
					  		<table>
								<tr>
									<td><input type = "hidden" name = "uid" value = "${activeSeller.uid}"/></td>
								</tr>
								<tr>
									<td>姓名：</td>
									<td><input type = "text" name = "uname" placeholder = "姓名" value = "${activeSeller.uname}"/></td>
								</tr>
								<tr>
									<td>性别：</td>
									<td>
										男 <input type = "radio" name = "usex" value = "男"
											<c:if test="${activeSeller.usex == '男'}">
												checked = "checked"
											</c:if>
										/>
										&nbsp;&nbsp;&nbsp;&nbsp;
										女 <input type = "radio" name = "usex" value = "女"
											<c:if test="${activeSeller.usex == '女'}">
												checked = "checked"
											</c:if>
										/>
									</td>
								</tr>
								<tr>
									<td>头像：</td>
									<td><input type = "file" name = "uhead2"/></td>
								</tr>
								<tr>
									<td>电子邮箱：</td>
									<td><input type = "text" name = "uemail" placeholder = "电子邮箱"  value = "${activeSeller.uemail}"/></td>
								</tr>
								<tr>
									<td>地址：</td>
									<td>
										<input type = "text" name = "uaddress" placeholder = "地址" value = "${activeSeller.uaddress}"/>
									</td>
								</tr>
								<tr>
									<td>手机号码：</td>
									<td><input type = "text" name = "utelephone" id = "" placeholder = "手机号码"  value = "${activeSeller.utelephone}"/></td>
								</tr>
								<tr>
									<td colspan = "2"><input type = "submit" value = "提交"/></td>
								</tr>
							</table>
						</form>
					</div>
					<div class="tab-pane" id="panel-484783">
<!-- 商户资料 -->
						<form action="store/addStore.action" method="post" enctype="multipart/form-data">
					  		<table>
								<tr>
									<td><input type = "hidden" name = "uid" value = "${activeSeller.uid}"/></td>
								</tr>
								<tr>
									<td>营业许可证号：</td>
									<td><input type = "text" name = "spermit" placeholder = "营业许可证号"/></td>
								</tr>
								<tr>
									<td>店铺名称：</td>
									<td><input type = "text" name = "stype" placeholder = "店铺名称" /></td>
								</tr>
								
								<tr>
									<td>法人代表姓名：</td>
									<td><input type = "text" name = "sperson" placeholder = "法人代表姓名" /></td>
								</tr>
								
								<tr>
									<td>法人代表身份证号：</td>
									<td><input type = "text" name = "spidcard" placeholder = "法人代表身份证号"/></td>
								</tr>
								<tr>
									<td>店铺固定电话：</td>
									<td><input type = "text" name = "shomephone" placeholder = "店铺固定电话"/></td>
								</tr>
								<tr>
									<td>商户地址：</td>
									<td>
										<select id = "province2" onchange = "showCity()" name ="saddress1"></select>
					  					<select id = "city2" onchange = "showTown()" name ="saddress2"></select>
					  					<select id = "town2" name ="saddress3"></select>
									</td>
								</tr>
								<tr>
									<td>店铺描述：</td>
									<td>
										<textarea rows="5" cols="20" name = "sdescription"></textarea>
									</td>
								</tr>
								<tr>
									<td>头像：</td>
									<td><input type = "file" name = "simage"/></td>
								</tr>
								<tr>
									<td colspan = "2"><input type = "submit" value = "提交审核"/></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
  </body>
</html>
