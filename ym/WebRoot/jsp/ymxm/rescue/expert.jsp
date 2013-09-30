<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="gb2312"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/jqueryhead.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>救援专家</title>
		<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
		<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
		<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
		<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
		<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
		<script type="text/javascript">
//加载页面就执行
$(document).ready(
 	function (){
 		//urlValue: 项目访问根路径;    typeId: 数据库中对应的下拉类型id; 
 		//$('#oneId'): 一级下拉列对象;  $('#twoId'): 二级下拉列对象 ; $('#threeId'): 三级下拉列对象;
 		//list页面查询
 		onloadCombobox('${ctx}','zjzy',$('#select_specialized'),null,null);
 		onloadCombobox('${ctx}','zjzb',$('#select_workGroup'),null,null);
 		//更新页面
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
			moduleName:'救援专家',
			url:'${ctx}/rescueExpert/rescueExpertAction',
			afterViewLoadData:function(viewFormObject, data) {
				$(viewFormObject).find('span[name="rescueExpert.specialized"]').text(data.specializedText);
				$(viewFormObject).find('span[name="rescueExpert.workGroup"]').text(data.workGroupText);
				$(viewFormObject).find('span[name="rescueExpert.sex"]').text(data.sexText);
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
				救援专家列表
			</div>
			<div class="panel-icon icon-edit"></div>
			<div class="panel-tool"></div>
		</div>

		<div class="datagrid-toolbar" id="tb"  style="padding-left:0px; height:10px;">
			<div>
				<form id="searchForm" method="post" style="display: inline;">
                   <div style="margin-top:-8px">
					&nbsp;&nbsp;姓名:&nbsp;&nbsp;<input id="select_name" name="rescueExpert.name" data-options="validType:'length[1,25]'" />
					&nbsp;&nbsp;专业:&nbsp;&nbsp;<input id="select_specialized" name="rescueExpert.specialized"  data-options="panelHeight:'auto',width:'100',editable:false" value="" />
					&nbsp;&nbsp;组别:&nbsp;&nbsp;<input id="select_workGroup" name="rescueExpert.workGroup" readonly data-options="panelHeight:'auto',width:'100',editable:false" value="" />
					&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search();">查询</a> &nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch();">清空</a>
                    </div>
				</form>
			</div>
            </div>
            <div class="search_add">
			<shiro:hasPermission name="48:add">
				<a href="javascript:void(0)" class="easyui-linkbutton"
					data-options="iconCls:'icon-add', plain:true"
					onclick="crud.add()">添加</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="48:delete">
				<a href="javascript:void(0)" class="easyui-linkbutton"
					data-options="iconCls:'icon-remove', plain:true"
					onclick="crud.remove();">删除</a>
			</shiro:hasPermission>
		</div>
		<!-- 表单表头 -->
		<div style="height:78%;">
			<table id="data_list" style="display: none">
				<thead>
					<tr>
						<th field="name" width="150" align="center" title="name">
							姓名
						</th>
						<th field="specializedText" width="150" align="center"
							title="specializedText">
							专业
						</th>
						<th field="workGroupText" width="150" align="center" title="workGroupText">
							组别
						</th>
						<th field="business" width="150" align="center" title="business">
							现任职务
						</th>
						<th field="mobilePhone" width="150" align="center"
							title="mobilePhone">
							手机号码
						</th>
						<th align="center" field="id" width="160" align="center"
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
					<input type="hidden" id="updateId" name="rescueExpert.id" />
					 <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
						<tr>
							<td class="table_nemu_new"  width="25%">
								姓名
							</td>
							<td class="table_con" width="25%">
								<input class="easyui-validatebox" type="text" id="updateName"
									name="rescueExpert.name" data-options="required: true"
									missingMessage="请输姓名" />
							</td>
							<td class="table_nemu_new"  width="25%">
								性别
							</td>
							<td class="table_con"  width="25%">
								<input type="text" id="updateSex" name="rescueExpert.sex" data-options="required: true,panelHeight:'auto',editable:false" missingMessage="请输性别" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">
								年龄
							</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updateAge" name="rescueExpert.age" validtype="positiveInt"/>
							</td>
							<td class="table_nemu_new">
								专业
							</td>
							<td class="table_con">
								<input type="text" id="updateSpecialized" name="rescueExpert.specialized" data-options="required: true,panelHeight:'auto',editable:false" missingMessage="请输入专业" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">
								组别
							</td>
							<td class="table_con">
								<input id="updateWorkGroup" name="rescueExpert.workGroup" data-options="required: false,panelHeight:'auto',editable:false" missingMessage="请输组别" />
							</td>
							<td class="table_nemu_new">
								现任职务
							</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text"
									id="updateBusiness" name="rescueExpert.business"
									data-options="required: false" missingMessage="请输入现任职务" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">
								办公室电话
							</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updateOfficePhone" name="rescueExpert.officePhone" validtype="phone" />
							</td>
							<td class="table_nemu_new">
								住宅电话
							</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updateHomePhone" validtype="phone" name="rescueExpert.homePhone"/>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">
								手机
							</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updateMobilePhone" validtype="mobile" name="rescueExpert.mobilePhone" />
							</td>
							<td class="table_nemu_new">
								序号
							</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updateNumber"
									name="rescueExpert.number" data-options="required: false"
									missingMessage="请输入序号" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">
								家庭住址
							</td>
							<td class="table_con" colspan="3">
								<input class="easyui-validatebox" type="text" size="70"
									id="updateAddress" name="rescueExpert.address"
									data-options="required: false" missingMessage="请输入家庭住址" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">
								所属单位
							</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text"
									id="updateOrganize" name="rescueExpert.organize"
									data-options="required: true" missingMessage="请输入所属单位" />
							</td>
							<td class="table_nemu_new">
								所属部门
							</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text"
									id="updateDepartment" name="rescueExpert.department"
									data-options="required: false" missingMessage="请输入所属部门" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new" width="25%">
								工作经历
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