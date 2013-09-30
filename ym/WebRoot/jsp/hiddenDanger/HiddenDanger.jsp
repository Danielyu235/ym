<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>安全隐患排查</title>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
</head>
<body>
	<div class="panel-header" style="width:100%;">
		<div class="panel-title panel-with-icon">安全隐患排查</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
		<div>
			<form id="searchForm" method="post" style="display: inline;">
            	<div style="margin-top:-8px;">
				&nbsp;&nbsp;发现人:&nbsp;&nbsp;<input type="text" name="hiddenDanger.findPeople_Name" />
				&nbsp;&nbsp;发现时间:&nbsp;&nbsp;<input class="easyui-my97 easyui-validatebox" editable="false" name="hiddenDanger.discoveryTime" />
				&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search();">查询</a>
				&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch();">清空</a>
            	</div>
	        </form>
	    </div>
	</div>
   	<div class="search_add">
		<shiro:hasPermission name="309:add">
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add', plain:true" onclick="crud.add();">添加</a>
		</shiro:hasPermission>
		<shiro:hasPermission name="309:delete">		
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove', plain:true" onclick="crud.remove();">删除</a>
		</shiro:hasPermission>
    </div>
	<!-- 表单表头 -->
	<div style="height:74%;">
	    <table id="data_list" style="display:none">
	        <thead>
	            <th align="center" field="findPeople_Name" width="150" formatter="gridFormatterLength" >发现人</th>
	            <th align="center" field="discoveryTime" width="150" formatter="gridFormatterLength" >发现时间</th>
	            <th align="center" field="location" width="150" formatter="gridFormatterLength" >地点</th>
	            <th align="center" field="correctivePeople" width="150" formatter="gridFormatterLength" >整改人</th>
	            <th align="center" field="deadline" width="150" formatter="gridFormatterLength" >整改期限</th>
	            <th align="center" field="id" width="120" formatter="gridFormatter">操作</th>          
	        </thead>
	    </table>
	</div>

	<!-- 添加更新窗口 -->
	<div style="display: none;">
		<div id="addForm" style="width: 1000px; height: 500px;" data-options="iconCls:'icon-save',modal:true,minimizable:true,maximizable:true,collapsible:true,draggable:false">
			<form method="post">
	     		<input type="hidden" name="hiddenDanger.id"/>
		    	<div style="padding:10px;" align="center" name="addDiv" id="addDiv">
					<table id="detailTable" cellpadding="5px" style="font-size:12px;" cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
						<tr>
							<td class="table_nemu_new" width="14%">发现人</td>
							<td class="table_con" width="38%">
								<input type="hidden" name="findPeople_Id">
								<input class="easyui-validatebox" name="hiddenDanger.findPeople_Name" value="${user_name}" data-options="required:true"/>
							</td>
							<td class="table_nemu_new" width="10%">发现时间</td>
							<td class="table_con" width="38%">
								<input class="easyui-my97 easyui-validatebox" name="hiddenDanger.discoveryTime" data-options="required:true"/>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">地点</td>
							<td class="table_con" colspan="3">
								<input class="easyui-validatebox" name="hiddenDanger.location" style="width:550px"/>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">专业</td>
							<td class="table_con">
								<input class="easyui-validatebox" name="hiddenDanger.specialty"/>
							</td>
							<td class="table_nemu_new">检查项目</td>
							<td class="table_con">
								<input class="easyui-validatebox" name="hiddenDanger.checkItem"/>
							</td>							
						</tr>
						<tr>
							<td class="table_nemu_new">检查线路</td>
							<td class="table_con">
								<input class="easyui-validatebox" name="hiddenDanger.checkLine"/>
							</td>
							<td class="table_nemu_new">检查地点</td>
							<td class="table_con">
								<input class="easyui-validatebox" name="hiddenDanger.checkLocation"/>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">检查标准</td>
							<td class="table_con" colspan="3">
								<textarea class="easyui-validatebox" name="hiddenDanger.checkLabel" style="width:550px;heigth:100px"></textarea>
							</td>							
						</tr>
						<tr>
							<td class="table_nemu_new">检查内容</td>
							<td class="table_con" colspan="3">
								<textarea class="easyui-validatebox" name="hiddenDanger.hiddenContent" style="width:550px;heigth:100px"></textarea>
							</td>							
						</tr>
						<tr>
							<td class="table_nemu_new">隐患类型</td>
							<td class="table_con">
								<input class="easyui-combobox" name="hiddenDanger.hiddenType" data-options="panelHeight:'auto',editable:false,valueField: 'value',textField: 'label',
									data: [{
										label: 'A类。需集团公司处理的隐患。',
										value: 'A类。需集团公司处理的隐患。'
									},{
										label: 'B类。需矿（厂、处）处理的问题。',
										value: 'B类。需矿（厂、处）处理的问题。'
									},{
										label: 'C类。需区队解决的隐患。',
										value: 'C类。需区队解决的隐患。'
									}]" style="width:200px"/>			
							</td>	
							<td class="table_nemu_new">三色单</td>
							<td class="table_con">
								<input class="easyui-combobox" name="hiddenDanger.threeColorForm" data-options="panelHeight:'auto',editable:false,valueField: 'value',textField: 'label',
									data: [{
										label: '白色，一般隐患。',
										value: '白色，一般隐患。'
									},{
										label: '黄色，较大隐患。',
										value: '黄色，较大隐患。'
									},{
										label: '红色，较大隐患。',
										value: '红色，较大隐患。'
									}]" style="width:200px"/>
							</td>						
						</tr>
						<tr>
							<td class="table_nemu_new">整改措施</td>
							<td class="table_con" colspan="3">
								<textarea class="easyui-validatebox" name="hiddenDanger.measure" style="width:550px;heigth:100px"></textarea>
							</td>							
						</tr>
						<tr>
							<td class="table_nemu_new">整改人</td>
							<td class="table_con">
								<input class="easyui-validatebox" name="hiddenDanger.correctivePeople"/>
							</td>
							<td class="table_nemu_new">整改期限</td>
							<td class="table_con">
								<input class="easyui-my97 easyui-validatebox" name="hiddenDanger.deadline"/>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">整改结果</td>
							<td class="table_con" colspan="3">
								<textarea class="easyui-validatebox" name="hiddenDanger.correctionReport" style="width:550px;heigth:100px"></textarea>
							</td>							
						</tr>
						<tr>
							<td class="table_nemu_new">跟踪落实</td>
							<td class="table_con">
								<input class="easyui-validatebox" name="hiddenDanger.followUp"/>
							</td>
							<td class="table_nemu_new">完成时间</td>
							<td class="table_con">
								<input class="easyui-my97 easyui-validatebox" name="hiddenDanger.completionTime"/>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
	
	<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
	<script type="text/javascript">
		$(document).ready(function (){
			grid = new Grid('${ctx}/hiddenDanger/hiddenDangerAction!list','data_list');
			grid.loadGrid();
			crud = new Crud({
				grid:grid, 
				addFormObject:$('#addForm'), 
				searchFormObject:$('#searchForm'),
				entityName:'hiddenDanger',
				moduleName:'安全隐患排查',
				url:'${ctx}/hiddenDanger/hiddenDangerAction',
			});
			
	 	}); 
	  	//页面显示（判断每个单元格内容字符长度是否大于10，大于部分用...省略）
	   	function gridFormatterLength(value, rowData, rowIndex) {
	       	if(value==null || value == '' || value == 'undefined')
	       		return '';
	   		if(value.length > 10)
	   			return value.substring(0, 10) + '...';
	   		return value;
	    }
	    //数据操作
		function gridFormatter(value, rowData, rowIndex) {
			var rowId = rowData.id;
			var rowName=rowData.corpKey;
			var url = "";
			<shiro:hasPermission name="309:view">
			url += "<a title=\"查看\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"../../images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
			</shiro:hasPermission>
			<shiro:hasPermission name="309:update">
			url += "<a title=\"修改\" onclick='crud.update(\""+rowId+"\");' class='btn2'><img src=\"../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
			</shiro:hasPermission>
			return url;
		}
	</script>
</body>
</html>