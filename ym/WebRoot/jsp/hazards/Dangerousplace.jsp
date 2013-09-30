<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="gb2312" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>Σ�ճ���</title>

<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/validator.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<link rel="stylesheet" href="../../css/newCrud.css" type="text/css"></link>
<script type="text/javascript">
$(document).ready(function() {
 		eSelect = new Select('ѡ��','${ctx}/jsp/ymxm/enterprise/EnterpriseSelect.jsp'
	    		 , null, function(id, corpName) {
	    	        $('input[name="dangerousplaceInfo.dwdm"]').val(id);
	    	        $('#addWin input[name="dangerousplaceInfo.corpName"]').val(corpName);
	    	        $('#updateWin input[name="dangerousplaceInfo.corpName"]').val(corpName);
	    });
	    mSelect = new Select('ѡ��', '${ctx}/jsp/hazards/materials/MaterialsSelect.jsp'
	    		 , null, function(id, name) {
	    	        //alert(id + ":" + corpName);
	    	        $('input[name="dangerCargoInfo.id"]').val(id);
	    	        $('input[name="dangerCargoInfo.dangercargoname"]').val(name);
	    });
		oSelect = new Select('�Զ���Σ������', '${ctx}/jsp/hazards/materials/OtherMaterialsSelect.jsp'
	    		 , {width:'900px', height:'200px'}, function(id, name) {
	    	        //alert(id + ":" + corpName);
	    	        $('input[name="dangerCargoInfo.id"]').val(id);
	    	        $('input[name="dangerCargoInfo.dangercargoname"]').val(name);
	    });
		grid = new Grid('${ctx}/dangerplace/dangerousplaceAction!list', 'data_list');
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'dangerousplaceInfo',
			moduleName:'Σ�ճ���',
			url:'${ctx}/dangerplace/dangerousplaceAction',
			beforeSubmit:function() {
				 if($('#addForm input[name="dangerousplaceInfo.dwdm"]').val() == '') {
					$.messager.alert("����", "��ѡ��������λ");
					return false;
			 	 }
				 return true;
			},
			afterUpdateLoadData:function() {
				changeIsPark($('#isParkTrue').combobox('getValue'));
			},
			afterViewLoadData:function(viewFormObject) {
				changeIsPark($(viewFormObject).find('span[name="dangerousplaceInfo.isparkTrue"]').text());
			}
		});
		$('#isParkTrue').combobox({
			onSelect: function(record){
				if(record.v)
					changeIsPark(record.v);
			}
		});
}); 

       
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
<shiro:hasPermission name="48:update">
	url += "<a title=\"���ʹ���\" onclick='viewChildFunction(\""+rowId+"\");' class='btn2' ><img src=\"../../images/addRes.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;"
	</shiro:hasPermission>
	return url;
}

function viewDpFunction(){
var rowsid;
 var rows = grid.getSelectNodes();
 if (rows.length == 0) {
        $.messager.show({
            title:'��ʾ',
            msg:'��ѡ��ҪԤ������',
            timeout:2000,
            showType:'slide'
        });
        return;
    } else{
		rowsid = rows[0].id;
	}
	
	testform.id.value=rowsid;
	testform.submit();
}

function viewChildFunction(rowId) {
	$('#childFrame').attr('src', 'DangerousMaterials.jsp?fid=' + rowId);
	$('#viewChildForm').dialog({
		title:'�鿴����',
		modal:true,
		draggable:false,
		minimizable:true,
		maximizable:true,
		maximized:true,
		onClose:function(){
			$('#data_list').datagrid('reload');
		},
		buttons:[{
			text:'ȡ��',
			iconCls:'icon-cancel',
			handler:function() {
				$('#viewChildForm').dialog('close');
			}
		}]
	});
}

function changeIsPark(value){
	if(value == '��') {
		$('#ispark').val('');
		$('.ispark').show();
	} else {
		$('#ispark').val('');
		$('.ispark').hide();
	}
}
</script>
</head>

<body>
<div id="hidden" align="center" >
			<form  name="testform" id="testform" action="${ctx}/dangerplace/dangerousplaceAction!getByIds" target="_target">
		    	<input type="hidden" name="id" id="id" />
		    </form>
		    </div>
  <div class="panel-header" style="width:100%;">
	<div class="panel-title panel-with-icon">Σ�ճ�����Ϣ�б�</div>
	<div class="panel-icon icon-edit"></div>
	<div class="panel-tool"></div>
	</div>
	<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
		 <div>
		        <form id="searchForm" method="post" style="display: inline;">
	            <div style="margin-top:-8px;">
	            &nbsp;&nbsp;������λ:&nbsp;&nbsp;<input class="easyui-validatebox"  name="dangerousplaceInfo.corpName" >
		        &nbsp;&nbsp;Σ�ճ�������:&nbsp;&nbsp;<input class="easyui-validatebox"  name="dangerousplaceInfo.dangerplacename" >
		        &nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search();">��ѯ</a>
				&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch();">���</a>
	            </div>
		        </form>
		    </div>
	        </div>
	        <div class="search_add">
			<shiro:hasPermission name="48:add">
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add', plain:true" onclick="changeIsPark();crud.add();">���</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="48:delete">		
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove', plain:true" onclick="crud.remove();">ɾ��</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="48:view">		
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove', plain:true" onclick="viewDpFunction();">��ӡԤ��</a>
			</shiro:hasPermission>
	        </div>
	</div>


