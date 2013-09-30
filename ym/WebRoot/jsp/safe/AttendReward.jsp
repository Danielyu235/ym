<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<%
	String departmentf = request.getParameter("departmentf");
	String departments = request.getParameter("departments");
	if(departmentf == null){
		departmentf = "";
	}
	if(departments == null){
		departments = "";
	}
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>人员日常考勤与奖罚</title>
	<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
	<style type="text/css">
		.emp{
			display:block;
		}
	</style>
</head>
<body>
	<div class="panel-header" style="width:100%;">
		<div class="panel-title panel-with-icon">人员日常考勤与奖罚列表</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	
    <div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
	     <div>
	        <form id="searchForm" method="post" style="display: inline;">
	            <div style="margin-top:-8px;">            
					&nbsp;&nbsp;员工工号:&nbsp;&nbsp;<input type="text" name="attendReward.employeeName" id="employee.jobnum" style="width: 120px;"/>
					 <!-- &nbsp;&nbsp;员工姓名:&nbsp;&nbsp;<input type="text" name="attendReward.name" id="employee.ename" style="width: 120px;"/> -->
					&nbsp;&nbsp;记录时间:&nbsp;&nbsp;<input type="text" name="attendReward.jlTime" class="easyui-my97 easyui-validatebox" data-options="readOnly:true" style="width: 120px;"/>
					&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search();">查询</a>
					&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="advancedsearch()">高级查询</a>&nbsp;&nbsp;
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
		        <tr>
		            <th align="center" field="jobNum" width="80" formatter="gridFormatterLength" >员工工号</th>
		            <th align="center" field="name" width="80" formatter="gridFormatterLength" >员工姓名</th>
		            <th align="center" field="major" width="80" formatter="gridFormatterLength" >专业</th>
			        <th align="center" field="post" width="80" formatter="gridFormatterLength" >岗位</th>
		            <th align="center" field="done" width="120" formatter="gridFormatters" >所属部门</th>
		            <th align="center" field="jlTime" width="80" formatter="gridFormatterLength" >记录时间</th>
		            <th align="center" field="attend" width="80" formatter="gridFormatterLength" >考勤状况</th>
		            <th align="center" field="reward" width="80" formatter="gridFormatterLength" >奖惩情况</th>
		            <th align="center" field="id" width="80" formatter="gridFormatter">操作</th>          
	            </tr>
	        </thead>
	    </table>
	</div>

	<!-- 添加更新窗口 -->
	<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" data-options="iconCls:'icon-save',modal:true,minimizable:true,maximizable:true,collapsible:true,draggable:false">
			<form method="post" >
		    <input type="hidden" name="attendReward.id"/>
		    <input type="hidden" name="attendReward.employeeId"/>
		    	<div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
					<table id="detailTable" cellpadding="5px" style="font-size:12px;" cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
						<tr>
							<td class="table_nemu_new"  width="15%">员工工号</td>
							<td class="table_con" width="35%">
								<div  style="float: left;" width="25%">
									<input type="text" class="easyui-validatebox" name="attendReward.jobNum" disabled/>
								</div>
								<div class="emp" style="float:left;" width="25%">
									<input type="button" value="单击选择" onclick="eSelect.open()" />
								</div>						
							</td>
							<td class="table_nemu_new" width="15%">所在部门</td>
							<td class="table_con" width="35%">
								<input type="text" class="easyui-validatebox" name="attendReward.done" disabled style="width:100px"/>
								-
								<input type="text" class="easyui-validatebox" name="attendReward.dtwo" disabled style="width:100px"/>
							</td>						
						</tr>
						<tr>
							<td class="table_nemu_new">员工名称</td>
							<td class="table_con">
								<input type="text" class="easyui-validatebox" name="attendReward.name" id="employeeName" disabled/>
							</td>
							<td class="table_nemu_new">专业</td>
							<td class="table_con">
								<input type="text" class="easyui-validatebox" name="attendReward.major" disabled />
							</td>						
						</tr>
						<tr>
							<td class="table_nemu_new">岗位</td>
							<td class="table_con">
								<input type="text" class="easyui-validatebox" name="attendReward.post" disabled/>
							</td>				
							<td class="table_nemu_new">记录时间</td>
							<td class="table_con">
							<input type="text" class="easyui-my97 easyui-validatebox" data-options="required:true,readOnly:true" name="attendReward.jlTime"/>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">考勤状况</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="attendReward.attend"
							data-options="panelHeight:'auto',editable:false,valueField: 'label',
							textField: 'value',
							data:[{
							     label:'迟到',
							     value:'迟到'
							     },
							     {
							     label:'旷工',
							     value:'旷工'
							     }]" />
							</td>
						
							<td class="table_nemu_new">奖惩情况</td>
							<td class="table_con">
							<input type="text"  class="easyui-combobox" name="attendReward.reward"
							data-options="panelHeight:'auto',editable:false,valueField: 'label',
							textField: 'value',
							data:[{
							     label:'奖励',
							     value:'奖励'
							     },
							     {
							     label:'惩罚',
							     value:'惩罚'
							     }]" />
							</td>
						</tr>						
						<tr>
							<td class="table_nemu_new">奖惩原因</td>
							<td class="table_con" colspan="3">
							<TEXTAREA  type="text" style="width: 80%; height: 80px;"  name="attendReward.rewardReason"
							></TEXTAREA>
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
						<input type="text" name="attendReward.employeeName" style="width:150px">
					</td>
				</tr>
				<tr>
					<td>
						<label>员工姓名：</label>
					</td>
					<td >
						<input type="text" name="attendReward.name" style="width:150px">
					</td>
				</tr>
				<tr>
					<td>
						<label>身份证号：</label>
					</td>
					<td >
						<input type="text" name="attendReward.idNumber" style="width:150px">
					</td>
				</tr>
				<tr>
					<td>
						<label>专业：</label>
					</td>
					<td>
						<input class="easyui-combobox" name="attendReward.major" id="major" data-options="panelHeight:'auto',editable:false,valueField: 'label',textField: 'value'" style="width:150px"/>
					</td>
				</tr>
				<tr>
					<td>
						<label>岗位：</label>
					</td>
					<td>
						<input class="easyui-combobox" name="attendReward.post" id="post" data-options="panelHeight:'auto',editable:false,valueField: 'label',textField: 'value'" style="width:150px"/>
					</td>
				</tr>
				<tr>
					<td>
						<label>记录时间：</label>
					</td>
					<td >
						<input type="text" name="attendReward.jlTime"  class="easyui-my97" style="width:150px">
					</td>
				</tr>				
				<tr>
					<td>
						<label>考勤情况：</label>
					</td>
					<td>
						<input class="easyui-combobox" name="attendReward.attend" data-options="panelHeight:'auto',editable:false,
							valueField: 'label',
							textField: 'value',
							data: [{
								label: '迟到',
								value: '迟到'
							},{
								label: '旷工',
								value: '旷工'
							}]" style="width:150px"/>
					</td>
				</tr>
				<tr>
					<td>
						<label>奖惩情况：</label>
					</td>
					<td>
						<input class="easyui-combobox" name="attendReward.reward" data-options="panelHeight:'auto',editable:false,
							valueField: 'label',
							textField: 'value',
							data: [{
								label: '惩罚',
								value: '惩罚'
							},{
								label: '奖励',
								value: '奖励'
							}]" style="width:150px"/>
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
       $(document).ready(function (){
    	   onloadCombobox('${ctx}','zy',$('#major'),$('#post'),null);
    	  	eSelect = new Select('选择','${ctx}/jsp/safe/EmployeeSelect.jsp'
   	    		 , null, function(id, jobNum,name,major,post,done,dtwo) {
   	    		  $('input[name="attendReward.employeeId"]').val(id);
   	    	        $('input[name="attendReward.jobNum"]').val(jobNum);
   	    	         $('#employeeName').val(name);
   	    	        $('input[name="attendReward.major"]').val(major);
   	    	        $('input[name="attendReward.post"]').val(post);
   	    	        $('input[name="attendReward.done"]').val(done);
		    	    $('input[name="attendReward.dtwo"]').val(dtwo);
   	    });
		//div 全屏选择
		eSelect.selectDialog.dialog({  
			maximized:true
		});
           
        grid =new Grid('${ctx}/attendReward/attendRewardAction!list?attendReward.done=<%=departmentf%>&attendReward.dtwo=<%=departments%>','data_list');
        grid.loadGrid();
 		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'attendReward',
			moduleName:'人员日常考勤与奖罚',
			url:'${ctx}/attendReward/attendRewardAction',
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

         function gridFormatterLength(value, rowData, rowIndex) {
         	if(value==null || value == '' || value == 'undefined')
         		return '';
     		if(value.length > 25)
     			return value.substring(0, 25) + '...';
     		return value;
     	}
     	function gridFormatters(value, rowData, rowIndex) {
         	return rowData.done+"-"+rowData.dtwo
        }
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