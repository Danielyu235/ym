<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>危险物质</title>
<link rel="stylesheet" type="text/css" href="${ctx}/css/bus.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/newCrud.css">
<script type="text/javascript" src="${ctx}/js/GridUtilNoToolBar.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
</head>
<body>
<div class="panel-header" style="width:100%;">
<div class="panel-title panel-with-icon">选择危险物质</div>
<div class="panel-icon icon-edit"></div>
<div class="panel-tool"></div>
</div>
<div class="datagrid-toolbar" id ="tb" style="padding-left:0px;height:10px;">
<div>
	<form id="materialsSearchForm" style="display: inline;">
	<div style="margin-top:-8px;">
	&nbsp;&nbsp;物质类型:&nbsp;&nbsp;<input type="text" name="materials.type" class="easyui-combobox" 
	data-options="validType:'maxByteLength[100]',valueField:'v', textField:'v', data:
	[{v:'爆炸品'},{v:'易燃气体'},{v:'毒性气体'},{v:'易燃液体'},{v:'易于自燃的物质'}
	,{v:'遇水放出易燃气体的物质'},{v:'氧化性物质'},{v:'有机过氧化物'},{v:'毒性物质'}
	,{v:'氧化性气体'},{v:'易燃固体'}],editable:false" panelHeight="auto"/>
	&nbsp;&nbsp;物质名称:&nbsp;&nbsp;<input type="text" name="materials.name" />
	&nbsp;&nbsp;临界量:&nbsp;&nbsp;<input type="text" name="materials.thresholdQuantity" />
	
	&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="materialsGrid_searchForm()">查询</a>
	&nbsp;&nbsp;
	<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="materialsGrid_clearSearchForm()">清空</a>
	</div>
	</form>
</div>
</div>
<div class="search_add">
</div>

<div style="height:50%;">
    <table id="materialsGrid_" loadMsg="正在努力拉取数据中..." fit="true" fitColumns="true">
        <thead>
        <tr>
            <th align="center" field="type" width="150">物质类型</th>
            <th align="center" field="name" width="150">物质名称</th>
            <th align="center" field="thresholdQuantity" width="150">临界量</th>
            <th align="center" field="id" width="120" formatter="materials_gridFormatt">操作</th>         
        </tr>
        </thead>
    </table>
</div>
<script type="text/javascript">
	$(document).ready(function () {
		var materialsGrid_setting = {
				title : '',
				iconCls : 'icon-edit',
				nowrap : false,
				striped : true,
				border : true,
				collapsible : false,
				fit : true,
				url : '${ctx}/materials/materialsAction!list',
				remoteSort : false,
				idField : 'id',
				singleSelect : true,
				pagination : true,
				rownumbers : true,
				loadMsg:"正在努力拉取数据中...",
				fit : true,
			    fitColumns:true,
				frozenColumns : [],
				toolbar : '',
			    onLoadSuccess: function(data){}		          
		};
		$('#materialsGrid_').datagrid(materialsGrid_setting);
		var materialsGrid_pageController = $('#materialsGrid_').datagrid('getPager');

		var materialsGrid_pageSettings = {
			pageSize : 10,
			pageList : [ 10, 15, 20, 30 ],
			beforePageText : '第',
			afterPageText : '页    共{pages} 页',
			displayMsg : '当前显示 {from} - {to} 条记录  共{total}条记录',
			buttons :[{
				iconCls:"icon-search",
				handler : function(){
					var num = materialsGrid_pageController.data().pagination.bb.num.val();
					materialsGrid_pageController.pagination("select",num);
				}
			}]
			
		};
		$(materialsGrid_pageController).pagination(materialsGrid_pageSettings);
	});
	function materialsGrid_searchForm() { 
		var params = $.form2Json($('#materialsSearchForm'));
		$('#materialsGrid_').datagrid('load', params);
	}
	function materialsGrid_clearSearchForm() {
		$('#materialsSearchForm').form('clear');
	}
    function materials_selectFunction(id, name) {
    	if(typeof mSelect.callBack != 'function'){
			$.messager.alert('错误','请传递的回调函数!');  
			return;
		}
		mSelect.callBack(id, name);
    }
    function materials_gridFormatt(value, rowData, rowIndex) {
		var url = "";
		url += "<a title=\"选择\" onclick='materials_selectFunction(\""+rowData.id+"\",\""+rowData.name+"\");' class='btn2'><img src=\"${ctx}/images/choose.png\"></img></a>&nbsp;&nbsp;&nbsp;&nbsp;";
		return url;
	}
</script>
</body>
</html>