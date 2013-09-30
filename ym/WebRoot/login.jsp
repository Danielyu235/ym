<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.ay.framework.shiro.SystemParameter" %>
<%@ include file="/common/taglibs.jsp" %>
<%
	String jquery_path = request.getContextPath();
	String jquery_basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ jquery_path + "/";
	String login_authcode_switch = SystemParameter.getLogin_authcode_switch();
	request.setAttribute("login_authcode_switch", login_authcode_switch);
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>阳煤集团“两化融合”项目系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="<%=jquery_basePath%>resources/js/jquery/easyui-1.3/themes/cupertino/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=jquery_basePath%>resources/js/jquery/easyui-1.3/themes/icon.css">
<script type="text/javascript" src="<%=jquery_basePath%>resources/js/jquery/jquery-1.7.2.js"></script>
<link href="css/login.css" type=text/css rel=stylesheet>
<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/s3Slider.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=jquery_basePath%>resources/js/jquery/easyui-1.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=jquery_basePath%>resources/js/jquery/easyui-1.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">

//验证密码长度
	$.extend($.fn.validatebox.defaults.rules, {  
	    minLength: {  
	        validator: function(value, param){  
	            return value.length >= param[0];  
	        },  
	        message: '密码长度不能小于8位.'  
	    }  
	});  

	$(document).ready(
	  function() { 
		  $('#slider').s3Slider({
			  timeOut:5000
			 });
		 if ($.browser.msie){ 
			 /**
			 if ($.browser.version == "6.0"){		   
			   $("#login").html("");		  
			   $("#login").css("backgroundImage","url(templets/login_images/bg_browerupdate1.png)"); 
			   $("#login").css("width","711px");
			   $("#login").css("height","315px");
			   $("#login").append("<div style='margin-left:185px;margin-top:140px;'><ul style=' list-style:none;'><li style='float:left;margin-right:5px;'><input type='button' onclick='browerUpdate()' style='background:url(templets/login_images/btn_yes.png) no-repeat;width:40px;height:22px;display:block;border:0; cursor:hand;' /></li> <li><input type='button' onclick='window_close()' style='background:url(templets/login_images/btn_no.png) no-repeat;width:40px;height:22px;display:block;border:0; cursor:hand;' /></li> </ul></div>");
			   return;
			 }
			 */
			 if(parseInt($.browser.version) < 8) {
				 $.messager.alert('警告','您的IE版本太低，请升级IE版本!<br/><a target="_blank" href="http://download.microsoft.com/download/1/6/1/16174D37-73C1-4F76-A305-902E9D32BAC9/IE8-WindowsXP-x86-CHS.exe">点此升级</a>'
						 ,'info', function() {
				 });
			 }
		 } else {
			 //$.messager.alert('警告','推荐使用IE浏览器!','info');
		 }
 	});
 /**
 function browerUpdate(){
 	window.location.href="http://windows.microsoft.com/zh-CN/internet-explorer/products/ie/home";
 }
 function window_close(){
 	var info = window.confirm("您确定不升级IE版本吗?确定，您访问的页面!");
 	if(info){
 	  window.close();
 	}else{
 	  return;
 	}
 	
 }
 */
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
</script>
<style>
.easyui-validatebox{height:36px;
	 border:0;
	 line-height:30px;
	 *+line-height:36px;
	 padding-left:43px;background:none;}
</style>
</head>

<body onload="MM_preloadImages('images/index_zc_h.png','images/index_button_h.png')">
<form name="loginForm" method="post" action="login!login.action"  onKeyDown= "javascript:Enter()">
<input name="SkinType" value="2" type="hidden"> 
 <center>
   <div id="top"><img src="images/index_top.png" width="793" height="85" />
   </div>
   <div id="middle">
   <div id="slider" style="left:0px; top:30px; right:0px;">
 <ul id="sliderContent">
  <li class="sliderImage">
   <img src="images/01.jpg" width="900" height="370" alt="安元科技">
   <span class="bottom">欢迎使用阳煤集团“两化融合”项目系统。</span>
  </li>
  <li class="sliderImage">
   <img src="images/02.jpg" width="900" height="370" alt="安元科技">
   <span class="bottom">阳泉煤业（集团）有限责任公司前身为阳泉矿务局，为山西省五大煤炭集团之一，是全国最大的无烟煤生产基地。</span>
  </li>
  <li class="sliderImage">
   <img src="images/03.jpg" width="900" height="370" alt="安元科技">
   <span class="bottom"> 阳煤集团在六十多年发展征程中，已经书写了彪炳日月的壮丽历史，也锻造出了永续基业的强大物质基础和无形资产。</span>
  </li>
   </li>
  <li class="sliderImage">
   <img src="images/04.jpg" width="900" height="370" alt="安元科技">
   <span class="bottom">阳煤集团有足够的信心、能力和力量，展现更加气势恢宏的进取态势，高起点、高水平建设安全阳煤、百年阳煤、和谐阳煤！</span>
  </li>
  <div class="clear sliderImage"></div>
 </ul>
