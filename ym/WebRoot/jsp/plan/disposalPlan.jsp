<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>现场处置方案</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
<link rel="stylesheet" href="${ctx}/css/planCrud.css" type="text/css"></link>
<script type="text/javascript">
$(document).ready(
 	function (){
 		//urlValue: 项目访问根路径;    typeId: 数据库中对应的下拉类型id; 
 		//$('#oneId'): 一级下拉列对象;  $('#twoId'): 二级下拉列对象 ; $('#threeId'): 三级下拉列对象;
 		//list页面查询
 		onloadCombobox('${ctx}','yajb',$('#select_yadjId'),null,null);
 		onloadCombobox('${ctx}','sglx',$('#select_accidenttypeFather'),null,null);
 		//$('#addAccidenttypeFather').combobox('validate');//下拉框必填项的验证
 		//更新页面
 		onloadCombobox('${ctx}','yajb',$('#updatePlanLeve'),null,null);
 		onloadCombobox('${ctx}','sglx',$('#updateAccidenttypeFather'),null,null);
 		grid = new Grid('${ctx}/tbPlanDisposal/tbPlanDisposalAction!list', 'data_list');
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'tbPlanDisposal',
			moduleName:'现场处置方案',
			url:'${ctx}/tbPlanDisposal/tbPlanDisposalAction',
			afterViewLoadData:function(viewFormObject, data) {
				var accidenttypeFatherData = data.accidenttypeFatherText;
				if(data.accidenttypeSonText != null&&data.accidenttypeSonText != "") accidenttypeFatherData += "/"+data.accidenttypeSonText;
				$(viewFormObject).find('span[name="tbPlanDisposal.accidenttypeFather"]').text(accidenttypeFatherData);
				$(viewFormObject).find('span[name="tbPlanDisposal.planLeve"]').text(data.planLeveText);
			}
			
		});
 	}
  ); 
  //加载表单操作列
function gridFormatter(value, rowData, rowIndex) {
	var rowId = rowData.id;
	var url = "";
	<shiro:hasPermission name="48:view">
	url += "<a title=\"查看\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"../../images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	<shiro:hasPermission name="48:update">
	url += "<a title=\"修改\" onclick='crud.update(\""+rowId+"\");' class='btn2'><img src=\"../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	url += "<a title=\"查看指挥人员\"  onclick='peopleFunction(\""+rowId+"\");' class='btn2'><img src=\"../../images/selectExpert.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	url += "<a title=\"查看救援资源\"  onclick='resourceFunction(\""+rowId+"\");' class='btn2'><img src=\"../../images/selectResource.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	url += "<a title=\"查看附件\"  onclick='attachmentFunction(\""+rowId+"\");'  class='btn2'><img src=\"../../images/selectAttachment.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	return url;
}

