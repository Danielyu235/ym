<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="gb2312"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/jqueryhead.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>技术支持</title>
		<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
		<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
		<script type="text/javascript">
//加载页面就执行
$(document).ready(
 	function (){
 		//加载list数据
 		grid = new Grid('${ctx}/rescueTechnical/rescueTechnicalAction!list', 'data_list');
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'rescueTechnical',
			moduleName:'技术支持',
			url:'${ctx}/rescueTechnical/rescueTechnicalAction'
			});
 	}
  ); 
  
//加载表单操作列（按钮）
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
		url += "<a title=\"定位\" onclick='window.top.gis.showPoint(\""+rowData.id+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.name +"\");' class='btn2' ><img src=\"${ctx}/images/showPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	} else {
		url += "<a title=\"打点\" onclick='window.top.gis.addPoint(\""+rowData.id+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.name +"\");' class='btn2' ><img src=\"${ctx}/images/addPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	}
	return url;
}
</script>
	</head>
	<body>

		<div class="panel-header" style="width: 100%;">
			<div class="panel-title panel-with-icon">
				技术支持列表
			</div>
			<div class="panel-icon icon-edit"></div>
			<div class="panel-tool"></div>
		</div>

		<div class="datagrid-toolbar" id="tb" style="padding-left:0px; height:10px;">
		<div>
				   <form id="searchForm" method="post" style="display: inline;">
                    <div style="margin-top:-8px;">
					&nbsp;&nbsp;机构名称:&nbsp;&nbsp;<input id="select_name" name="rescueTechnical.name" data-options="validType:'length[1,25]'" />
					&nbsp;&nbsp;负责人:&nbsp;&nbsp;<input id="select_director" name="rescueTechnical.director" data-options="validType:'length[1,25]'" />
					&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search();">查询</a> &nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch();">清空</a>
                    </div>
				</form>
			</div>
            </div>
             <div class="search_add">
			<shiro:hasPermission name="48:add">
				<a href="javascript:void(0)" class="easyui-linkbutton"
					data-options="iconCls:'icon-add', plain:true"
					onclick="crud.add();">添加</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="48:delete">
				<a href="javascript:void(0)" class="easyui-linkbutton"
					data-options="iconCls:'icon-remove', plain:true"
					onclick="crud.remove();">删除</a>
			</shiro:hasPermission>
		    </div>
		<!-- 表单表头 -->
		<div style="height: 74%;">
			<table id="data_list" style="display: none">
				<thead>
					<tr>
						<th field="name" width="150" align="center" title="name">
							机构名称
						</th>
						<th field="mechanismSpeciality" width="150" align="center" title="mechanismSpeciality">
							机构特长
						</th>
						<th field="personnelNumber" width="150" align="center" title="personnelNumber">
							人员数量（人）
						</th>
						<th field="director" width="150" align="center" title="director">
							负责人
						</th>
						<th field="telephone" width="150" align="center" title="telephone">
							负责人电话
						</th>
						<th field="mobilePhone" width="150" align="center" title="mobilePhone">
							负责人手机
						</th>
						<th align="center" field="id" width="160" 
							formatter="gridFormatter">
							操作
						</th>
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
					<input type="hidden" id="updateId" name="rescueTechnical.id" />
					<div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
						<tr>
							<td class="table_nemu_new" width="25%">
								机构名称
							</td>
							<td class="table_con" width="25%">
								<input class="easyui-validatebox" type="text" id="updateName" name="rescueTechnical.name" data-options="required: true" missingMessage="请输入机构名称" />
							</td>
							<td class="table_nemu_new" width="25%">
								负责人
							</td>
							<td class="table_con" width="25%">
								<input class="easyui-validatebox" type="text" id="updateDirector" name="rescueTechnical.director" data-options="required: true" missingMessage="请输入负责人" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">
								负责人电话
							</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updateTelephone" name="rescueTechnical.telephone" validtype="phoneNumber"/>
							</td>
							<td class="table_nemu_new">
								负责人手机
							</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updateMobilePhone" name="rescueTechnical.mobilePhone" validtype="mobile"/>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">
								联系人1
							</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updateContactsOne" name="rescueTechnical.contactsOne" data-options="required: false" missingMessage="请输入联系人1" />
							</td>
							<td class="table_nemu_new">
								联系人1电话
							</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updateContactsOneTelephone" name="rescueTechnical.contactsOneTelephone" validtype="phoneNumber"/>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">
								联系人1手机
							</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updateContactsOneMobilePhone" name="rescueTechnical.contactsOneMobilePhone" validtype="mobile"/>
							</td>
							<td class="table_nemu_new">
								联系人2
							</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updateContactsTwo" name="rescueTechnical.contactsTwo" data-options="required: false" missingMessage="请输入联系人2" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">
								联系人2电话
							</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updateContactsTwoTelephone" name="rescueTechnical.contactsTwoTelephone" validtype="phoneNumber"/>
							</td>
							<td class="table_nemu_new">
								联系人2手机
							</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updateContactsTwoMobilePhone" name="rescueTechnical.contactsTwoMobilePhone" validtype="mobile"/>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">
								机构特长
							</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updateMechanismSpeciality" name="rescueTechnical.mechanismSpeciality" data-options="required: false" missingMessage="请输入机构特长" />
							</td>
							<td class="table_nemu_new">
								人员（人）
							</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updatePersonnelNumber" name="rescueTechnical.personnelNumber" validtype="positiveInt"/>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">
								地址
							</td>
							<td class="table_con" colspan="3">
								<input class="easyui-validatebox" type="text" size="70" id="updateAddress" name="rescueTechnical.address" data-options="required: false" missingMessage="请输入地址" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">
								场所情况介绍
							</td>
							<td class="table_con" colspan="3">
								<textarea cols="70" rows="3" id="updateOrganizeIntroduce"
									name="rescueTechnical.organizeIntroduce" class="easyui-validatebox"
									data-options="required: false" missingMessage="请输入场所情况介绍"></textarea>
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