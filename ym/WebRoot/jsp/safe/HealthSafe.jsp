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
	<title>人员职业健康</title>
	<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
	<style type="text/css">
		.emp{
			display:block;
		}
	</style>
</head>
<body>
	<div class="panel-header" style="width:100%;">
		<div class="panel-title panel-with-icon">人员职业健康</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	
	<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
		<div>
	    	<form id="searchForm" method="post" style="display: inline;">
            	<div style="margin-top:-8px;">	            	
					&nbsp;&nbsp;员工工号:&nbsp;&nbsp;<input type="text" name="checkUp.employeeName" id="employee.jobnum" style="width: 120px;" />
					<!-- &nbsp;&nbsp;员工姓名:&nbsp;&nbsp;<input type="text" name="checkUp.name" id="employee.ename" style="width: 120px;"/> -->
					&nbsp;&nbsp;体检时间:&nbsp;&nbsp;<input name="checkUp.date" class="easyui-my97 easyui-validatebox" style="width: 120px;"/>&nbsp;&nbsp;
					<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search()">查询</a>&nbsp;&nbsp;
					<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="advancedsearch()">高级查询</a>&nbsp;&nbsp;
					<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch();">清空</a>
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
			        <th align="center" field="jobNum" width="80" formatter="gridFormatterLength" >员工工号</th>
			        <th align="center" field="name" width="80" formatter="gridFormatterLength" >员工姓名</th>
		            <th align="center" field="major" width="80" formatter="gridFormatterLength" >专业</th>
		            <th align="center" field="post" width="80" formatter="gridFormatterLength" >岗位</th>
		            <th align="center" field="done" width="100" formatter="gridFormatters" >所属部门</th>
		            <th align="center" field="result" width="50" formatter="gridFormatterLength" >体检结果</th>            
		            <th align="center" field="date" width="50" formatter="gridFormatterLength" >体检时间</th>            
		            <th align="center" field="id" width="120" formatter="gridFormatter">操作</th>   
		        </tr>
	        </thead>
	    </table>
	</div>
	
	<!-- 添加更新窗口 -->
	<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" 
			data-options="iconCls:'icon-save',modal:true,minimizable:true,maximizable:true,collapsible:true,draggable:false">    			
			<form method="post" >
				<input type="hidden" class="easyui-validatebox" name="checkUp.pid"/>
		     	<input type="hidden" name="checkUp.id"/>
			    <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
					<table id="detailTable" cellpadding="5px" style="font-size:12px;"cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
					 	<tr>
							<td class="table_nemu_new"  width="15%">员工工号</td>
							<td class="table_con" width="35%">
								<div  style="float: left;" width="25%">
									<input type="text" class="easyui-validatebox" name="checkUp.jobNum" disabled/>
								</div>
								<div class="emp" style="float:left;" width="25%">
									<input type="button" value="单击选择" onclick="eSelect.open()" />
								</div>						
							</td>
							<td class="table_nemu_new" width="15%">所在部门</td>
							<td class="table_con" width="35%">
								<input type="text" class="easyui-validatebox" name="checkUp.done" disabled style="width:100px"/>
								-
								<input type="text" class="easyui-validatebox" name="checkUp.dtwo" disabled style="width:100px"/>
							</td>						
						</tr>
						<tr>
							<td class="table_nemu_new">员工名称</td>
							<td class="table_con">
								<input type="text" class="easyui-validatebox" name="checkUp.name" id="employeeName" disabled/>
							</td>
							<td class="table_nemu_new">专业</td>
							<td class="table_con">
								<input type="text" class="easyui-validatebox" name="checkUp.major" disabled />
							</td>						
						</tr>
						<tr>
							<td class="table_nemu_new">岗位</td>
							<td class="table_con">
								<input type="text" class="easyui-validatebox" name="checkUp.post" disabled/>
							</td>				
							<td class="table_nemu_new" >
								体检时间
							</td>
							<td class="table_con">
							<input type="text" class="easyui-my97 easyui-validatebox" data-options="required:true,readOnly:true" name="checkUp.date" />
							</td>
						</tr>						
						<tr>
							<td class="table_nemu_new">血压(高)(mmHg)</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="checkUp.bloodPressureHigh"
							data-options="validType:'positiveInt'" required="true"/>
							</td>
						<td class="table_nemu_new">血压(低)(mmHg)</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="checkUp.bloodPressureLow"
							data-options="validType:'positiveInt'" required="true"/>
							</td>
							</tr>
							<tr>
							<td class="table_nemu_new">脉率(bpm)</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="checkUp.pulseRate"
							data-options="validType:'positiveInt'" required="true"/>
							</td>
						
							<td class="table_nemu_new">心电图</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="checkUp.electrocardiogram"
							data-options="valueField:'v', textField:'m', data:[{v:'正常',m:'正常'},{v:'不正常',m:'不正常'}],editable:false" panelHeight="auto"/>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">B超</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="checkUp.bc"
							data-options="valueField:'v', textField:'m', data:[{v:'正常',m:'正常'},{v:'不正常',m:'不正常'}],editable:false" panelHeight="auto" />
						
							<td class="table_nemu_new">尘肺病</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="checkUp.pneumoconiosis"
							data-options="valueField:'v', textField:'m', data:[{v:'无',m:'无'},{v:'有',m:'有'}],editable:false" panelHeight="auto" required="true"/>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">血液检查</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="checkUp.bloodExamination"
							data-options="valueField:'v', textField:'m', data:[{v:'正常',m:'正常'},{v:'不正常',m:'不正常'}],editable:false" panelHeight="auto" />
							</td>
						
							<td class="table_nemu_new">肝肾功能</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="checkUp.lkExamination"
							data-options="valueField:'v', textField:'m', data:[{v:'正常',m:'正常'},{v:'不正常',m:'不正常'}],editable:false" panelHeight="auto" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">神经系统</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="checkUp.nervousSystem"
							data-options="valueField:'v', textField:'m', data:[{v:'正常',m:'正常'},{v:'不正常',m:'不正常'}],editable:false" panelHeight="auto" />
							</td>
						
							<td class="table_nemu_new">甲状腺</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="checkUp.thyroid"
							data-options="valueField:'v', textField:'m', data:[{v:'正常',m:'正常'},{v:'不正常',m:'不正常'}],editable:false" panelHeight="auto" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">浅表淋巴结</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="checkUp.superficialLymphadenopathy"
							data-options="valueField:'v', textField:'m', data:[{v:'正常',m:'正常'},{v:'不正常',m:'不正常'}],editable:false" panelHeight="auto" />
							</td>
						
							<td class="table_nemu_new">皮肤黏膜</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="checkUp.skinAndMucosa"
							data-options="valueField:'v', textField:'m', data:[{v:'正常',m:'正常'},{v:'不正常',m:'不正常'}],editable:false" panelHeight="auto" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">备注</td>
							<td colspan="3" class="table_con">
							<textarea class="easyui-validatebox" name="checkUp.remark"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[500]'">
							</textarea>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
	<div style="display: none;">
		<div id="viewPeopleForm" style="width: 1000px; height: 500px;" data-options="iconCls:'icon-save'">
			<iframe frameborder="0" id="checkupFrame" width="100%" height="100%" scrolling-x="no"></iframe>
		</div>
	</div>
	
	<!-- 弹出层（高级查询） -->
	<div id="advancedsearch" class="easyui-window" style="width: 360px; height: 280px" title="高级查询"
		data-options="modal:true,closed:true,minimizable:false,maximizable:false,resizable:false" align="center">
		<form id="advanced">
			<table style="border:0;padding:5px;width:auto">
				<tr>
					<td style="width:100px">
						<label>员工工号：</label>
					</td>
					<td>
						<input type="text" name="checkUp.employeeName" style="width:150px">
					</td>
				</tr>
				<tr>
					<td>
						<label>员工姓名：</label>
					</td>
					<td >
						<input type="text" name="checkUp.name" style="width:150px">
					</td>
				</tr>
				<tr>
					<td>
						<label>身份证号：</label>
					</td>
					<td >
						<input type="text" name="checkUp.idNumber" style="width:150px">
					</td>
				</tr>
				<tr>
					<td>
						<label>专业：</label>
					</td>
					<td>
						<input class="easyui-combobox" name="checkUp.major" id="major" data-options="panelHeight:'auto',editable:false,valueField: 'label',textField: 'value'" style="width:150px"/>
					</td>
				</tr>
				<tr>
					<td>
						<label>岗位：</label>
					</td>
					<td>
						<input class="easyui-combobox" name="checkUp.post" id="post" data-options="panelHeight:'auto',editable:false,valueField: 'label',textField: 'value'" style="width:150px"/>
					</td>
				</tr>
				<tr>
					<td>
						<label>体检时间：</label>
					</td>
					<td >
						<input type="text" name="checkUp.date"  class="easyui-my97" style="width:150px">
					</td>
				</tr>				
				<tr>
					<td>
						<label>体检结果：</label>
					</td>
					<td>
						<input class="easyui-combobox" name="checkUp.result" data-options="panelHeight:'auto',editable:false,
							valueField: 'label',
							textField: 'value',
							data: [{
								label: '正常',
								value: '正常'
							},{
								label: '不正常',
								value: '不正常'
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
	    $(document).ready(
		 	function (){
		 		onloadCombobox('${ctx}','zy',$('#major'),$('#post'),null);
		 		eSelect = new Select('选择','${ctx}/jsp/safe/EmployeeSelect.jsp'
		    		 , null, function(id, jobNum,name,major,post,done,dtwo) {
		    		    $('input[name="checkUp.pid"]').val(id);
		    	        $('input[name="checkUp.jobNum"]').val(jobNum);
		    	        $('#employeeName').val(name);
		    	        $('input[name="checkUp.major"]').val(major);
		    	        $('input[name="checkUp.post"]').val(post);
		    	        $('input[name="checkUp.done"]').val(done);
		    	        $('input[name="checkUp.dtwo"]').val(dtwo);
		    });
		     //div 全屏选择
			eSelect.selectDialog.dialog({  
				maximized:true
			});
	 			grid = new Grid('${ctx}/checkUp/checkUpAction!list?checkUp.done=<%=departmentf%>&checkUp.dtwo=<%=departments%>', 'data_list');
				grid.loadGrid();
				crud = new Crud({
					grid:grid, 
					addFormObject:$('#addForm'), 
					searchFormObject:$('#searchForm'),
					entityName:'checkUp',
					moduleName:'人员职业健康',
					url:'${ctx}/checkUp/checkUpAction',
					dialogCss:{width:"1100px",height:"600px"},
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
	      	return rowData.done+"-"+rowData.dtwo
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
			url += "<a title=\"血压趋势\" href=\"javascript:void(0)\" onclick=\"checkup('1','"+rowData.pid+"')\"><img src=\"${ctx}/images/bloo.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
			url += "<a title=\"脉率趋势\" href=\"javascript:void(0)\" onclick=\"checkup('2','"+rowData.pid+"');\"><img src=\"${ctx}/images/pulseRate.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
			return url;
		}
		function checkup(n,pid){
			var url='${ctx}/jsp/safe/';
			var ti;
			if(n=='1'){
				url+='Bloo.jsp?id='+pid;
				ti='血压趋势';
			}else{
				url+='pulseRate.jsp?id='+pid;
				ti='脉率趋势';
			}		
			$('#checkupFrame').attr('src', url);
			$('#viewPeopleForm').dialog({
				title:ti,
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
						$('#viewPeopleForm').dialog('close');
					}
				}]
			});		
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