<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>压力容器</title>
<link rel="stylesheet" href="${ctx}/css/bus.css" type="text/css"></link>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript">
	$(function(){
		eSelect = new Select('选择', '${ctx}/jsp/ymxm/enterprise/EnterpriseSelect.jsp'
	    		 , null, function(id, corpName) {
	    	        //alert(id + ":" + corpName);
	    	        $('#addForm input[name="pressureVesselHazards.dwdm"]').val(id);
	    	        $('#addForm input[name="pressureVesselHazards.corpName"]').val(corpName);
	    });
		mSelect = new Select('选择', '${ctx}/jsp/hazards/materials/MaterialsSelect.jsp'
	    		 , null, function(id, name) {
	    	        //alert(id + ":" + corpName);
	    	        $('#addForm input[name="pressureVesselHazards.materialsId"]').val(id);
	    	        $('#addForm input[name="pressureVesselHazards.jiezhi"]').val(name);
	    });
		oSelect = new Select('自定义危险物质', '${ctx}/jsp/hazards/materials/OtherMaterialsSelect.jsp'
	    		 , {width:'900px', height:'200px'}, function(id, name) {
	    	        //alert(id + ":" + corpName);
	    	        $('#addForm input[name="pressureVesselHazards.materialsId"]').val(id);
	    	        $('#addForm input[name="pressureVesselHazards.jiezhi"]').val(name);
	    });
	});
		$(document).ready(function () {
		     grid = new Grid('${ctx}/pressureVesselHazards/pressureVesselHazardsAction!list', 'data_list');
		     grid.loadGrid();
		     crud = new Crud({
		     	grid:grid, 
		     	addFormObject:$('#addForm'), 
		     	searchFormObject:$('#searchForm'),
		     	entityName:'pressureVesselHazards',
		     	moduleName:'压力容器',
		    	url:'${ctx}/pressureVesselHazards/pressureVesselHazardsAction',
		    	beforeSubmit:function() {
		    			 if($('input[name="pressureVesselHazards.dwdm"]').val() == '') {
	    						$.messager.alert("错误", "请选择所属单位");
	    						return false;
	    				 }
		    			 if($('input[name="pressureVesselHazards.materialsId"]').val() == '') {
			                	$.messager.alert("错误", "请选择危险物质");
	        					return;
	        			 }
		    			 return true;
		    		 }
		    });
		});
        function gridFormatterLength(value, rowData, rowIndex) {
        	if(value==null || value == '' || value == 'undefined')
        		return '';
    		if(value.length > 25)
    			return value.substring(0, 25) + '...';
    		return value;
    	}
        function viewChildFunction(rowId) {
			$('#childFrame').attr('src', 'PeriodicalSurveyHazards.jsp?pressureId=' + rowId);
			$('#viewChildForm').dialog({
				title:'查看定时检查情况',
				modal:true,
				draggable:false,
				minimizable:true,
				maximizable:true,
				maximized:true,
				buttons:[{
					text:'取消',
					iconCls:'icon-cancel',
					handler:function() {
						$('#viewChildForm').dialog('close');
					}
				}]
			});
		}
        function gridFormatter(value, rowData, rowIndex) {
        	var rowId = rowData.id;
        	var url = "";
        	url += "<a title=\"查看\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"../../images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
        	url += "<a title=\"修改\" onclick='crud.update(\""+rowId+"\");' class='btn2'><img src=\"../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
        	url += "<a title=\"查看定时检查情况\" onclick='viewChildFunction(\""+rowId+"\");' class='btn2'><img src=\"../../images/selectTime.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
        	if(rowData.hasMap == '1') { //已定位
			url += "<a title=\"定位\" onclick='window.top.gis.showPoint(\""+rowData.dwdm+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.name +"\");' class='btn2' ><img src=\"${ctx}/images/showPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
			} else {
			url += "<a title=\"打点\" onclick='window.top.gis.addPoint(\""+rowData.dwdm+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.name +"\");' class='btn2' ><img src=\"${ctx}/images/addPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
			}
        	return url;
        }
        
</script>
</head>
<body>
<div class="panel-header" style="width:100%;">
<div class="panel-title panel-with-icon">压力容器信息列表</div>
<div class="panel-icon icon-edit"></div>
<div class="panel-tool"></div>
</div>
<div class="datagrid-toolbar" id ="tb" style="padding-left:0px;height:10px;">
<div>
	<form id="searchForm" style="display: inline;">
	<div style="margin-top:-8px;">
	&nbsp;&nbsp;所属单位:&nbsp;&nbsp;<input type="text" name="pressureVesselHazards.corpName" />
	&nbsp;&nbsp;名称:&nbsp;&nbsp;<input type="text" name="pressureVesselHazards.name" />
	&nbsp;&nbsp;编号:&nbsp;&nbsp;<input type="text" name="pressureVesselHazards.ownId" />
	&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search()">查询</a>
	&nbsp;&nbsp;
	<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch()">清空</a>
	</div>
	</form>
</div>
</div>
<div class="search_add">
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add', plain:true" onclick="crud.add()">添加</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-delete', plain:true" onclick="crud.remove()">删除</a>
<!-- 	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-exp', plain:true" onclick="expFunction()">导出</a> -->
</div>
<div style="height:74%;">
    <table id="data_list" loadMsg="正在努力拉取数据中..." fit="true" fitColumns="true">
        <thead>
        <tr>
            <th align="center" field="corpName" width="150" formatter="gridFormatterLength" >所属单位</th>
            <th align="center" field="name" width="150" formatter="gridFormatterLength" >名称</th>
            <th align="center" field="ownId" width="150" formatter="gridFormatterLength" >编号</th>
            <th align="center" field="registerId" width="150" formatter="gridFormatterLength" >注册编号</th>
            <th align="center" field="id" width="80" formatter="gridFormatter">操作</th>         
        </tr>
        </thead>
    </table>
