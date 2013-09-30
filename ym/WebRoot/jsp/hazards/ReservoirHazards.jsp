<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>库房</title>

<link rel="stylesheet" type="text/css" href="${ctx}/css/bus.css">
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript">
		var areaId = '${param.areaId}';
		$(document).ready(function () {
		     grid = new Grid('${ctx}/reservoirHazards/reservoirHazardsAction!list?reservoirHazards.areaId=' + areaId,'data_list');
		     grid.loadGrid();
		     crud = new Crud({
		    	 grid:grid, 
		    	 addFormObject:$('#addForm'),
		    	 searchFormObject:$('#searchForm'),
		    	 entityName:'reservoirHazards',
		    	 moduleName:'库房',
		    	 url:'${ctx}/reservoirHazards/reservoirHazardsAction', 
		    	 dialogCss:{width:'900px',height:'400px'},
		    	 beforeSubmit:function() {
		    			 $('#addForm [name="reservoirHazards.areaId"]').val(areaId);
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

        function gridFormatter(value, rowData, rowIndex) {
        	var rowId = rowData.id;
        	var url = "";
        	url += "<a title=\"查看\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"../../images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
        	url += "<a title=\"修改\" onclick='crud.update(\""+rowId+"\");' class='btn2'><img src=\"../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
        	return url;
        }
        
</script>
</head>
<body>
<div class="panel-header" style="width:100%;">
<div class="panel-title panel-with-icon">库房信息列表</div>
<div class="panel-icon icon-edit"></div>
<div class="panel-tool"></div>
</div>
<div class="datagrid-toolbar" id ="tb" style="padding-left:0px;height:10px;">
<div>
	<form id="searchForm" style="display: inline;">
	<div style="margin-top:-8px;">
	&nbsp;&nbsp;库房序号:&nbsp;&nbsp;<input type="text" name="reservoirHazards.no" />
	&nbsp;&nbsp;库房名称:&nbsp;&nbsp;<input type="text" name="reservoirHazards.name" />
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
</div>

<div style="height:74%;">
    <table id="data_list" loadMsg="正在努力拉取数据中..." fit="true" fitColumns="true">
        <thead>
        <tr>
            <th align="center" field="no" width="150" formatter="gridFormatterLength" >库房序号</th>
            <th align="center" field="name" width="150" formatter="gridFormatterLength" >库房名称</th>
            <th align="center" field="style" width="150" formatter="gridFormatterLength" >库房形式</th>
            <th align="center" field="structure" width="150" formatter="gridFormatterLength" >库房结构</th>
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
			<input type="hidden" name="reservoirHazards.id"/>
			<input type="hidden" name="reservoirHazards.areaId" />
			<div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
						<tr>
							<td class="table_nemu_new" width="25%">库房序号</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="reservoirHazards.no"
							data-options="required:true,validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new" width="25%">库房名称</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="reservoirHazards.name"
							data-options="required:true,validType:'maxByteLength[100]'" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">库房形式</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="reservoirHazards.style"
							data-options="required:true,validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'单层'},{v:'多层'}],editable:false" panelHeight="auto"/>
							</td>
							<td class="table_nemu_new">库房结构</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="reservoirHazards.structure"
							data-options="required:true,validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'混凝土结构'},{v:'砖木结构'},{v:'木质简易库房'},{v:'其它'}],editable:false" panelHeight="auto"/>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">设计使用年限（年）</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="reservoirHazards.useYearTime"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new">竣工时间</td>
							<td class="table_con">
							<input type="text" onfocus="WdatePicker({readOnly:true})"  class="Wdate"  name="reservoirHazards.buildTime"
							data-options="validType:'maxByteLength[100]',editable:false" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">占地面积（m2）</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="reservoirHazards.area"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new">有无防火墙</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="reservoirHazards.hasFireWall"
							data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'有'},{v:'无'}],editable:false" panelHeight="auto"/>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new" colspan="2" style="text-align: center;">库房储存物品种类</td>
							<td class="table_nemu_new" colspan="2" style="text-align: center;">数量</td>
						</tr>
						<tr>
							<td class="table_nemu_new" rowspan="3">民用爆破器材</td>
							<td class="table_nemu_new">起爆器材（t）</td>
							<td class="table_con" colspan="2">
							<input type="text" class="easyui-validatebox" name="reservoirHazards.explosionEquipment"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">工业炸药（t）</td>
							<td class="table_con" colspan="2">
							<input type="text" class="easyui-validatebox" name="reservoirHazards.explosionExplosive"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">爆炸危险原材料（t）</td>
							<td class="table_con" colspan="2">
							<input type="text" class="easyui-validatebox" name="reservoirHazards.explosionMaterials"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new" colspan="2">烟火剂、烟花爆竹（t）</td>
							<td class="table_con" colspan="2">
							<input type="text" class="easyui-validatebox" name="reservoirHazards.firecracker"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new" rowspan="2">易燃液体</td>
							<td class="table_nemu_new">闪点＜28℃（t）</td>
							<td class="table_con" colspan="2">
							<input type="text" class="easyui-validatebox" name="reservoirHazards.liquidLess"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">28℃≤闪点＜60℃（t）</td>
							<td class="table_con" colspan="2">
							<input type="text" class="easyui-validatebox" name="reservoirHazards.liquidMore"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new" rowspan="2">可燃气体</td>
							<td class="table_nemu_new">爆炸下限＜10%（t）</td>
							<td class="table_con" colspan="2">
							<input type="text" class="easyui-validatebox" name="reservoirHazards.gasLess"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">爆炸下限≥10%（t）</td>
							<td class="table_con" colspan="2">
							<input type="text" class="easyui-validatebox" name="reservoirHazards.gasMore"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new" rowspan="3">毒性物质</td>
							<td class="table_nemu_new">剧毒品（kg）</td>
							<td class="table_con" colspan="2">
							<input type="text" class="easyui-validatebox" name="reservoirHazards.poisonMost"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">有毒品（kg）</td>
							<td class="table_con" colspan="2">
							<input type="text" class="easyui-validatebox" name="reservoirHazards.poisonMore"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">有害品（t）</td>
							<td class="table_con" colspan="2">
							<input type="text" class="easyui-validatebox" name="reservoirHazards.poisonLittle"
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