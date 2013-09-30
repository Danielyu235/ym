<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/jqueryhead.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>专项应急预</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
<link rel="stylesheet" href="${ctx}/css/planCrud.css" type="text/css"></link>
<script type="text/javascript">
	$(document).ready(
			function() {
				//urlValue: 项目访问根路径;    typeId: 数据库中对应的下拉类型id; 
				//$('#oneId'): 一级下拉列对象;  $('#twoId'): 二级下拉列对象 ; $('#threeId'): 三级下拉列对象;
				onloadCombobox('${ctx}', 'yajb', $('#yadjId'), null, null);
				onloadCombobox('${ctx}', 'sglx', $('#sglx_oneId'),
						$('#sglx_twoId'), null);
				onloadCombobox('${ctx}', 'yajb', $('#updateYajb'), null,null);
				onloadCombobox('${ctx}', 'sglx', $('#updateSglx_oneId'),null,null);
			grid = new Grid('${ctx}/specialPlan/specialPlanAction!list', 'data_list');
			grid.loadGrid();
			crud = new Crud({
				grid:grid, 
				addFormObject:$('#addForm'), 
				searchFormObject:$('#searchForm'),
				entityName:'specialPlan',
				moduleName:'专项应急预案',
				url:'${ctx}/specialPlan/specialPlanAction',
				afterViewLoadData:function(viewFormObject, data) {
					var accidentTypeData = data.accidentTypeText;
					if(data.accidentTypeSubclassText != null)accidentTypeData += "/"+data.accidentTypeSubclassText;
					$(viewFormObject).find('span[name="specialPlan.accidentType"]').text(accidentTypeData);
					$(viewFormObject).find('span[name="specialPlan.planLevel"]').text(data.planLevelText);
				}
				
			});
	});
  //合并事故类型的父级和子级字段
function fatherAndSon(value,row,index){
	if(row.accidentTypeSubclassText != null && row.accidentTypeSubclassText!='' ){
		var str = value + "/" + row.accidentTypeSubclassText;
	}else {
		var str = value ;
	}
	return str;
}
	//加载表单操作列
	function gridFormatter(value, rowData, rowIndex) {
		var rowId = rowData.id;
		var url = "";
		<shiro:hasPermission name="48:view">
	url += "<a title=\"查看\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"../../images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	<shiro:hasPermission name="48:update">
	url += "<a title=\"修改\" onclick='crud.update(\""+rowId+"\");'  class='btn2'><img src=\"../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	url += "<a title=\"查看指挥人员\"  onclick='peopleFunction(\""+rowId+"\");' class='btn2'><img src=\"../../images/selectExpert.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	url += "<a title=\"查看救援资源\"  onclick='resourceFunction(\""+rowId+"\");' class='btn2'><img src=\"../../images/selectResource.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	url += "<a title=\"查看附件\" onclick='attachmentFunction(\""+rowId+"\");'  class='btn2'><img src=\"../../images/selectAttachment.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	return url;
	}
