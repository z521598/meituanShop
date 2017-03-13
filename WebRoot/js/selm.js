$(function () {
    $(".content-left,.content-right").height($(window).height() - 130);
});
$(".accordion-inner").click(function () {
    $(".active").html($(this).find(".left-body").text());
});

$(window).resize(function () {
    $(".content-left,.content-right").height($(window).height() - 130);
});
//以下为导航控制跳转的js实现
$("#orders").click(function(){
	$("#ifr").attr("src","orders/findBySellerId.action");
});
$("#cooperation").click(function(){
	$("#ifr").attr("src","sellerNav/cooperation.jsp");
});
$("#goods").click(function(){
	$("#ifr").attr("src","goods/findByUid.action");
});
/*
$("#journalAccount").click(function(){
	$("#ifr").attr("src","sellerNav/journalAccount.jsp");
});
*/
$("#sale").click(function(){
	$("#ifr").attr("src","sellerNav/sale.jsp");
});

$("#sellerInfo").click(function(){
	$("#ifr").attr("src","sellerNav/sellerInfo.jsp");
});

$("#sellerKey").click(function(){
	$("#ifr").attr("src","sellerNav/sellerKey.jsp");
});

$("#storeInfor").click(function(){
	$("#ifr").attr("src","sellerNav/storeInfor.jsp");
});

$("#evaluate").click(function(){
	$("#ifr").attr("src","comment/findByUid.action");
});
$("#home").click(function(){
	$("#ifr").attr("src","sellerNav/home.jsp");
	//修改导航栏的文字信息
	$(".active").html("");
});
$("#message").click(function(){
	$("#ifr").attr("src","message/findBySeller.action");
	$(".active").html("消息");
});
$("#newMsg").click(function(){
	$("#ifr").attr("src","sellerNav/newMessage.jsp");
	$(".active").html("消息");
});

