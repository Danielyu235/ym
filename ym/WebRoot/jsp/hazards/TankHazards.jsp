<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>贮罐</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link> 
<script type="text/javascript">
$(document).ready(
 	function (){
		mSelect = new Select('选择', '${ctx}/jsp/hazards/materials/MaterialsSelect.jsp'
	    		 , null, function(id, name) {
	    	        //alert(id + ":" + corpName);
	    	        $('input[name="tankHazards.materialsId"]').val(id);
	    	        $('input[name="tankHazards.keepMatterName"]').val(name);
	    });
		oSelect = new Select('自定义危险物质', '${ctx}/jsp/hazards/materials/OtherMaterialsSelect.jsp'
	    		 , {width:'900px', height:'200px'}, function(id, name) {
	    	        //alert(id + ":" + corpName);
	    	        $('input[name="tankHazards.materialsId"]').val(id);
	    	        $('input[name="tankHazards.keepMatterName"]').val(name);
	    });
	    grid = new Grid('${ctx}/tankHazards/tankHazardsAction!list?tankHazards.tankAraeID=${param.tankAraeID}', 'data_list');
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'tankHazards',
			moduleName:'贮罐',
			url:'${ctx}/tankHazards/tankHazardsAction',
			beforeSubmit:function() {
			 		$("#updateTankAraeID").val('${param.tankAraeID}');
				 if($('#addForm input[name="tankHazards.materialsId"]').val() == '') {
					$.messager.alert("错误", "请选择贮存物质名称");
					return false;
			 	 }
				 return true;
			}
		});
 	}
  ); 
function gridFormatter(value, rowData, rowIndex) {
	var rowId = rowData.id;
	var url = "";
	<shiro:hasPermission name="48:view">
	url += "<a title=\"查看\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"${ctx}/images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	<shiro:hasPermission name="48:update">
	url += "<a title=\"修改\" onclick='crud.update(\""+rowId+"\");' class='btn2'><img src=\"${ctx}/images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	return url;
}
</script>
</head>
<body>
	 <div class="panel-header" style="width:100%;">
		<div class="panel-title panel-with-icon">贮罐信息列表</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	<div class="dataGrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
	 <div>
	        <form id="searchForm" method="post" style="display: inline;">
            <div style="margin-top:-8px;">
	       &nbsp;&nbsp;贮罐名称：&nbsp;&nbsp;
	        <input class="easyui-validatebox" id="tankName" name="tankHazards.tankName" data-options="validType:'length[1,25]'">
	        &nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search();">查询</a>
			&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch();">清空</a>
            </div>
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
	<div style="height:78%;">
	    <table id="data_list" style="display:none">
	        <thead>
	        <tr>
	          <th field="tankName" width="20%" align="center" title="tankName">贮罐名称</th>
	           <th field="keepMatterName" width="20%" align="center" title="keepMatterName">贮存物质名称</th>
	            <th field="tankMaterial" width="20%" align="center" title="tankMaterial">贮罐材质</th>
	            <th field="operationDate" width="10%" align="center" title="operationDate">投产时间</th>
	            <th align="center" field="id" width="10%" align="center" formatter="gridFormatter">操作</th>     
	        </tr>
	        </thead>
	    </table>
	</div>
	
