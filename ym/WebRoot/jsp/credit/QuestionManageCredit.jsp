<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>题型维护</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtilCheckbox.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<script type="text/javascript">
$(document).ready(
 	function (){
 		grid = new Grid('${ctx}/questionManageCredit/questionManageCreditAction!list', 'data_list');
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'questionManageCredit',
			moduleName:'题型维护',
			url:'${ctx}/questionManageCredit/questionManageCreditAction',
			dialogCss:{width:"900px",height:"200px"}
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
	url += "<a title=\"试题管理\" onclick='questionFunction(\""+rowId+"\",\""+rowName+"\");' class='btn2'><img src=\"../../images/text.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	return url;
}
</script>
</head>
<body>
 <div class="panel-header" style="width:100%;">
		<div class="panel-title panel-with-icon">题型维护列表</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
	 <div>
	        <form id="searchForm" method="post" style="display: inline;">
            <div style="margin-top:-8px;">
	      &nbsp;&nbsp;题型名称:&nbsp;&nbsp;<input type="text" name="questionManageCredit.questionName" style="width: 120px;"/>
		&nbsp;&nbsp;备注:&nbsp;&nbsp;<input type="text" name="questionManageCredit.questionRemarks" style="width: 120px;" />
		&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search()">查询</a>
		&nbsp;&nbsp;
	<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch();">清空</a>
            </div>
	        </form>
	    </div>
        </div>
        <div class="search_add">
        </div>
	<!-- 表单表头 -->
	<div style="height:74%;">
	    <table id="data_list" style="display:none">
	        <thead>
	        <tr>
	        <th align="center" field="questionName" width="150" formatter="gridFormatterLength" >题型名称</th>
	         <th align="center" field="questionRemarks" width="150" formatter="gridFormatterLength" >备注</th>
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
		<form method="post" >
	     <input type="hidden" name="questionManageCredit.id"/>
		    <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
						<tr>
							<td class="table_nemu_new" width="25%">题型名称</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="questionManageCredit.questionName"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new" width="25%">备注</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="questionManageCredit.questionRemarks"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							
						</tr>
				</table>
			</div>
		</form>
	</div>
	</div>
	<script type="text/javascript">
	
	//调用指挥人员list页面
	function questionFunction(rowId,rowName) {
	if(rowName == "单选题"){
		$('#singleFrame').attr('src', 'QuestionSingleCredit.jsp?id=' + rowId);
				$('#viewSingleForm').dialog({
					title:'试题管理',
					modal:true,
					draggable:false,
					minimizable:true,
					maximizable:true,
					maximized:true,
					onClose:function(){
						$('#data_list').datagrid('reload');
					},
					buttons:[{
						text:'取消',
						iconCls:'icon-cancel',
						handler:function() {
							$('#viewSingleForm').dialog('close');
						}
					}]
				});
	}
	
	if(rowName == "多选题"){
				$('#manyFrame').attr('src', 'QuestionManyCredit.jsp?id=' + rowId);
				$('#viewManyForm').dialog({
					title:'试题管理',
					modal:true,
					draggable:false,
					minimizable:true,
					maximizable:true,
					maximized:true,
					onClose:function(){
						$('#data_list').datagrid('reload');
					},
					buttons:[{
						text:'取消',
						iconCls:'icon-cancel',
						handler:function() {
							$('#viewManyForm').dialog('close');
						}
					}]
				});
	}
	 if(rowName == "判断题") {
		$('#judgeFrame').attr('src', 'QuestionJudgeCredit.jsp?id=' + rowId);
				$('#viewJudgeForm').dialog({
					title:'试题管理',
					modal:true,
					draggable:false,
					minimizable:true,
					maximizable:true,
					maximized:true,
					onClose:function(){
						$('#data_list').datagrid('reload');
					},
					buttons:[{
						text:'取消',
						iconCls:'icon-cancel',
						handler:function() {
							$('#viewJudgeForm').dialog('close');
						}
					}]
				});
	}
	}
	</script>
	<!-- 单项选择题层 -->
	<div style="display: none;">
		<div id="viewSingleForm" style="width: 960px; height: 400px;" data-options="iconCls:'icon-save'">
			<iframe frameborder="0" id="singleFrame" width="100%" height="98%" scrolling-x="no"></iframe>
		</div>
	</div>
	<!-- 多项选择题层 -->
	<div style="display: none;">
		<div id="viewManyForm" style="width: 960px; height: 400px;" data-options="iconCls:'icon-save'">
			<iframe frameborder="0" id="manyFrame" width="100%" height="98%" scrolling-x="no"></iframe>
		</div>
	</div>
	<!-- 多项选择题层 -->
	<div style="display: none;">
		<div id="viewJudgeForm" style="width: 960px; height: 400px;" data-options="iconCls:'icon-save'">
			<iframe frameborder="0" id="judgeFrame" width="100%" height="98%" scrolling-x="no"></iframe>
		</div>
	</div>
</body>
</html>