<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="gb2312" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�ܵ���Ϣ�б�</title>

<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<script type="text/javascript">
$(document).ready(
 	function (){
 			// ����1������·��;����2��ʵ������������3��title
 		//init('${ctx}/tbHazhardsPenstock/tbHazhardsPenstockAction','tbHazhardsPenstock','ѹ���ܵ�');
         //��������
 		eSelect = new Select('ѡ��','${ctx}/jsp/ymxm/enterprise/EnterpriseSelect.jsp'
	    		 , null, function(id, corpName) {
	    	        $('input[name="tbHazhardsPenstock.dwdm"]').val(id);
	    	        $('input[name="tbHazhardsPenstock.corpName"]').val(corpName);
	    });
 		 mSelect = new Select('ѡ��', '${ctx}/jsp/hazards/materials/MaterialsSelect.jsp'
	    		 , null, function(id, name) {
	    	        //alert(id + ":" + corpName);
	    	        $('input[name="tbHazhardsPenstock.materialsId"]').val(id);
	    	        $('input[name="tbHazhardsPenstock.csjz"]').val(name);
	    });
		oSelect = new Select('�Զ���Σ������', '${ctx}/jsp/hazards/materials/OtherMaterialsSelect.jsp'
	    		 , {width:'900px', height:'200px'}, function(id, name) {
	    	        //alert(id + ":" + corpName);
	    	        $('input[name="tbHazhardsPenstock.materialsId"]').val(id);
	    	        $('input[name="tbHazhardsPenstock.csjz"]').val(name);
	    });
 		grid = new Grid('${ctx}/tbHazhardsPenstock/tbHazhardsPenstockAction!list', 'data_list');
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'tbHazhardsPenstock',
			moduleName:'ѹ���ܵ�',
			url:'${ctx}/tbHazhardsPenstock/tbHazhardsPenstockAction',
			beforeSubmit:function() {
					 if($('#addForm input[name="tbHazhardsPenstock.dwdm"]').val() == '') {
						$.messager.alert("����", "��ѡ��������λ");
						return false;
				 	 }
				 	  if($('input[name="tbHazhardsPenstock.materialsId"]').val() == '') {
			                	$.messager.alert("����", "��ѡ��Σ������");
	        					return;
	        			 }
					 return true;
			}
		});
 	}
 	
  ); 
         //���ر�������
function gridFormatter(value, rowData, rowIndex) {
	var rowId = rowData.id;
	var url = "";
	<shiro:hasPermission name="48:view">
	url += "<a title=\"�鿴\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"../../images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	<shiro:hasPermission name="48:update">
	url += "<a title=\"�޸�\" onclick='crud.update(\""+rowId+"\");' class='btn2'><img src=\"../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	if(rowData.hasMap == '1') { //�Ѷ�λ
	url += "<a title=\"��λ\" onclick='window.top.gis.showPoint(\""+rowData.dwdm+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.gdmc +"\");' class='btn2' ><img src=\"${ctx}/images/showPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	} else {
	url += "<a title=\"���\" onclick='window.top.gis.addPoint(\""+rowData.dwdm+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.gdmc +"\");' class='btn2' ><img src=\"${ctx}/images/addPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	}
	return url;
}
</script>
</head>
<body>

  <div class="panel-header" style="width:100%;">
	<div class="panel-title panel-with-icon">ѹ���ܵ���Ϣ�б�</div>
	<div class="panel-icon icon-edit"></div>
	<div class="panel-tool"></div>
</div>

<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
<div>
        <form id="searchForm" method="post" style="display: inline;">
        <div style="margin-top:-8px;">
        &nbsp;&nbsp;������λ:&nbsp;&nbsp;<input class="easyui-validatebox" id="corpName" name="tbHazhardsPenstock.corpName" >
        &nbsp;&nbsp;�ܵ�����:&nbsp;&nbsp;<input class="easyui-validatebox"  name="tbHazhardsPenstock.gdmc">
        &nbsp;&nbsp;�ܵ����:&nbsp;&nbsp;<input type="text" class="easyui-combobox" name="tbHazhardsPenstock.gdlb"
							data-options="valueField:'v', textField:'v', data:
							[{v:'����ܵ�'},{v:'���ùܵ�'},{v:'��ҵ�ܵ�'}],editable:false" panelHeight="auto"/>
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