</div>

	<!-- 添加更新窗口 -->
	<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" 
			data-options="iconCls:'icon-save',modal:true,
    			minimizable:true,maximizable:true,collapsible:true,draggable:false">
		<form method="post" >
			<input type="hidden" name="pressureVesselHazards.id"/>
			<input type="hidden" class="easyui-validatebox" name="pressureVesselHazards.dwdm"/>
			<input type="hidden" name="pressureVesselHazards.materialsId"/>
			<input type="hidden" name="pressureVesselHazards.jiezhi"/>
			<div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
				 		<tr>
				 			<td class="table_nemu_new" width="25%">所属单位</td>
							<td class="table_con" colspan="3">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.corpName"
							data-options="validType:'maxByteLength[100]'" disabled="disabled"/>
							<input type="button" value="选择" onclick="eSelect.open()"/>
							</td>
				 		</tr>
						<tr>
							<td class="table_nemu_new" width="25%">名称</td>
							<td class="table_con" width="25%">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.name"
							data-options="required:true,validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new" width="25%">编号</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.ownId"
							data-options="required:true,validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">注册编号</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.registerId"
							data-options="required:true,validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">使用证编号</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.certificateId"
							data-options="required:true,validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">类别</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.type"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">设计单位</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.designDept"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">投用年月</td>
							<td class="table_con">
							<input type="text" onfocus="WdatePicker({readOnly:true})"  class="Wdate"  name="pressureVesselHazards.useTime"
							data-options="validType:'maxByteLength[100]',editable:false" />
							</td>
							<td class="table_nemu_new">容积（m3）</td>
								<td class="table_con">
								<input type="text" class="easyui-numberbox" name="pressureVesselHazards.volume"
								data-options="max:100000000000,	groupSeparator:',', precision:2" />
								</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">制造单位</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.createDept"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">制造年月</td>
							<td class="table_con">
							<input type="text"  onfocus="WdatePicker({readOnly:true})"  class="Wdate"  name="pressureVesselHazards.createYear"
							data-options="editable:false,validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">出厂编号</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.facoryId"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">筒体</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.tongti"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">封头</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.fengtou"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">内衬</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.neichen"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">内径（mm）</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="pressureVesselHazards.neijing"
							data-options="max:100000000000,	groupSeparator:','" />
							</td>
						
							<td class="table_nemu_new">设计压力（MPa）</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="pressureVesselHazards.designPresure"
							data-options="max:100000000000,	groupSeparator:',', precision:2" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">壁厚（mm）</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="pressureVesselHazards.bihou"
							data-options="max:100000000000,	groupSeparator:','" />
							</td>
						
							<td class="table_nemu_new">最高工作压力（MPa）</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="pressureVesselHazards.zggzyl"
							data-options="required:true,max:100000000000,groupSeparator:',', precision:2" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">高（长）（mm）</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="pressureVesselHazards.height"
							data-options="max:100000000000,	groupSeparator:','" />
							</td>
						
							<td class="table_nemu_new">设计温度（℃）</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="pressureVesselHazards.designTemp"
							data-options="max:100000000000,	groupSeparator:',', precision:2" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">介质</td>
							<td class="table_con" colspan="3">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.jiezhi" disabled="disabled"/>
							<input type="button" value="选择" onclick="mSelect.open()"/>
							<input type="button" value="自定义" onclick="oSelect.open()"/>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">有无保温、绝热</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="pressureVesselHazards.haveBw"
							data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'有'},{v:'无'}],editable:false" panelHeight="auto"/>
							</td>
						
							<td class="table_nemu_new">是否有安全阀</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="pressureVesselHazards.haveAqf"
							data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'是'},{v:'否'}],editable:false" panelHeight="auto"/>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">是否有爆破片</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="pressureVesselHazards.haveBpp"
							data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'是'},{v:'否'}],editable:false" panelHeight="auto"/>
							</td>
						
							<td class="table_nemu_new">是否有紧急切断阀</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="pressureVesselHazards.haveJjqdf"
							data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'是'},{v:'否'}],editable:false" panelHeight="auto"/>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">是否有压力表</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="pressureVesselHazards.haveYlb"
							data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'是'},{v:'否'}],editable:false" panelHeight="auto"/>
							</td>
						
							<td class="table_nemu_new">是否有液面计</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="pressureVesselHazards.haveYmy"
							data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'是'},{v:'否'}],editable:false" panelHeight="auto"/>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">安全状况等级</td>
							<td colspan="3" class="table_con">
							<textarea class="easyui-validatebox" name="pressureVesselHazards.safeLevel"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[4000]'">
							</textarea>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">备注</td>
							<td colspan="3" class="table_con">
							<textarea class="easyui-validatebox" name="pressureVesselHazards.remark"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[4000]'">
							</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">填表人</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.saveMan"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">联系电话</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.contactPhone"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">填表日期</td>
							<td class="table_con">
							<input type="text" onfocus="WdatePicker({readOnly:true})"  class="Wdate"  name="pressureVesselHazards.saveTime"
							data-options="validType:'maxByteLength[100]',editable:false" />
							</td>
							<td class="table_con" colspan="2">
							</td>
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