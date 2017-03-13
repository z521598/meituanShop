<%@ page language="java" contentType = "text/html ; charset = UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>添加产品</title>
  	<script type = "text/javascript" src = "js/jquery-1.9.1.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script type="text/javascript">
		function addRow(){
			var tbody = $("#rows");
			var newrow = 
			"<tr><td><input type = 'text' placeholder = '商品名称' name = 'contentName'/></td><td>x</td><td><input type = 'text' placeholder = '份数' name = 'contentNumber'/></td></tr>"
			tbody.append(newrow);
		}
	</script>
  </head>
  <body>
  <div class="container">
  <h3>产品信息</h3>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<form action="goods/addGoods.action" method="post" enctype="multipart/form-data">
				<div class="form-group">
					 产品名称: <input type="text" class="form-control" name = "gname" placeholder = "产品名称"/>
				</div>
				<div class="form-group">
					产品封面: <input type="file" class="form-control" name = "gcover2" />
				</div>
				<div class="form-group">
					产品库存: <input type="text" class="form-control" name = "gnum" placeholder = "产品库存"/>
				</div>
				<div class="form-group">
					 适用人数: <input type="text" class="form-control" name = "gpersonnum" placeholder = "适用人数"/>
				</div>
				<div>
					<input type="hidden" name = "uid" value = "${activeSeller.uid}"/>
				</div>
				<div class="form-group">
					商品类别: 美食<input type="radio" name = "gtype" value = "1"/> 酒店<input type="radio" name = "gtype" value = "2"/> 快餐<input type="radio" name = "gtype" value = "3"/> 美发<input type="radio" name = "gtype" value = "4"/><br/>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
							 景点<input type="radio" name = "gtype" value = "5"/> 冷饮<input type="radio" name = "gtype" value = "6"/> 丽人<input type="radio" name = "gtype" value = "7"/> 健身<input type="radio" name = "gtype" value = "8"/>
					
				</div>
				<div class="form-group">
					 商品原价格: <input type="text" class="form-control" name = "goldprice" placeholder = "商品原价格(元)"/>
				</div>
				<div class="form-group">
					 商品美团价格: <input type="text" class="form-control" name = "gprice" placeholder = "商品美团价格(元)"/>
				</div>
				<div class="form-group">
					 商品介绍: <textarea cols="30" rows="5" name = "gdescription"></textarea>
				</div>
				<div class="form-group">
					 商品内容: <input type = "button" onclick="addRow()" value = "添加一项"/>
					 <table>
						<tbody id = "rows">
							<tr>
								<td><input type = "text" placeholder = "商品名称" name = "contentName"/></td>
								<td>x</td>
								<td><input type = "text" placeholder = "份数" name = "contentNumber"/></td>
							</tr>
						</tbody>
					 </table>
				</div>
				<div>
					<button type="submit" class="btn btn-default">提交审核</button>
				</div>
			  </form>
			</div>
		</div>
	</div>
  </body>
</html>