<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>岗位要领维护</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<script type="text/javascript">
$(document).ready(
	 	function (){
	 		onloadCombobox('${ctx}','zy',$('#sszy'),$('#ssgz'),null);
	 		onloadCombobox('${ctx}','zy',$('#updatesszy'),$('#updatessgz'),null);
	 		grid = new Grid('${ctx}/essentials/essentialsAction!list', 'data_list', {
	 			onLoadSuccess: function(data) {
	 				var nameTemp = null;
	 				var index = 0;
	 				var rowspan = 1;
	 				$.each(data.rows, function(i, v){
	 					if(v.sszyByType == nameTemp) {
	 						rowspan++;
	 					} else {
	 						if(rowspan != 1) {
				 				$('#data_list').datagrid('mergeCells',{field:'sszyByType','index':index,'rowspan':rowspan});
	 						}
	 						nameTemp = v.sszyByType; 
	 						index = i;
	 						rowspan = 1;
	 					}
	 					
	 				});
	 				if(rowspan != 1) {
	 					$('#data_list').datagrid('mergeCells',{field:'sszyByType','index':index,'rowspan':rowspan});
					}
	 			}
	 			});
			grid.loadGrid();
			crud = new Crud({
				grid:grid, 
				addFormObject:$('#addForm'), 
				searchFormObject:$('#searchForm'),
				entityName:'essentials',
				moduleName:'岗位要领维护',
				url:'${ctx}/essentials/essentialsAction',
				afterUpdateLoadData:function(updateFormObject, data) {
					onLoadSelect("${ctx}",$('#updatesszy'),$('#updatessgz'));
					$('#updatessgz').combobox('setValue', data.ssgz);
				},
				afterViewLoadData:function(viewFormObject, data) {
					$(viewFormObject).find('span[name="essentials.sszy"]').text(data.sszyByType);
					$(viewFormObject).find('span[name="essentials.ssgz"]').text(data.ssgzByType);
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
	var rowName=rowData.craftTypeName;
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
		<div class="panel-title panel-with-icon">岗位要领维护列表</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
	 <div>
	        <form id="searchForm" method="post" style="display: inline;">
            <div style="margin-top:-8px;">
				&nbsp;&nbsp;适用专业:&nbsp;&nbsp;<input class="easyui-combobox" name="essentials.sszy" id="sszy"/>
				&nbsp;&nbsp;适用岗位:&nbsp;&nbsp;<input class="easyui-combobox" name="essentials.ssgz" id="ssgz" style="width: 100px;"/>
				&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search();">查询</a>
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
        </div>
	<!-- 表单表头 -->
	<div style="height:74%;">
	    <table id="data_list" style="display:none">
	        <thead>
	        <th align="center" field="czyl" width="150" formatter="gridFormatterLength" >一、岗标操作要领</th>
            <th align="center" field="ksyd" width="150" formatter="gridFormatterLength" >二、手指口述要点</th>
            <th align="center" field="sgal" width="150" formatter="gridFormatterLength" >三、典型事故案例</th>
            <th align="center" field="sszyByType" width="150" formatter="gridFormatterLength" >适用专业</th>
            <th align="center" field="ssgzByType" width="150" formatter="gridFormatterLength" >适用岗位</th>
            <th field="id" width="120" formatter="gridFormatter">操作</th>   
	        </thead>
	    </table>
	</div>

	<!-- 添加更新窗口 -->
	<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" data-options="iconCls:'icon-save',modal:true,minimizable:true,maximizable:true,collapsible:true,draggable:false">
		<form method="post" >
	     <input type="hidden" name="essentials.id"/>
		    <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;" cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
						<tr>
							<td class="table_nemu_new" style="25%;">适用专业</td>
							<td class="table_con" style="25%;">
							<input class="easyui-combobox" data-options="panelHeight:'auto',editable:false" id="updatesszy" name="essentials.sszy" required="true" />
							</td>
							<td class="table_nemu_new" style="25%;">适用岗位</td>
							<td class="table_con" style="25%;">
							<input class="easyui-combobox" data-options="panelHeight:'auto',editable:false" id="updatessgz" name="essentials.ssgz" required="true"style="width: 100px;" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new" colspan="4" style="text-align: left;">一、岗标操作要领</td>
						</tr>
						<tr>
							<td class="table_con" colspan="4">
							<textarea class="easyui-validatebox" name="essentials.czyl" style="height: 80px;width:100%;" required="true"></textarea>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new" colspan="4" style="text-align: left;">二、手指口述要点</td>
						</tr>
						<tr>
							<td class="table_con" colspan="4">
							<textarea class="easyui-validatebox" name="essentials.ksyd" style="height: 80px;width:100%;" required="true"></textarea>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new" colspan="4" style="text-align: left;">三、典型事故案例</td>
						</tr>
						<tr>
							<td class="table_con" colspan="4">
							<textarea class="easyui-validatebox" name="essentials.sgal" style="height: 80px;width:100%;" required="true"></textarea>
							</td>
						</tr>
				</table>
			</div>
		</form>
	</div>
	</div>
</body>
</html>