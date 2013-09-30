<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="gb2312" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>医疗保障</title>

<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<script type="text/javascript">
$(document).ready(
 	function (){
 		grid = new Grid('${ctx}/rescueMedical/rescueMedicalAction!list', 'data_list');
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'rescueMedical',
			moduleName:'医疗保障',
			url:'${ctx}/rescueMedical/rescueMedicalAction',
			afterViewLoadData:function(viewFormObject, data) {
				$(viewFormObject).find('span[name="rescueMedical.yljglb"]').text(data.yljglbtext);
			}
			
		});
 		onloadCombobox('${ctx}','yljglb',$('#updYljglb'),null,null);
 		onloadCombobox('${ctx}','yljglb',$('#serYljglb'),null,null);
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
	url += "<a title=\"修改\" onclick='crud.update(\""+rowId+"\");' class='btn2' ><img src=\"../../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	if(rowData.hasMap == '1') { //已定位
		url += "<a title=\"定位\" onclick='window.top.gis.showPoint(\""+rowData.id+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.jgmc +"\");' class='btn2' ><img src=\"${ctx}/images/showPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	} else {
		url += "<a title=\"打点\" onclick='window.top.gis.addPoint(\""+rowData.id+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.jgmc +"\");' class='btn2' ><img src=\"${ctx}/images/addPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	}
	return url;
}
</script>
</head>
<body>

  <div class="panel-header" style="width:100%;">
	<div class="panel-title panel-with-icon">医疗保障</div>
	<div class="panel-icon icon-edit"></div>
	<div class="panel-tool"></div>
</div>

<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
	 <div id="search">
        <form id="searchForm" method="post" style="display: inline;">
           <div style="margin-top:-8px">
        &nbsp;&nbsp;机构名称:&nbsp;&nbsp;<input class="easyui-validatebox"  name="rescueMedical.jgmc" >
        &nbsp;&nbsp;医疗机构类别:&nbsp;&nbsp;<input id="serYljglb" class="easyui-validatebox" name="rescueMedical.yljglb" >
        &nbsp;&nbsp;医疗机构等级:&nbsp;&nbsp;<input class="easyui-validatebox"  name="rescueMedical.yljgdj" >
        &nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search();">查询</a>
		&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch();">清空</a>
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
            <th field="jgmc" width="150" align="center" title="jgmc">机构名称</th>
            <th field="syzxs" width="150" align="center" title="syzxs">所有制形式</th>
            <th field="yljglbtext" width="150" align="center" title="yljglbtext">医疗机构类别</th>
            <th field="yljgdj" width="150" align="center" title="yljgdj">医疗机构等级</th>
            <th field="jhry" width="150" align="center" title="jhry">救护人员</th>
            <th field="jhcl" width="150" align="center" title="jhcl">救护车辆</th>
            <th align="center" field="id" width="160" align="center" formatter="gridFormatter">操作</th>     
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
    <input type="hidden" id="updateId" name="rescueMedical.id"/>
	  <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
	   		<tr>
    			<td class="table_nemu_new" width="25%">机构名称</td><td class="table_con"  width="25%"><input class="easyui-validatebox" name="rescueMedical.jgmc" data-options="required: true" missingMessage="请输入机构名称"/></td>	
    			<td class="table_nemu_new"  width="25%">医疗机构类别</td><td class="table_con"  width="25%"><input  id="updYljglb" name="rescueMedical.yljglb" data-options="editable:false,panelHeight:'auto'"/></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new">隶属关系</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.affiliation"/></td>	
    			<td class="table_nemu_new">所有制形式</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.syzxs"/></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new">救护人员</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.jhry"/></td>	
    			<td class="table_nemu_new">救护车辆</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.jhcl"/></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new">床位</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.bed"/></td>	
    			<td class="table_nemu_new">其他物资</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.qtwz"/></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new">医疗机构等级</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.yljgdj"/></td>	
    			<td class="table_nemu_new">详细地址</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.address"/></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new">联系电话</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.tel"/></td>	
    			<td class="table_nemu_new">传真</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.byValue"/></td>	
    		</tr>
           	<tr>
    			<td class="table_nemu_new">负责人姓名</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.fzrxm"/></td>	
    			<td class="table_nemu_new">负责人性别</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.fzrxb"/></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new">负责人专业</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.fzrzy"/></td>	
    			<td class="table_nemu_new">负责人职务</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.fzrzw"/></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new">负责人职称</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.fzrzc"/></td>	
    			<td class="table_nemu_new">负责人办公电话</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.fzrbgdh"/></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new">负责人住宅电话</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.fzrzzdh"/></td>	
    			<td class="table_nemu_new">负责人手机</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.fzrsj"/></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new">联系人姓名</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.lxrxm"/></td>	
    			<td class="table_nemu_new">联系人性别</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.lxrxb"/></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new">联系人专业</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.lxrzy"/></td>	
    			<td class="table_nemu_new">联系人职务</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.lxrzw"/></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new">联系人职称</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.lxrzc"/></td>	
    			<td class="table_nemu_new">联系人办公电话</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.lxrbgdh"/></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new">联系人住宅电话</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.lxrzzdh"/></td>	
    			<td class="table_nemu_new">联系人手机</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.lxrsj"/></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new"  width="25%">备注</td><td class="table_con" colspan="3"><textarea rows="3" cols="70" class="easyui-validatebox" name="rescueMedical.remark"></textarea></td>	
    		</tr>
		</table>
	        </div> 
   	</form>
</div>
</div>
</body>
</html>