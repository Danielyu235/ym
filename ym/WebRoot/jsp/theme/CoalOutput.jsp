<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>原煤产量</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>

<script type="text/javascript">
$(document).ready(
 	function (){
 		onloadCombobox('${ctx}','dwdz',$('#unit'),null,null);//加载添加，修改页面combobox数据
 		onloadCombobox('${ctx}','dwdz',$('#group'),null,null);//加载添加，修改页面combobox数据
 		grid = new Grid('${ctx}/coalOutput/coalOutputAction!list', 'data_list');
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'coalOutput',
			moduleName:'原煤产量',
			url:'${ctx}/coalOutput/coalOutputAction',
			afterViewLoadData:function(viewFormObject, data) {
				$(viewFormObject).find('span[name="coalOutput.unitGroup"]').text(data.unitGroupText);
			}
		});
 	}
  ); 
   //页面显示（判断每个单元格内容字符长度是否大于25，大于部分用...省略）
   function gridFormatterLength(value, rowData, rowIndex) {
        	if(value==null || value == '' || value == 'undefined')
        		return '';
    		if(value.length > 25)
    			return value.substring(0, 25) + '...';
    		return value;
    	}
//数据操作
function gridFormatter(value, rowData, rowIndex) {
	var rowId = rowData.id;
	var rowName=rowData.questionName;
	var url = "";
	<shiro:hasPermission name="48:view">
	url += "<a title=\"查看\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"../../images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	<shiro:hasPermission name="48:update">
	url += "<a title=\"修改\" onclick='crud.update(\""+rowId+"\");' class='btn2'><img src=\"../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	return url;
}
</script>
</head>
<body>
<div class="panel-header" style="width:100%;">
		<div class="panel-title panel-with-icon">机电系统列表</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
	 <div>
	        <form id="searchForm" method="post" style="display: inline;">
            <div style="margin-top:-8px;">
	&nbsp;&nbsp;单位队组:&nbsp;&nbsp;<input type="text" class="easyui-combobox" name="coalOutput.unitGroup" data-options="panelHeight:'auto',width:'100'" id="group" />
	&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search()">查询</a>
		&nbsp;&nbsp;
	<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch();">清空</a>
            </div>
	        </form>
	    </div>
        </div>
        <div class="search_add">
		<shiro:hasPermission name="48:add">
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add', plain:true" onclick="crud.add();">添加</a>
		</shiro:hasPermission>
		<shiro:hasPermission name="48:delete">		
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove', plain:true" onclick="crud.remove();">删除</a>
		</shiro:hasPermission>
        </div>

<!-- 表单表头 -->
	<div style="height:74%;">
	    <table id="data_list" style="display:none">
	        <thead>
	        <tr>
            <th align="center" field="unitGroupText" width="150" formatter="gridFormatterLength" >单位队组</th>
            <th align="center" field="monthPlan" width="150" formatter="gridFormatterLength" >时间</th>
            <th align="center" field="dailyPlan" width="150" formatter="gridFormatterLength" >日计划</th>
            <th align="center" field="dailyOutput" width="150" formatter="gridFormatterLength" >日产量</th>
            <th align="center" field="dailyExceedLoss" width="150" formatter="gridFormatterLength" >日超亏</th>
            <th align="center" field="monthCumulatePlan" width="150" formatter="gridFormatterLength" >月累计划</th>
            <th align="center" field="monthCumulateOutput" width="150" formatter="gridFormatterLength" >月累产量</th>
            <th align="center" field="monthCumulateExceedLoss" width="150" formatter="gridFormatterLength" >月累超亏</th>
            <th align="center" field="yearCumulatePlan" width="150" formatter="gridFormatterLength" >年累计划</th>
            <th align="center" field="yearCumulateOutput" width="150" formatter="gridFormatterLength" >年累产量</th>
            <th align="center" field="yearCumulateExceedLoss" width="150" formatter="gridFormatterLength" >年累超亏</th>
            <th align="center" field="id" width="120" formatter="gridFormatter">操作</th>         
    	        </tr>
	        </thead>
	    </table>
	</div>

<!-- 添加更新窗口 -->
	<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" 
			data-options="iconCls:'icon-save',modal:true,
    			minimizable:true,maximizable:true,collapsible:true,draggable:false">
		<form method="post" >
			<input type="hidden" name="coalOutput.id"/>
			 <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
						<tr>
							<td class="table_nemu_new">单位队组</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="coalOutput.unitGroup" data-options="panelHeight:'auto',width:'100',required: true" id="unit"/>
							</td>
						
							<td class="table_nemu_new">时间</td>
							<td class="table_con">
							<input type="text" class="easyui-my97 easyui-validatebox" data-options="required:true,readOnly:true" name="coalOutput.monthPlan"/>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">日计划</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="coalOutput.dailyPlan"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">日产量</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="coalOutput.dailyOutput"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">日超亏</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="coalOutput.dailyExceedLoss"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">月累计划</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="coalOutput.monthCumulatePlan"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">月累产量</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="coalOutput.monthCumulateOutput"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">月累超亏</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="coalOutput.monthCumulateExceedLoss"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">年累计划</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="coalOutput.yearCumulatePlan"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">年累产量</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="coalOutput.yearCumulateOutput"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">年累超亏</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="coalOutput.yearCumulateExceedLoss"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new"></td>
							<td class="table_con">
							</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
	
	<div style="display: none;">
		<div id="viewForm" style="width: 960px; height: 500px;">
			
		</div>
	</div>
	
</body>
</html>