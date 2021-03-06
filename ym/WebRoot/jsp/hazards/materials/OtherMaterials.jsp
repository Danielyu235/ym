<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>自定义危险物质</title>

<link rel="stylesheet" type="text/css" href="${ctx}/css/bus.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/newCrud.css">
<script type="text/javascript" src="${ctx}/js/GridUtilNoToolBar.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript">
        var grid = null;
        var crud = null;
        
		$(document).ready(function () {
		     grid = new Grid($("title").html(), 'icon-edit',
		             '${ctx}/otherMaterials/otherMaterialsAction!list',
		             'data_list','#tb');
		     grid.loadGrid();
		     crud = new Crud(grid, $('#addForm'), $('#searchForm'),'otherMaterials','自定义危险物质'
		    		 ,'${ctx}/otherMaterials/otherMaterialsAction', {width:"900px",height:"200px"});
		});
        
        function gridFormatterLength(value, rowData, rowIndex) {
        	if(value==null || value == '' || value == 'undefined')
        		return '';
    		if(value.length > 25)
    			return value.substring(0, 25) + '...';
    		return value;
    	}

        function gridFormatter(value, rowData, rowIndex) {
        	var rowId = rowData.id;
        	var url = "";
        	url += "<input type='button' class='btn1' onclick='crud.update(\"" + rowId + "\");' value='修改'/>&nbsp;&nbsp;";
        	url += "<input type='button' class='btn1' onclick='crud.view(\"" + rowId + "\");' value='查看'/>&nbsp;&nbsp;";
        	return url;
        }
        
</script>
</head>
<body>
<div class="panel-header" style="width:100%;">
<div class="panel-title panel-with-icon">自定义危险物质</div>
<div class="panel-icon icon-edit"></div>
<div class="panel-tool"></div>
</div>
<div class="datagrid-toolbar" id ="tb" style="padding-left:0px;height:10px;">
<div>
	<form id="searchForm" style="display: inline;">
	<div style="margin-top:-8px;">
	&nbsp;&nbsp;物质名称:&nbsp;&nbsp;<input type="text" name="otherMaterials.name" />
	&nbsp;&nbsp;类型:&nbsp;&nbsp;<input type="text" name="otherMaterials.type" />
	&nbsp;&nbsp;危险性分类及说明:&nbsp;&nbsp;<input type="text" name="otherMaterials.description" />
	&nbsp;&nbsp;临界量:&nbsp;&nbsp;<input type="text" name="otherMaterials.thresholdQuantity" />
	
	&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search()">查询</a>
	&nbsp;&nbsp;
	<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch()">清空</a>
	</div>
	</form>
</div>
</div>
<div class="search_add">
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add', plain:true" onclick="crud.add()">新增</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-delete', plain:true" onclick="crud.remove()">删除</a>
</div>

<div style="height: 500px">
    <table id="data_list" loadMsg="正在努力拉取数据中..." fit="true" fitColumns="true">
        <thead>
        <tr>
			
            <th align="center" field="name" width="150" >物质名称</th>
            <th align="center" field="type" width="150" >类型</th>
            <th align="center" field="description" width="150" >危险性分类及说明</th>
            <th align="center" field="thresholdQuantity" width="150" >临界量</th>
            <th field="id" width="120" formatter="gridFormatter">操作</th>         
        </tr>
        </thead>
    </table>
</div>

	<!-- 添加更新窗口 -->
	<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 200px;" 
			data-options="iconCls:'icon-save',modal:true,
    			minimizable:true,maximizable:true,collapsible:true,draggable:false">
		<form method="post">
			<input type="hidden" name="materials.id"/>
			<div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea">
						<tr>
							<td class="table_nemu">物质名称:</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="otherMaterials.name"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu">类型:</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="otherMaterials.type"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu">危险性分类及说明:</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="otherMaterials.description"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu">临界量:</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="otherMaterials.thresholdQuantity"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
				</table>
			</div>
		</form>
		</div>
	</div>
</body>
</html>