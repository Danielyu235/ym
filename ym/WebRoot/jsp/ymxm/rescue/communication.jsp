<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="gb2312"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/jqueryhead.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<title>ͨѶ����</title>
	<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
	<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
	<script type="text/javascript">
//����ҳ���ִ��
$(document).ready(
 	function (){
 		grid = new Grid('${ctx}/rescueCommunication/rescueCommunicationAction!list', 'data_list');
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'rescueCommunication',
			moduleName:'ͨѶ����',
			url:'${ctx}/rescueCommunication/rescueCommunicationAction'
		});
 	}
 	
  ); 
  
//���ر������У���ť��
function gridFormatter(value, rowData, rowIndex) {
	var rowId = rowData.id;
	var url = "";
	<shiro:hasPermission name="48:view">
	url += "<a title=\"�鿴\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"../../../images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	<shiro:hasPermission name="48:update">
	url += "<a title=\"�޸�\" onclick='crud.update(\""+rowId+"\");' class='btn2'><img src=\"../../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
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
				ͨѶ�����б�
			</div>
			<div class="panel-icon icon-edit"></div>
			<div class="panel-tool"></div>
		</div>

		<div class="datagrid-toolbar" id="tb"  style="padding-left:0px; height:10px;">
			<div>
				<form id="searchForm" method="post" style="display: inline;">
					&nbsp;&nbsp;��������:&nbsp;&nbsp;
					<input id="select_name" name="rescueCommunication.name" data-options="validType:'length[1,25]'" />
					&nbsp;&nbsp;������:&nbsp;&nbsp;
					<input id="select_director" name="rescueCommunication.director" data-options="validType:'length[1,25]'" />
					&nbsp;&nbsp;
					<a href="javascript:void(0)" class="easyui-linkbutton"
						iconCls="icon-search" onclick="crud.search();">��ѯ</a> &nbsp;&nbsp;
					<a href="javascript:void(0);" class="easyui-linkbutton"
						iconCls="icon-clear" onclick="crud.clearSearch();">���</a>
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
		<div style="height: 78%;">
			<table id="data_list" style="display: none">
				<thead>
					<tr>
						<th field="name" width="150" align="center" title="name">
							��������
						</th>
						<th field="carNumber" width="150" align="center" title="carNumber">
							��������������
						</th>
						<th field="personnelNumber" width="150" align="center" title="personnelNumber">
							��Ա�������ˣ�
						</th>
						<th field="director" width="150" align="center" title="director">
							������
						</th>
						<th field="telephone" width="150" align="center" title="telephone">
							�����˵绰
						</th>
						<th field="mobilePhone" width="150" align="center" title="mobilePhone">
							�������ֻ�
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
					<input type="hidden" id="updateId" name="rescueCommunication.id" />
					 <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
						<tr>
							<td class="table_nemu_new" width="25%">
								��������
							</td>
							<td class="table_con" width="25%">
								<input class="easyui-validatebox" type="text" id="updateName" name="rescueCommunication.name" data-options="required: true" missingMessage="�������������" />
							</td>
							<td class="table_nemu_new" width="25%">
								������
							</td>
							<td class="table_con" width="25%">
								<input class="easyui-validatebox" type="text" id="updateDirector" name="rescueCommunication.director" data-options="required: true" missingMessage="�����븺����" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">
								�����˵绰
							</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updateTelephone" name="rescueCommunication.telephone" validtype="phoneNumber"/>
							</td>
							<td class="table_nemu_new">
								�������ֻ�
							</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updateMobilePhone" name="rescueCommunication.mobilePhone" validtype="mobile"/>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">
								��ϵ��1
							</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updateContactsOne" name="rescueCommunication.contactsOne" data-options="required: false" missingMessage="��������ϵ��1" />
							</td>
							<td class="table_nemu_new">
								��ϵ��1�绰
							</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updateContactsOneTelephone" name="rescueCommunication.contactsOneTelephone" validtype="phoneNumber"/>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">
								��ϵ��1�ֻ�
							</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updateContactsOneMobilePhone" name="rescueCommunication.contactsOneMobilePhone" validtype="mobile"/>
							</td>
							<td class="table_nemu_new">
								��ϵ��2
							</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updateContactsTwo" name="rescueCommunication.contactsTwo" data-options="required: false" missingMessage="��������ϵ��2" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">
								��ϵ��2�绰
							</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updateContactsTwoTelephone" name="rescueCommunication.contactsTwoTelephone" validtype="phoneNumber"/>
							</td>
							<td class="table_nemu_new">
								��ϵ��2�ֻ�
							</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updateContactsTwoMobilePhone" name="rescueCommunication.contactsTwoMobilePhone" validtype="mobile"/>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">
								ͨѶ����������
							</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updateCarNumber" name="rescueCommunication.carNumber" validtype="positiveInt"/>
							</td>
							<td class="table_nemu_new">
								��Ա���ˣ�
							</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updatePersonnelNumber" name="rescueCommunication.personnelNumber" validtype="positiveInt"/>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new" width="25%">
								��ַ
							</td>
							<td class="table_con" colspan="3">
								<input class="easyui-validatebox" type="text" size="70" id="updateAddress" name="rescueCommunication.address" data-options="required: false" missingMessage="�������ַ" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new" width="25%">
								�����������
							</td>
							<td class="table_con" colspan="3">
								<textarea  rows="3" cols="70" id="updateOrganizeIntroduce"
									name="rescueCommunication.organizeIntroduce" class="easyui-validatebox"
									data-options="required: false" missingMessage="�����볡���������"></textarea>
							</td>
						</tr>
					</table>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>