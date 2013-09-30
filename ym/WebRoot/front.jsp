<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.ay.framework.shiro.SystemParameter" %>
<%@ include file="/common/taglibs.jsp" %>
<%
	String login_authcode_switch = SystemParameter.getLogin_authcode_switch();
	request.setAttribute("login_authcode_switch", login_authcode_switch);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>阳煤项目"两化融合"系统</title>
<link href="css/logout.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="resources/js/jquery/easyui-1.3/themes/cupertino/easyui_front.css"/>
<link rel="stylesheet" type="text/css" href="resources/js/jquery/easyui-1.3/themes/icon.css"/>
<script type="text/javascript" src="resources/js/jquery/jquery-1.7.2.js"></script>
<script type="text/javascript" src="resources/js/jquery/easyui-1.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="resources/js/jquery/easyui-1.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/cookie.js"></script>
<script type="text/javascript" src="js/frontCookie.js"></script>

<script type="text/javascript">
	var cookie = null;
	$(function(){
		cookie = new Cookie();
		cookie.initMember();
	});
	function toggleDiv(value){
		if(value=='qy'){
			$("#qyDiv").show();
			$("#zfDiv").hide();
			form1.username1.value='';
			form1.username2.value='';
			form1.username3.value='';
		}else{
			$("#qyDiv").hide();
			$("#zfDiv").show();
			form1.username.value='';
		}
			
	}
	function setQYUsername(){
		form1.username.value = form1.username1.value
			+ '-' + form1.username2.value
			+ '-' + form1.username3.value;
	}
	function beforeSubmit(){
		cookie.saveOrRemoveMember();
		form_sub();
	}
	function changeCheckbox(obj) {
		if(obj == form1.zfUser) {
			if(obj.checked) {
				form1.qyUser.checked = false;
				form1.usertype.value = '2';
				toggleDiv('zf');
			} else {
				form1.qyUser.checked = true;
				form1.usertype.value = '3';
				toggleDiv('qy');
			}
		}else {
			if(obj.checked) {
				form1.zfUser.checked = false;
				form1.usertype.value = '3';
				toggleDiv('qy');
			} else {
				form1.zfUser.checked = true;
				form1.usertype.value = '2';
				toggleDiv('zf');
			}
		}
	}
	function form_sub(){
	 	var username = document.form1.username.value;
		var password = document.form1.password.value;
		var usertype = document.form1.usertype.value;
		var validCode='';
		if(document.form1.validCode)
			validCode = document.form1.validCode.value; 
		$.ajax({
			url:"login!login.action",
			type:"post",
			data:"username="+username+"&password="+password+"&usertype="+usertype+"&validCode="+validCode,
			success:function(ret){
				if(ret instanceof Object){
					if(!ret.operateSuccess){
						$.messager.show({
                            //title:'提示',
                            msg:ret.operateMessage,
                            timeout:2000,
                            width: 438,
                            height: 81,
                            showType:'slide'
                        });
						changeCode(document.getElementById("validCodeImg"));
					}
				}else{
					document.form1.submit();
				}
			}
		});
	}
	function Enter(){
		if(event.keyCode==13){
			form_sub();
		}	
	}
	function changeCode(obj){
		if(obj){		
		   //获取当前的时间作为参数，无具体意义  
		   var timenow = new Date().getTime();  
	      	//每次请求需要一个不同的参数，否则可能会返回同样的验证码  
		   //这和浏览器的缓存机制有关系，也可以把页面设置为不缓存，这样就不用这个参数了。  
		   obj.src="validCode.action?d="+timenow;  
		}
	}
</script>
</head>

<body>
<form id="form1" name="form1" method="post" action="login!login.action" onkeydown="Enter()">
<center>
<div id="main">
       	<div class="m_top"></div>
        <div class="out_name"></div>
		<div id="out_button"><a href="login.jsp" onMouseOver = "over1()" onMouseOut = "out1()"><img name = "image1" src="images/btn_cxdl.png" border="0" /></a></div>
      </div>
</center>
</form>
</body>
</html>
<script>
function over1(){
if(document.images)
document.image1.src = "images/btn_cxdl.png";
}
function out1(){
if(document.images)
document.image1.src = "images/btn_cxdl.png";
}
</script>
