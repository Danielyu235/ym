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
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<script type="text/javascript">
$(document).ready(
 	function (){
 		grid = new Grid('${ctx}/rescueCars/rescueCarsAction!list', 'data_list');
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'rescueCars',
			moduleName:'��Ԯ����',
			url:'${ctx}/rescueCars/rescueCarsAction'
		});
 	}
 	
  ); 
         //���ر�������
function gridFormatter(value, rowData, rowIndex) {
	var rowId = rowData.id;
	var url = "&nbsp;&nbsp;&nbsp;";
	<shiro:hasPermission name="48:view">
	url += "<a title=\"�鿴\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"../../../images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	<shiro:hasPermission name="48:update">
	url += "<a title=\"�޸�\" onclick='crud.update(\""+rowId+"\");' class='btn2' ><img src=\"../../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	if(rowData.hasMap == '1') { //�Ѷ�λ
		url += "<a title=\"��λ\" onclick='window.top.gis.showPoint(\""+rowData.id+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.carName +"\");' class='btn2' ><img src=\"${ctx}/images/showPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	} else {
		url += "<a title=\"���\" onclick='window.top.gis.addPoint(\""+rowData.id+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.carName +"\");' class='btn2' ><img src=\"${ctx}/images/addPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
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

<div class="datagrid-toolbar" id = "tb" style="padding-left: 0px;height:10px;"">
	 <div id="search">
        <form id="searchForm" method="post" style="display: inline;">
           <div style="margin-top:-8px">
        &nbsp;&nbsp;��������:&nbsp;&nbsp;<input class="easyui-validatebox"  name="rescueCars.carName" >
        &nbsp;&nbsp;����:&nbsp;&nbsp;<input class="easyui-validatebox"  name="rescueCars.carStyle" >
        &nbsp;&nbsp;�ͺ�:&nbsp;&nbsp;<input class="easyui-validatebox"  name="rescueCars.carModle" >
        &nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search();">��ѯ</a>
		&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch();">���</a>
        </div>
        </form>
    </div>
    </div>
    <div  class="search_add">
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
            <th field="carName" width="200" align="center" title="carName">��������</th>
            <th field="carStyle" width="200" align="center" title="carStyle">����</th>
            <th field="carModle" width="200" align="center" title="carModle">�ͺ�</th>
            <th field="number" width="100" align="center" title="number">����</th>
            <th field="hasPump" width="100" align="center" title="hasPump">�������</th>
            <th field="tonnage" width="100" align="center" title="tonnage">��λ</th>
            <th align="center" field="id" width="120"  formatter="gridFormatter">����</th>
        </tr>
        </thead>
    </table>
</div>

<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" 
			data-options="iconCls:'icon-save',modal:true,
    			minimizable:true,maximizable:true,collapsible:true,draggable:false">
		<form method="post" >
    <input type="hidden" id="updateId" name="rescueCars.id"/>
	  <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
	<tr >
	    <td class="table_nemu_new" width="25%">��������</td>
	    <td  class="table_con" width="25%"><input class="easyui-validatebox" name="rescueCars.carName" data-options="required: true" missingMessage="�����복������"></td>
	    <td  class="table_nemu_new" width="25%">����</td>
	    <td class="table_con" width="25%"><input class="easyui-validatebox" name="rescueCars.carStyle"/></td>
	  </tr>
	  <tr >
	    <td  class="table_nemu_new" >�ͺ�</td>
	    <td class="table_con" ><input class="easyui-validatebox" name="rescueCars.carModle"/></td>
	    <td class="table_nemu_new" >��λ���֣�</td>
	    <td  class="table_con" ><input  name="rescueCars.tonnage"/></td>
	  </tr>
	  <tr >
	    <td class="table_nemu_new" >����</td>
	    <td class="table_con" ><input style="width: 50px"  name="rescueCars.number" data-options="required: true" missingMessage="����������"/></td>
	    <td class="table_nemu_new" >�����Ƿ����</td>
	    <td class="table_con" ><input class="easyui-combobox"  id="updHasPump" data-options="valueField: 'label',
				textField: 'value',
				data: [{
					label: '��',
					value: '��'
				},{
					label: '��',
					value: '��'
		        }],panelHeight:'auto',editable:false" style="width: 50" name="rescueCars.hasPump"/></td>
	 </tr>
	 <tr>	        
	    <td class="table_nemu_new" >�Ƿ��Ա����䳵�� </td>
	    <td class="table_con" colspan="3"><input class="easyui-combobox" id="updHasCarProvide" data-options="valueField: 'label',
				textField: 'value',
				data: [{
					label: '��',
					value: '��'
				},{
					label: '��',
					value: '��'
		        }],panelHeight:'auto',editable:false" style="width: 50"  name="rescueCars.hasCarProvide"/></td>
	  </tr>
	  <tr >
	    <td  class="table_nemu_new" >������λ</td>
	    <td class="table_con" ><input class="easyui-validatebox" name="rescueCars.organize"/></td>
	    <td class="table_nemu_new" >��������</td>
	    <td  class="table_con" ><input class="easyui-validatebox" name="rescueCars.department"/></td>
	  </tr>
	   <tr >
	    <td  class="table_nemu_new" >������</td>
	    <td class="table_con" ><input class="easyui-validatebox" name="rescueCars.principal" data-options="required: true" missingMessage="�����븺����"/></td>
	    <td class="table_nemu_new" >�������ֻ�</td>
	    <td  class="table_con" ><input class="easyui-validatebox" name="rescueCars.mobilePhone" data-options="required: true" missingMessage="�����븺�����ֻ�"/></td>
	  </tr>
	  <tr height="100">
	    <td class="table_nemu_new"  width="25%">��ע</td>
	    <td colspan="5" class="table_con"><textarea rows="3" cols="70" class="easyui-validatebox" name="rescueCars.remark" type="textarea" ></textarea></td>
	  </tr>
		</table>
		</div>
   	</form>
</div>
</div>
</body>
</html>