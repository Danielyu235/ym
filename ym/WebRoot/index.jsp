<%@ page contentType="text/html;charset=gb2312" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>��ҳ��ת</title>
<script src="resources/js/jquery/jquery-1.7.2.js" type="text/javascript"></script>
<script>
$(document).ready(function(){

	/**window.setTimeout(function(){
	window.opener=null;//���������Ҫ��openner����һ�п���ȥ�� 
	window.open('','_top'); 
	var newwindow = window.open('main.jsp','_blank','Width='+ (screen.width) + ',Height=' + (screen.height) + ',Left=0,Top=0,status=yes,menubar=no, location=no,scrollbars=no,resizable=yes');
	if(newwindow !=null){
		window.top.close();
	}else{
		$("#open").html("�������������ã���������ʱ���ڣ�����ֱ�ӵ��<a href='#' onclick='opendiv();'>����</a>������ת��");
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
	font-family:'΢���ź�';
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