<!-- Σ�ճ�����Ϣչʾ����ͷ -->
		<div style="height:78%;">
			<table id="data_list" style="display: none">
				<thead>
					<tr>
					<th field="corpName" width="150" align="center">������λ</th>
					<th field="dangerplacename" width="150" align="center">Σ�ճ�������</th>
					<th field="dangerplacelevel" width="150" align="center">Σ�ճ�������</th>
					<th field="dangerplacetime" width="150" align="center">Σ�ճ���Ͷ��ʱ��</th>
					<th align="center" field="id" width="80" align="center" formatter="gridFormatter">����</th>
					</tr>
				</thead>
			</table>
		</div>
		
		<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" 
			data-options="iconCls:'icon-save',modal:true,
    			minimizable:true,maximizable:true,collapsible:true,draggable:false">
			<form method="post" >
			    <input type="hidden" name="dangerousplaceInfo.id"/>
			    <input type="hidden" name="dangerousplaceInfo.dwdm"/>
				    <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
					<table id="detailTable" cellpadding="5px" style="font-size:12px;"
					 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
						<tr>
							<td class="table_nemu_new" width="25%">������λ</td>
							<td class="table_con" colspan="3"><input type="text" class="easyui-validatebox" name="dangerousplaceInfo.corpName"
							 disabled="disabled"/>
							<input type="button" value="ѡ��" onclick="eSelect.open()"/></td>
						</tr>
						<tr>
							<td class="table_nemu_new">Σ�ճ�������</td>
							<td class="table_con" colspan="3"><input class="easyui-validatebox" type="text" id="addName" 
							name="dangerousplaceInfo.dangerplacename" 
							data-options="required: true,editable:false,panelHeight:'auto'" missingMessage="������Σ�ճ�������" value=""/></td>
						</tr>
						<tr>
							<td class="table_nemu_new" width="25%">Σ�ճ������ڵ�ַ</td>
							<td class="table_con" colspan="1" width="25%"><input style="width:95%" class="easyui-validatebox" type="text" id="addAddess" name="dangerousplaceInfo.dangerplaceadress"/></td>
							<td class="table_nemu_new" width="25%">Σ�ճ���Ͷ��ʱ��</td>
							<td class="table_con" colspan="1" width="25%"><input onfocus="WdatePicker({readOnly:true})"  class="Wdate"  id="updateDp" name="dangerousplaceInfo.dangerplacetime" 
							data-options="required: true,editable:false"/></td>
						</tr>
						<tr>
						<td class="table_nemu_new">Σ�ճ�������</td>
							<td class="table_con" colspan="1"><input class="easyui-validatebox" type="text" id="addLevel" name="dangerousplaceInfo.dangerplacelevel"/></td>
						<td class="table_nemu_new">Rֵ</td>
							<td class="table_con" colspan="1"><input class="easyui-validatebox" style ="width: 60%" type="text" 
							validtype="positiveInt" id="addRvalue" name="dangerousplaceInfo.rvalue"/></td>
						</tr>
						<tr>
							<td class="table_nemu_new">��Ԫ����Ҫװ�á���ʩ�����������棩��ģ</td>
							<td class="table_con" colspan="3"><textarea cols="70" rows="3" class="easyui-validatebox" type="text" id="addUnitSize" 
							name="dangerousplaceInfo.unitsize" /></textarea></td>
						</tr>
						<tr>
							<td class="table_nemu_new">�Ƿ�λ�ڻ�������ҵ��԰��</td>
							<td class="table_con" colspan="3">
							<input type="text" name="dangerousplaceInfo.isparkTrue" id="isParkTrue"	data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'��'},{v:'��'}],editable:false" panelHeight="auto" style="width:40px;"/>
							<font style="display:none;" class="ispark">&nbsp;&nbsp;&nbsp;&nbsp;԰������:</font>
							<input type="text" class="ispark" id="ispark" name="dangerousplaceInfo.ispark" style="display:none;"/>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">Σ�ճ������ܱ��ص����Ŀ��������������m��</td>
							<td class="table_con" colspan="3"><textarea class="easyui-validatebox" type="text" id="adddistance" 
							cols="70" rows="3" name="dangerousplaceInfo.distance" ></textarea></td>
							</tr>
							<tr>
							<td class="table_nemu_new">�����߽���500m��Χ����������ֵ</td>
							<td class="table_con" colspan="3"><input class="easyui-validatebox" type="text" id="addestimatedvalue" 
							  name="dangerousplaceInfo.estimatedvalue" validtype="positiveInt"/></td>
						</tr>
						<tr>
							<td class="table_nemu_new">��������Σ�ջ�ѧƷ�¹����	</td>
							<td class="table_con" colspan="3"><textarea class="easyui-validatebox" type="text" id="addsituation" 
							cols="70" rows="5" name="dangerousplaceInfo.situation" data-options="required: false"></textarea></td>
							</tr>
						<tr>
						<td class="table_nemu_new">�����</td>
							<td class="table_con"><input class="easyui-validatebox" type="text" id="addPostcode" 
							name="dangerousplaceInfo.formpeople" data-options="required: false"/></td>
							<td class="table_nemu_new">��ϵ�绰</td>
							<td class="table_con" ><input class="easyui-validatebox" type="text" id="addPhonenumber" 
							name="dangerousplaceInfo.phonenumber" data-options="required: true" validtype="phone" missingMessage="��������ϵ�绰" /></td>
						</tr>
						<tr>
							<td class="table_nemu_new">���ʱ��</td>
							<td class="table_con"><input  onfocus="WdatePicker({readOnly:true})"  class="Wdate"  id="updateFormdate" name="dangerousplaceInfo.formdate" required: true,editable:false"/></td>
							<td class="table_con" colspan="2"></td>
						</tr>
					</table>
					</div>
				</form>
			</div>
		</div>
	<div style="display: none;">
		<div id="viewChildForm" style="width: 960px; height: 400px;" data-options="iconCls:'icon-save'">
			<iframe frameborder="0" id="childFrame" width="100%" height="98%" scrolling-x="no"></iframe>
		</div>
	</div>
		
</body>
</html>