<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/jqueryhead.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>安全生产标准</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<script type="text/javascript">
	//页面初始化各窗体
	$(document).ready(
			function() {
				onloadCombobox('${ctx}', 'bzlx', $('#seaBzType'), null, null);
				onloadCombobox('${ctx}', 'bzlx', $('#updBzType'), null, null);
				grid = new Grid('${ctx}/criterion/criterionAction!pageList', 'data_list');
				grid.loadGrid();
				crud = new Crud({
				grid:grid, 
				addFormObject:$('#addForm'), 
				searchFormObject:$('#searchForm'),
				entityName:'criterion',
				moduleName:'安全生产标准列表',
				url:'${ctx}/criterion/criterionAction',
				afterViewLoadData:function(viewFormObject, data) {
				$(viewFormObject).find('span[name="criterion.bzType"]').text(data.bzTypeId);
				}
				});
			}
		);

	//工具栏按钮
	function gridFormatter(value, rowData, rowIndex) {
		var rowId = rowData.id;
		var url = "";
	url += "<a title=\"查看\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"../../../../images/select.png\"></img></a>&nbsp;&nbsp;&nbsp;&nbsp;";

	url += "<a title=\"修改\" onclick='crud.update(\""+rowId+"\");' class='btn2'><img src=\"../../../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	url += "<a title=\"查看附件\"  onclick='window.open(\"${ctx}/jsp/sys/fileUpload/uploadFile.jsp?relationId="+ rowId + "\")'  class='btn2'><img src=\"../../../../images/selectAttachment.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
		return url;
	}
</script>
</head>
<body>
	<div class="panel-header" style="width: 100%;">
		<div class="panel-title panel-with-icon">安全生产标准</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
	<div>
			<form id="searchForm" method="post" style="display: inline;">
            <div style=" margin-top:-8px;">
				&nbsp;&nbsp;标准名称:&nbsp;&nbsp;<input class="easyui-validatebox"
					id="seaBzName" name="criterion.bzName"
					data-options="validType:'length[1,25]'">
				&nbsp;&nbsp;标准类型:&nbsp;&nbsp;<input class="easyui-validatebox"
					id="seaBzType" name="criterion.bzType"
					data-options="panelHeight:'auto'"> &nbsp;&nbsp;<a
					href="javascript:void(0)" class="easyui-linkbutton"
					iconCls="icon-search" onclick="crud.search();">查询</a> &nbsp;&nbsp;<a
					href="javascript:void(0);" class="easyui-linkbutton"
					iconCls="icon-clear" onclick="crud.clearSearch();">清空</a>
                    </div>
			</form>
        </div>
		</div>
        <div class="search_add">
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

	<div style="height: 74%;">
		<table id="data_list" style="display: none">
			<thead>
				<tr>
					<!-- easyUI field的值要和对象Person属性对应 -->
					<th field="bzName" width="30%" title="标准名称" align="center">标准名称</th>
					<th field="bzTypeId" width="20%" title="标准类型" align="center">标准类型</th>
					<th field="promDepartment" width="20%" title="颁布部门" align="center">颁布部门</th>
					<th field="publishTime" width="15%" title="颁布日期" align="center">颁布日期</th>
					<th field="effectiveTime" width="15%" title="生效日期" align="center">生效日期</th>
					<th field="text" width="25%" title=颁布地区 formatter="gridFormatter"
						align="center">操作</th>
				</tr>
			</thead>
		</table>
	</div>
	<!-- 更新窗口 -->
	<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" 
			data-options="iconCls:'icon-save',modal:true,
    			minimizable:true,maximizable:true,collapsible:true,draggable:false">
		<form method="post" >
    	<input type="hidden" name="criterion.id" id="updId" />
	  <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
					<tr>
					<td class="table_nemu_new">标准名称</td>
						<td class="table_con" colspan="3"><input style="width: 230px"
							class="easyui-validatebox" id="updBzName" name="criterion.bzName"
							data-options="required: true,panelHeight:'auto'"
							missingMessage="请输入标准名称" /></td>
					</tr>
					<tr>
							<td class="table_nemu_new" width="25%">标准编号</td>
						<td class="table_con"><input class="easyui-validatebox"
							type="text" id="updBzNum" name="criterion.bzNum"
							data-options="required: true" missingMessage="请输入标准编号" /></td>
							<td class="table_nemu_new">标准类别</td>
						<td class="table_con"><input id="updBzType" name="criterion.bzType" data-options="required: true,editable:false"
							missingMessage="请输入标准类别" /></td>
					</tr>
					<tr>
						<td class="table_nemu_new">发布日期</td>
						<td class="table_con"><input style="width: 155px" value=" "
							class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" id="updPublishTime"
							name="criterion.publishTime"/></td>
							<td class="table_nemu_new">实施日期</td>
						<td class="table_con"><input style="width: 155px" value=" "
							class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" id="updImplementTime"
							name="criterion.implementTime" /></td>
					</tr>
					<tr>
						<td class="table_nemu_new">生效日期</td>
						<td class="table_con"><input style="width: 155px" id="updEffectiveTime"
							name="criterion.effectiveTime" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
							<td class="table_nemu_new">颁布部门</td>
						<td class="table_con"><input style="width: 155px"
							class="easyui-validatebox" id="updPromDepartment"
							name="criterion.promDepartment" data-options="required: true"
							missingMessage="请输入颁布部门" /></td>
							
					</tr>
					<tr>
						<td class="table_nemu_new">标准内容</td>
						<td class="table_con" colspan="3"><textarea
								style="width: 400px; height: 60px" class="easyui-validatebox"
								id="updContent" name="criterion.content"
								data-options="required: true" missingMessage="请输入标准内容" /></textarea></td>
					</tr>
				</table>
				</div>
			</form>
		</div>
	</div>
	<div style="display: none;">
	<div id="excelWin" iconCls="icon-save" title="上传Excel文件">
		<form name="excelForm" method="post" enctype="multipart/form-data"
			action="${ctx}/user/userAction!imp"
			style="padding: 10px 20px 10px 20px;" target="excelFrame">
			上传Excel文件<input type="file" name="excelFile" id="excelFile" /> <input
				type="submit" value="上传" />
		</form>
		<iframe id="excelFrame" name="excelFrame" frameborder="0" width="100%"
			height="100"></iframe>
	</div>
	</div>
	<form name="printForm" method="post" action="${ctx}/common/print.jsp"
		target="_blank">
		<input type="hidden" name="printContent" id="printContent" />
	</form>
</body>
</html>