</div>
   <!--denglu-->
    <div id="content">
      <table width="720" align="center" >
      <tr>
      <td colspan="2" class="t_item">用户名&nbsp;:</td>
      <td width="270" align="left">
		  <div id="zfDiv">
	<input id="username" name="username" value="admin" class="easyui-validatebox" data-options="required: true" missingMessage="请输入帐号"  />
    <input id="username1" name="username1" value="jdk002" type="hidden" />    
          </div>
       </td>
       <td class="td_jz" width="110">
	  <input name="member" type="checkbox" class="cb" value="记住密码"/><span class="jzmm">记住密码</span>
	  </td>
      <td width="170"></td>
      </tr>
      <tr>
	 <td colspan="2" class="t_item">密&nbsp;码&nbsp;:</td>
	 <td align="left">
     <div id="zfzc">
      <input id="password" name="password" value="11111111" type="password" class="easyui-validatebox" data-options="required: true, validType:'minLength[8]'" missingMessage="请输入登录 密码" />
      <input id="password1" name="password1" value="11111111" type="hidden"  />
     </div>
     </td>
     <td>
		<a href="#" onClick="form_sub();"><img src="images/index_button.png" id="Image2" onmouseover="MM_swapImage('Image2','','images/index_button_h.png',1)" onmouseout="MM_swapImgRestore()"/></a>
	</td>
	<td>  
	 <a href="#" onClick="login();"><img src="images/index_button1.png"/></a>
    </td>
    <!-- <td width="170"> <a href="register.jsp"><img src="images/index_zc.png" id="Image1" onmouseover="MM_swapImage('Image1','','images/index_zc_h.png',1)" onmouseout="MM_swapImgRestore()" ></a>
		</td> -->
    </tr>
</table>
      </div>
   </div>
   <div id="foot"></div>
  </center>
</form>
<script>
function form_sub(){
 	var username = document.loginForm.username.value;
	var password = document.loginForm.password.value;
	var validCode='';
	if(document.loginForm.validCode)
		validCode = document.loginForm.validCode.value; 
 	if($("#username").validatebox("isValid")&&$("#password").validatebox("isValid")){
		$.ajax({
			url:"login!login.action",
			type:"post",
			data:"username="+username+"&password="+password+"&validCode="+validCode,
			success:function(ret){
				if(ret instanceof Object){
					if(!ret.operateSuccess){
						$.messager.show({
                            title:'失败',
                            msg:ret.operateMessage,
                            timeout:2000,
                            showType:'slide'
                        });
						changeCode(document.getElementById("validCodeImg"));
					}
				}else{
					document.loginForm.submit();
				}
			}
		});
	} 	

}
function login(){
 	var username = document.loginForm.username1.value;
	var password = document.loginForm.password1.value;
	var validCode='';
	if(document.loginForm.validCode)
		validCode = document.loginForm.validCode.value; 
 	if($("#username").validatebox("isValid")&&$("#password").validatebox("isValid")){
		$.ajax({
			url:"login!login.action",
			type:"post",
			data:"username="+username+"&password="+password+"&validCode="+validCode,
			success:function(ret){
				if(ret instanceof Object){
					if(!ret.operateSuccess){
						$.messager.show({
                            title:'失败',
                            msg:ret.operateMessage,
                            timeout:2000,
                            showType:'slide'
                        });
						changeCode(document.getElementById("validCodeImg"));
					}
				}else{
					document.loginForm.submit();
				}
			}
		});
	} 	

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
</body>
</html>