</script>
</head>
<body>

	<div class="panel-header" style="width: 100%;">
		<div class="panel-title panel-with-icon">专项应急预案列表</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	 <div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
		<div>
			<form id="searchForm" method="post" style="display: inline;">
					&nbsp;&nbsp;预案名称：&nbsp;&nbsp;<input class="easyui-validatebox"
						id="searchPlanName" name="specialPlan.planName"
						data-options="validType:'length[1,25]'">
					&nbsp;&nbsp;事故类型：&nbsp;&nbsp;<input id="sglx_oneId"
						class="easyui-combobox"
						data-options="panelHeight:'auto',width:'100'"
						name="specialPlan.accidentType"  style="width: 100px;" value="">
					&nbsp;&nbsp;预案级别：&nbsp;&nbsp;<input id="yadjId"
						class="easyui-combobox"
						data-options="panelHeight:'auto',editable:false"
						name="specialPlan.planLevel" value=""> &nbsp;&nbsp;<a
						href="javascript:void(0)" class="easyui-linkbutton"
						iconCls="icon-search" onclick="crud.search();">查询</a> &nbsp;&nbsp;<a
						href="javascript:void(0);" class="easyui-linkbutton"
						iconCls="icon-clear" onclick="crud.clearSearch();">清空</a>
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

	<div style="height:74%;">
		<table id="data_list">
			<thead>
				<tr>
					<th field="planName" width="30%" align="center" title="">预案名称</th>
					<th field="accidentTypeText" width="20%" align="center"
						title="accidentTypeText" formatter="fatherAndSon">事故类型</th>
					<th field="time" width="15%" align="center" title="time">建立时间</th>
					<th field="planLevelText" width="8%" align="center"
						title="planLevelText">预案级别</th>
					<th field="id" width="20%" align="center" formatter="gridFormatter">操作</th>
				</tr>
			</thead>
		</table>
	</div>
	<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" 
			data-options="iconCls:'icon-save',modal:true,
    			minimizable:true,maximizable:true,collapsible:true,draggable:false">
		<form method="post" >
					<input type="hidden" name="specialPlan.id" />
					 <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
				<tr height="100%">
					<td class="table_nemu_new" width="15%">预案名称</td>
					<td class="table_con" width="15%"><input class="easyui-validatebox"
						data-options="required:true" name="specialPlan.planName" /></td>
					<td class="table_nemu_new"width="15%">预案类型</td>
					<td class="table_con" width="15%">
					专项应急预案
						<input type="hidden" name="specialPlan.planType" id="updatePlanType" value="专项应急预案"/></td>
				</tr>
				<tr height="100%">
					<td class="table_nemu_new">事故类型</td>
					<td class="table_con"><input id="updateSglx_oneId"
						class="easyui-combobox"
						data-options="panelHeight:'auto',width:'100'"
						name="specialPlan.accidentType" style="width: 100px;" value="--请选择--">
					<td class="table_nemu_new">预案等级</td>
					<td class="table_con"><input id="updateYajb"
						class="easyui-combobox"
						data-options="panelHeight:'auto',editable:false"
						name="specialPlan.planLevel" value="--请选择--"
						data-options="required: true" missingMessage="请输入预案级别" /></td>
				</tr>
				<tr height="100%">
					<td class="table_nemu_new" rowspan="32" width="15%">预案内容</td>
					<td class="table_nemu_new" colspan="3" width="15%"><FONT SIZE="5"><B>1
								专项应急预案的主要内容</B></FONT><br /> <FONT SIZE="4"><B>1.1 事故类型和危害程度分析</B></FONT>
					</td>
				</tr>
				<tr height="100%">
					<td colspan="3" class="table_con"><textarea
							class="easyui-validatebox" name="specialPlan.typeHarmAnalysis"
							style="width: 80%; height: 80px;"></textarea></td>
				</tr>
				<tr height="100%">
					<td class="table_nemu_new" colspan="3"><FONT SIZE="4"><B>1.2
								应急处置基本原则</B></FONT></td>
				</tr>
				<tr>
					<td class="table_con" colspan="3"><textarea
							class="easyui-validatebox" name="specialPlan.basicPrinciples"
							style="width: 80%; height: 80px;"></textarea></td>
				</tr>
				<tr>
					<td class="table_nemu_new" colspan="3"><FONT SIZE="5"><B>2
								组织机构及职责</B></FONT></td>
				</tr>
				<tr>
					<td class="table_nemu_new" colspan="3"><FONT SIZE="4"><B>2.1
								应急组织体系</B></FONT></td>
				</tr>
				<tr>
					<td class="table_con" colspan="3"><textarea
							class="easyui-validatebox"
							name="specialPlan.emergencyOrganizationSystem"
							style="width: 80%; height: 80px;"></textarea></td>
				</tr>
				<tr>
					<td class="table_nemu_new" colspan="3"><FONT SIZE="4"><B>2.2
								指挥机构及职责</B></FONT></td>
				</tr>
				<tr>
					<td class="table_con" colspan="3"><textarea
							class="easyui-validatebox"
							name="specialPlan.structureResponsibilities"
							style="width: 80%; height: 80px;"></textarea></td>
				</tr>
				<tr>
					<td class="table_nemu_new" colspan="3"><FONT SIZE="5"><B>3
								预防</B></FONT></td>
				</tr>
				<tr>
					<td class="table_nemu_new" colspan="3"><FONT SIZE="4"><B>3.1
								危险源监控</B></FONT></td>
				</tr>
				<tr>
					<td class="table_con" colspan="3"><textarea
							class="easyui-validatebox" name="specialPlan.hazardControl"
							style="width: 80%; height: 80px;"></textarea></td>
				</tr>
				<tr>
					<td class="table_nemu_new" colspan="3"><FONT SIZE="5"><B>4
								预警</B></FONT></td>
				</tr>
				<tr>
					<td class="table_nemu_new" colspan="3"><FONT SIZE="4"><B>4.1
								预警行动</B></FONT></td>
				</tr>
				<tr>
					<td class="table_con" colspan="3"><textarea
							class="easyui-validatebox" name="specialPlan.actionWarning"
							style="width: 80%; height: 80px;"></textarea></td>
				</tr>
				<tr>
					<td class="table_nemu_new" colspan="3"><FONT SIZE="4"><B>5
								信息报告程序</B></FONT></td>
				</tr>
				<tr>
					<td class="table_con" colspan="3"><textarea
							class="easyui-validatebox"
							name="specialPlan.informationReportingProcedures"
							style="width: 80%; height: 80px;"></textarea></td>
				</tr>
				<tr>
					<td class="table_nemu_new" colspan="3"><FONT SIZE="5"><B>6
								应急处理</B></FONT></td>
				</tr>
				<tr>
					<td class="table_nemu_new" colspan="3"><FONT SIZE="4"><B>6.1
								响应分级</B></FONT></td>
				</tr>
				<tr>
					<td class="table_con" colspan="3"><textarea
							class="easyui-validatebox" name="specialPlan.responseGrading"
							style="width: 80%; height: 80px;"></textarea></td>
				</tr>
				<tr>
					<td class="table_nemu_new" colspan="3"><FONT SIZE="4"><B>6.2
								响应程度</B></FONT></td>
				</tr>
				<tr>
					<td class="table_con" colspan="3"><textarea
							class="easyui-validatebox" name="specialPlan.responseDegree"
							style="width: 80%; height: 80px;"></textarea></td>
				</tr>
				<tr>
					<td class="table_nemu_new" colspan="3"><FONT SIZE="4"><B>6.3
								处置措施</B></FONT></td>
				</tr>
				<tr>
					<td class="table_con" colspan="3"><textarea
							class="easyui-validatebox" name="specialPlan.disposalMeasures"
							style="width: 80%; height: 80px;"></textarea></td>
				</tr>
				<tr>
					<td class="table_nemu_new" colspan="3"><FONT SIZE="5"><B>7
								应急物资与装备保障</B></FONT></td>
				</tr>
				<tr>
					<td class="table_con" colspan="3"><textarea
							class="easyui-validatebox" name="specialPlan.suppliesEquipment"
							style="width: 80%; height: 80px;"></textarea></td>
				</tr>
			</table>
			</div>
		</form>
