<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="gb2312"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/jqueryhead.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>��Ԯר��</title>
		<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
		<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
		<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
		<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
		<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
		<script type="text/javascript">
//����ҳ���ִ��
$(document).ready(
 	function (){
 		//urlValue: ��Ŀ���ʸ�·��;    typeId: ���ݿ��ж�Ӧ����������id; 
 		//$('#oneId'): һ�������ж���;  $('#twoId'): ���������ж��� ; $('#threeId'): ���������ж���;
 		//listҳ���ѯ
 		onloadCombobox('${ctx}','zjzy',$('#select_specialized'),null,null);
 		onloadCombobox('${ctx}','zjzb',$('#select_workGroup'),null,null);
 		//����ҳ��
 		onloadCombobox('${ctx}','22d229c9278745c0b909b108011ba6f3',$('#updateSex'),null,null);
 		onloadCombobox('${ctx}','zjzy',$('#updateSpecialized'),null,null);
 		onloadCombobox('${ctx}','zjzb',$('#updateWorkGroup'),null,null);
 		grid = new Grid('${ctx}/rescueExpert/rescueExpertAction!list', 'data_list');
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'rescueExpert',
			moduleName:'��Ԯר��',
			url:'${ctx}/rescueExpert/rescueExpertAction',
			afterViewLoadData:function(viewFormObject, data) {
				$(viewFormObject).find('span[name="rescueExpert.specialized"]').text(data.specializedText);
				$(viewFormObject).find('span[name="rescueExpert.workGroup"]').text(data.workGroupText);
				$(viewFormObject).find('span[name="rescueExpert.sex"]').text(data.sexText);
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
	url += "<a title=\"�޸�\" onclick='crud.update(\""+rowId+"\");' class='btn2' ><img src=\"../../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	if(rowData.hasMap == '1') { //�Ѷ�λ
		url += "<a title=\"��λ\" onclick='window.top.gis.showPoint(\""+rowData.id+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.name +"\");' class='btn2' ><img src=\"${ctx}/images/showPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	} else {
		url += "<a title=\"���\" onclick='window.top.gis.addPoint(\""+rowData.id+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.name +"\");' class='btn2' ><img src=\"${ctx}/images/addPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	}
	return url;
}
</script>
	</head>
	<body>

		<div class="panel-header" style="width: 100%;">
			<div class="panel-title panel-with-icon">
				��Ԯר���б�
			</div>
			<div class="panel-icon icon-edit"></div>
			<div class="panel-tool"></div>
		</div>

		<div class="datagrid-toolbar" id="tb"  style="padding-left:0px; height:10px;">
			<div>
				<form id="searchForm" method="post" style="display: inline;">
                   <div style="margin-top:-8px">
					&nbsp;&nbsp;����:&nbsp;&nbsp;<input id="select_name" name="rescueExpert.name" data-options="validType:'length[1,25]'" />
					&nbsp;&nbsp;רҵ:&nbsp;&nbsp;<input id="select_specialized" name="rescueExpert.specialized"  data-options="panelHeight:'auto',width:'100',editable:false" value="" />
					&nbsp;&nbsp;���:&nbsp;&nbsp;<input id="select_workGroup" name="rescueExpert.workGroup" readonly data-options="panelHeight:'auto',width:'100',editable:false" value="" />
					&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search();">��ѯ</a> &nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch();">���</a>
                    </div>
				</form>
			</div>
            </div>
            <div class="search_add">
			<shiro:hasPermission name="48:add">
				<a href="javascript:void(0)" class="easyui-linkbutton"
					data-options="iconCls:'icon-add', plain:true"
					onclick="crud.add()">���</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="48:delete">
				<a href="javascript:void(0)" class="easyui-linkbutton"
					data-options="iconCls:'icon-remove', plain:true"
					onclick="crud.remove();">ɾ��</a>
			</shiro:hasPermission>
		</div>
		<!-- ����ͷ -->
		<div style="height:78%;">
			<table id="data_list" style="display: none">
				<thead>
					<tr>
						<th field="name" width="150" align="center" title="name">
							����
						</th>
						<th field="specializedText" width="150" align="center"
							title="specializedText">
							רҵ
						</th>
						<th field="workGroupText" width="150" align="center" title="workGroupText">
							���
						</th>
						<th field="business" width="150" align="center" title="business">
							����ְ��
						</th>
						<th field="mobilePhone" width="150" align="center"
							title="mobilePhone">
							�ֻ�����
						</th>
						<th align="center" field="id" width="160" align="center"
							formatter="gridFormatter">
							����
						</th>
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
					<input type="hidden" id="updateId" name="rescueExpert.id" />
					 <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
						<tr>
							<td class="table_nemu_new"  width="25%">
								����
							</td>
							<td class="table_con" width="25%">
								<input class="easyui-validatebox" type="text" id="updateName"
									name="rescueExpert.name" data-options="required: true"
									missingMessage="��������" />
							</td>
							<td class="table_nemu_new"  width="25%">
								�Ա�
							</td>
							<td class="table_con"  width="25%">
								<input type="text" id="updateSex" name="rescueExpert.sex" data-options="required: true,panelHeight:'auto',editable:false" missingMessage="�����Ա�" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">
								����
							</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updateAge" name="rescueExpert.age" validtype="positiveInt"/>
							</td>
							<td class="table_nemu_new">
								רҵ
							</td>
							<td class="table_con">
								<input type="text" id="updateSpecialized" name="rescueExpert.specialized" data-options="required: true,panelHeight:'auto',editable:false" missingMessage="������רҵ" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">
								���
							</td>
							<td class="table_con">
								<input id="updateWorkGroup" name="rescueExpert.workGroup" data-options="required: false,panelHeight:'auto',editable:false" missingMessage="�������" />
							</td>
							<td class="table_nemu_new">
								����ְ��
							</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text"
									id="updateBusiness" name="rescueExpert.business"
									data-options="required: false" missingMessage="����������ְ��" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">
								�칫�ҵ绰
							</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updateOfficePhone" name="rescueExpert.officePhone" validtype="phone" />
							</td>
							<td class="table_nemu_new">
								סլ�绰
							</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updateHomePhone" validtype="phone" name="rescueExpert.homePhone"/>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">
								�ֻ�
							</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updateMobilePhone" validtype="mobile" name="rescueExpert.mobilePhone" />
							</td>
							<td class="table_nemu_new">
								���
							</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updateNumber"
									name="rescueExpert.number" data-options="required: false"
									missingMessage="���������" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">
								��ͥסַ
							</td>
							<td class="table_con" colspan="3">
								<input class="easyui-validatebox" type="text" size="70"
									id="updateAddress" name="rescueExpert.address"
									data-options="required: false" missingMessage="�������ͥסַ" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">
								������λ
							</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text"
									id="updateOrganize" name="rescueExpert.organize"
									data-options="required: true" missingMessage="������������λ" />
							</td>
							<td class="table_nemu_new">
								��������
							</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text"
									id="updateDepartment" name="rescueExpert.department"
									data-options="required: false" missingMessage="��������������" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new" width="25%">
								��������
							</td>
							<td class="table_con" colspan="3">
								<textarea rows="3" cols="70" id="updateExperience" name="rescueExpert.experience"></textarea>
							</td>
						</tr>
					</table>
					<br />
					</div>
				</form>
			</div>
		</div>
	</body>
</html>