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
    <link href="css/sellerInfo.css" rel="stylesheet"/>
    <title>门店信息</title>
    <script type="text/javascript" src = "js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
    	$(function($){
    		$.post("store/findStoreByUid.action",{"uid":${activeSeller.uid}},function(data){
    			var store = eval("("+data+")");
    			$("#spermit").html(store.spermit);
    			$("#stype").html(store.stype);
    			$("#saddress").html(store.saddress);
    			$("#sperson").html(store.sperson);
    			$("#spidcard").html(store.spidcard);
    			$("#shomephone").html(store.shomephone);
    			$("#sdescription").html(store.sdescription);
    			switch(store.ssign){
    			case 0 :
					$("#ssign").html("待审核");
					break;
    			case 1 :
					$("#ssign").html("审核通过");
					break;
    			case 2 :
					$("#ssign").html("审核未通过");
					//创建重新申请按钮
					var but = $("<input type = 'button' value = '重新申请' id = 're'/>");
					$("#rebutton").html(but);
					$("#re").bind("click",function(){
						window.location.href = "sellerNav/sellerInfo.jsp";
					});
					break;
    			case 3 :
					$("#ssign").html("店铺被封禁");
					break;	
    			}
    			// TODO  排名
    			//$("#sranking").html(store.spermit);
    		});
    	});
    
    </script>    
  </head>
  <body>
	<div class="container" style = "margin-top :50px">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="tab-content">
					<div class="tab-pane active" id="panel-356940">
						<table>
							<tr>
								<td>营业许可证号：</td>
								<td><label id = "spermit"></label></td>
							</tr>
							<tr>
								<td>店铺名称：</td>
								<td><label id = "stype"></label></td>
							</tr>
							<tr>
								<td>店铺地址：</td>
								<td><label id = "saddress"></label></td>
							</tr>
							
							<tr>
								<td>法人代表姓名：</td>
								<td><label id = "sperson"></label></td>
							</tr>
							<tr>
								<td>法人代表身份证号：</td>
								<td><label id = "spidcard"></label></td>
							</tr>
							<tr>
								<td>店铺固定电话：</td>
								<td><label id = "shomephone"></label></td>
							</tr>
							<tr>
								<td>店铺描述：</td>
								<td><label id = "sdescription"></label></td>
							</tr>
							<tr>
								<td>店铺状态：</td>
								<td><label id = "ssign"></label></td>
							</tr>
							<tr>
								<td>店铺排名：</td>
								<td><label id = "sranking"></label></td>
							</tr>
							<tr>
								<td colspan = "2" id = "rebutton"></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
  </body>
</html>
