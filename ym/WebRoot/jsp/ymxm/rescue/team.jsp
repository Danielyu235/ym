<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="gb2312" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>救援队伍</title>
		<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
		<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
		<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
		<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
		<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<script type="text/javascript">
$(document).ready(
 	function (){
 		onloadCombobox('${ctx}','dwlx',$('#updTeamtype'),null,null);
 		onloadCombobox('${ctx}','dwlx',$('#serTeamtype'),null,null);
 		grid = new Grid('${ctx}/rescueTeam/rescueTeamAction!list', 'data_list');
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'rescueTeam',
			moduleName:'救援队伍',
			url:'${ctx}/rescueTeam/rescueTeamAction',
			afterViewLoadData:function(viewFormObject, data) {
				$(viewFormObject).find('span[name="rescueTeam.teamtype"]').text(data.teamtypeCode);
			}
			
		});
 	}
 	 
  ); 
//加载表单操作列
function gridFormatter(value, rowData, rowIndex) {
	var rowId = rowData.id;
	var url = "";
	<shiro:hasPermission name="48:view">
	url += "<a title=\"查看\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"../../../images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	<shiro:hasPermission name="48:update">
	url += "<a title=\"修改\" onclick='crud.update(\""+rowId+"\");' class='btn2'><img src=\"../../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	if(rowData.hasMap == '1') { //已定位
		url += "<a title=\"定位\" onclick='window.top.gis.showPoint(\""+rowData.id+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.teamname +"\");' class='btn2' ><img src=\"${ctx}/images/showPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	} else {
		url += "<a title=\"打点\" onclick='window.top.gis.addPoint(\""+rowData.id+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.teamname +"\");' class='btn2' ><img src=\"${ctx}/images/addPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	}
	return url;
}
</script>
</head>
<body>

  <div class="panel-header" style="width:100%;">
	<div class="panel-title panel-with-icon">救援队伍</div>
	<div class="panel-icon icon-edit"></div>
	<div class="panel-tool"></div>
</div>

<div class="datagrid-toolbar" id = "tb" style="padding-left: 0px; height:10px;">
<div>
        <form id="searchForm" method="post" style="display: inline;">
        <div style="margin-top:-8px">
        &nbsp;&nbsp;队伍名称:&nbsp;&nbsp;<input class="easyui-validatebox"  name="rescueTeam.teamname">
        &nbsp;&nbsp;队伍类型:&nbsp;&nbsp;<input class="easyui-validatebox"  name="rescueTeam.teamtype" id="serTeamtype" data-options="panelHeight:'auto',editable:false"></td>
        &nbsp;&nbsp;负责人:&nbsp;&nbsp;<input class="easyui-validatebox"    name="rescueTeam.headOf" >
        &nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search();">查询</a>
		&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch();">清空</a>
        </div>
        </form>
</div>
</div>
<div  class="search_add">
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
            <th field="teamname" width="200" align="center" title="teamname">队伍名称</th>
            <th field="teamtypeCode" width="150" align="center" title="teamtypeCode">队伍类型</th>
            <th field="persons" width="100" align="center" title="persons">人员数量</th>
            <th field="headOf" width="100" align="center" title="headOf">负责人</th>
            <th field="headOfTel" width="150" align="center" title="headOfTel">负责人电话</th>
            <th field="headOfPhone" width="150" align="center" title="headOfPhone">负责人手机</th>
            <th align="center" field="id" width="120" formatter="gridFormatter">操作</th>     
        </tr>
        </thead>
    </table>
</div>
<!-- 修改窗口 -->
<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" 
			data-options="iconCls:'icon-save',modal:true,
    			minimizable:true,maximizable:true,collapsible:true,draggable:false">
		<form method="post" >
    <input type="hidden" id="updateId" name="rescueTeam.id"/>
	    <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
	   		<tr>
				<td class="table_nemu_new" width="25%">队伍名称</td>
				<td class="table_con"  width="25%"><input class="easyui-validatebox" type="text"  id="addTeamname" name="rescueTeam.teamname" data-options="required: true" missingMessage="请输入队伍名称"/></td>
				<td class="table_nemu_new"  width="25%">队伍类型</td>
				<td class="table_con"  width="25%"><input  class="easyui-combobox" type="text" id="updTeamtype" name="rescueTeam.teamtype" data-options="required: true,panelHeight:'auto',editable:false" missingMessage="请选择队伍类型"/></td>
			</tr>
			<tr>
				<td class="table_nemu_new">地址</td>
				<td class="table_con"><input class="easyui-validatebox" type="text"  id="addAddress" name="rescueTeam.address" /></td>
				<td class="table_nemu_new">人员</td>
				<td class="table_con"><input  type="text" id="addPersons" name="rescueTeam.persons" /></td>
			</tr>
			<tr>
				<td class="table_nemu_new">负责人</td>
				<td class="table_con"><input class="easyui-validatebox" type="text" id="addFcrq" name="rescueTeam.headOf" data-options="required: true" missingMessage="请输入负责人"/></td>
				<td class="table_nemu_new">负责人电话</td>
				<td class="table_con"><input class="easyui-validatebox"   type="text" id="addTcrq" name="rescueTeam.headOfTel" data-options="required: true" missingMessage="请输入负责人电话"/></td>
			</tr>
				<tr>
				<td class="table_nemu_new">负责人手机</td>
				<td class="table_con" ><input class="easyui-validatebox"   name="rescueTeam.headOfPhone" data-options="required: true" missingMessage="请输入负责人手机"/></td>
				<td class="table_nemu_new">联系人</td>
				<td class="table_con" ><input   name="rescueTeam.contact"  /></td>
			</tr>
            <tr>
				<td class="table_nemu_new">联系人电话</td>
				<td class="table_con" ><input   name="rescueTeam.contactTel"  /></td>
				<td class="table_nemu_new">联系人手机</td>
				<td class="table_con" ><input   name="rescueTeam.contactPhone" /></td>
			</tr>
			<tr>
	            <td class="table_nemu_new">所属单位</td>
	            <td class="table_con"><input name="rescueTeam.affiliation"  type="text" ></td>
	            <td class="table_nemu_new">所属部门</td>
	            <td  class="table_con" ><input name="rescueTeam.departments"  type="text" ></td>
	       </tr>
	       <tr>
	            <td class="table_nemu_new" width="25%">队伍情况介绍</td>
	            <td class="table_con" colspan="3" ><textarea rows="3" cols="70" name="rescueTeam.teamBriefing" ></textarea></td>
	       </tr>
		</table>
	        </div> 
   	</form>
</div>
</div>
</body>
</html>