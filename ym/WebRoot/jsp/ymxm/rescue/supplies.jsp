<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="gb2312" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��Ԯ����</title>
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
 		//����list����
 		grid = new Grid('${ctx}/tbRescueSupplies/tbRescueSuppliesAction!list', 'data_list');
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'tbRescueSupplies',
			moduleName:'��Ԯ����',
			url:'${ctx}/tbRescueSupplies/tbRescueSuppliesAction',
			afterViewLoadData:function(viewFormObject, data) {
				$(viewFormObject).find('span[name="tbRescueSupplies.wzlb"]').text(data.wzlbtext);
			}
			
		});
 	} 	
  ); 
         //���ر�������
function gridFormatter(value, rowData, rowIndex) {
	var rowId = rowData.id;
	var url = "";
	<shiro:hasPermission name="48:view">
	url += "<a title=\"�鿴\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"../../../images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	<shiro:hasPermission name="48:update">
	url += "<a title=\"�޸�\" onclick='crud.update(\""+rowId+"\");'  class='btn2'><img src=\"../../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	if(rowData.hasMap == '1') { //�Ѷ�λ
		url += "<a title=\"��λ\" onclick='window.top.gis.showPoint(\""+rowData.id+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.wzmc +"\");' class='btn2' ><img src=\"${ctx}/images/showPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	} else {
		url += "<a title=\"���\" onclick='window.top.gis.addPoint(\""+rowData.id+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.wzmc +"\");' class='btn2' ><img src=\"${ctx}/images/addPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	}
	return url;
}
</script>
</head>
<body>

  <div class="panel-header" style="width:100%;">
	<div class="panel-title panel-with-icon">��Ԯ����</div>
	<div class="panel-icon icon-edit"></div>
	<div class="panel-tool"></div>
</div>

<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
	 <div id="search">
        <form id="searchForm" method="post" style="display: inline;">
        <div style="margin-top:-8px">
        &nbsp;&nbsp;��������:&nbsp;&nbsp;<input class="easyui-validatebox"  name="tbRescueSupplies.wzmc" >
        &nbsp;&nbsp;�ͺŹ��:&nbsp;&nbsp;<input class="easyui-validatebox"  name="tbRescueSupplies.wzlb">
        &nbsp;&nbsp;���λ��:&nbsp;&nbsp;<input class="easyui-validatebox"  name="tbRescueSupplies.cfwz" >
        &nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search();">��ѯ</a>
		&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch();">���</a>
        </div>
        </form>
    </div>
    </div>
    <div class="search_add">
	<shiro:hasPermission name="48:add">
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add', plain:true" onclick="crud.add();">���</a>
	</shiro:hasPermission>
	<shiro:hasPermission name="48:delete">		
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove', plain:true" onclick="crud.remove();">ɾ��</a>
	</shiro:hasPermission>
    </div>
<!-- ����ͷ -->
<div style="height:74%;">
    <table id="data_list" style="display:none">
        <thead>
        <tr>
            <th field="wzmc" width="150" align="center" title="wzmc">��������</th>
            <th field="wzlb" width="150" align="center" title="wzlb">�ͺŹ��</th>
            <th field="ssdw" width="150" align="center" title="ssdw">��λ</th>
            <th field="wzsl" width="150" align="center" title="wzsl">��������</th>
            <th field="cfwz" width="150" align="center" title="cfwz">���λ��</th>
            <th align="center" field="id" width="160" formatter="gridFormatter">����</th>
        </thead>
    </table>
</div>

<!-- �޸Ĵ��� -->
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
    			<td class="table_nemu_new" width="25%">��������</td><td class="table_con" width="25%"><input class="easyui-validatebox" name="tbRescueSupplies.wzmc" data-options="required: true" missingMessage="��������������"/></td>	
    			<td class="table_nemu_new" width="25%">�ͺŹ��</td><td class="table_con" width="25%"><input class="easyui-validatebox"  name="tbRescueSupplies.wzlb"/></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new">��������</td><td class="table_con"><input  name="tbRescueSupplies.wzsl"/></td>	
    			<td class="table_nemu_new">��λ</td><td class="table_con"><input class="easyui-validatebox" name="tbRescueSupplies.ssdw"/></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new">���λ��</td><td class="table_con" colspan="3"><input class="easyui-validatebox" name="tbRescueSupplies.cfwz" size="50"/></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new" width="25%">��ע</td><td class="table_con" colspan="3"><textarea rows="3" cols="70" class="easyui-validatebox" name="tbRescueSupplies.remark"></textarea></td>	
    		</tr>
			
		</table>
	        </div> 
   	</form>
</div>
</div>
</body>
</html>