<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>启动应急救援平台</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtilCheckbox.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<script type="text/javascript">
var sta;
$(document).ready(
 	function (){
 	onloadCombobox('${ctx}', 'sglx', $('#bigId_1'),null, null);
 	onloadCombobox('${ctx}', 'sglx', $('#big'),null, null);
 	$('#cm').tabs({  
	   border:false,  
	   onSelect:function(title){  
	       if(title == "未处理"){
	       	sta = 1;
	       }else if(title == "处理中"){
	       	sta = 2;
	       }else{
	       	sta = 3;
	       }
	       init(sta);
	   }  
	}); 
	
 	}
  ); 
  //初始化数据
  function init(state){
 	 grid = new Grid('${ctx}/platformRescue/platformRescueAction!list?platformRescue.state='+state, 'data_list_'+state);
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'platformRescue',
			moduleName:'事故',
			url:'${ctx}/platformRescue/platformRescueAction',
			afterViewLoadData: function(viewFormObject, data){
			   $("#addView").height($(window).height());
			    $("#addView").width($(window).width());
		 	}
		});
  }
  //页面显示（判断每个单元格内容字符长度是否大于25，大于部分用...省略）
   function gridFormatterLength(value, rowData, rowIndex) {
        	if(value==null || value == '' || value == 'undefined')
        		return '';
    		if(value.length > 15)
    			return value.substring(0, 15) + '...';
    		return value;
   }
//数据操作
function gridFormatter(value, rowData, rowIndex) {
	var rowId = rowData.id;
	var rowName=rowData.questionName;
	var url = "";
	<shiro:hasPermission name="48:view">
	url += "<a title=\"查看\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"${ctx}/images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	url += "<a title=\"修改\" onclick='crud.update(\""+rowId+"\");' class='btn2'><img src=\"${ctx}/images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	return url;
}
//数据操作
function gridFormatterSelect(value, rowData, rowIndex) {
	var rowId = rowData.id;
	var rowName=rowData.questionName;
	var url = "";
	<shiro:hasPermission name="48:view">
	url += "<a title=\"查看\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"${ctx}/images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	return url;
}
//数据操作

function gridFormatters(value, rowData, rowIndex) {
	var rowId = rowData.id;
	var rowName=rowData.questionName;
	var type=rowData.bigAccidentTypes;
	var url = "";
	<shiro:hasPermission name="48:view">
	url += "<a title=\"启动救援平台\"  onclick='par(\""+rowId+"\",\""+type+"\");' class='btn2'><img src=\"${ctx}/images/jypt.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	return url;
}
//已处理
function gridFormatterProcessed(value, rowData, rowIndex) {
	var rowId = rowData.id;
	var rowName=rowData.questionName;
	var type=rowData.bigAccidentTypes;
	var url = "";
	<shiro:hasPermission name="48:view">
	url += "<a title=\"启动救援平台\"  onclick='par(\""+rowId+"\",\""+type+"\");' class='btn2'><img src=\"${ctx}/images/jypt.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	url += "<a title=\"查看报告\"  onclick='publish(\""+rowId+"\");' class='btn2'><img src=\"${ctx}/images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	return url;
}
function par(id,type){
	window.parent.viewChildFunction("/ym/jsp/hazards/rescue/sendMessage.jsp?id="+id+"&type="+type,"事故通知");
}
function publish(rowid){
	parent.viewChildFunction('/ym/jsp/AccidentConclusion/accidentView.jsp?aid='+rowid,'事故总结');
}
//生成救援方案
function rescue(){
	window.parent.viewChildFunction('/ym/jsp/emergencyRescue/rescuePlan.jsp?cid='+types.cid+'&aid='+types.aid+'&type='+types.type+'&pid='+types.pid+'&beginTime='+types.beginTime,'救援方案');
}
</script>
</head>
<body>
<div style="margin-left: auto;margin-right: auto;">
   <div class="datagrid-toolbar" id = "tb" style="padding-left: 0px; height:10px;border: 1 solid #c8f2ff">
	 <div>
	        <form id="searchForm" method="post" style="display: inline;">
            <div style="margin-top:-8px;">
	&nbsp;&nbsp;事故类型:&nbsp;&nbsp;<input type="text" class="easyui-combobox" id="bigId_1" data-options="panelHeight:'auto',width:'100'" style="width: 100px;"name="platformRescue.bigAccidentTypes" />
	&nbsp;&nbsp;事故发生时间:&nbsp;&nbsp;<input type="text" name="platformRescue.accidentOfTime" class="easyui-my97 easyui-validatebox" data-options="readOnly:true" />&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search()">查询</a>
		&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch();">清空</a>
            </div>
	       </form>
	    </div>
   </div>
   <br/>
