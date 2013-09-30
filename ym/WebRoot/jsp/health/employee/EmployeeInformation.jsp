<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="gb2312" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>员工信息</title>
<script type="text/javascript" src="${ctx}/js/GridUtilNoToolBar.js"></script>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<script type="text/javascript">
$(document).ready(
	
 	function (){
 		onloadCombobox('${ctx}','post',$('#specialities'),$('#post'),null);
 		onloadCombobox('${ctx}','post',$('#updatesszy'),$('#updatessgz'),null);
 		grid = new Grid('${ctx}/employeeInformation/employeeInformationAction!list', 'data_list');
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'employeeInformation',
			moduleName:'员工',
			url:'${ctx}/employeeInformation/employeeInformationAction',
			afterUpdateLoadData:function(updateFormObject, data) {
					onLoadSelect("${ctx}",$('#specialities'),$('#post'));
					
					$('#post').combobox('setValue', data.post);
				},
			afterViewLoadData:function(viewFormObject, data) {
					
					$(viewFormObject).find('span[name="employeeInformation.specialities"]').text(data.specialitiesByType);
					$(viewFormObject).find('span[name="employeeInformation.post"]').text(data.postByType);
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
	<shiro:hasPermission name="48:update">
	url += "<a title=\"体检\" onclick='checkup(\""+rowId+"\");' class='btn2' ><img src=\"${ctx}/images/stethoscope.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	return url;
}
	function checkup(rowId){
		$('#checkupFrame').attr('src', '${ctx}/jsp/health/checkup/CheckUp.jsp?id='+rowId);
			$('#viewPeopleForm').dialog({
				title:'体检',
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
	function doBlur(jobNumber){
		var isT=false ;
		if(jobNumber!=null&&jobNumber!=''){
			$.ajax({
				url:'${ctx}/employeeInformation/employeeInformationAction!getByJobNumber',
				async:false,
				data:'jobNumber='+jobNumber,
				success:function(data){
					if(data!='0'){
					$.messager.alert('失败','工号已存在');
					isT= false;
					
				}else{
					isT= true;
				}
				}
			});
			
		}
		return isT;
	}
	
</script>
</head>
<body>

  <div class="panel-header" style="width:100%;">
	<div class="panel-title panel-with-icon">员工信息</div>
	<div class="panel-icon icon-edit"></div>
	<div class="panel-tool"></div>
</div>

<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
 <div id="search">
        <form id="searchForm" method="post" style="display: inline;">
        
        <div style=" margin-top:-8px;">
       &nbsp;&nbsp;工号:&nbsp;&nbsp;<input type="text" name="employeeInformation.jobNumber" />
			&nbsp;&nbsp;姓名:&nbsp;&nbsp;<input type="text" name="employeeInformation.name" />
			
			
		
		
			
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

    </div>
<!-- 表单表头 -->
<div style="height:74%;">
    <table id="data_list" style="display:none;" >
        <thead>
        <tr>
             <th align="center" field="jobNumber" width="15%"  >工号</th>
            <th align="center" field="name" width="15%" >姓名</th>
            <th align="center" field="sex" width="15%"  >性别</th>
            <th align="center" field="date" width="15%"  >出生日期</th>
            <!-- th align="center" field="dept" width="15%" >所在岗位</th> -->
            <th align="center" field="result" width="15%"  >检查结果</th>
            <th align="center" field="id" width="15%" formatter="gridFormatter">操作</th>          
        </tr>
        </thead>
    </table>
</div>

<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" 
			data-options="iconCls:'icon-save',modal:true,
    			minimizable:true,maximizable:true,collapsible:true,draggable:false">
		<form method="post" >
		<input type="hidden" id="updateId" name="employeeInformation.id"/>
	    <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
	  				<tr>
							<td class="table_nemu_new">工号:</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" id="jobNumber" name="employeeInformation.jobNumber"
							data-options="validType:'maxByteLength[100]'" required="true" onBlur="doBlur(this.value)" />
							</td>
						
							<td class="table_nemu_new">姓名:</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employeeInformation.name"
							data-options="validType:'maxByteLength[100]'"  required="true"/>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">性别:</td>
							<td class="table_con">
							<input  type="text"  name="employeeInformation.sex"
							class="easyui-combobox" data-options="valueField:'v', textField:'v', data:[{v:'男'},{v:'女'}],editable:false" panelHeight="auto" required="true"/>
							</td>
						
							<td class="table_nemu_new">出生日期:</td>
							<td class="table_con">
							<input type="text" readonly="readonly"  class="easyui-datebox"  name="employeeInformation.date" required="true" id="date"/>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new" style="25%;">专业</td>
							<td class="table_con" style="25%;">
							<input class="easyui-combobox" data-options="panelHeight:'auto',editable:false" id="specialities" name="employeeInformation.specialities"  />
							</td>
							<td class="table_nemu_new" style="25%;">岗位</td>
							<td class="table_con" style="25%;">
							<input class="easyui-combobox" data-options="panelHeight:'auto',editable:false" id="post" name="employeeInformation.post"  />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">电话号码:</td>
							<td class="table_con">
							<input  type="text"  name="employeeInformation.telephone"
							class="easyui-validatebox" data-options="validType:'phoneNumber'" />
							</td>
						
							<td class="table_nemu_new">电子邮箱:</td>
							<td class="table_con">
							<input type="text"  class="easyui-validatebox"  name="employeeInformation.email" data-options="validType:'email[50]'" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">家庭地址:</td>
							<td class="table_con" colspan="3">
							<input type="text" class="easyui-validatebox" name="employeeInformation.address"
							data-options="validType:'maxByteLength[100]'"  required="true" size='80'/>
							</td>
						
						</tr>
						
				</table>
	        </div> 
   	</form>
</div>
</div>
	<div style="display: none;">
		<div id="viewPeopleForm" style="width: 960px; height: 400px;" data-options="iconCls:'icon-save'">
			<iframe frameborder="0" id="checkupFrame" width="100%" height="98%" scrolling-x="no"></iframe>
		</div>
	</div>
</body>
</html>