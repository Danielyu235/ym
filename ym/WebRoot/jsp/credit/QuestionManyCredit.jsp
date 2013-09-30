<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>试题管理</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<script type="text/javascript">
$(document).ready(
 	function (){
 		onloadCombobox('${ctx}','stlx',$('#quartersTypeId'),null,null);
 		onloadCombobox('${ctx}','stlx',$('#updQuartersTypeId'),null,null);
 		$("#qsTypeId").hide();
 		grid = new Grid('${ctx}/questionCredit/questionCreditAction!list?questionCredit.qsTypeId=${param.id}', 'data_list', {
 			onLoadSuccess: function(data) {
 				var nameTemp = null;
 				var index = 0;
 				var rowspan = 1;
 				$.each(data.rows, function(i, v){
 					if(v.quartersTypeName == nameTemp) {
 						rowspan++;
 					} else {
 						if(rowspan != 1) {
			 				$('#data_list').datagrid('mergeCells',{field:'quartersTypeName','index':index,'rowspan':rowspan});
 						}
 						nameTemp = v.quartersTypeName; 
 						index = i;
 						rowspan = 1;
 					}
 					
 				});
 				if(rowspan != 1) {
 					$('#data_list').datagrid('mergeCells',{field:'quartersTypeName','index':index,'rowspan':rowspan});
				}
 			}
 		});
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'questionCredit',
			moduleName:'试题',
			url:'${ctx}/questionCredit/questionCreditAction',
			dialogCss:{width:"900px",height:"500px"},
			afterViewLoadData:function(viewFormObject, data) {
				$(viewFormObject).find('span[name="questionCredit.quartersTypeId"]').text(data.quartersTypeName);
			}
		});
 	}
  ); 
  //页面显示（判断每个单元格内容字符长度是否大于25，大于部分用...省略）
   function gridFormatterLength(value, rowData, rowIndex) {
        	if(value==null || value == '' || value == 'undefined')
        		return '';
    		if(value.length > 45)
    			return value.substring(0, 45) + '...';
    		return value;
    }
    //数据操作
	function gridFormatter(value, rowData, rowIndex) {
		var rowId = rowData.id;
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
		<div class="panel-title panel-with-icon">试题管理列表</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
	 <div>
	        <form id="searchForm" method="post" style="display: inline;">
            <div style="margin-top:-8px;">
	&nbsp;&nbsp;题目:&nbsp;&nbsp;<input type="text" name="questionCredit.qsName"style="width: 120px;" />
	&nbsp;&nbsp;岗位类型:&nbsp;&nbsp;<input type="text" name="questionCredit.quartersTypeId" id="quartersTypeId" style="width: 120px;"/>
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
        </div>
<!-- 表单表头 -->
	<div style="height:74%;">
	    <table id="data_list" style="display:none">
	        <thead>
	        <tr>
	        <th align="center" field="quartersTypeName" width="70" formatter="gridFormatterLength" >岗位类型</th>
            <th align="center" field="qsName" width="250" formatter="gridFormatterLength" >题目</th>
            <th align="center" field="qsAnswer" width="50" formatter="gridFormatterLength" >题目答案</th>
            <th align="center" field="remarks" width="150" formatter="gridFormatterLength" >备注</th>
            <th align="center" field="id" width="120" formatter="gridFormatter">操作</th>         
        </thead>
	    </table>
	</div>
	<!-- 添加更新窗口 -->
	<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" 
			data-options="iconCls:'icon-save',modal:true,
    			minimizable:true,maximizable:true,collapsible:true,draggable:false">
		<form method="post" >
			<input type="text" name="questionCredit.qsTypeId" value="${param.id}" id="qsTypeId"/>
			<input type="hidden" name="questionCredit.id"/>
			<div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
						<tr>
							<td class="table_nemu_new">题目</td>
							<td class="table_con" colspan="3">
							<textarea  name="questionCredit.qsName" rows="2" cols="80"></textarea>
							</td>
						</tr>
						 <tr>
							<td class="table_nemu_new">选项A</td>
							<td class="table_con" colspan="3">
							<textarea  name="questionCredit.optionA" rows="2" cols="80"></textarea>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">选项B</td>
							<td class="table_con" colspan="3">
							<textarea  name="questionCredit.optionB" rows="2" cols="80"></textarea>
						</tr>
						<tr>
							<td class="table_nemu_new">选项C</td>
							<td class="table_con" colspan="3">
							<textarea  name="questionCredit.optionC" rows="2" cols="80"></textarea>
							</td>
							</tr>
						<tr>
							<td class="table_nemu_new">选项D</td>
							<td class="table_con" colspan="3">
							<textarea  name="questionCredit.optionD" rows="2" cols="80"></textarea>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">选项E</td>
							<td class="table_con" colspan="3">
							<textarea  name="questionCredit.optionE" rows="2" cols="80"></textarea>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">题目答案</td>
							<td class="table_con">
							<input class="easyui-validatebox" type="text"  id="updQsAnswer" name="questionCredit.qsAnswer"/>
							</td>
								<td class="table_nemu_new">岗位类型</td>
							<td class="table_con">
							<input class="easyui-validatebox" type="text"  id="updQuartersTypeId" name="questionCredit.quartersTypeId"/>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">备注</td>
							<td class="table_con" colspan="3">
							<textarea  name="questionCredit.remarks" rows="2" cols="80"></textarea>
							</td>
						</tr>
						
				</table>
			</div>
		</form>
	</div>
</body>
</html>