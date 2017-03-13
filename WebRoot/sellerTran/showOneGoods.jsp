<%@ page language="java" contentType = "text/html ; charset = UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <link href="css/showUserTable.css" type = "text/css" rel="stylesheet"/>
    <title>查看产品</title>
  </head>
  <body>
	<table border = 1 cellspacing = 0>
  		<tbody>
  			<tr>
  				<td colspan = "2" rowspan = "4"><img src = "${oneGoods.gcover}" alt = "暂未上传" width = "100px" height = "100px"/></td>
  				<td>
  				 	${oneGoods.gid } ${oneGoods.gname}
  				</td>
  			</tr>
  			<tr>
  				<td><del>${oneGoods.goldprice }元</del> ${oneGoods.gprice }元</td>
  			</tr>
  			<tr>
  				<td>
  					商品类型:${oneGoods.gtype }
  				</td>
  			</tr>
  			<tr>
  				<td>
  					商品库存:${oneGoods.gnum }
  				</td>
  			</tr> 			
  			<tr>
  				<td>
  					适用人数:
  				</td>
  				<td colspan = "2">
  				${oneGoods.gpersonnum} <br/>
  				</td>
  			</tr>
  			<tr>
  				<td>商品内容</td>
  				<td colspan = "2">${oneGoods.gcontent }</td>
  			</tr>
  			<tr>
  				<td>商品介绍</td>
  				<td colspan = "2">${oneGoods.gdescription }</td>
  			</tr>
  			<tr>
  				<td>上架时间</td>
  				<td colspan = "2"><fmt:formatDate value="${oneGoods.onsaletime }" type = "BOTH" pattern="yy-MM-dd hh:mm:ss"/></td>
  			</tr>
  		</tbody>
  	</table>	
  </body>
</html>