</div>
	</div>
	
	<script type="text/javascript">
	
	//调用指挥人员list页面
	function peopleFunction(rowId) {
			$('#peopleFrame').attr('src', 'plan_expert.jsp?id=' + rowId);
			$('#viewPeopleForm').dialog({
				title:'查看指挥人员',
				modal:true,
				draggable:false,
				minimizable:true,
				maximizable:true,
				maximized:true,
				onClose:function(){
					$('#data_list').datagrid('reload');
				},
				buttons:[{
					text:'取消',
					iconCls:'icon-cancel',
					handler:function() {
						$('#viewPeopleForm').dialog('close');
					}
				}]
			});
		}
	//调用救援资源list页面
	function resourceFunction(rowId) {
			$('#resourceFrame').attr('src', 'plan_resource.jsp?id=' + rowId);
			$('#viewResourceForm').dialog({
				title:'查看救援资源',
				modal:true,
				draggable:false,
				minimizable:true,
				maximizable:true,
				maximized:true,
				onClose:function(){
					$('#data_list').datagrid('reload');
				},
				buttons:[{
					text:'取消',
					iconCls:'icon-cancel',
					handler:function() {
						$('#viewResourceForm').dialog('close');
					}
				}]
			});
		}
		//调用附件页面
	function attachmentFunction(rowId) {
			$('#attachmentFrame').attr('src', '${ctx}/jsp/sys/fileUpload/uploadFile.jsp?relationId=' + rowId);
			$('#viewAttachmentForm').dialog({
				title:'查看救援资源',
				modal:true,
				draggable:false,
				minimizable:true,
				maximizable:true,
				maximized:true,
				buttons:[{
					text:'取消',
					iconCls:'icon-cancel',
					handler:function() {
						$('#viewAttachmentForm').dialog('close');
					}
				}]
			});
	}
	</script>
	<!-- 指挥人员层 -->
	<div style="display: none;">
		<div id="viewPeopleForm" style="width: 960px; height: 400px;" data-options="iconCls:'icon-save'">
			<iframe frameborder="0" id="peopleFrame" width="100%" height="98%" scrolling-x="no"></iframe>
		</div>
	</div>
	<!-- 救援资源层 -->
	<div style="display: none;">
		<div id="viewResourceForm" style="width: 960px; height: 400px;" data-options="iconCls:'icon-save'">
			<iframe frameborder="0" id="resourceFrame" width="100%" height="98%" scrolling-x="no"></iframe>
		</div>
	</div>
		<!--附件层 -->
	<div style="display: none;">
		<div id="viewAttachmentForm" style="width: 960px; height: 400px;" data-options="iconCls:'icon-save'">
			<iframe frameborder="0" id="attachmentFrame" width="100%" height="98%" scrolling-x="no"></iframe>
		</div>
	</div>
</body>
</html>