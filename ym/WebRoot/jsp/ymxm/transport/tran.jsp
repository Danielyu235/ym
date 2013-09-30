<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>运输系统数据入口</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<script type="text/javascript">
	//页面初始化各窗体
	$(document).ready(
		function() {
			onloadCombobox('${ctx}', 'ssgzm', $('#searchWorkFace'), null, null);
			onloadCombobox('${ctx}', 'ssgzm', $('#updateWorkFace'), null, null);
			grid = new Grid('${ctx}/tran/tranAction!list', 'data_list');
			grid.loadGrid();
			crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'tran',
			moduleName:'运输系统主题',
			url:'${ctx}/tran/tranAction',
			afterViewLoadData:function(viewFormObject, data) {
				$(viewFormObject).find('span[name="tran.workFace"]').text(data.workFaceByName);
			}
			});
		}
	);

	//工具栏按钮
	function gridFormatter(value, rowData, rowIndex) {
		var rowId = rowData.id;
		var url = "";
		url += "<a title=\"查看\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"${ctx}/images/select.png\"></img></a>&nbsp;&nbsp;&nbsp;&nbsp;";
		url += "<a title=\"修改\" onclick='crud.update(\""+rowId+"\");' class='btn2'><img src=\"${ctx}/images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
		return url;
	}
</script>
</head>
<body>
<div id="tb">
	<div class="panel-header" style="width: 100%;">
		<div class="panel-title panel-with-icon">运输系统主题</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
	<div>
		<form id="searchForm" method="post" style="display: inline;">
           <div style=" margin-top:-8px;">
				&nbsp;&nbsp;工作面:&nbsp;&nbsp;<input type="text" id="searchWorkFace" name="tran.workFace" />
				&nbsp;&nbsp;统计时间:&nbsp;&nbsp;
				<input type="text" name="tran.statisticalTime" class="easyui-my97 easyui-validatebox" data-options="readOnly:true,dateFmt:'yyyy-MM'"/>
				&nbsp;&nbsp;无故障运行天数:&nbsp;&nbsp;<input type="text" name="tran.turns" />
				&nbsp;&nbsp;
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search();">查询</a> &nbsp;&nbsp;
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
		<div style="text-align: center;font-size: 28px;"><span id="ys" style="color:red;"></span></div>
	</div>


<div style="height: 450px">
    <table id="data_list" loadMsg="正在努力拉取数据中..." fit="true" fitColumns="true">
        <thead>
        <tr>
            <th align="center" field="workFaceByName" width="150">工作面</th>
            <th align="center" field="statisticalTime" width="150">统计时间</th>
            <th align="center" field="turns" width="150">无故障运行天数</th>
            <th align="center" field="id" width="120" formatter="gridFormatter">操作</th>         
        </tr>
        </thead>
    </table>
</div>

<!-- 更新窗口 -->
<div style="display: none;">
	<div id="addForm" style="width: 900px; height: 450px;" data-options="iconCls:'icon-save',modal:true,minimizable:true,maximizable:true,collapsible:true,draggable:false">
	<form method="post" >
   	<input type="hidden" name="tran.id"/>
	  <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;" cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
					<tr>
						<td class="table_nemu_new">工作面:</td>
						<td class="table_con">
						<input type="text" class="easyui-validatebox" id="updateWorkFace" name="tran.workFace" data-options="validType:'maxByteLength[100]'" />
						</td>
					
						<td class="table_nemu_new">统计时间:</td>
						<td class="table_con">
						<input type="text" name="tran.statisticalTime" class="easyui-my97 easyui-validatebox" data-options="readOnly:true,dateFmt:'yyyy-MM'"/>
						</td>
					</tr>
					
					<tr>
						<td class="table_nemu_new">无故障运行天数:</td>
						<td class="table_con" colspan="3">
						<input type="text" class="easyui-validatebox" name="tran.turns" data-options="validType:'maxByteLength[100]'" />
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