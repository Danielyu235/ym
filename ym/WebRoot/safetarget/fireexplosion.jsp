<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>瓦斯爆炸模拟记录</title>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
</head>
<body>
	<div class="panel-header" style="width:100%;">
		<div class="panel-title panel-with-icon">瓦斯爆炸模拟</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
		<div>
			<form id="searchForm" method="post" style="display: inline;">
            	<div style="margin-top:-8px;">
				&nbsp;&nbsp;模拟时间:&nbsp;&nbsp;<input class="easyui-my97 easyui-validatebox" editable="false" name="safeTarget.testTime" />
				&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search();">查询</a>
				&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch();">清空</a>
            	</div>
	        </form>
	    </div>
	</div>
   	<div class="search_add">
		<shiro:hasPermission name="309:delete">		
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove', plain:true" onclick="crud.remove();">删除</a>
		</shiro:hasPermission>
    </div>
	<!-- 表单表头 -->
	<div style="height:74%;">
	    <table id="data_list" style="display:none">
	        <thead>
	            <th align="center" field="gl" width="150" formatter="gridFormatterLength" >概率</th>
	            <th align="center" field="testTime" width="150" formatter="gridFormatterLength" >模拟时间</th>
	            <th align="center" field="id" width="120" formatter="gridFormatter">操作</th>          
	        </thead>
	    </table>
	</div>

	
	
	<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
	<script type="text/javascript">
		$(document).ready(function (){
			grid = new Grid('${ctx}/safeTarget/safeTargetAction!list?safeTarget.testType=火灾事故模拟','data_list');
			grid.loadGrid();
			crud = new Crud({
				grid:grid, 
				addFormObject:$('#addForm'), 
				searchFormObject:$('#searchForm'),
				entityName:'safeTarget',
				moduleName:'煤矿火灾事故',
				url:'${ctx}/safeTarget/safeTargetAction'
			});
			
	 	}); 
	  	//页面显示（判断每个单元格内容字符长度是否大于10，大于部分用...省略）
	   	function gridFormatterLength(value, rowData, rowIndex) {
	       	if(value==null || value == '' || value == 'undefined')
	       		return '';
	   		if(value.length > 20)
	   			return value.substring(0, 20) + '...';
	   		return value;
	    }
	    //数据操作
		function gridFormatter(value, rowData, rowIndex) {
			var rowId = rowData.id;
			var rowName=rowData.corpKey;
			var url = "";
			<shiro:hasPermission name="309:view">
			url += "<a title=\"查看\" onclick='view(\""+rowId+"\");' class='btn2'><img src=\"../images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
			</shiro:hasPermission>
			return url;
		}
      function view(id){
    	  //window.location.href="selectafter1.jsp?id="+id;
    	  window.open("fireafter1.jsp?id="+id);
      }
	</script>
</body>
</html>