<div class="easyui-tabs" style="padding-left: 0px;height:400px;border: 1 solid #c8f2ff" id="cm">  
   <div id="1" title="未处理" style="padding:10px;" data-options="selected:true">  

	<div style="height:74%;">
	    <table id="data_list_1" style="display:none">
	        <thead>
	        <tr>
            <th align="center" field="bigText" width="150" formatter="gridFormatterLength" >事故类型</th>
            <th align="center" field="accidentOfTime" width="150" formatter="gridFormatterLength" >事故发生时间</th>
            <th align="center" field="alarm" width="150" formatter="gridFormatterLength" >接警人</th>
            <th align="center" field="alarmTel" width="150" formatter="gridFormatterLength" >接警时间</th>
            <th align="center" field="id" width="120" formatter="gridFormatter">接警信息</th>
            <th align="center" field="deathToll" width="120" formatter="gridFormatters">操作</th>         
	        </tr>
	        </thead>
	    </table>
	</div>
    </div>  
   <div id="2" title="处理中" style="padding:10px;">  
	<div style="height:74%;">
	    <table id="data_list_2" style="display:none">
	        <thead>
	        <tr>
            <th align="center" field="bigText" width="150" formatter="gridFormatterLength" >事故类型</th>
            <th align="center" field="accidentOfTime" width="150" formatter="gridFormatterLength" >事故发生时间</th>
            <th align="center" field="alarm" width="150" formatter="gridFormatterLength" >接警人</th>
            <th align="center" field="alarmTel" width="150" formatter="gridFormatterLength" >接警时间</th>
            <th align="center" field="id" width="120" formatter="gridFormatter">接警信息</th>
            <th align="center" field="deathToll" width="120" formatter="gridFormatters">操作</th>         
	        </tr>
	        </thead>
	    </table>
	</div>
    </div>  
    <div id="3" title="已处理" id="" style="padding:10px;" > 
	<div style="height:74%;">
	    <table id="data_list_3" style="display:none">
	        <thead>
	        <tr>
            <th align="center" field="bigText" width="150" formatter="gridFormatterLength" >事故类型</th>
            <th align="center" field="accidentOfTime" width="150" formatter="gridFormatterLength" >事故发生时间</th>
            <th align="center" field="alarm" width="150" formatter="gridFormatterLength" >接警人</th>
            <th align="center" field="alarmTel" width="150" formatter="gridFormatterLength" >接警时间</th>
            <th align="center" field="id" width="120" formatter="gridFormatterSelect">接警信息</th>
            <th align="center" field="deathToll" width="120" formatter="gridFormatterProcessed">操作</th>         
	        </tr>
	        </thead>
	    </table>
	</div>
</div> 
</div sty>	
	<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" 
			data-options="iconCls:'icon-save',modal:true,minimizable:true,maximizable:true,maximized:true,collapsible:true,draggable:false">    			
			<form method="post" >
				<input type="hidden" name="platformRescue.id"/>
			    <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
					<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
						<tr>
							<td class="table_nemu_new" width="15%">报警人</td>
							<td class="table_con" width="35%">
							<input type="text" class="easyui-validatebox" name="platformRescue.alarmPeople"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new" width="15%">报警人电话</td>
							<td class="table_con" width="35%">
							<input type="text" class="easyui-validatebox" name="platformRescue.alarmPeopleTel"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">事故类型</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" data-options="panelHeight:'auto',width:'100'" name="platformRescue.bigText" style="width: 100px" id="big"/>
							</td>
							<td class="table_nemu_new">事故发生时间</td>
							<td class="table_con">
							<input type="text" class="easyui-my97 easyui-validatebox" data-options="required:true,readOnly:true" name="platformRescue.accidentOfTime"/>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new" width="25%">事发地点</td>
							<td class="table_con" colspan="3">
							<textarea class="easyui-validatebox" name="platformRescue.accidentOfPlace"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'"></textarea>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">事故过程描述</td>
							<td colspan="3" class="table_con">
							<textarea class="easyui-validatebox" name="platformRescue.accidentDescription"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'"></textarea>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">接警人</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="platformRescue.alarm"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">接警时间</td>
							<td class="table_con">
							<input type="text" name="platformRescue.alarmTel" class="easyui-my97 easyui-validatebox" data-options="required:true,readOnly:true"  />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">灾难损失概要说明（对周边环境的影响）</td>
							<td colspan="3" class="table_con">
							<textarea class="easyui-validatebox" name="platformRescue.explain"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'"></textarea>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">死亡人数</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="platformRescue.deathToll"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">受伤人数</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="platformRescue.injuredToll"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">失踪人数</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="platformRescue.disappearToll"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">住院人数</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="platformRescue.hospitalToll"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
							<td class="table_nemu_new">被疏散人数</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="platformRescue.evacuatedToll"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new"></td>
							<td class="table_con">
							</td>
						</tr>
							
						<tr>
							<td class="table_nemu_new">疏散地点</td>
							<td colspan="3" class="table_con">
							<textarea class="easyui-validatebox" name="platformRescue.evacuptedPlace"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'"></textarea>
						</tr>
						
						<tr>
							<td class="table_nemu_new">目前状况</td>
							<td colspan="3" class="table_con">
							<textarea class="easyui-validatebox" name="platformRescue.situation"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'"></textarea>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">备注</td>
							<td colspan="3" class="table_con">
							<textarea class="easyui-validatebox" name="platformRescue.remarks"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'"></textarea>
							</td>
						</tr>
				</table>
				</div>
			</form>
		</div>
	</div>
	</div>
</body>
</html>