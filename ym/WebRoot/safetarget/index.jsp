<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<style>
body{ background:#a5ebff}
a{ border:none;}
img{ border:none}
.safe_box{ background:#4181f5 url(images/safeimg.png) no-repeat 20px center; border:none; width:260px; height:100px; display:block; margin-left:100px}
.safe_box:hover{ background:#1961e4 url(images/safeimg.png) no-repeat 20px center;}
.tree_box{ background:#2997cb url(images/tree.png) no-repeat 20px center; border:none; width:260px; height:100px;display:block}
.tree_box:hover{ background:#047cb5 url(images/tree.png) no-repeat 20px center;}
span{ display:block; padding:15px 0 0 85px}
table{ margin-top:100px; vertical-align:middle; text-align:center;}
.lir_bar{ width:600px; margin:50px 0 0 -80px; padding:30px 0px 20px 30px; border:2px #0690d0 dashed; clear:both;height:100px; background:#47d4fd;-moz-border-radius:6px 6px 6px 6px;-webkit-border-radius:6px 6px 6px 6px;border-radius:6px 6px 6px 6px;}
.li_one{background:#efa126;width:200px;height:60px;line-height:60px;padding-left:10px;font-family:SimHei;font-size:25px;font-weight:bold;font-style:normal;text-decoration:none;color:#fff; float:left; display:block}
.li_one:hover{ background:#ec6b02}
.left{ width:300px; float:left}
.right{ width:300px; float:right;}
.li_two{background:#ef5454;width:200px;height:60px;line-height:60px;padding-left:10px;font-family:SimHei;font-size:25px;font-weight:bold;font-style:normal;text-decoration:none;color:#fff; display:block}
.li_two:hover{ background:#f44141}
</style>
<script type="text/javascript">
function HideWeekMonth()
{
    $("#lir_bar").hide();
}
function change(){
	 $("#lir_bar").toggle('slow');
}
</script>
</head>

<body onLoad="HideWeekMonth()">
<center>
<table width="900px">
<tr>
<td width="450px" height="150px">
<a href="" class="safe_box"><span><img src="images/safe.png"></span></a>
</td>
<td width="450px"  height="150px">
<a href="javascript:change();"  class="tree_box"><span><img src="images/adtree.png"></span></a>
</td>
</tr>
</table>
  <div class="lir_bar" id="lir_bar">
   <div class="left">
   <div ><a href="select.jsp"  target="_blank" class="li_one">煤矿瓦斯事故树</a></div>
   </div>
   <div class="right">
   <div><a href="fire.jsp" target="_blank" class="li_two">煤矿火灾事故树</a></div>
   </div>
  </div>
</center>
</body>
</html>
