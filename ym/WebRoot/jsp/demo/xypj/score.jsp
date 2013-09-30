<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>安全信誉评价</title>
<style>
 body{ background:url(score_bg.jpg) repeat-x;}
</style>
<script type="text/javascript">
$(document).ready(
 	function (){
	   $('#addWinJ').window({
	                width:900,
	                height:500,
	                modal:true,
	                draggable:false,
	                closed:true,
	                onOpen:function(){
	                $(".window-mask").css("height","100%");
	                }
	    });
	    $('#addWinR').window({
	                width:900,
	                height:500,
	                modal:true,
	                draggable:false,
	                closed:true,
	                onOpen:function(){
	                $(".window-mask").css("height","100%");
	                }
	    });
	     $('#addWinK').window({
	                width:900,
	                height:500,
	                modal:true,
	                draggable:false,
	                closed:true,
	                onOpen:function(){
	                $(".window-mask").css("height","100%");
	                }
	    });
	    });
	    </script>
</head>

<body>
<center>
 <img src="score.jpg" border="0" usemap="#Map" />
 <map name="Map" id="Map">
   <area shape="poly" coords="404,259,546,430,685,261,670,254,646,247,616,240,574,237,534,236,481,240" href="/ym/jsp/demo/coo.html?/editor/do/view/id/166352/cid/47608/kid/1616/ad/0"/>
   <area shape="poly" coords="327,478,546,475,439,613,420,605,391,587,365,570,338,531,327,502" href="#" onclick="fu('j')" />
   <area shape="poly" coords="547,490,644,611,604,624,568,629,537,629,505,624,474,619,448,612" href="#"onclick="fu('r')" />
   <area shape="poly" coords="713,290,732,306,754,329,768,347,778,366,785,383,792,407,794,429,794,447,791,464,786,486,780,503,768,524,752,546,743,558,728,571,709,585,692,595,678,601,554,448"  href="#"onclick="fu('k')" />
   <area shape="poly" coords="545,460,298,459,300,430,307,407,317,391,325,378,339,362,356,345,369,334,390,321,406,313,424,307"  href="#"onclick="fu('k')" />
 </map>
</center>
<script>
	function fu(value){
	if(value == 'j')
	 $('#addWinJ').window('open');
	 if(value == 'r')
     $('#addWinR').window('open');
     if(value == 'k')
     $('#addWinK').window('open');
      if(value == 'c')
     $('#addWinC').window('open');
	}
	//关闭窗体
 function closeAllWin() {
    $('#addWinJ').window('close');
    $('#addWinR').window('close');
    $('#addWinK').window('close');
    $('#addWinC').window('close');
}
</script>
<div style="display:none">
<div id="addWinJ"  style="width: 60%;margin: 0 auto;padding-top: 100px" title="查看人员职业健康信息">
	 <SCRIPT LANGUAGE="JavaScript">   
	</SCRIPT>   
		<form method="post" >
		    <div style="padding: 10px 20px 10px 20px;" align="center">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
				      <tr>
				                <td class="table_nemu_news">员工工号</td>
								<td class="table_nemu_news" colspan="2">ymcjb001</td>
								
				      </tr>
				      <tr>
				                <td class="table_nemu_news">员工姓名</td>
								<td class="table_nemu_news" colspan="2">李四</td>
								
				      </tr>
				      <tr>
				                <td class="table_nemu_news">所在岗位</td>
								<td class="table_nemu_news" colspan="2">采掘部</td>
								
				      </tr>
				      <tr>
				                <td class="table_nemu_news">安全信誉评价</td>
								<td class="table_nemu_news">得分  70</td>
								<td class="table_nemu_news">扣分  30</td>
				      </tr>
					  <tr>
								<td class="table_nemu_news">人员职业健康</td>
								<td class="table_nemu_news">得分  10</td>
								<td class="table_nemu_news">扣分  0</td>

					  </tr>

				</table>
			</div>
		</form>
		<div align="center" >
		            <a href="javascript:history.go(-1)" class="easyui-linkbutton" icon="icon-cancel" onclick="closeAllWin();return false;">返回</a>
		        </div>
		</div>
