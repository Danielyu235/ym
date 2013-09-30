<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/jqueryhead.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>典型事故案例</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<script type="text/javascript">

	$(function() {
		onloadCombobox('${ctx}', 'sgallx', $('#seaCaseType'), null,
				null);
		onloadCombobox('${ctx}', 'sgallx', $('#addCaseType'), null,
				null);
		grid = new Grid('${ctx}/accidentCase/accidentCaseAction!pageList', 'data_list');
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'accidentCase',
			moduleName:'典型事故案例',
			url:'${ctx}/accidentCase/accidentCaseAction',
			afterViewLoadData:function(viewFormObject, data) {
				$(viewFormObject).find('span[name="accidentCase.caseType"]').text(data.caseTypeId);
			}
		});
	});

	//工具栏按钮
	function gridFormatter(value, rowData, rowIndex) {
		var rowId = rowData.id;
		var url = "";
		<shiro:hasPermission name="48:view">
	url+= "<a title=\"查看\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"../../../../images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;"
	</shiro:hasPermission>
	<shiro:hasPermission name="48:update">
	url+="<a title=\"修改\" onclick='crud.update(\""+rowId+"\");'  class='btn2'><img src=\"../../../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;"
	</shiro:hasPermission>
		return url;
	}
</script>
</head>
<body>

	<div class="panel-header" style="width: 100%;">
		<div class="panel-title panel-with-icon">典型事故案例</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	<div class="datagrid-toolbar" id="tb" style="padding-left: 0px;">
	<div>
			<form id="searchForm" method="post" style="display: inline;">
				&nbsp;&nbsp;事故名称:&nbsp;&nbsp;<input class="easyui-validatebox"
					id="seaCaseTitle" name="accidentCase.caseTitle"
					data-options="validType:'length[1,25]'">
				&nbsp;&nbsp;事故类型:&nbsp;&nbsp;<input class="easyui-validatebox"
					id="seaCaseType" name="accidentCase.caseType"
					data-options="panelHeight:'auto',editable:false">
				&nbsp;&nbsp;涉及行业:&nbsp;&nbsp;<input class="easyui-validatebox"
					id="seaCaseTrade" name="accidentCase.caseTrade"
					data-options="validType:'length[1,25]'"> &nbsp;&nbsp;<a
					href="javascript:void(0)" class="easyui-linkbutton"
					iconCls="icon-search" onclick="searchForm();">查询</a> &nbsp;&nbsp;<a
					href="javascript:void(0);" class="easyui-linkbutton"
					iconCls="icon-clear" onclick="clearSearchForm();">清空</a>
			</form>
		</div>
		<shiro:hasPermission name="48:add">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-add', plain:true"
				onclick="crud.add();">添加</a>
		</shiro:hasPermission>
		<shiro:hasPermission name="48:delete">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-remove', plain:true"
				onclick="crud.remove();">删除</a>
		</shiro:hasPermission>
		
	</div>

	<div style="height: 78%;">
		<table id="data_list" style="display: none">
			<thead>
				<tr>
					<!-- easyUI field的值要和对象Person属性对应 -->
					<th field="caseTitle" width="30%" title="事故名称" align="center">事故名称</th>
					<th field="caseTypeId" width="20%" title="事故类型" align="center">事故类型</th>
					<th field="caseTrade" width="20%" title="涉及行业" align="center">涉及行业</th>
					<th field="caseTime" width="15%" title="发生日期" align="center">发生日期</th>
					<th field="model" width="15%" title="事故模型" align="center">事故模型</th>
					<th field="text" width="15%" title=操作 formatter="gridFormatter"
						align="center">操作</th>
				</tr>
			</thead>
		</table>
	</div>

	<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" 
			data-options="iconCls:'icon-save',modal:true,
    			minimizable:true,maximizable:true,collapsible:true,draggable:false">
		<form method="post" >
				<input type="hidden" name="accidentCase.id"/>
				<div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
					<tr>
						<td class="table_nemu_new" width="25%">事故名称</td>
						<td class="table_con" colspan="3"><input style="width: 500px"
							class="easyui-validatebox" type="text" id="addCaseTitle"
							name="accidentCase.caseTitle" data-options="required: true"
							 /></td>
					</tr>
					<tr>
						<td class="table_nemu_new" width="25%">事故地点</td>
						<td class="table_con" colspan="3"><input style="width: 500px"
							class="easyui-validatebox" type="text" id="addCaseAddress"
							name="accidentCase.caseAddress" data-options="required: true"
							 /></td>
					</tr>
					<tr>
						<td class="table_nemu_new" width="25%">事故类型</td>
						<td class="table_con" width="25%">
						<input type="text" id="addCaseType" name="accidentCase.caseType"
							data-options="required: true,panelHeight:'auto'"
							 /></td>
						<td class="table_nemu_new" width="25%">发生日期</td>
						<td class="table_con" colspan="1" width="25%">
						<input onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" class="Wdate" id="addCaseTime"
							name="accidentCase.caseTime"
							 /></td>
					</tr>
					<tr>
						<td class="table_nemu_new">涉及行业</td>
						<td class="table_con"><input class="easyui-validatebox"
							type="text" id="addCaseTrade" name="accidentCase.caseTrade"
							data-options="required: false"  /></td>
						<td class="table_nemu_new">事故模型</td>
						<td class="table_con"><input class="easyui-validatebox"
							type="text" id="addModel" name="accidentCase.model"
							data-options="required: false"  /></td>
					</tr>
					<tr height="90">
						<td class="table_nemu_new">事故起因</td>
						<td class="table_con" colspan="3"><textarea
								style="width: 80%; height: 80px" class="easyui-validatebox"
								id="addCaseCause" name="accidentCase.caseCause"
								data-options="required: false"  /></textarea></td>
					</tr>
					<tr height="90">
						<td class="table_nemu_new">预防措施</td>
						<td class="table_con" colspan="3"><textarea
								style="width: 80%; height: 80px" class="easyui-validatebox"
								id="addPrecaution" name="accidentCase.precaution"
								data-options="required: false" /></textarea></td>
					</tr>
				</table>
				</div>
			</form>
		</div>
	</div>

</body>
</html>