//合并事故类型的父级和子级字段
function fatherAndSon(value,row,index){
	if(row.accidenttypeSonText != null && row.accidenttypeSonText!='' ){
		var str = value + "/" + row.accidenttypeSonText;
	}else {
		var str = value ;
	}
	
	return str;
}
</script>
</head>
<body>
	 <div class="panel-header" style="width:100%;">
		<div class="panel-title panel-with-icon">现场处置方案列表</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	 <div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
    <div id="search">
	        <form id="searchForm" method="post" style="display: inline;">
	        &nbsp;&nbsp;预案名称：&nbsp;&nbsp;
	        <input class="easyui-validatebox" id="searchPlanName" name="tbPlanDisposal.planName" data-options="validType:'length[1,25]'" style="width: 120px;">
	        &nbsp;&nbsp;事故类型：&nbsp;&nbsp;
	        <input id="select_accidenttypeFather" class="easyui-combobox" data-options="panelHeight:'auto',editable:false" name="tbPlanDisposal.accidenttypeFather" style="width: 120px;" readonly value="" >
	        &nbsp;&nbsp;预案级别：&nbsp;&nbsp; <input id="select_yadjId" class="easyui-combobox" data-options="panelHeight:'auto',editable:false" name="tbPlanDisposal.planLeve" value="" >
	        &nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search();">查询</a>
			&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch();">清空</a>
	        </form>
	    </div>
        </div>
        <div class="search_add">
		<shiro:hasPermission name="48:add">
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add', plain:true" onclick="crud.add();">添加</a>
		</shiro:hasPermission>
		<shiro:hasPermission name="48:delete">		
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove', plain:true" onclick="crud.remove();">删除</a>
		</shiro:hasPermission>
	    </div>
	<!-- 表单表头 -->
	<div style="height:74%;">
	    <table id="data_list" style="display:none">
	        <thead>
	        <tr>
	          <th field="planName" width="30%" align="center" title="planName">预案名称</th>
	            <th field="accidenttypeFatherText" width="20%" align="center" title="accidenttypeFatherText" formatter="fatherAndSon">事故类型</th>
	            <th field="time" width="15%" align="center" title="time">建立时间</th>
	            <th field="planLeveText" width="8%" align="center" title="planLeveText">预案级别</th>
	            <th align="center" field="id" width="20%" formatter="gridFormatter">操作</th>     
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
					 <input type="hidden" id="updateId" name="tbPlanDisposal.id"/>
					 <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
		   		<tr>
					<td class="table_nemu_new" width="15%">预案名称</td>
					<td class="table_con" width="15%"><input class="easyui-validatebox" type="text"  id="updatePlanname" name="tbPlanDisposal.planName" data-options="required: true" missingMessage="请输入预案名称"/></td>
					<td class="table_nemu_new" width="15%">预案类型</td>
					<td class="table_con" width="15%">
						现场处置方案
						<input type="hidden" name="tbPlanDisposal.planType" id="updatePlanType" value="现场处置方案"/>
					</td>
				</tr>
				<tr>
					<td class="table_nemu_new">事故类型</td>
					<td class="table_con">
						<input id="updateAccidenttypeFather" class="easyui-combobox" data-options="panelHeight:'auto',width:'100',editable:false" name="tbPlanDisposal.accidenttypeFather" style="width: 100px;" value="" >
					</td>
					<td class="table_nemu_new">预案级别</td>
					<td class="table_con"><input id="updatePlanLeve" class="easyui-combobox" data-options="panelHeight:'auto',width:'100',editable:false" name="tbPlanDisposal.planLeve" value="--请选择--" data-options="required: true" missingMessage="请输入预案级别"/></td>
				</tr>
				<tr height="100%">
					<td class="table_nemu_new" rowspan="8">具体内容</td>
					<td class="table_nemu_new" colspan="3">
						<FONT SIZE="3"><B>1 事故特征</B></FONT></br></br>
				</tr>
				<tr height="100%">
					<td class="table_con" colspan="5"><textarea name="tbPlanDisposal.accidentCharacteristics" style="width:80%;height:80px;"></textarea></td>
				</tr>
				
				<tr height="100%">
					<td class="table_nemu_new" colspan="3">
						<FONT SIZE="3"><B>2 应急组织与职责</B></FONT></br></br>
				</tr>
				<tr height="100%">
					<td class="table_con" colspan="3"><textarea name="tbPlanDisposal.organizeDuty" style="width:80%;height:80px;"></textarea></td>
				</tr>
				
				<tr height="100%">
					<td class="table_nemu_new" colspan="3">
						<FONT SIZE="3"><B>3 应急处置</B></FONT></br></br>
				</tr>
				<tr height="100%">
					<td class="table_con" colspan="3"><textarea name="tbPlanDisposal.emergencyDisposal" style="width:80%;height:80px;"></textarea></td>
				</tr>

				<tr height="100%">
					<td class="table_nemu_new" colspan="3">
						<FONT SIZE="3"><B>4 注意事项</B></FONT></br></br>
				</tr>
				<tr height="100%">
					<td class="table_con" colspan="3"><textarea name="tbPlanDisposal.attention" style="width:80%;height:80px;"></textarea></td>
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