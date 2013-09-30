<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>危险源辨识日志</title>

<link rel="stylesheet" type="text/css" href="${ctx}/css/bus.css">
<script type="text/javascript" src="${ctx}/js/GridUtilNewToolBar.js"></script>
<script type="text/javascript">
        var grid = null;
        var key = null;

		$(document).ready(function () {
		     grid = new Grid($("title").html(), 'icon-edit',
		             '${ctx}/identificationLog/identificationLogAction!list',
		             'data_list','#tb');
		     grid.loadGrid();
		});
        
        function gridFormatterLength(value, rowData, rowIndex) {
        	if(value==null || value == '' || value == 'undefined')
        		return '';
    		if(value.length > 25)
    			return value.substring(0, 25) + '...';
    		return value;
    	}
		function searchFunction(){
        	var form = $.form2Json($("#searchForm"));
			grid.doSearch(form);  	
        }
		 function clearSearchGrid(){
        	$('#searchForm').form('clear');
        }
</script>
</head>
<body>
<div id="tb">
	<div>
	<form id="searchForm" style="margin: 0;">
	&nbsp;&nbsp;所属单位:&nbsp;&nbsp;<input type="text" name="identificationLog.corpName" />
	&nbsp;&nbsp;危险源名称:&nbsp;&nbsp;<input type="text" name="identificationLog.hazardsName" />
	&nbsp;&nbsp;危险源类型:&nbsp;&nbsp;<input type="text" name="identificationLog.hazardsType" />
	
	&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="searchFunction()">查询</a>
	&nbsp;&nbsp;
	<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="clearSearchGrid();">清空</a>
	</form>
	</div>
</div>

<div style="height: 74%">
    <table id="data_list" loadMsg="正在努力拉取数据中..." fit="true" fitColumns="true">
        <thead>
        <tr>
            <th align="center" field="corpName" width="150" formatter="gridFormatterLength" >所属单位</th>
             <th align="center" field="hazardsName" width="150" formatter="gridFormatterLength" >危险源名称</th>
            <th align="center" field="hazardsType" width="150" formatter="gridFormatterLength" >危险源类型</th>
            <th align="center" field="info" width="150" formatter="gridFormatterLength" >辨识信息</th>
            <th align="center" field="reason" width="150" formatter="gridFormatterLength" >原因</th>     
             <th align="center" field="logDate" width="150" formatter="gridFormatterLength" >辨识时间</th> 
        </tr>
        </thead>
    </table>
</div>
</body>
</html>