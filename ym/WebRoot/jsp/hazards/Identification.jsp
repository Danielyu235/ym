<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>危险源</title>

<link rel="stylesheet" type="text/css" href="${ctx}/css/bus.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/newCrud.css">
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript">
		$(document).ready(function () {
		     grid = new Grid('${ctx}/hazards/hazardsAction!list',
		             'data_list');
		     grid.datagrid({
		    	 onRowContextMenu:function(e, rowIndex, rowData) {
		    		 $('#data_list').datagrid('unselectAll');
		    		 $('#data_list').datagrid('selectRow', rowIndex);
		    		 e.preventDefault();
		    		 $('#mm').menu('show', { 
                         left: e.pageX, 
                         top: e.pageY
                     });
		    	 }
		     });
		     grid.loadGrid();
		     crud = new Crud({
					grid:grid, 
					addFormObject:$('#addForm'), 
					searchFormObject:$('#searchForm'),
					entityName:'hazards',
					moduleName:'危险源',
					url:'${ctx}/hazards/hazardsAction',
					dialogCss:{width:'900px',height:'250px'}
				});
		});
        
        function gridFormatterLength(value, rowData, rowIndex) {
        	if(value==null || value == '' || value == 'undefined')
        		return '';
    		if(value.length > 25)
    			return value.substring(0, 25) + '...';
    		return value;
    	}

        function hazardsFormatter(value, rowData, rowIndex) {
        	//var v = '<span style="width:100%,height:100%;background-color: gray;">' + value + '</span>';
        	return value;
        }
        function gridFormatter(value, rowData, rowIndex) {
        	var rowId = rowData.id;
        	var url = "";
        	url += "<a title=\"查看\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"../../images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
        	return url;
        }
        
	function isMajor(flag) {
		var isMajor = 'yes';
		if(!flag) {
			isMajor = 'no';
		}
		var rows = grid.getSelectNodes();
		if (rows.length == 0) {
			$.messager.show({
				title : '提示',
				msg : '请选择要设置的危险源',
				timeout : 2000,
				showType : 'slide'
			});
			return;

		} else {
			var ids = [];
			var i = 0;
			for (i = 0; i < rows.length; i++) {
				ids.push(rows[i].id);
			}
			$.ajax({
				type: 'POST',
				url : '${ctx}/hazards/hazardsAction!updateIsMajor?ids=' + ids + '&isMajor=' + isMajor,
				success : function(data) {
					var data = eval('(' + data + ')');
					if (data.operateSuccess) {
						$.messager.show({
							title : '成功',
							msg : data.operateMessage,
							timeout : 2000,
							showType : 'slide'
						});
					} else {
						$.messager.show({
							title : '失败',
							msg : data.operateMessage,
							timeout : 2000,
							showType : 'slide'
						});
					}
					grid.reloadGrid();
				}
			});
		}
	}
	function identification() {
		var rows = grid.getSelectNodes();
		if (rows.length == 0) {
			$.messager.show({
				title : '提示',
				msg : '请选择要辨识的危险源',
				timeout : 2000,
				showType : 'slide'
			});
			return;

		} else {
			var ids = [];
			var types = [];
			var i = 0;
			for (i = 0; i < rows.length; i++) {
				ids.push(rows[i].id);
				types.push(rows[i].nameSpace);
			}
			$.ajax({
				type: 'POST',
				url : '${ctx}/hazards/hazardsAction!identification?ids=' + ids + '&types=' + types,
				success : function(data) {
					var data = eval('(' + data + ')');
					if (data.operateSuccess) {
						$.messager.show({
							title : '成功',
							msg : data.operateMessage,
							timeout : 2000,
							showType : 'slide'
						});
					} else {
						$.messager.show({
							title : '失败',
							msg : data.operateMessage,
							timeout : 2000,
							showType : 'slide'
						});
					}
					grid.reloadGrid();
				}
			});
		}
	}