</div>
<div style="display:none">
<div id="addWinR"  style="width: 60%;margin: 0 auto;padding-top: 100px" title="查看人员日常状态信息">
	 <SCRIPT LANGUAGE="JavaScript">   
	</SCRIPT>   
		<form method="post" >
		    <div style="padding: 10px 20px 10px 20px;" align="center">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
				      <tr>
				                <td class="table_nemu_news">员工工号</td>
								<td class="table_nemu_news" colspan="2">ymcjb001</td>
								
				      </tr>
				      <tr>
				                <td class="table_nemu_news">员工姓名</td>
								<td class="table_nemu_news" colspan="2">李四</td>
								
				      </tr>
				      <tr>
				                <td class="table_nemu_news">所在岗位</td>
								<td class="table_nemu_news" colspan="2">采掘部</td>
								
				      </tr>
				      <tr>
				                <td class="table_nemu_news">安全信誉评价</td>
								<td class="table_nemu_news">得分  70</td>
								<td class="table_nemu_news">扣分  30</td>
				      </tr>
					  <tr>
								<td class="table_nemu_news">人员职业健康</td>
								<td class="table_nemu_news">得分  10</td>
								<td class="table_nemu_news">扣分  0</td>

					  </tr>

				</table>
			</div>
		</form>
		<div align="center" >
		            <a href="javascript:history.go(-1)" class="easyui-linkbutton" icon="icon-cancel" onclick="closeAllWin();return false;">返回</a>
		        </div>
		</div>
</div>

<div style="display:none">
<div id="addWinK"  style="width: 60%;margin: 0 auto;padding-top: 100px" title="查看人员日常考勤与奖罚信息">
	 <SCRIPT LANGUAGE="JavaScript">   
	</SCRIPT>   
		<form method="post" >
		    <div style="padding: 10px 20px 10px 20px;" align="center">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
				      <tr>
				                <td class="table_nemu_news">员工工号</td>
								<td class="table_nemu_news" colspan="2">ymcjb001</td>
								
				      </tr>
				      <tr>
				                <td class="table_nemu_news">员工姓名</td>
								<td class="table_nemu_news" colspan="2">李四</td>
								
				      </tr>
				      <tr>
				                <td class="table_nemu_news">所在岗位</td>
								<td class="table_nemu_news" colspan="2">采掘部</td>
								
				      </tr>
				      <tr>
				                <td class="table_nemu_news">安全信誉评价</td>
								<td class="table_nemu_news">得分  70</td>
								<td class="table_nemu_news">扣分  30</td>
				      </tr>
					  <tr>
								<td class="table_nemu_news">人员日常考勤与奖罚</td>
								<td class="table_nemu_news">得分  20</td>
								<td class="table_nemu_news">扣分  0</td>

					  </tr>

				</table>
			</div>
		</form>
		<div align="center" >
		            <a href="javascript:history.go(-1)" class="easyui-linkbutton" icon="icon-cancel" onclick="closeAllWin();return false;">返回</a>
		        </div>
		</div>
</div>

<div style="display:none">
<div id="addWinC"  style="width: 60%;margin: 0 auto;padding-top: 100px" title="查看日常三违惩罚信息">
	 <SCRIPT LANGUAGE="JavaScript">   
	</SCRIPT>   
		<form method="post" >
		    <div style="padding: 10px 20px 10px 20px;" align="center">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
				      <tr>
				                <td class="table_nemu_news">员工工号</td>
								<td class="table_nemu_news" colspan="2">ymcjb001</td>
								
				      </tr>
				      <tr>
				                <td class="table_nemu_news">员工姓名</td>
								<td class="table_nemu_news" colspan="2">李四</td>
								
				      </tr>
				      <tr>
				                <td class="table_nemu_news">所在岗位</td>
								<td class="table_nemu_news" colspan="2">采掘部</td>
								
				      </tr>
				      <tr>
				                <td class="table_nemu_news">安全信誉评价</td>
								<td class="table_nemu_news">得分  70</td>
								<td class="table_nemu_news">扣分  30</td>
				      </tr>
					  <tr>
								<td class="table_nemu_news">日常三违惩罚</td>
								<td class="table_nemu_news">得分  30</td>
								<td class="table_nemu_news">扣分  0</td>

					  </tr>

				</table>
			</div>
		</form>
		<div align="center" >
		            <a href="javascript:history.go(-1)" class="easyui-linkbutton" icon="icon-cancel" onclick="closeAllWin();return false;">返回</a>
		        </div>
		</div>
</div>
</body>
</html>
