<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>库区</title>

<link rel="stylesheet" type="text/css" href="${ctx}/css/bus.css">
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript">
	$(function(){
		eSelect = new Select('选择', '${ctx}/jsp/ymxm/enterprise/EnterpriseSelect.jsp'
	    		 , null, function(id, corpName) {
	    	        $('input[name="reservoirAreaHazards.dwdm"]').val(id);
	    	        $('table input[name="reservoirAreaHazards.corpName"]').val(corpName);
	    });
	});
		$(document).ready(function () {
		     grid = new Grid('${ctx}/reservoirAreaHazards/reservoirAreaHazardsAction!list','data_list');
		     grid.loadGrid();
		     crud = new Crud({
			     grid:grid, 
			     addFormObject:$('#addForm'), 
			     searchFormObject:$('#searchForm'),
			     entityName:'reservoirAreaHazards',
			     moduleName:'库区',
		    	 url:'${ctx}/reservoirAreaHazards/reservoirAreaHazardsAction', 
		    	 dialogCss:{width:'900px',height:'350px'}, 
		    	 beforeSubmit:function() {
		    			 if($('input[name="reservoirAreaHazards.dwdm"]').val() == '') {
	    						$.messager.alert("错误", "请选择所属单位");
	    						return false;
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
			$('#childFrame').attr('src', 'ReservoirHazards.jsp?areaId=' + rowId);
			$('#viewChildForm').dialog({
				title:'查看库房信息',
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
				}],
				onClose: function() {
					grid.reloadGrid();
				}
			});
		}
        function gridFormatter(value, rowData, rowIndex) {
        	var rowId = rowData.id;
        	var url = "";
        	url += "<a title=\"查看\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"../../images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
        	url += "<a title=\"修改\" onclick='crud.update(\""+rowId+"\");' class='btn2'><img src=\"../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
        	url += "<a title=\"查看库房信息\" onclick='viewChildFunction(\""+rowId+"\");' class='btn2'><img src=\"../../images/selectReservoir.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
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
<div class="panel-title panel-with-icon">库区信息列表</div>
<div class="panel-icon icon-edit"></div>
<div class="panel-tool"></div>
</div>
<div class="datagrid-toolbar" id ="tb" style="padding-left:0px;height:10px;">
<div>
	<form id="searchForm" style="display: inline;">
	<div style="margin-top:-8px;">
		&nbsp;&nbsp;所属单位:&nbsp;&nbsp;<input type="text" name="reservoirAreaHazards.corpName" />
		&nbsp;&nbsp;库区名称:&nbsp;&nbsp;<input type="text" name="reservoirAreaHazards.name" />
		&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search()">查询</a>
		&nbsp;&nbsp;
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch()">清空</a>
	</div>
	</form>
</div>
</div>
<div class="search_add">
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add', plain:true" onclick="crud.add()">新增</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-delete', plain:true" onclick="crud.remove()">删除</a>
</div>

<div style="height:74%;">
    <table id="data_list" loadMsg="正在努力拉取数据中..." fit="true" fitColumns="true">
        <thead>
        <tr>
            <th align="center" field="corpName" width="150" formatter="gridFormatterLength" >所属单位</th>
            <th align="center" field="name" width="150" formatter="gridFormatterLength" >库区名称</th>
                 <th align="center" field="size" width="150" formatter="gridFormatterLength" >库房个数</th>
            <th align="center" field="environment" width="150" formatter="gridFormatterLength" >所处环境功能区</th>
            <th align="center" field="id" width="120" formatter="gridFormatter">操作</th>         
        </tr>
        </thead>
    </table>
</div>

	<!-- 添加更新窗口 -->
	<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" 
			data-options="iconCls:'icon-save',modal:true,
    			minimizable:true,maximizable:true,collapsible:true,draggable:false">
			<form method="post">
			<input type="hidden" name="reservoirAreaHazards.id"/>
			<input type="hidden" class="easyui-validatebox" name="reservoirAreaHazards.dwdm"/>
			<div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
						<tr>
							<td class="table_nemu_new" width="25%">所属单位</td>
							<td class="table_con" colspan="3">
							<input type="text" name="reservoirAreaHazards.corpName"
							disabled="disabled" />
							<input type="button" value="选择" onclick="eSelect.open()"/>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new" width="25%">编号</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="reservoirAreaHazards.no"
							data-options="required:true,validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new" width="25%">库区名称</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="reservoirAreaHazards.name"
							data-options="required:true,validType:'maxByteLength[100]'" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">具体位置</td>
							<td class="table_con" colspan="3">
							<textarea name="reservoirAreaHazards.location" rows="3" cols="70"></textarea>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">所处环境功能区</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="reservoirAreaHazards.environment"
							data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'工业区'},{v:'农业区'},{v:'商业区'},{v:'居民区'},{v:'行政办公区'},{v:'交通枢纽区'},{v:'科技文化区'},{v:'水源保护区'},{v:'文物保护区'}],editable:false" panelHeight="auto"/>
							</td>
						
							<td class="table_nemu_new">库区占地面积（m²）</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="reservoirAreaHazards.area"
							data-options="max:100000000000,	groupSeparator:',', precision:2" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">填表人</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="reservoirAreaHazards.saveMan"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new">联系电话</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="reservoirAreaHazards.contactPhone"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">填表日期</td>
							<td class="table_con">
							<input type="text" class="easyui-my97 easyui-validatebox" data-options="required:true,readOnly:true" name="reservoirAreaHazards.saveTime"/>
							</td>
							<td class="table_nemu_new"></td>
							<td class="table_con">
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