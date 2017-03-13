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
$("#addAdmin").click(function(){
	$("#ifr").attr("src","adminNav/addAdmin.jsp");
});
$("#advertisement").click(function(){
	$("#ifr").attr("src","advertise/findAll.action");
});
$("#evaluate").click(function(){
	$("#ifr").attr("src","comment/findAll.action");
});
/*
$("#goods_appr").click(function(){
	$("#ifr").attr("src","adminNav/goods_appr.jsp");
});
*/
$("#goods").click(function(){
	$("#ifr").attr("src","goods/findAllGoods.action");
});
$("#information").click(function(){
	$("#ifr").attr("src","orders/findInfo.action");
});
$("#journalAccount").click(function(){
	$("#ifr").attr("src","adminNav/journalAccount.jsp");
});
/*
$("#seller_appr").click(function(){
	$("#ifr").attr("src","adminNav/seller_appr.jsp");
});
*/
$("#seller_info").click(function(){
	$("#ifr").attr("src","adminNav/seller_info.jsp");
});
$("#seller").click(function(){
	$("#ifr").attr("src","store/findAllSeller.action");
});
$("#updatePassword").click(function(){
	$("#ifr").attr("src","adminNav/updatePassword.jsp");
});
$("#users_info").click(function(){
	$("#ifr").attr("src","adminNav/users_info.jsp");
});
$("#users").click(function(){
	$("#ifr").attr("src","users/findUsers12.action");
});
$("#home").click(function(){
	$("#ifr").attr("src","adminNav/home.jsp");
	//修改导航栏的文字信息
	$(".active").html("");
});
$("#message").click(function(){
	$("#ifr").attr("src","message/findAll.action");
	$(".active").html("消息");
});
$("#newMsg").click(function(){
	$("#ifr").attr("src","adminTran/addMessage.jsp");
	$(".active").html("消息");
});


