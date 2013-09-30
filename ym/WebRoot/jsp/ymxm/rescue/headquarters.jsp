<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>应急指挥部</title>
	<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
</head>
<body>
	<div class="panel-header" style="width:100%;">
		<div class="panel-title panel-with-icon">应急指挥部列表</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	
	<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
	     <div>
	        <form id="searchForm" method="post" style="display: inline;">
	            <div style="margin-top:-8px;">            
					&nbsp;&nbsp;指挥部名称:&nbsp;&nbsp;<input type="text" name="headquarters.name" id="headquarters.name" style="width: 120px;"/>
					&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search();">查询</a>
					<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch();">清空</a>
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
	
	<div style="height:74%;">
	    <table id="data_list" style="display:none">
	        <thead>
		        <tr>22
		            <th align="center" field="name" formatter="gridFormatterLength" >指挥部名称</th>
		            <th align="center" field="name" width="80" formatter="gridFormatterLength" >指挥部地址</th>
		            <th align="center" field="id" width="80" formatter="gridFormatter">操作</th>          
	            </tr>
	        </thead>
	    </table>
	</div>
	
	<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
	<script type="text/javascript">
		$(document).ready(function (){
    		grid =new Grid('${ctx}/headquarters/headquartersAction!list','data_list');
        	grid.loadGrid();
   	    });
	</script>
</body>
</html>