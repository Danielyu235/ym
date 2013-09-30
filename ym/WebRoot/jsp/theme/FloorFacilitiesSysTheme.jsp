<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>地面设施系统</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<script type="text/javascript">
$(document).ready(
 	function (){
 		onloadCombobox('${ctx}','dmss',$('#floorType'),null,null);//加载list页面查询combobox菜单数据
 		onloadCombobox('${ctx}','dmss',$('#floorTypeId'),null,null);
 		onloadCombobox('${ctx}','ssks',$('#department'),null,null);//
 		onloadCombobox('${ctx}','ssks',$('#departmentId'),null,null);//
 		grid = new Grid('${ctx}/floorFacilitiesSysTheme/floorFacilitiesSysThemeAction!list', 'data_list');
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'floorFacilitiesSysTheme',
			moduleName:'地面设施系统',
			url:'${ctx}/floorFacilitiesSysTheme/floorFacilitiesSysThemeAction',
			dialogCss:{width:"900px",height:"400px"},
			afterViewLoadData:function(viewFormObject, data) {
				$(viewFormObject).find('span[name="floorFacilitiesSysTheme.floorType"]').text(data.floorTypeName);
				$(viewFormObject).find('span[name="floorFacilitiesSysTheme.departmentId"]').text(data.departmentName);
			}
		});
 	}
  ); 
  //页面显示（判断每个单元格内容字符长度是否大于25，大于部分用...省略）
   function gridFormatterLength(value, rowData, rowIndex) {
        	if(value==null || value == '' || value == 'undefined')
        		return '';
    		if(value.length > 25)
    			return value.substring(0, 25) + '...';
    		return value;
    	}
//数据操作
function gridFormatter(value, rowData, rowIndex) {
	var rowId = rowData.id;
	var rowName=rowData.questionName;
	var url = "";
	<shiro:hasPermission name="48:view">
	url += "<a title=\"查看\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"../../images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	<shiro:hasPermission name="48:update">
	url += "<a title=\"修改\" onclick='crud.update(\""+rowId+"\");' class='btn2'><img src=\"../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	return url;
}
</script>
</head>
<body>
<div class="panel-header" style="width:100%;">
		<div class="panel-title panel-with-icon">一通三防系统列表</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
	 <div>
	        <form id="searchForm" method="post" style="display: inline;">
            <div style="margin-top:-8px;">
	&nbsp;&nbsp;地面设施类型:&nbsp;&nbsp;<input type="text" name="floorFacilitiesSysTheme.floorType" id="floorTypeId" data-options="panelHeight:'auto',width:'100',editable:false" />
	&nbsp;&nbsp;所属科室:&nbsp;&nbsp;<input type="text" name="floorFacilitiesSysTheme.departmentId" id="department" data-options="panelHeight:'auto',width:'100',editable:false" />
	&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search()">查询</a>
		&nbsp;&nbsp;
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
		<a href="${ctx}/Highcharts-3.0.1/examples/dynamic-update/index.htm" class="easyui-linkbutton" data-options="iconCls:'icon-add', plain:true">统计图</a>
        </div>
	<!-- 表单表头 -->
	<div style="height:74%;">
	    <table id="data_list" style="display:none">
	        <thead>
	        <tr>
	         <th align="center" field="floorTypeName" width="150" formatter="gridFormatterLength" >地面设施类型</th>
            <th align="center" field="departmentName" width="150" formatter="gridFormatterLength" >所属科室</th>
            <th align="center" field="score" width="150" formatter="gridFormatterLength" >得分</th>
            <th align="center" field="reason" width="150" formatter="gridFormatterLength" >扣分原因</th>
            <th align="center" field="date" width="150" formatter="gridFormatterLength" >评分时间</th>
            <th field="id" width="120" formatter="gridFormatter">操作</th> 
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
	    <input type="hidden" name="floorFacilitiesSysTheme.id"/>
		    <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
						<tr>
							<td class="table_nemu_new" width="25%">地面设施类型</td>
							<td class="table_con" width="25%">
							<input type="text" class="easyui-combobox" data-options="panelHeight:'auto',width:'100',required: true,editable:false" 
							name="floorFacilitiesSysTheme.floorType" id="floorType"/>
							</td>
						
							<td class="table_nemu_new" width="25%">所属科室</td>
							<td class="table_con" width="25%">
							<input type="text" class="easyui-combobox" data-options="panelHeight:'auto',width:'100',required: true,editable:false"  
							name="floorFacilitiesSysTheme.departmentId" id="departmentId"/>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">得分</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="floorFacilitiesSysTheme.score"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						<td class="table_nemu_new">评分时间</td>
							<td class="table_con">
							<input type="text" class="easyui-my97 easyui-validatebox" data-options="required:true,readOnly:true" name="floorFacilitiesSysTheme.date"/>
							</td>
							
						</tr>
						
						<tr>
							<td class="table_nemu_new">扣分原因</td>
							<td class="table_con" colspan="3">
							<textarea  name="floorFacilitiesSysTheme.reason" rows="3" cols="80"></textarea>
							</td>
						</tr>
				</table>
			</div>
		</form>
	</div>
	</div>
</body>
</html>