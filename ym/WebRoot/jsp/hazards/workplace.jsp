<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="gb2312" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��������</title>

<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<link rel="stylesheet" href="../../css/newCrud.css" type="text/css"></link>
<script type="text/javascript">
$(document).ready(
 	function (){
 		eSelect = new Select('ѡ��','${ctx}/jsp/ymxm/enterprise/EnterpriseSelect.jsp'
	    		 , null, function(id, corpName) {
	    	        $('input[name="tbHazhardsWorkplace.dwdm"]').val(id);
	    	        $('input[name="tbHazhardsWorkplace.corpName"]').val(corpName);
	    });
	    mSelect = new Select('ѡ��', '${ctx}/jsp/hazards/materials/MaterialsSelect.jsp'
	    		 , null, function(id, name) {
	    	        //alert(id + ":" + corpName);
	    	        $('input[name="tbHazhardsMaterials.materialsId"]').val(id);
	    	        $('input[name="tbHazhardsMaterials.wzmc"]').val(name);
	    });
		oSelect = new Select('�Զ���Σ������', '${ctx}/jsp/hazards/materials/OtherMaterialsSelect.jsp'
	    		 , {width:'900px', height:'200px'}, function(id, name) {
	    	        //alert(id + ":" + corpName);
	    	        $('input[name="tbHazhardsMaterials.materialsId"]').val(id);
	    	        $('input[name="tbHazhardsMaterials.wzmc"]').val(name);
	    });
		grid = new Grid('${ctx}/hazhardsWorkplace/hazhardsWorkplaceAction!list', 'data_list');
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'tbHazhardsWorkplace',
			moduleName:'��������',
			url:'${ctx}/hazhardsWorkplace/hazhardsWorkplaceAction',
			dialogCss:{width:'900px',height:'350px'},
			beforeSubmit:function() {
				if($('#addForm input[name="tbHazhardsWorkplace.dwdm"]').val() == '') {
					$.messager.alert("����", "��ѡ��������λ");
					return false;
			 	 }
				 return true;
			},
			afterViewLoadData: function(viewFormObject, data){
			    if(data.list == null) return;
			 	$(viewFormObject).find('.appendTable .appendClass').remove();
			 	$.each(data.list, function(i, v){
			 		var ele = $('<tr class="appendClass">'
			 		+ '<td class="table_con">'+v.wzmc+'</td>'
			 		+ '<td class="table_con">'+v.xcwzzl+'</td>'
			 		+ '<td class="table_con">'+v.gygczdwzl+'</td>'
			 		+ '<td class="table_con">'+v.ccdwzl+'</td>'
			 		+ '<td class="table_con">'+v.fqwzl+ '</td>'
			 		+ '<td class="table_con"><a title=\"�޸�\" onclick=\'updateChild(\"'+v.id+'\",\"'+data.id+'\");\'><img src=\"../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a title=\"ɾ��\" onclick=\'deleteChild(\"'+v.id+'\",\"'+v.fid+'\");\'><img src=\"../../images/deleteRes.png\"></a></td></tr>');
			 		$(ele).appendTo($(viewFormObject).find('.appendTable'));
			 	});
		 	}
		});
		//�鿴ҳ��ƴ���ӱ��s
		var tr = $('<tr></tr>');
		var td = $('<td colspan="4"></td>');
		$(td).append($('.appendTable').clone()).appendTo(tr);
		$(crud.params.viewFormObject).css({width:'900px',height:'450px'});
		$(crud.params.viewFormObject).find('table').append(tr);
		crudRes = new Crud({
			addFormObject:$('#addResForm'), 
			entityName:'tbHazhardsMaterials',
			moduleName:'����',
			url:'${ctx}/tbHazhardsMaterials/tbHazhardsMaterialsAction',
			dialogCss:{width:'900px',height:'250px'},
			beforeSubmit:function() {
				 if($('#addResForm input[name="tbHazhardsMaterials.materialsId"]').val() == '') {
					$.messager.alert("����", "��ѡ��Σ������");
					return false;
			 	 }
				 return true;
			},
			afterUpdateSuccess:function(){
				crud.view(fid);
			},
			afterRemoveSuccess:function(){
				crud.view(fid);
			}
		});
 	}
 	
  ); 
 function addChild(rowId) {
	 crudRes.add();
	 $('#addResForm input[name="tbHazhardsMaterials.fid"]').val(rowId);
 }
 function updateChild(rowId, id) {
	 crudRes.update(rowId);
	 fid = id;
 }
 function deleteChild(rowId, id) {
	 var ids = [];
	 ids.push(rowId);
	 crudRes.removeByIds(ids);
	 fid = id;
 }
       
 //���ر�������
