<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />

<link rel="stylesheet" type="text/css" href="${ctx}/templets/template_2/css/logout.css" />
</head>
<body>
<!-- %
com.ay.login.UserManager.removeUser(session);
%-->
	<div id="container">
		<div id="out_button"><a href="${ctx}/logout!logout.action" onMouseOver = "over1()" onMouseOut = "out1()"><img name = "image1" src="../images/out_button.gif" border="0" /></a></div>
	</div>
</body>
</html>
<script>
function over1(){
if(document.images)
document.image1.src = "../images/out_button2.gif";
}
function out1(){
if(document.images)
document.image1.src = "../images/out_button.gif";
}
</script>
