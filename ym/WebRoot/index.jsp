<%@ page contentType="text/html;charset=gb2312" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页跳转</title>
<script src="resources/js/jquery/jquery-1.7.2.js" type="text/javascript"></script>
<script>
$(document).ready(function(){

	/**window.setTimeout(function(){
	window.opener=null;//如果后面需要用openner，这一行可以去掉 
	window.open('','_top'); 
	var newwindow = window.open('main.jsp','_blank','Width='+ (screen.width) + ',Height=' + (screen.height) + ',Left=0,Top=0,status=yes,menubar=no, location=no,scrollbars=no,resizable=yes');
	if(newwindow !=null){
		window.top.close();
	}else{
		$("#open").html("请调整浏览器设置，允许弹出临时窗口！或者直接点击<a href='#' onclick='opendiv();'>这里</a>进行跳转。");
	}},1000);**/
	window.location.href="main.jsp";

});

function opendiv(){
	var newwindow = window.open('main.jsp','_blank','Width='+ (screen.width) + ',Height=' + (screen.height) + ',Left=0,Top=0,status=yes,menubar=no, location=no,scrollbars=no,resizable=yes');
	window.top.close();
}
</script>
<style>
/**#open{
	background-image:url(images/indexloading.gif);
	height:200px;
	width:600px;
	font-family:'微软雅黑';
	left:50%;
	top:20%;
	background-repeat:no-repeat;
	background-position: center;
	text-align: center;
	position: absolute; 
	margin-left: -300px;
}**/
</style>
</head>

<body>
<div id="open"></div>
</body>
</html>


