<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<%
	String departmentf =request.getParameter("departmentf");
	String departments =request.getParameter("departments");
	if(departmentf == null){
		departmentf ="";
	}
	if(departments == null){
		departments ="";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>日常三违处罚</title>
	<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
	<style type="text/css">
		.emp{
			display:block;
		}
	</style>
</head>
<body>
	<div class="panel-header" style="width:100%;">
		<div class="panel-title panel-with-icon">日常三违处罚</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
	 <div>
	      <form id="searchForm" method="post" style="display: inline;">
            <div style="margin-top:-8px;">	            	
                &nbsp;&nbsp;员工工号:&nbsp;&nbsp;<input type="text" name="punishSafe.bfkrjobnum" id="employee.bfkrjobnum" style="width: 120px;"/>
				&nbsp;&nbsp;记录时间:&nbsp;&nbsp;<input type="text" name="punishSafe.fksj" class="easyui-my97" style="width: 120px;"/>
				&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search()">查询</a>
				&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="advancedsearch()">高级查询</a>
				&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch();">清空</a>
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
		        	<th data-options="field:'bfkrjobnum',width:10,align:'center',formatter:gridFormatterLength">被罚款人工号</th>
		        	<th data-options="field:'bfkrname',width:10,align:'center',formatter:gridFormatterLength">被罚款人姓名</th>
		        	<th data-options="field:'bfkrmajor',width:15,align:'center',formatter:gridFormatterLength">被罚款人专业</th>
		        	<th data-options="field:'bfkrpost',width:15,align:'center',formatter:gridFormatterLength">被罚款人岗位</th>
		        	<th data-options="field:'done',width:20,align:'center',formatter:gridFormatters">被罚款人所属部门</th>
		        	<th data-options="field:'fkje',width:10,align:'center',formatter:gridFormatterLength">罚款金额</th>
		        	<th data-options="field:'fksj',width:10,align:'center',formatter:gridFormatterLength">罚款时间</th>
		        	<th data-options="field:'id',width:10,align:'center',formatter:gridFormatter">操作</th>
		        </tr>
	        </thead>
	    </table>
	</div>
	
	<!-- 添加更新窗口 -->
	<div style="display:none">
		<div id="addForm" style="width:900px;height:450px" data-options="iconCls:'icon-save',modal:true,minimizable:true,maximizable:true,collapsible:true,draggable:false">
			<form method="post" >
		    	<input type="hidden" name="punishSafe.id"/>
		    	<input type="hidden" name="punishSafe.bfkrid"/>
			    <div style="padding:10px 20px 10px 20px;" align="center" name="addDiv">
					<table id="detailTable" cellpadding="5px" style="font-size:12px;" cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">						
						<tr>
							<td class="table_nemu_new" width="12%">被罚款人工号</td>
							<td class="table_con" width="38%">
								<div style="float: left;" width="25%">
									<input class="easyui-validatebox" name="punishSafe.bfkrjobnum" disabled/>
								</div>
								<div class="emp" style="float:left;" width="25%">
									&nbsp;&nbsp;&nbsp;<input type="button" value="单击选择" onclick="eSelect.open()" />
								</div>						
							</td>
							<td class="table_nemu_new" width="12%">被罚款人所在部门</td>
							<td class="table_con" width="38%">
								<input class="easyui-validatebox" name="punishSafe.bfkrdone" disabled style="width:100px"/>
								-
								<input class="easyui-validatebox" name="punishSafe.bfkrdtwo" disabled style="width:100px"/>
							</td>						
						</tr>
						<tr>
							<td class="table_nemu_new">被罚款人姓名</td>
							<td class="table_con">
								<input class="easyui-validatebox" name="punishSafe.bfkrname" id="bfkrname" disabled/>
							</td>
							<td class="table_nemu_new">被罚款人专业</td>
							<td class="table_con">
								<input class="easyui-validatebox" name="punishSafe.bfkrmajor" disabled />
							</td>						
						</tr>
						<tr>
							<td class="table_nemu_new">被罚款人岗位</td>
							<td class="table_con" >
								<input type="text" class="easyui-validatebox" name="punishSafe.bfkrpost" disabled/>
							</td>					
							<td class="table_nemu_new">罚款班次</td>
							<td class="table_con">
								<input class="easyui-validatebox" name="punishSafe.fkbc" data-options="validType:'maxByteLength[100]'"/>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">罚款金额</td>
							<td class="table_con">
								<input class="easyui-validatebox" name="punishSafe.fkje" data-options="validType:'maxByteLength[100]'"/>
							</td>
						
							<td class="table_nemu_new">罚款时间</td>
							<td class="table_con">
								<input type="text" name="punishSafe.fksj" class="easyui-my97 easyui-validatebox" data-options="readOnly:true"/>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">罚款类型</td>
							<td class="table_con">
								<input class="easyui-validatebox" name="punishSafe.fklx" data-options="validType:'maxByteLength[100]'"/>
							</td>
						
							<td class="table_nemu_new">罚款明细</td>
							<td class="table_con">
								<input class="easyui-validatebox" name="punishSafe.fkmx" data-options="validType:'maxByteLength[100]'"/>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">地点</td>
							<td class="table_con">
								<input class="easyui-validatebox" name="punishSafe.dd" data-options="validType:'maxByteLength[100]'"/>
							</td>
						
							<td class="table_nemu_new">处罚人</td>
							<td class="table_con">
								<input name="punishSafe.cfrid" class="easyui-validatebox"/>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">事因</td>
							<td colspan="3" class="table_con">
								<textarea class="easyui-validatebox" name="punishSafe.sy" style="width:80%;height:80px;" data-options="validType:'maxByteLength[255]'"></textarea>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
	
	<!-- 弹出层（高级查询） -->
	<div id="advancedsearch" class="easyui-window" style="width: 360px; height: 320px" title="高级查询"
		data-options="modal:true,closed:true,minimizable:false,maximizable:false,resizable:false" align="center">
		<form id="advanced">
			<table style="border:0;padding:5px;width:auto">
				<tr>
					<td style="width:100px">
						<label>员工工号：</label>
					</td>
					<td>
						<input type="text" name="punishSafe.bfkrjobnum" style="width:150px">
					</td>
				</tr>
				<tr>
					<td>
						<label>员工姓名：</label>
					</td>
					<td >
						<input type="text" name="punishSafe.bfkrname" style="width:150px">
					</td>
				</tr>
				<tr>
					<td>
						<label>身份证号：</label>
					</td>
					<td >
						<input type="text" name="punishSafe.bfkridnumber" style="width:150px">
					</td>
				</tr>
				<tr>
					<td>
						<label>专业：</label>
					</td>
					<td>
						<input class="easyui-combobox" name="punishSafe.bfkrmajor" id="major" data-options="panelHeight:'200',editable:false,valueField: 'label',textField: 'value'" style="width:150px"/>
					</td>
				</tr>
				<tr>
					<td>
						<label>岗位：</label>
					</td>
					<td>
						<input class="easyui-combobox" name="punishSafe.bfkrpost" id="post" data-options="panelHeight:'200',editable:false,valueField: 'label',textField: 'value'" style="width:150px"/>
					</td>
				</tr>
				<tr>
					<td>
						<label>罚款时间：</label>
					</td>
					<td >
						<input type="text" name="punishSafe.fksj"  class="easyui-my97" style="width:150px">
					</td>
				</tr>
				<tr>
					<td>
						<label>罚款金额：</label>
					</td>
					<td>
						<input type="text" name="punishSafe.fkje" style="width:150px">
					</td>
				</tr>
			</table>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="submitSearchForm()">确 定</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-back" onclick="crud.clearSearch()">清 空</a>
		</form>
	</div>
	
	<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
	<script type="text/javascript">
	    $(document).ready(
		 	function (){
			 	onloadCombobox('${ctx}','zy',$('#major'),$('#post'),null);
				eSelect = new Select('选择','${ctx}/jsp/safe/EmployeeSelect.jsp'
					 ,null, function(id, jobNum,name,major,post,done,dtwo) {
					$('input[name="punishSafe.bfkrid"]').val(id);
					$('input[name="punishSafe.bfkrname"]').val(name);
					$('input[name="punishSafe.bfkrjobnum"]').val(jobNum);
					$('input[name="punishSafe.bfkrmajor"]').val(major);
					$('input[name="punishSafe.bfkrpost"]').val(post);
					$('input[name="punishSafe.bfkrdone"]').val(done);
					$('input[name="punishSafe.bfkrdtwo"]').val(dtwo);
				});
				//div全屏选择
				eSelect.selectDialog.dialog({  
					maximized:true
				});
					
		 		onloadCombobox('${ctx}','ssqy',$('#areaId'),null,null);
		 		onloadCombobox('${ctx}','ssqy',$('#updAreaId'),null,null);
		 		grid = new Grid('${ctx}/punishSafe/punishSafeAction!list?punishSafe.bfkrdone=<%=departmentf%>&punishSafe.bfkrdtwo=<%=departments%>', 'data_list');
				grid.loadGrid();
				crud = new Crud({
					grid:grid, 
					addFormObject:$('#addForm'), 
					searchFormObject:$('#searchForm'),
					entityName:'punishSafe',
					moduleName:'三违情况',
					url:'${ctx}/punishSafe/punishSafeAction',
					dialogCss:{width:"1000px",height:"450px"},
					afterViewLoadData:function(viewFormObject, data) {
						crud.params.viewFormObject.find(".emp").remove();
					}
				});
				$('#advancedsearch').window({
			       onBeforeClose:function(){ 
			           crud.params.searchFormObject = $('#searchForm');
			       }
			    });
	 	}); 
	    //页面显示（判断每个单元格内容字符长度是否大于25，大于部分用...省略）
	    function gridFormatterLength(value, rowData, rowIndex) {
        	if(value==null || value == '' || value == 'undefined')
        		return '';
    		if(value.length > 25)
    			return value.substring(0, 25) + '...';
    		return value;
	    }
	    function gridFormatters(value, rowData, rowIndex) {
	      	return rowData.bfkrdone + "-" + rowData.bfkrdtwo;
	    } 	
		//数据操作
		function gridFormatter(value, rowData, rowIndex) {
			var rowId = rowData.id;
			var rowName=rowData.questionName;
			var url = "";
			<shiro:hasPermission name="48:view">
			url += "<a title=\"查看\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"${ctx}/images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
			</shiro:hasPermission>
			<shiro:hasPermission name="48:update">
			url += "<a title=\"修改\" onclick='crud.update(\""+rowId+"\");' class='btn2'><img src=\"${ctx}/images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
			</shiro:hasPermission>
			return url;
		}
		//打开高级查询窗口
		function advancedsearch(){
			$('#advancedsearch').window('open');
			crud.params.searchFormObject = $('#advanced');
		}
		//执行高级查询
		function submitSearchForm(){
			crud.search();
			crud.clearSearch();
			$('#advancedsearch').window('close');
			crud.params.searchFormObject = $('#searchForm');
		}
	</script>
</body>
</html>