<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>定期检查情况</title>

<link rel="stylesheet" type="text/css" href="${ctx}/css/bus.css">
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript">
		var pressureId = '${param.pressureId}';
		$(document).ready(function () {
		     grid = new Grid('${ctx}/periodicalSurveyHazards/periodicalSurveyHazardsAction!list?periodicalSurveyHazards.pressureId=' + pressureId,'data_list');
		     grid.loadGrid();
		     crud = new Crud({
		     	grid:grid, 
		     	addFormObject:$('#addForm'),
		     	searchForm:$('#searchForm'),
		     	entityName:'periodicalSurveyHazards',
		     	moduleName:'定期检查情况',
		    	url:'${ctx}/periodicalSurveyHazards/periodicalSurveyHazardsAction',
		    	beforeSubmit:function() {
		    			$('#addForm [name="periodicalSurveyHazards.pressureId"]').val(pressureId);
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
<div class="panel-title panel-with-icon">定期检查情况信息列表</div>
<div class="panel-icon icon-edit"></div>
<div class="panel-tool"></div>
</div>
<div class="datagrid-toolbar" id ="tb" style="padding-left:0px;height:10px;">
<div>
	<form id="searchForm" style="display: inline;">
	<div style="margin-top:-8px;">
	&nbsp;&nbsp;检查时间:&nbsp;&nbsp;<input type="text" onClick="WdatePicker()" class="Wdate"  name="periodicalSurveyHazards.date" data-options="editable:false" />
	&nbsp;&nbsp;检查结果:&nbsp;&nbsp;<input type="text" name="periodicalSurveyHazards.result" />
	
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
            <th align="center" field="date" width="150" formatter="gridFormatterLength" >检查时间</th>
            <th align="center" field="result" width="150" formatter="gridFormatterLength" >检查结果</th>
            <th align="center" field="situation" width="150" formatter="gridFormatterLength" >检查情况</th>
            <th align="center" field="id" width="120" formatter="gridFormatter">操作</th>         
        </tr>
        </thead>
    </table>
</div>

	<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" 
			data-options="iconCls:'icon-save',modal:true,
    			minimizable:true,maximizable:true,collapsible:true,draggable:false">
		<form method="post">
			<input type="hidden" name="periodicalSurveyHazards.id"/>
			<input type="hidden" name="periodicalSurveyHazards.pressureId"/>
			<div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
						<tr>
							<td class="table_nemu">检查时间</td>
							<td class="table_con" >
							<input type="text" onfocus="WdatePicker({readOnly:true})"  class="Wdate"  name="periodicalSurveyHazards.date"
							data-options="required:true,validType:'maxByteLength[100]',editable:false" />
							</td>
							<td class="table_nemu">检查结果</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="periodicalSurveyHazards.result"
							data-options="required:true,validType:'maxByteLength[100]'" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu">检查情况</td>
							<td class="table_con" colspan="3">
							<textarea class="easyui-validatebox" name="periodicalSurveyHazards.situation"
							 style="width: 80%; height: 120px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
				</table>
			</div>
		</form>
		</div>
	</div>
</body>
</html>