function gridFormatter(value, rowData, rowIndex) {
	var rowId = rowData.id;
	var url = "";
	<shiro:hasPermission name="48:view">
	url += "<a title=\"�鿴\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"../../images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	<shiro:hasPermission name="48:update">
	url += "<a title=\"�޸�\" onclick='crud.update(\""+rowId+"\");' class='btn2' ><img src=\"../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	url += "<a title=\"��������\" onclick='addChild(\""+rowId+"\");' class='btn2' ><img src=\"../../images/addRes.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	if(rowData.hasMap == '1') { //�Ѷ�λ
	url += "<a title=\"��λ\" onclick='window.top.gis.showPoint(\""+rowData.dwdm+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.dymc +"\");' class='btn2' ><img src=\"${ctx}/images/showPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	} else {
	url += "<a title=\"���\" onclick='window.top.gis.addPoint(\""+rowData.dwdm+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.dymc +"\");' class='btn2' ><img src=\"${ctx}/images/addPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	}
	return url;
}

</script>
</head>
<body>
  <div class="panel-header" style="width:100%;">
	<div class="panel-title panel-with-icon">����������Ϣ�б�</div>
	<div class="panel-icon icon-edit"></div>
	<div class="panel-tool"></div>
</div>
<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
	 <div>
	        <form id="searchForm" method="post" style="display: inline;">
            <div style="margin-top:-8px;">
            &nbsp;&nbsp;������λ:&nbsp;&nbsp;<input class="easyui-validatebox"  name="tbHazhardsWorkplace.corpName" >
	        &nbsp;&nbsp;��������:&nbsp;&nbsp;<input class="easyui-validatebox"  name="tbHazhardsWorkplace.dymc" >
	        &nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search()">��ѯ</a>
			&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch()">���</a>
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
</div>
<!-- ����ͷ -->
<div style="height: 74%">
    <table id="data_list" class="easyui-datagrid" loadMsg="����Ŭ����ȡ������..."
           fit="true" fitColumns="true" pagination="false">
        <thead>
        <tr>
        <th field="corpName" width="150" align="center" title="corpName">������λ</th>
           <th field="dymc" width="150" align="center" title="dymc">��������</th>
            <th field="gdzczz" width="150" align="center" title="gdzczz">�̶��ʲ���ֵ</th>
            <th field="zdmj" width="150" align="center" title="zdmj">ռ�����</th>
            <th align="center" field="id" width="80" align="center" formatter="gridFormatter">����</th>         
        </tr>
        </thead>
    </table>
</div>

