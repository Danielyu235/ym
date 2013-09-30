<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/jqueryhead.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>安全生产法规</title>

<script type="text/javascript" src="${ctx}/js/tree/Tree.js"></script>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<% 
	String prom_area = request.getParameter("prom_area");
 %>
<script type="text/javascript">
	//页面初始化各窗体
	$(document).ready(
			function() {
				onloadCombobox('${ctx}', 'fglx', $('#seaFgType'), null, null);
				onloadCombobox('${ctx}', 'fglx', $('#updFgType'), null, null);
				onloadCombobox('${ctx}','bbdq',$('#updlawPromArea'),null,null);
				grid = new Grid('${ctx}/law/lawAction!pageList.action?law.promArea=<%=prom_area%>', 'data_list');
				grid.loadGrid();
				crud = new Crud({
					grid:grid, 
					addFormObject:$('#addForm'), 
					searchFormObject:$('#searchForm'),
					entityName:'law',
					moduleName:'安全生产法规',
					url:'${ctx}/law/lawAction',
					afterViewLoadData:function(viewFormObject, data) {
					$(viewFormObject).find('span[name="law.fgType"]').text(data.fgTypeId);
					$(viewFormObject).find('span[name="law.promArea"]').text(data.promAreaId);
					}
				});
			});

	
	//工具栏按钮
	function gridFormatter(value, rowData, rowIndex) {
		var rowId = rowData.id;
		var url = "";
		url += "<a title=\"查看\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img align='absmiddle' src=\"../../../../images/select.png\"></img></a>&nbsp;&nbsp;&nbsp;&nbsp;";
		url += "<a title=\"修改\" onclick='crud.update(\""+rowId+"\");' class='btn2'><img align='absmiddle' src=\"../../../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
		url += "<a title=\"查看附件\"  onclick='window.open(\"${ctx}/jsp/sys/fileUpload/uploadFile.jsp?relationId="
				+ rowId + "\")' class='btn2' ><img align='absmiddle' src=\"../../../../images/selectAttachment.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
		return url;
	}

</script>
</head>
<body>

	<div class="panel-header" style="width: 100%;">
		<div class="panel-title panel-with-icon">安全生产法规</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
	<div>
			<form id="searchForm" method="post" style="display: inline;">
            <div style="margin-top:-8px;">
				&nbsp;&nbsp;法规名称:&nbsp;&nbsp;<input class="easyui-validatebox"
					id="seaFgName" name="law.fgName"
					data-options="validType:'length[1,25]'">
				&nbsp;&nbsp;法规类别:&nbsp;&nbsp;<input class="easyui-validatebox"
					id="seaFgType" name="law.fgType"
					data-options="panelHeight:'auto',editable:false">
				&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton"
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
	<div style="height: 72%;">
		<table id="data_list" style="display: none">
			<thead>
				<tr>
					<th field="fgName" width="30%" title="法规名称" align="center">法规名称</th>
					<th field="fgTypeId" width="15%" title="法规类型" align="center">法规类型</th>
					<th field="promDepartment" width="15%" title="颁布部门" align="center">颁布部门</th>
					<th field="promAreaId" width="10%" title="颁布地区" align="center">颁布地区</th>
					<th field="publishTime" width="15%" title="颁布日期" align="center">颁布日期</th>
					<th field="effectiveTime" width="15%" title="生效日期" align="center">生效日期</th>
					<th field="text" width="25%" title=操作 formatter="gridFormatter" align="center">操作</th>
				</tr>
			</thead>
		</table>
	</div>
<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" 
			data-options="iconCls:'icon-save',modal:true,
    			minimizable:true,maximizable:true,collapsible:true,draggable:false">
		<form method="post" >
    	<input type="hidden" name="law.id" id="updId" />
	  <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
					<tr>
						<td class="table_nemu_new" width="25%">法规编号</td>
						<td class="table_con"><input class="easyui-validatebox"
							type="text" id="updFgNum" name="law.fgNum"
							data-options="required: true" missingMessage="请输入法规编号" /></td>
							<td class="table_nemu_new">法规名称</td>
						<td class="table_con"><input style="width: 230px"
							class="easyui-validatebox" id="updFgName" name="law.fgName"
							data-options="panelHeight:'auto',required: true,editable:false" missingMessage="请输入法规名称" /></td>
					</tr>
					<tr>
						<td class="table_nemu_new">法规类别</td>
						<td class="table_con"><input id="updFgType" name="law.fgType"
							data-options="required: true,panelHeight:'auto',editable:false"
							missingMessage="请输入法规类别" /></td>
							<td class="table_nemu_new">发布日期</td>
						<td class="table_con"><input style="width: 155px" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" class="Wdate" id="updPublishTime"
							name="law.publishTime" data-options="required: true"
							missingMessage="请输入发布日期" /></td>
							
					</tr>
					<tr>
						<td class="table_nemu_new">实施日期</td>
						<td class="table_con"><input style="width: 155px" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" class="Wdate" id="updImplementTime"
							name="law.implementTime" data-options="required: true"
							missingMessage="请输入实施日期" /></td>
							<td class="table_nemu_new">生效日期</td>
						<td class="table_con"><input style="width: 155px" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" class="Wdate" id="updEffectiveTime"
							name="law.effectiveTime" data-options="required: true"
							missingMessage="请输入生效日期" /></td>
					</tr>
					<tr>
						<td class="table_nemu_new">颁布部门</td>
						<td class="table_con"><input style="width: 155px"
							class="easyui-validatebox" id="updPromDepartment"
							name="law.promDepartment" data-options="required: true"
							missingMessage="请输入颁布部门" /></td>
							<td class="table_nemu_new">颁布地区</td>
						<td class="table_con"><input style="width: 155px" id="updlawPromArea" name="law.promArea"
							data-options="panelHeight:'auto',required: true,editable:false" missingMessage="请输入颁布地区" /></td>
					</tr>
					<tr>
						<td class="table_nemu_new">法规内容</td>
						<td class="table_con" colspan="3"><textarea
								style="width:400px; height: 60px" class="easyui-validatebox"
								id="updContent" name="law.content" data-options="required: true"
								missingMessage="请输入法规内容" /></textarea></td>
					</tr>
				</table>
				</div>
			</form>
		</div>
	</div>
</body>
</html>

