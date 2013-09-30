<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>采煤系统</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
</head>
<body style="text-align:center;">
	<!-- 添加更新窗口 -->
	<div style="width: 60%;margin: 0 auto;">
	 <SCRIPT LANGUAGE="JavaScript">   
		var maxtime = 1200 //一个小时，按秒计算，自己调整!   
		function CountDown(){   
		if(maxtime>=0){   
		minutes = Math.floor(maxtime/60);   
		seconds = Math.floor(maxtime%60);   
		msg = "距离结束还有"+minutes+"分"+seconds+"秒";   
		document.all["timer"].innerHTML=msg;   
		if(maxtime == 5*60) alert('注意，还有5分钟!');   
		--maxtime;   
		}   
		else{   
		clearInterval(timer);   
		alert("时间到，结束!");   
		}   
		}   
		timer = setInterval("CountDown()",1000);     
	</SCRIPT>   

		<form method="post" >
	     <input type="hidden" name="coalMiningSysTheme.id"/>
		    <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
					 <tr>
									<td class="table_nemu_news"><div id="timer" style="color:red;width:150px;"></div></td>
							</tr>
					  <tr>
								<td class="table_nemu_news" style="text-align: center;">
								<div style="font-size: 14px"> 2013年机电科定期培训考核</div>
	                    <div style="font-size: 14px">试卷说明 </div>
	                    <div style="font-size: 14px">
	                        <table cellspacing="0" cellpadding="0" border="0">
	                            <tbody>
	                                <tr>
	                                    <td style="font-size: 14px">卷面总分：<strong>20</strong> 分 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                                    </td>
	                                    <td style="font-size: 14px">合格分数：<strong>15</strong> 分&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                                    </td>
	                                    <td style="font-size: 14px">最高分数：<strong>20</strong> 分&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td style="font-size: 14px">参考人数：<strong>12362</strong>人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                                    </td>
	                                    <td style="font-size: 14px">答题时间：<strong>20</strong>分钟&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td style="font-size: 14px">
	                                        <span class="left">试题星级：</span><span class="xx">★</span><span class="xx">★</span><span class="xx">★</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                                    </td>
	                                    <td style="font-size: 14px">试卷来源：阳煤集团&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                                    </td>
	                                    <td style="font-size: 14px">试卷年份：2013年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                                    </td>
	                                </tr>
	                            </tbody>
	                        </table>
	                    </div>
	                </td>
						</tr>
					  <tr>
								<td class="table_nemu_news">判断题【每题5分】</td>
						</tr>
						<tr>
							<td class="table_nemu_news">1．坚持“管理、装备、培训”三并重，是我国煤矿安全生产的基本原则。（）</td>
						</tr>
						<tr>
							<td class="table_con"><input type="radio" name="1" onclick="fn('正确')"/>正确</td>
						</tr>
						<tr>
							<td class="table_con"><input type="radio" name="1" onclick="fn('错误')"/>错误</td>
						</tr>
						<script>
							function fn(value){
								$("#dd").val(value);
							}
						</script>
						<tr>
							<td class="table_con">我的答案：<input type="text" style="border:0;color: blue;" id="dd"/></td>
						</tr>
						 <tr>
								<td class="table_nemu_news">单选题【每题5分】</td>
						</tr>
						<tr>
							<td class="table_nemu_news">1．在生产活动中，为消除能导致人身伤亡或造成设备、财产破坏以及危害环境的因素而制定的具体技术要求和实施程序的统一规定是指（）。</td>
						</tr>
						<tr>
							<td class="table_con"><input type="radio" name="2"/>A．安全法规</td>
						</tr>
						<tr>
							<td class="table_con"><input type="radio" name="2"/>B．安全操作规程</td>
						</tr>
						<tr>
							<td class="table_con"><input type="radio" name="2"/>C．规章制度</td>
						</tr>
						<tr>
							<td class="table_con">我的答案：<input type="text" style="border:0" id="dd34"/></td>
						</tr>
						<tr>
							<td class="table_nemu_news">2．井下爆炸材料库房距井筒、井底车场、主要运输巷道、主要硐室以及影响全矿井或大部分采区通风的风门的法线距离：硐室式不得小于（）m，壁槽式不得小于60m。</td>
						</tr>
						<tr>
							<td class="table_con"><input type="radio" name="11"/>A．80</td>
						</tr>
						<tr>
							<td class="table_con"><input type="radio" name="11"/>B．100</td>
						</tr>
						<tr>
							<td class="table_con"><input type="radio" name="11"/>C．120</td>
						</tr>
						<tr>
							<td class="table_con">我的答案：<input type="text" style="border:0" id="dd23"/></td>
						</tr>
						 <tr>
								<td class="table_nemu_news">多选题【每题5分】</td>
						</tr>
						<tr>
							<td class="table_nemu_news">1．人的位应教育从业人负，按照劳动保护用品的使用规则和防护要求正确使用劳动保护用品，使职工做到（）。</td>
						</tr>
						<tr>
							<td class="table_con"><input type="checkbox" name="3"/>A．会检查劳动保护用品的可靠性</td>
						</tr>
						<tr>
							<td class="table_con"><input type="checkbox" name="4"/>B．会正确使用劳动保护用品</td>
						</tr>
						<tr>
							<td class="table_con"><input type="checkbox" name="5"/>C．会正确维护保养劳动保护用品</td>
						</tr>
						<tr>
							<td class="table_con"><input type="checkbox" name="6"/>D．会正确维护保养劳动保护用品</td>
						</tr>
						<tr>
							<td class="table_con">我的答案：<input type="text" style="border:0;color: blue;" id="dd12" /></td>
						</tr>
				</table>
			</div>
			<br/>
		        <div align="center" >
		            <a href="#" class="easyui-linkbutton" icon="icon-ok" onclick="updateSubmitForm();return false;">结束作答</a>
		            <a href="#" class="easyui-linkbutton" icon="icon-cancel" onclick="closeAllWin();return false;">取消</a>
		        </div>
		</form>
		</div>
</body>
</html>