</script>
</head>
<body>
<div class="panel-header" style="width:100%;">
<div class="panel-title panel-with-icon">危险源信息列表</div>
<div class="panel-icon icon-edit"></div>
<div class="panel-tool"></div>
</div>
<div class="datagrid-toolbar" id ="tb" style="padding-left:0px;height:10px;">
<div>
	<form id="searchForm" style="display: inline;">
	<div style="margin-top:-8px;">
	&nbsp;&nbsp;所属单位:&nbsp;&nbsp;<input type="text" name="hazards.corpName" />
	&nbsp;&nbsp;危险源名称:&nbsp;&nbsp;<input type="text" name="hazards.name" />
	&nbsp;&nbsp;危险源类型:&nbsp;&nbsp;<input type="text" name="hazards.type"  class="easyui-combobox" 
		data-options="valueField:'v', textField:'v', data:[{v:'锅炉'},{v:'贮罐区'},{v:'压力容器'},
			{v:'压力管道'},{v:'生产场所'},{v:'库区'},{v:'煤矿'},{v:'尾矿库'},{v:'金属非金属地下矿山'}],editable:false" panelHeight="auto"/>
	&nbsp;&nbsp;辨识状态:&nbsp;&nbsp;<input type="text" name="hazards.info"  class="easyui-combobox" 
		data-options="valueField:'v', textField:'v', data:[{v:'未辨识'},{v:'重大危险源'},{v:'非重大危险源'},
			{v:'辨识失败'}],editable:false" panelHeight="auto"/>
	&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search()">查询</a>
	&nbsp;&nbsp;
	<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch()">清空</a>
	</div>
	</form>
</div>
</div>
<div class="search_add">
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add', plain:true" onclick="identification()">批量辨识</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save', plain:true" onclick="isMajor(true)">设置为重大危险源</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save', plain:true" onclick="isMajor(false)">设置为非重大危险源</a>
</div>

<div style="height:74%;">
    <table id="data_list" loadMsg="正在努力拉取数据中..." fit="true" fitColumns="true">
        <thead>
        <tr>
            <th align="center" field="corpName" width="150" formatter="gridFormatterLength" >所属单位</th>
            <th align="center" field="name" width="150" formatter="gridFormatterLength" >危险源名称</th>
            <th align="center" field="type" width="150" formatter="gridFormatterLength" >危险源类型</th>
            
            <th align="center" field="info" width="150" formatter="hazardsFormatter" >危险源辨识</th>
            <th align="center" field="id" width="120" formatter="gridFormatter">操作</th>         
        </tr>
        </thead>
    </table>
</div>
<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" 
			data-options="iconCls:'icon-save',modal:true,
    			minimizable:true,maximizable:true,collapsible:true,draggable:false">
		<form method="post">
			<input type="hidden" name="collieryHazards.id"/>
			<input type="hidden" class="easyui-validatebox" name="collieryHazards.dwdm"/>
			<div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
						<tr>
							<td class="table_nemu_new" width="25%">所属单位:</td>
							<td class="table_con" colspan="3">
							<input type="text" class="easyui-validatebox" name="hazards.corpName"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new" width="25%">危险源名称:</td>
							<td class="table_con" width="25%">
							<input type="text" class="easyui-validatebox" name="hazards.name"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new" width="25%">危险源类型:</td>
							<td class="table_con" width="25%">
							<input type="text" class="easyui-validatebox" name="hazards.type"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">辨识状态:</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="hazards.info"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new">辨识原因:</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="hazards.reason"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
				</table>
			</div>
		</form>
		</div>
	</div>
	<div id="mm" class="easyui-menu" style="width:150px;">
		<div onclick="identification()">自动辨识</div>
		<div class="menu-sep"></div>
		<div data-options="name:'save',iconCls:'icon-save'" onclick="isMajor(true)">设置为重大危险源</div>
		<div data-options="name:'print',iconCls:'icon-save'" onclick="isMajor(false)">设置为非重大危险源</div>
	</div>
</body>
</html>