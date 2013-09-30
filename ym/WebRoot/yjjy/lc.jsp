<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>应急救援</title>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<link href="css/liucheng.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
</script>
</head>
<body style="overflow-y: hidden">
   <div id="top">
 <!-- <iframe name="weather_inc" src="http://tianqi.xixik.com/cframe/2" width="410" height="70" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe> -->

      <table class="top_right" cellpadding="0" cellspacing="0">
      <tr>
      <td><a href=""><img src="images/rydw.jpg" /></a></td>
      <td><a href=""><img src="images/ygkq.jpg" /></a></td>
      <td><a href=""><img src="images/qtxt.jpg" /></a></td>
      </tr>
      </table>
   </div>
   <div id="middle">
   <center>
   <table class="middle">
    <tr>
    <td><a href="javascript:viewChildFunction('/ym/jsp/hazards/rescue/retreat.jsp','是否停产撤人');"><img id="sgjj" src="images/sgjj.png" /></a></td>
    <td><a href="javascript:viewChildFunction('/ym/jsp/hazards/rescue/platformRescueState.jsp','事故处理状态');"><img src="images/clzt.png" /></a></td>
    <td><img id="yjzs" src="images/yjzs.png" /></td>
    </tr>
    <tr>
    <td><img id="jyfa" src="images/jyfa.png" /></td>
    <td><img id="jcjb" src="images/jcjb.png" /></td>
    <td><img id="ztpg" src="images/ztpg.png" /></td>
    </tr>
   </table>
   </center>
   </div>
   <script type="text/javascript">
   $(document).ready(function (){
	   });
		function viewChildFunction(src,tit) {
			$('#childFrame').attr('src', src);
			$('#viewChildForm').dialog({
				title:tit,
				modal:true,
				width: 1200,  
				height:600
			});
		}
		function closeView(){
			$('#viewChildForm').dialog('close');
		}
	</script>
	<div style="display: none;">
		<div id="viewChildForm" style="width: 960px; height: 400px;" data-options="iconCls:'icon-save'">
			<iframe frameborder="0" id="childFrame" width="100%" height="98%" scrolling-x="no"></iframe>
		</div>
	</div>
</body>
</html>