<!-- ��Ӵ��� -->
<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" 
			data-options="iconCls:'icon-save',modal:true,
    			minimizable:true,maximizable:true,collapsible:true,draggable:false">
		<form method="post" >
    	<input type="hidden" name="tbHazhardsWorkplace.id"/>
    	<input type="hidden" class="easyui-validatebox" name="tbHazhardsWorkplace.dwdm"/>
    	<div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
			<table id="detailTable" cellpadding="5px" style="font-size:12px;"
			 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
    		<tr>
    			<td class="table_nemu_new" width="25%">��������</td>
    			<td class="table_con" width="25%"><input class="easyui-validatebox" name="tbHazhardsWorkplace.dymc"/></td>	
    			<td class="table_nemu_new" width="25%">�̶��ʲ���ֵ����Ԫ��</td>
    			<td class="table_con" width="25%"><input class="easyui-validatebox" name="tbHazhardsWorkplace.gdzczz"/></td>	
    		</tr>
    		<tr>
    		<td class="table_nemu_new">������λ</td><td class="table_con"><input type="text" class="easyui-validatebox" name="tbHazhardsWorkplace.corpName"
							data-options="validType:'maxByteLength[100]'" disabled="disabled"/>
							<input type="button" value="ѡ��" onclick="eSelect.open()"/></td>	
    			<td class="table_nemu_new">��������������</td><td class="table_con"><input class="easyui-combobox"  id='updschjgnq' data-options="valueField: 'label',
				textField: 'value',
				data: [{
					label: '��ҵ��',
					value: '��ҵ��'
				},{
					label: 'ũҵ��',
					value: 'ũҵ��'
		        },{
					label: '��ҵ��',
					value: '��ҵ��'
		        },{
					label: '������',
					value: '������'
		        },{
					label: '�����칫��',
					value: '�����칫��'
		        },{
					label: '��ͨ��Ŧ��',
					value: '��ͨ��Ŧ��'
		        },{
					label: '�Ƽ��Ļ���',
					value: '�Ƽ��Ļ���'
		        },{
					label: 'ˮԴ������',
					value: 'ˮԴ������'
		        },{
					label: '���ﱣ����',
					value: '���ﱣ����'
		        }
		        ],panelHeight:'auto',editable:false"  name="tbHazhardsWorkplace.schjgnq"/></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new">����λ��</td><td class="table_con" colspan="3"><TEXTAREA style="width: 400;height: 100;" class="easyui-validatebox" name="tbHazhardsWorkplace.jtwz"></TEXTAREA></td>	
    		</tr>
    		
    		<tr>
    			<td class="table_nemu_new">ռ�����</td><td class="table_con"><input class="easyui-validatebox" name="tbHazhardsWorkplace.zdmj"/></td>	
    			<td class="table_nemu_new">������������</td><td class="table_con"><input class="easyui-validatebox" name="tbHazhardsWorkplace.zcdbrs"/></td>	
    		</tr>
    	</table>
			</div>
	  </form>
</div>
</div>
<!-- �����Ʒ -->
<div style="display: none;">
		<div id="addResForm" style="width: 900px; height: 450px;" 
			data-options="iconCls:'icon-save',modal:true,
    			minimizable:true,maximizable:true,collapsible:true,draggable:false">
		<form method="post" >
			<input type="hidden" class="easyui-validatebox" id="id" name="tbHazhardsMaterials.id" />
  			<input type="hidden" class="easyui-validatebox" id="fid" name="tbHazhardsMaterials.fid" />
  		   	<input type="hidden" name="tbHazhardsMaterials.materialsId"/>
	   		 <input type="hidden" name="tbHazhardsMaterials.wzmc"/>
  			 <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
  			 	<tr>
					<td class="table_nemu_new" width="25%">��������</td>
					<td class="table_con" colspan="3">
						<input id="addWzmc" name="tbHazhardsMaterials.wzmc" disabled="disabled" />
						<input type="button" value="ѡ��" onclick="mSelect.open()"/>
						<input type="button" value="�Զ���" onclick="oSelect.open()"/>
					</td>
				</tr>
				 <tr>
					<td class="table_nemu_new" width="25%">�ִ�����������t��</td>
					<td class="table_con" width="25%">
						<input class="easyui-validatebox" id="addXcwzzl" name="tbHazhardsMaterials.xcwzzl"/>
					</td>
					<td class="table_nemu_new" width="25%">���չ����е���������t��</td>
					<td class="table_con" width="25%">
						<input class="easyui-validatebox" id="addGygczdwzl" name="tbHazhardsMaterials.gygczdwzl" />
					</td>
				</tr>
				<tr>
					<td class="table_nemu_new">�洢����������t��</td>
					<td class="table_con">
						<input class="easyui-validatebox" id="addCcdwzl" name="tbHazhardsMaterials.ccdwzl"/>
					</td>
					<td class="table_nemu_new">������������t��</td>
					<td class="table_con">
						<input class="easyui-validatebox" id="addFqwzl" name="tbHazhardsMaterials.fqwzl"/>
					</td>
				</tr>
  			 </table>
  			 </div>
  		</form>
  	</div>
</div>
<div style="display: none;">
<table class="appendTable" width="100%" border="1">
<tr text-align="center">
	<td class="table_nemu_new" rowspan="2">��������</td>
	<td colspan="5" class="table_nemu_new" text-align="center">��  Ԫ  ��  Σ  ��  ��  ��  ��</td>
</tr>
<tr>
	<td class="table_nemu_new">�ִ���������(t)</td>
	<td class="table_nemu_new">���չ����е�������(t)</td>
	<td class="table_nemu_new">�洢��������(t)</td>
	<td class="table_nemu_new">����������(t)</td>
	<td class="table_nemu_new">����</td>
</tr>	
</table>
</div>
</body>
</html>