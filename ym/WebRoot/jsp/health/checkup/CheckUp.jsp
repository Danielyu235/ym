<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="gb2312" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>员工信息</title>
<% 
	String id = request.getParameter("id");
	String departmentf =request.getParameter("departmentf");
		String departments =request.getParameter("departments");
		if(departmentf == null){
			departmentf ="";
		}
		if(departments == null){
			departments ="";
		}
 %>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<script type="text/javascript">

$(document).ready(
 	function (){
 		
 		grid = new Grid('${ctx}/checkUp/checkUpAction!list?checkUp.pid=<%=id%>&checkUp.done=<%=departmentf%>&checkUp.dtwo=<%=departments%>', 'data_list');
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'checkUp',
			moduleName:'体检信息',
			url:'${ctx}/checkUp/checkUpAction',
			beforeSubmit:function(){
				$('#pid').val('<%=id%>');
				return true;
			}
		});
 	
 	}
 	
  ); 
         //加载表单操作列
function gridFormatter(value, rowData, rowIndex) {
	var rowId = rowData.id;
	var url = "";
	<shiro:hasPermission name="48:view">
	url += "<a title=\"查看\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"${ctx}/images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	<shiro:hasPermission name="48:update">
	url += "<a title=\"修改\" onclick='crud.update(\""+rowId+"\");' class='btn2' ><img src=\"${ctx}/images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	
	return url;
}

	function checkup(n){
		var url='${ctx}/jsp/health/checkup/';
		var ti;
		if(n=='1'){
			url+='Bloo.jsp?id=<%=id%>';
			ti='血压趋势';
		}else{
			url+='pulseRate.jsp?id=<%=id%>';
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
</script>
</head>
<body>

  <div class="panel-header" style="width:100%;">
	<div class="panel-title panel-with-icon">体检信息</div>
	<div class="panel-icon icon-edit"></div>
	<div class="panel-tool"></div>
</div>

<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
 <div id="search">
        <form id="searchForm" method="post" style="display: inline;">
        
        <div style=" margin-top:-8px;">
       	&nbsp;&nbsp;血压(高):&nbsp;&nbsp;<input type="text" name="checkUp.bloodPressureHigh" />
       	&nbsp;&nbsp;血压(低):&nbsp;&nbsp;<input type="text" name="checkUp.bloodPressureLow" />
		&nbsp;&nbsp;脉率:&nbsp;&nbsp;<input type="text" name="checkUp.pulseRate" />
		
		
			
			&nbsp;&nbsp;
        &nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search();">查询</a>
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
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-bloo', plain:true" onclick="checkup('1');">血压趋势</a>&nbsp;
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-pulse', plain:true" onclick="checkup('2');">脉率趋势</a>
    </div>
<!-- 表单表头 -->
<div style="height:74%;">
    <table id="data_list" style="display:none;" >
        <thead>
        <tr>
        	<th align="center" field="bloodPressureHigh" width="150"  >血压(高)</th>
            <th align="center" field="bloodPressureLow" width="150"  >血压(低)</th>
            <th align="center" field="pulseRate" width="150"  >脉率</th>
            <th align="center" field="electrocardiogram" width="150"  >心电图</th>
            <th align="center" field="bc" width="150"  >B超</th>
            <th align="center" field="pneumoconiosis" width="150"  >尘肺病</th>
            <th align="center" field="bloodExamination" width="150"  >血液检查</th>
            <th align="center" field="lkExamination" width="150"  >肝肾功能</th>
            <th align="center" field="date" width="150"  >体检时间</th>
            
           
            
            <th field="id" width="120" formatter="gridFormatter">操作</th>         
        </tr>
        </thead>
    </table>
</div>

<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" 
			data-options="iconCls:'icon-save',modal:true,
    			minimizable:true,maximizable:true,collapsible:true,draggable:false">
		<form method="post" >
		<input type="hidden" name="checkUp.pid" id="pid" />
		<input type="hidden" id="updateId" name="checkUp.id"/>
	    <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
	  				<tr>
							<td class="table_nemu_new">血压(高):</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="checkUp.bloodPressureHigh"
							data-options="validType:'positiveInt'" required="true"/>(mmHg)
							</td>
						<td class="table_nemu_new">血压(低):</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="checkUp.bloodPressureLow"
							data-options="validType:'positiveInt'" required="true"/>(mmHg)
							</td>
							</tr>
							<tr>
							<td class="table_nemu_new">脉率:</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="checkUp.pulseRate"
							data-options="validType:'positiveInt'" required="true"/>(bpm)
							</td>
						
							<td class="table_nemu_new">心电图:</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="checkUp.electrocardiogram"
							data-options="valueField:'v', textField:'m', data:[{v:'正常',m:'正常'},{v:'不正常',m:'不正常'}],editable:false" panelHeight="auto"/>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">B超:</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="checkUp.bc"
							data-options="valueField:'v', textField:'m', data:[{v:'正常',m:'正常'},{v:'不正常',m:'不正常'}],editable:false" panelHeight="auto" />
						
							<td class="table_nemu_new">尘肺病:</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="checkUp.pneumoconiosis"
							data-options="valueField:'v', textField:'m', data:[{v:'无',m:'无'},{v:'有',m:'有'}],editable:false" panelHeight="auto" required="true"/>
							</td>
							
						</tr>
						
						<tr>
							<td class="table_nemu_new">血液检查:</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="checkUp.bloodExamination"
							data-options="valueField:'v', textField:'m', data:[{v:'正常',m:'正常'},{v:'不正常',m:'不正常'}],editable:false" panelHeight="auto" />
							</td>
						
							<td class="table_nemu_new">肝肾功能:</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="checkUp.lkExamination"
							data-options="valueField:'v', textField:'m', data:[{v:'正常',m:'正常'},{v:'不正常',m:'不正常'}],editable:false" panelHeight="auto" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">神经系统:</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="checkUp.nervousSystem"
							data-options="valueField:'v', textField:'m', data:[{v:'正常',m:'正常'},{v:'不正常',m:'不正常'}],editable:false" panelHeight="auto" />
							</td>
						
							<td class="table_nemu_new">甲状腺:</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="checkUp.thyroid"
							data-options="valueField:'v', textField:'m', data:[{v:'正常',m:'正常'},{v:'不正常',m:'不正常'}],editable:false" panelHeight="auto" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">浅表淋巴结:</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="checkUp.superficialLymphadenopathy"
							data-options="valueField:'v', textField:'m', data:[{v:'正常',m:'正常'},{v:'不正常',m:'不正常'}],editable:false" panelHeight="auto" />
							</td>
						
							<td class="table_nemu_new">皮肤黏膜:</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="checkUp.skinAndMucosa"
							data-options="valueField:'v', textField:'m', data:[{v:'正常',m:'正常'},{v:'不正常',m:'不正常'}],editable:false" panelHeight="auto" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new" >
								体检时间
							</td>
							<td colspan="3" class="table_con">
							<input type="text" readonly="readonly"  class="easyui-datebox" name="checkUp.date" data-options="validType:'currentDate'" required="true" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">备注:</td>
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
		<div id="viewPeopleForm" style="width: 960px; height: 500px;" data-options="iconCls:'icon-save'">
			<iframe frameborder="0" id="checkupFrame" width="100%" height="100%" scrolling-x="no"></iframe>
		</div>
	</div>
</body>
</html>