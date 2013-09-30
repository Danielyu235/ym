<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>锅炉</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>

<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<script type="text/javascript">
$(document).ready(
 	function (){
 			// 参数1：访问路径;参数2：实体类名；参数3：title
 		eSelect = new Select('选择','${ctx}/jsp/ymxm/enterprise/EnterpriseSelect.jsp'
	    		 , null, function(id, corpName) {
	    	        $('input[name="boiler.dwdm"]').val(id);
	    	        $('input[name="boiler.corpName"]').val(corpName);
	    	        $('#corpName').val('');
	    });
 		grid = new Grid('${ctx}/boiler/boilerAction!list', 'data_list');
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'boiler',
			moduleName:'锅炉',
			url:'${ctx}/boiler/boilerAction',
			beforeSubmit:function() {
				 if($('#addForm input[name="boiler.dwdm"]').val() == '') {
					$.messager.alert("错误", "请选择所属单位");
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
	url += "<a title=\"查看\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"../../images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	<shiro:hasPermission name="48:update">
	url += "<a title=\"修改\" onclick='crud.update(\""+rowId+"\");' class='btn2'><img src=\"../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	if(rowData.hasMap == '1') { //已定位
		url += "<a title=\"定位\" onclick='window.top.gis.showPoint(\""+rowData.dwdm+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.boilerName +"\");' class='btn2' ><img src=\"${ctx}/images/showPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	} else {
		url += "<a title=\"打点\" onclick='window.top.gis.addPoint(\""+rowData.dwdm+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.boilerName +"\");' class='btn2' ><img src=\"${ctx}/images/addPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	}
	return url;
}

</script>
</head>
<body>
	 <div class="panel-header" style="width:100%;">
		<div class="panel-title panel-with-icon">锅炉信息列表</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
	 <div>
	        <form id="searchForm" method="post" style="display: inline;">
            <div style="margin-top:-8px;">
	       	&nbsp;&nbsp; 所属单位:&nbsp;&nbsp;<input type="text" class="easyui-validatebox" name="boiler.corpName" id="corpName"/>
	    	&nbsp;&nbsp;锅炉名称：&nbsp;&nbsp;
	        <input class="easyui-validatebox" id="boilerName" name="boiler.boilerName" data-options="validType:'length[1,25]'">
	        &nbsp;&nbsp;锅炉类型：
	         &nbsp;&nbsp;
	        <input class="easyui-combobox" id="boilerType" name="boiler.boilerType" data-options="valueField: 'id',textField: 'value',data: [{id: '蒸汽锅炉',value: '蒸汽锅炉'},{id: '热水锅炉',value: '热水锅炉'}],panelHeight:'auto',width:'100',editable:false" />
	        &nbsp;&nbsp; <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search();">查询</a>
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
	<div style="height:74%;">
	    <table id="data_list" style="display:none">
	        <thead>
	        <tr>
	         <th field="corpName" width="20%" align="center" title="corpName">所属单位</th>
	          <th field="boilerName" width="20%" align="center" title="boilerName">锅炉名称</th>
	            <th field="boilerType" width="20%" align="center" title="boilerType">锅炉类型</th>
	            <th field="installEndDate" width="10%" align="center" title="installEndDate">安装完工日期</th>
	            <th field="inputUseDate" width="10%" align="center" title="inputUseDate">投入使用日期</th>
	            <th align="center" field="id" width="10%" formatter="gridFormatter">操作</th>  
	        </tr>
	        </thead>
	    </table>
	</div>
	
	<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" 
			data-options="iconCls:'icon-save',modal:true,
    			minimizable:true,maximizable:true,collapsible:true,draggable:false">
		<form method="post" >
	     <input type="hidden" id="updateId" name="boiler.id"/>
	     <input type="hidden" name="boiler.dwdm"/>
		    <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
		   		 <tr>
						<td class="table_nemu_new" width="25%">所属单位</td>
						<td class="table_con" colspan="3"><input type="text" class="easyui-validatebox" name="boiler.corpName"
								data-options="validType:'maxByteLength[100]'" disabled="disabled"/>
								<input type="button" value="选择" onclick="eSelect.open()"/></td>
				</tr>
		   		<tr>
					<td class="table_nemu_new" width="25%">锅炉型号</td>
					<td class="table_con" width="25%"><input class="easyui-validatebox"  id="updateBoilerModel" name="boiler.boilerModel" /></td>
					<td class="table_nemu_new" width="25%">锅炉名称</td>
					<td class="table_con" width="25%"><input class="easyui-validatebox" name="boiler.boilerName" id="updateBoilerName" data-options="required: true" missingMessage="请输入锅炉名称"/></td>
				</tr>
				<tr>
					<td class="table_nemu_new">编 &nbsp;&nbsp;号</td>
					<td class="table_con"><input class="easyui-validatebox" name="boiler.boilerNumber" id="updateBoilerNumber"  data-options="required: true" missingMessage="请输入编号"/></td>
					<td class="table_nemu_new">锅炉类型</td>
					<td class="table_con"><input class="easyui-combobox" id="updateBoilerType" name="boiler.boilerType" data-options="valueField: 'id',textField: 'value',data: [{id: '蒸汽锅炉',value: '蒸汽锅炉'},{id: '热水锅炉',value: '热水锅炉'}],panelHeight:'auto',width:'100',required: true,editable:false" missingMessage="请选择锅炉类型"/></td>
					
				</tr>
				<tr>
					<td class="table_nemu_new">具体位置</td>
					<td class="table_con" colspan="3"><textarea id="updateBoilerLocation" name="boiler.boilerLocation" rows="3" cols="70"></textarea></td>
				</tr>
				<tr>
					<td class="table_nemu_new">制造厂名</td>
					<td class="table_con"><input class="easyui-validatebox" id="updateMakeName" name="boiler.makeName" /></td>
					<td class="table_nemu_new">制造日期</td>
					<td class="table_con"><input type="text" readonly="readonly" onClick="WdatePicker()" class="Wdate" name="boiler.makeTime" id="updateMakeTime" /></td>
				</tr>
				<tr>
					<td class="table_nemu_new">投入使用日期</td>
					<td class="table_con" ><input type="text" readonly="readonly"  onClick="WdatePicker()" class="Wdate"  name="boiler.installEndDate" id="updateInstallEndDate" /></td>
					<td class="table_nemu_new">安装完工日期</td>
					<td class="table_con" ><input type="text" readonly="readonly" onClick="WdatePicker()" class="Wdate"  name="boiler.inputUseDate" id="updateInputUseDate" /></td>
				</tr>
				<tr>
					<td class="table_nemu_new">设计工作压力（MPa）</td>
					<td class="table_con" ><input class="easyui-validatebox" id="updateDesginWorkPressure" name="boiler.desginWorkPressure" data-options="required: true" missingMessage="请输入设计工作压力"/></td>
					<td class="table_nemu_new">许可使用压力（MPa）</td>
					<td class="table_con"><input class="easyui-validatebox" id="updatePermitUsePressure" name="boiler.permitUsePressure" data-options="required: true" missingMessage="请输入许可使用压力"/></td>
				</tr>
				<tr>
					<td class="table_nemu_new">额定供热量（KCal/h）</td>
					<td class="table_con"><input class="easyui-validatebox" id="updateFixLayHeat" name="boiler.fixLayHeat" missingMessage="请输入额定供热量"/><br/>
					<td class="table_nemu_new">或额定出力（t/h）</td>
					<td class="table_con"><input class="easyui-validatebox" id="updateLimitOutput" name="boiler.limitOutput"  missingMessage="请输入额定出力"/></td>
					</tr>
				<tr>
					<td class="table_nemu_new">介质出口温度（℃）</td>
					<td class="table_con"><input class="easyui-validatebox" id="updateAgentEcportTemperature" name="boiler.agentEcportTemperature" data-options="required: true" missingMessage="请输入介质出口温度"/></td>
					<td class="table_nemu_new">水处理方法</td>
					<td class="table_con" ><input class="easyui-validatebox" id="updateWaterManageMethod" name="boiler.waterManageMethod" /></td>
					</tr>
				<tr>
					<td class="table_nemu_new">备注（移装、检修、改造、事故记录）</td>
					<td class="table_con" colspan="3"><textarea class="easyui-validatebox" id="updateRemarks" name="boiler.remarks" rows="3" cols="70"></textarea></td>
				</tr>
				<tr>
					<td class="table_nemu_new">填报人</td>
					<td class="table_con"><input type="text" class="easyui-validatebox" name="boiler.tbr" id="updateTbr" data-options="required: true" missingMessage="请输入填报人"/></td>
					<td class="table_nemu_new">锅炉用途</td>
					<td class="table_con"><input class="easyui-validatebox" id="updateBoilerUse" name="boiler.boilerUse"/></td>
				</tr>
				<tr>
					<td class="table_nemu_new">联系电话</td>
					<td class="table_con"><input type="text" class="easyui-validatebox" name="boiler.tblxdh" id="updateTblxdh"  data-options="required: true" missingMessage="请输入联系电话"/></td>
					<td class="table_nemu_new">填报日期</td>
					<td class="table_con"><input type="text" class="easyui-my97 easyui-validatebox" data-options="required:true,readOnly:true" name="boiler.tbrq" id="updateTbrq"/></td>
				</tr>
			</table>
			</div>
	   	</form>
	</div>
	</div>
	
</body>
</html>