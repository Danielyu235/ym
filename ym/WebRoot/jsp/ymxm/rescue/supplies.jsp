<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="gb2312" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>救援物资</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<script type="text/javascript">
$(document).ready(
 	function (){
 		onloadCombobox('${ctx}','wzlb',$('#updWzlb'),null,null);
 		onloadCombobox('${ctx}','wzlb',$('#serWzlb'),null,null);
 		//加载list数据
 		grid = new Grid('${ctx}/tbRescueSupplies/tbRescueSuppliesAction!list', 'data_list');
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'tbRescueSupplies',
			moduleName:'救援物资',
			url:'${ctx}/tbRescueSupplies/tbRescueSuppliesAction',
			afterViewLoadData:function(viewFormObject, data) {
				$(viewFormObject).find('span[name="tbRescueSupplies.wzlb"]').text(data.wzlbtext);
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
	url += "<a title=\"修改\" onclick='crud.update(\""+rowId+"\");'  class='btn2'><img src=\"../../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	if(rowData.hasMap == '1') { //已定位
		url += "<a title=\"定位\" onclick='window.top.gis.showPoint(\""+rowData.id+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.wzmc +"\");' class='btn2' ><img src=\"${ctx}/images/showPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	} else {
		url += "<a title=\"打点\" onclick='window.top.gis.addPoint(\""+rowData.id+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.wzmc +"\");' class='btn2' ><img src=\"${ctx}/images/addPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	}
	return url;
}
</script>
</head>
<body>

  <div class="panel-header" style="width:100%;">
	<div class="panel-title panel-with-icon">救援物资</div>
	<div class="panel-icon icon-edit"></div>
	<div class="panel-tool"></div>
</div>

<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
	 <div id="search">
        <form id="searchForm" method="post" style="display: inline;">
        <div style="margin-top:-8px">
        &nbsp;&nbsp;物资名称:&nbsp;&nbsp;<input class="easyui-validatebox"  name="tbRescueSupplies.wzmc" >
        &nbsp;&nbsp;型号规格:&nbsp;&nbsp;<input class="easyui-validatebox"  name="tbRescueSupplies.wzlb">
        &nbsp;&nbsp;存放位置:&nbsp;&nbsp;<input class="easyui-validatebox"  name="tbRescueSupplies.cfwz" >
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
            <th field="wzmc" width="150" align="center" title="wzmc">物资名称</th>
            <th field="wzlb" width="150" align="center" title="wzlb">型号规格</th>
            <th field="ssdw" width="150" align="center" title="ssdw">单位</th>
            <th field="wzsl" width="150" align="center" title="wzsl">物资数量</th>
            <th field="cfwz" width="150" align="center" title="cfwz">存放位置</th>
            <th align="center" field="id" width="160" formatter="gridFormatter">操作</th>
        </thead>
    </table>
</div>

<!-- 修改窗口 -->
<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" 
			data-options="iconCls:'icon-save',modal:true,
    			minimizable:true,maximizable:true,collapsible:true,draggable:false">
		<form method="post" >
    <input type="hidden" id="updateId" name="tbRescueSupplies.id"/>
	   <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
	   		 <tr>
    			<td class="table_nemu_new" width="25%">物资名称</td><td class="table_con" width="25%"><input class="easyui-validatebox" name="tbRescueSupplies.wzmc" data-options="required: true" missingMessage="请输入物资名称"/></td>	
    			<td class="table_nemu_new" width="25%">型号规格</td><td class="table_con" width="25%"><input class="easyui-validatebox"  name="tbRescueSupplies.wzlb"/></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new">物资数量</td><td class="table_con"><input  name="tbRescueSupplies.wzsl"/></td>	
    			<td class="table_nemu_new">单位</td><td class="table_con"><input class="easyui-validatebox" name="tbRescueSupplies.ssdw"/></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new">存放位置</td><td class="table_con" colspan="3"><input class="easyui-validatebox" name="tbRescueSupplies.cfwz" size="50"/></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new" width="25%">备注</td><td class="table_con" colspan="3"><textarea rows="3" cols="70" class="easyui-validatebox" name="tbRescueSupplies.remark"></textarea></td>	
    		</tr>
			
		</table>
	        </div> 
   	</form>
</div>
</div>
</body>
</html>