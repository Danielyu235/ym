<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="gb2312" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>ҽ�Ʊ���</title>

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
			moduleName:'ҽ�Ʊ���',
			url:'${ctx}/rescueMedical/rescueMedicalAction',
			afterViewLoadData:function(viewFormObject, data) {
				$(viewFormObject).find('span[name="rescueMedical.yljglb"]').text(data.yljglbtext);
			}
			
		});
 		onloadCombobox('${ctx}','yljglb',$('#updYljglb'),null,null);
 		onloadCombobox('${ctx}','yljglb',$('#serYljglb'),null,null);
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
	url += "<a title=\"�޸�\" onclick='crud.update(\""+rowId+"\");' class='btn2' ><img src=\"../../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	if(rowData.hasMap == '1') { //�Ѷ�λ
		url += "<a title=\"��λ\" onclick='window.top.gis.showPoint(\""+rowData.id+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.jgmc +"\");' class='btn2' ><img src=\"${ctx}/images/showPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	} else {
		url += "<a title=\"���\" onclick='window.top.gis.addPoint(\""+rowData.id+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.jgmc +"\");' class='btn2' ><img src=\"${ctx}/images/addPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	}
	return url;
}
</script>
</head>
<body>

  <div class="panel-header" style="width:100%;">
	<div class="panel-title panel-with-icon">ҽ�Ʊ���</div>
	<div class="panel-icon icon-edit"></div>
	<div class="panel-tool"></div>
</div>

<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
	 <div id="search">
        <form id="searchForm" method="post" style="display: inline;">
           <div style="margin-top:-8px">
        &nbsp;&nbsp;��������:&nbsp;&nbsp;<input class="easyui-validatebox"  name="rescueMedical.jgmc" >
        &nbsp;&nbsp;ҽ�ƻ������:&nbsp;&nbsp;<input id="serYljglb" class="easyui-validatebox" name="rescueMedical.yljglb" >
        &nbsp;&nbsp;ҽ�ƻ����ȼ�:&nbsp;&nbsp;<input class="easyui-validatebox"  name="rescueMedical.yljgdj" >
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
            <th field="jgmc" width="150" align="center" title="jgmc">��������</th>
            <th field="syzxs" width="150" align="center" title="syzxs">��������ʽ</th>
            <th field="yljglbtext" width="150" align="center" title="yljglbtext">ҽ�ƻ������</th>
            <th field="yljgdj" width="150" align="center" title="yljgdj">ҽ�ƻ����ȼ�</th>
            <th field="jhry" width="150" align="center" title="jhry">�Ȼ���Ա</th>
            <th field="jhcl" width="150" align="center" title="jhcl">�Ȼ�����</th>
            <th align="center" field="id" width="160" align="center" formatter="gridFormatter">����</th>     
        </tr>
        </thead>
    </table>
</div>
<!-- �޸Ĵ��� -->
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
    			<td class="table_nemu_new" width="25%">��������</td><td class="table_con"  width="25%"><input class="easyui-validatebox" name="rescueMedical.jgmc" data-options="required: true" missingMessage="�������������"/></td>	
    			<td class="table_nemu_new"  width="25%">ҽ�ƻ������</td><td class="table_con"  width="25%"><input  id="updYljglb" name="rescueMedical.yljglb" data-options="editable:false,panelHeight:'auto'"/></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new">������ϵ</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.affiliation"/></td>	
    			<td class="table_nemu_new">��������ʽ</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.syzxs"/></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new">�Ȼ���Ա</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.jhry"/></td>	
    			<td class="table_nemu_new">�Ȼ�����</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.jhcl"/></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new">��λ</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.bed"/></td>	
    			<td class="table_nemu_new">��������</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.qtwz"/></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new">ҽ�ƻ����ȼ�</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.yljgdj"/></td>	
    			<td class="table_nemu_new">��ϸ��ַ</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.address"/></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new">��ϵ�绰</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.tel"/></td>	
    			<td class="table_nemu_new">����</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.byValue"/></td>	
    		</tr>
           	<tr>
    			<td class="table_nemu_new">����������</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.fzrxm"/></td>	
    			<td class="table_nemu_new">�������Ա�</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.fzrxb"/></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new">������רҵ</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.fzrzy"/></td>	
    			<td class="table_nemu_new">������ְ��</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.fzrzw"/></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new">������ְ��</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.fzrzc"/></td>	
    			<td class="table_nemu_new">�����˰칫�绰</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.fzrbgdh"/></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new">������סլ�绰</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.fzrzzdh"/></td>	
    			<td class="table_nemu_new">�������ֻ�</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.fzrsj"/></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new">��ϵ������</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.lxrxm"/></td>	
    			<td class="table_nemu_new">��ϵ���Ա�</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.lxrxb"/></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new">��ϵ��רҵ</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.lxrzy"/></td>	
    			<td class="table_nemu_new">��ϵ��ְ��</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.lxrzw"/></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new">��ϵ��ְ��</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.lxrzc"/></td>	
    			<td class="table_nemu_new">��ϵ�˰칫�绰</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.lxrbgdh"/></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new">��ϵ��סլ�绰</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.lxrzzdh"/></td>	
    			<td class="table_nemu_new">��ϵ���ֻ�</td><td class="table_con"><input class="easyui-validatebox" name="rescueMedical.lxrsj"/></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new"  width="25%">��ע</td><td class="table_con" colspan="3"><textarea rows="3" cols="70" class="easyui-validatebox" name="rescueMedical.remark"></textarea></td>	
    		</tr>
		</table>
	        </div> 
   	</form>
</div>
</div>
</body>
</html>