<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" 
			data-options="iconCls:'icon-save',modal:true,
    			minimizable:true,maximizable:true,collapsible:true,draggable:false">
		<form method="post" >
		<input type="hidden" id="updateTankAraeID" name="tankHazards.tankAraeID" value=""/>
	     <input type="hidden" id="updateId" name="tankHazards.id"/>
	     <input type="hidden" id="updateId" name="tankHazards.materialsId"/>
	     <input type="hidden" id="updateId" name="tankHazards.keepMatterName"/>
		    <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
		   		<tr>
		   			<td class="table_nemu_new" width="25%">编号</td>
					<td class="table_con" width="25%"> 
						<input class="easyui-validatebox" id="updateTankNumber" name="tankHazards.tankNumber"
						data-options="validType:'maxByteLength[100]'" />
					</td>
					<td class="table_nemu_new" width="25%">贮罐名称</td>
					<td class="table_con" >
						<input type="text" class="easyui-validatebox" id="updateTankName" name="tankHazards.tankName"
						data-options="validType:'maxByteLength[100]'" data-options="required: true" missingMessage="请输入贮罐名称"/>
					</td>
				</tr>
				<tr>
		   			<td class="table_nemu_new">贮罐形状</td>
					<td class="table_con">
						<input class="easyui-combobox" id="updateTankFrom" name="tankHazards.tankForm"
						data-options="valueField: 'id',textField: 'value',data: [{id: '立式圆筒罐',value: '立式圆筒罐'},{id: '球形罐',value: '球形罐'},{id: '卧式圆筒罐',value: '卧式圆筒罐'}],panelHeight:'auto',width:'100'" />
					</td>
					<td class="table_nemu_new">贮罐形式</td>
					<td class="table_con">
						<input class="easyui-combobox" id="updateTankShape" name="tankHazards.tankShape"
						data-options="valueField: 'id',textField: 'value',data: [{id: '固定顶罐',value: '固定顶罐'},{id: '浮顶罐',value: '浮顶罐'}],panelHeight:'auto',width:'100'" />
					</td>
					</tr>
					<tr>
					<td class="table_nemu_new">安装形式</td>
					<td class="table_con">
						<input class="easyui-combobox" id="updateInstallShape" name="tankHazards.installShape"
						data-options="valueField: 'id',textField: 'value',data: [{id: '地上',value: '地上'},{id: '地下',value: '地下'},{id: '半地下',value: '半地下'}],panelHeight:'auto',width:'100'" />
					</td>
				
		   			<td class="table_nemu_new">贮罐材质</td>
					<td class="table_con">
						<input  class="easyui-validatebox" id="updateTankMaterial" name="tankHazards.tankMaterial"
						data-options="validType:'maxByteLength[100]'" />
					</td>
					</tr>
					<tr>
					<td class="table_nemu_new">公称直径（m）</td>
					<td class="table_con">
						<input class="easyui-validatebox" id="updateNominalDiameter" name="tankHazards.nominalDiameter"
						data-options="validType:'maxByteLength[100]'" />
					</td>
					<td class="table_nemu_new">容积（m³）</td>
					<td class="table_con">
						<input class="easyui-validatebox" id="updateVolume" name="tankHazards.volume"
						data-options="validType:'maxByteLength[100]'" />
					</td>
				</tr>
				<tr>
		   			<td class="table_nemu_new">贮存物质名称</td>
					<td class="table_con">
						<input id="updateKeepMatterName" name="tankHazards.keepMatterName"
						disabled="disabled" />
						<input type="button" value="选择" onclick="mSelect.open()"/>
						<input type="button" value="自定义" onclick="oSelect.open()"/>
					</td>
					<td class="table_nemu_new">物质状态</td>
					<td class="table_con">
						<input class="easyui-validatebox" id="updateMatterState" name="tankHazards.matterState"
						data-options="validType:'maxByteLength[100]'" />
					</td>
					</tr>
					<tr>
					<td class="table_nemu_new">日常最大贮存量（m³）</td>
					<td class="table_con">
						<input class="easyui-validatebox" id="updateMaxKeep" name="tankHazards.maxKeep"
						data-options="validType:'maxByteLength[100]'" />
					</td>
				
		   			<td class="table_nemu_new">设计压力(MPa)</td>
					<td class="table_con">
						<input class="easyui-validatebox" id="updateDesignAblity" name="tankHazards.designAblity"
						data-options="required: true" missingMessage="请输入设计压力" />
					</td>
					</tr>
					<tr>
					<td class="table_nemu_new">实际工作压力（MPa）</td>
					<td class="table_con">
						<input class="easyui-validatebox" id="updateRealAblity" name="tankHazards.realAblity"
						data-options="required: true" missingMessage="请输入实际工作压力" />
					</td>
					<td class="table_nemu_new">设计温度（℃）</td>
					<td class="table_con">
						<input class="easyui-validatebox" id="updateDesignTemperature" name="tankHazards.designTemperature"
						data-options="required: true" missingMessage="请输入设计温度"/>
					</td>
				</tr>
				<tr>
		   			<td class="table_nemu_new">实际工作温度(℃)</td>
					<td class="table_con">
						<input class="easyui-validatebox" id="updateRealTemperature" name="tankHazards.realTemperature"
						data-options="required: true" missingMessage="请输入实际工作温度"/>
					</td>
					<td class="table_nemu_new">设计使用年限（年）</td>
					<td class="table_con">
						<input class="easyui-validatebox" id="updateDesignedServiceLife" name="tankHazards.designedServiceLife"
						data-options="validType:'maxByteLength[100]'" />
					</td>
					</tr>
					<tr>
					<td class="table_nemu_new">投产时间</td>
					<td class="table_con">
						<input onClick="WdatePicker()" readonly="readonly" class="Wdate"  id="updateOperationDate" name="tankHazards.operationDate"
						data-options="validType:'maxByteLength[100]'" />
					</td>
				
		   			<td class="table_nemu_new">进料方式</td>
					<td class="table_con">
						<input class="easyui-combobox" id="updateFeedingMode" name="tankHazards.feedingMode"
						data-options="valueField: 'id',textField: 'value',data: [{id: '管道',value: '管道'},{id: '铁路槽车',value: '铁路槽车'},{id: '槽车',value: '槽车'}],panelHeight:'auto',width:'100'" />
					</td>
					</tr>
					<tr>
					<td class="table_nemu_new">出料方式</td>
					<td class="table_con">
						<input class="easyui-combobox" id="updateDischargingMode" name="tankHazards.dischargingMode"
						data-options="valueField: 'id',textField: 'value',data: [{id: '管道',value: '管道'},{id: '铁路槽车',value: '铁路槽车'},{id: '槽车',value: '槽车'}],panelHeight:'auto',width:'100'"  />
					</td>
				
		   			<td class="table_nemu_new">进料管道直径（mm）</td>
					<td class="table_con">
						<input class="easyui-validatebox" id="updateFeedingDiameter" name="tankHazards.feedingDiameter"
						data-options="validType:'maxByteLength[100]'" />
					</td>
					</tr>
				   <tr>
					<td class="table_nemu_new">设计压力（MPa）</td>
					<td class="table_con">
						<input  class="easyui-validatebox" id="updateFeedingDesignAblity" name="tankHazards.feedingDesignAblity"
						data-options="validType:'maxByteLength[100]'" />
					</td>
					<td class="table_nemu_new">实际工作压力（MPa）</td>
					<td class="table_con">
						<input  class="easyui-validatebox" id="updateFeedingRealAblity" name="tankHazards.feedingRealAblity"
						data-options="validType:'maxByteLength[100]'" />
					</td>
				</tr>
				<tr>
		   			<td class="table_nemu_new">出料管道直径（mm）</td>
					<td class="table_con">
						<input class="easyui-validatebox" id="updateDischarginDiameter" name="tankHazards.discharginDiameter"
						data-options="validType:'maxByteLength[100]'" />
					</td>
					<td class="table_nemu_new">设计压力（MPa）</td>
					<td class="table_con">
						<input class="easyui-validatebox" id="updateDischarginDesignAblity" name="tankHazards.discharginDesignAblity"
						data-options="validType:'maxByteLength[100]'" />
					</td>
					</tr>
					<tr>
					<td class="table_nemu_new">实际工作压力（MPa）</td>
					<td class="table_con"  colSpan="3">
						<input class="easyui-validatebox" id="updateDischarginRealAblity" name="tankHazards.discharginRealAblity"
						data-options="validType:'maxByteLength[100]'" />
					</td>
				</tr>
			</table>
		</div>
	   	</form>
	</div>
	</div>
</body>
</html>