<div style="height: 500px">
    <table id="data_list" class="easyui-datagrid" loadMsg="����Ŭ����ȡ������..."
           fit="true" fitColumns="true">
        <thead>
        <tr>
            <th field="corpName" width="150" align="center" title="corpName">������λ</th>
            <th field="gdmc" width="150" align="center" title="gdmc">�ܵ�����</th>
            <th field="gdlb" width="150" align="center" title="gdlb">�ܵ����</th>
            <th field="gdcd" width="150" align="center" title="gdcd">�ܵ�����</th>
            <th field="gzyl" width="150" align="center" title="gzyl">����ѹ��</th>
            <th align="center" field="id" width="80" formatter="gridFormatter">����</th>       
        </tr>
        </thead>
    </table>
</div>
<!-- ���� -->
	<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" 
			data-options="iconCls:'icon-save',modal:true,
    			minimizable:true,maximizable:true,collapsible:true,draggable:false">
		<form method="post" >
	    	<input type="hidden" name="tbHazhardsPenstock.id"/>
	    	<input type="hidden" name="tbHazhardsPenstock.materialsId"/>
	   		 <input type="hidden" name="tbHazhardsPenstock.csjz"/>
	   		 <input type="hidden" name="tbHazhardsPenstock.dwdm"/>
    	 <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
    	<tr>
    			<td class="table_nemu_new" width="25%">������λ</td>
    			<td class="table_con" colspan="3">
    			<input type="text" class="easyui-validatebox" name="tbHazhardsPenstock.corpName"
							data-options="validType:'maxByteLength[100]'" disabled="disabled"/>
							<input type="button" value="ѡ��" onclick="eSelect.open()"/>
    			</td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new" width="25%">�ܵ�����</td><td class="table_con" width="25%"><input class="easyui-validatebox" name="tbHazhardsPenstock.gdmc" data-options="required: true" missingMessage="������ܵ�����"/></td>	
    			<td  class="table_nemu_new" width="25%">�ܵ����</td><td class="table_con" width="25%"><input class="easyui-validatebox" name="tbHazhardsPenstock.gdbh" data-options="required: true" missingMessage="������ܵ����"/></td>	
    		</tr>
    		<tr>
    			<td  class="table_nemu_new">�ܵ����</td><td class="table_con">
    			<input type="text" class="easyui-combobox" name="tbHazhardsPenstock.gdlb"
							data-options="required:true,
							valueField:'v', textField:'v', data:
							[{v:'����ܵ�'},{v:'���ùܵ�'},{v:'��ҵ�ܵ�'}],editable:false" panelHeight="auto"/>
    			</td>	
    			<td  class="table_nemu_new">����ֱ����mm��</td><td class="table_con"><input class="easyui-validatebox" name="tbHazhardsPenstock.gdzj" data-options="required: true" validtype="positiveInt"/></td>	
    	   </tr>
    	   <tr>
    			<td  class="table_nemu_new">��  ��</td><td class="table_con"><input class="easyui-validatebox" name="tbHazhardsPenstock.cz"/></td>	
    			<td  class="table_nemu_new">��    ��mm��</td><td class="table_con"><input class="easyui-validatebox" name="tbHazhardsPenstock.bh" validtype="positiveInt"/></td>	
    		</tr>
    			<td  class="table_nemu_new">�ܵ����ȣ�m��</td>
    			<td class="table_con">
    			<input class="easyui-validatebox" name="tbHazhardsPenstock.gdcd" data-options="required: true" validtype="positiveInt"/></td>	
    			<td class="table_nemu_new" >����ѹ����MPa��</td><td class="table_con"><input class="easyui-validatebox" name="tbHazhardsPenstock.gzyl" data-options="required: true" validtype="decimal"/></td>	
    		</tr>
    		<tr>
    			<td  class="table_nemu_new">ǿ������ѹ����MPa��</td><td class="table_con"><input class="easyui-validatebox" name="tbHazhardsPenstock.qdsyyl" validtype="decimal"/></td>	
    			<td  class="table_nemu_new">����������ѹ����MPa��</td><td class="table_con"><input class="easyui-validatebox" name="tbHazhardsPenstock.ymxsyyl" validtype="decimal"/></td>	
    		</tr>
    		<tr>
    			<td  class="table_nemu_new">���ͽ���</td><td class="table_con" colspan="3"><input id="updateCsjz" name="tbHazhardsPenstock.csjz" disabled="disabled" />
						<input type="button" value="ѡ��" onclick="mSelect.open()"/>
						<input type="button" value="�Զ���" onclick="oSelect.open()"/></td>	
    			
    		</tr>
    		<tr>
    			<td class="table_nemu_new" >Ͷ������</td><td class="table_con"><input id="updtyrq" onfocus="WdatePicker({readOnly:true})"  class="Wdate"  name="tbHazhardsPenstock.tyrq"/></td>	
    			<td  class="table_nemu_new">���跽ʽ</td><td class="table_con"><input class="easyui-combobox"  id='updfsfs' data-options="valueField: 'label',
				textField: 'value',
				data: [{
					label: '���',
					value: '���'
				},{
					label: '�ܿ�',
					value: '�ܿ�'
		        }],panelHeight:'auto',editable:false"  name="tbHazhardsPenstock.fsfs"/></td>	
    		</tr>
    		<tr>
    			<td  class="table_nemu_new">������ʽ</td><td class="table_con"><input class="easyui-combobox"  id='updfffs' data-options="valueField: 'label',textField: 'value',data:[{label:'�������� ',value:'�������� '},{label:'���������� ',value:'���������� '}],panelHeight:'auto',editable:false" name="tbHazhardsPenstock.fffs"/></td>	
    			<td  class="table_nemu_new">���ȷ�ʽ</td><td class="table_con"><input class="easyui-combobox"   id="updjrfs" data-options="valueField: 'label',textField: 'value',data:[{label:'���ȴ�ʩ ',value:'���ȴ�ʩ '},{label:'�޾��ȴ�ʩ ',value:'�޾��ȴ�ʩ '}],panelHeight:'auto',editable:false" name="tbHazhardsPenstock.jrfs"/></td>	
    		</tr>
    		<tr>
    			<td  class="table_nemu_new">��ƹ淶</td><td class="table_con"><input class="easyui-validatebox" name="tbHazhardsPenstock.sjgf"/></td>	
    			<td  class="table_nemu_new">��Ƶ�λ</td><td class="table_con"><input class="easyui-validatebox" name="tbHazhardsPenstock.sjdw"/></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new" >��װ�淶</td><td class="table_con"><input class="easyui-validatebox" name="tbHazhardsPenstock.azgf"/></td>	
    			<td  class="table_nemu_new">��װ��λ</td><td class="table_con"><input class="easyui-validatebox" name="tbHazhardsPenstock.azdw"/></td>	
    		</tr>
    		<tr>
    		<td  class="table_nemu_new">�����¶ȣ��棩</td><td class="table_con"><input class="easyui-validatebox" name="tbHazhardsPenstock.gzwd" data-options="required: true" validtype="positiveInt"/></td>	
    			<td class="table_nemu_new" >�ܵ�ͼ��</td><td class="table_con"><input class="easyui-validatebox" name="tbHazhardsPenstock.gdth"/></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new" >�ܵ�����������������</td><td class="table_con" colspan="3"><TEXTAREA rows="3" cols="70" class="easyui-validatebox" name="tbHazhardsPenstock.gdjgdq"></TEXTAREA></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new" >��ܵ������ĵ�ѹվ���䣩����</td><td class="table_con"><input class="easyui-validatebox" name="tbHazhardsPenstock.ygdxldtyz" validtype="positiveInt"/></td>	
    		    <td class="table_nemu_new" >�����</td><td class="table_con"><input class="easyui-validatebox" name="tbHazhardsPenstock.tbr"/></td>	
    			</tr>
    		<tr>
    			<td  class="table_nemu_new">��ϵ�绰</td><td class="table_con"><input class="easyui-validatebox" name="tbHazhardsPenstock.lxdh" validtype="phone"/></td>	
    			<td class="table_nemu_new" >�������</td><td class="table_con"><input  id="updtbrq" class="easyui-my97 easyui-validatebox" data-options="required:true,readOnly:true" name="tbHazhardsPenstock.tbrq"/></td>	
    		</tr>
    	</table>
        </div>
    </form>
</div>
</div>
</body>
</html>