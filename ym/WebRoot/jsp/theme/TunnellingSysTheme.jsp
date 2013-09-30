<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>掘进系统</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<script type="text/javascript">
$(document).ready(
 	function (){
 	   //onloadCombobox('${ctx}','ssgzm',$('#workingFaceId'),null,null);//加载list页面查询combobox菜单数据
 	   //onloadCombobox('${ctx}','ssgzm',$('#updWorkingFaceId'),null,null);//加载添加，修改页面combobox数据
 		grid = new Grid('${ctx}/coalzt/coalztAction!list?coalzt.type=2', 'data_list');
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'coalzt',
			moduleName:'掘进系统',
			url:'${ctx}/coalzt/coalztAction'
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
		<div class="panel-title panel-with-icon">掘进系统列表</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
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
            <th align="center" field="month" width="150" formatter="gridFormatterLength" >月份</th>
            <th align="center" field="group_type" width="150" formatter="gridFormatterLength" >组别</th>
            <th align="center" field="planYield" width="150" formatter="gridFormatterLength" >产量计划</th>
            <th align="center" field="dailyOutput" width="150" formatter="gridFormatterLength" >产量日产</th>
            <th align="center" field="struggleYield" width="150" formatter="gridFormatterLength" >产量奋斗计划</th>
            <th align="center" field="footagePlan" width="150" formatter="gridFormatterLength" >进尺计划</th>
            <th align="center" field="footageDaily" width="150" formatter="gridFormatterLength" >进尺日进</th>
            <th align="center" field="fstruggleYield" width="150" formatter="gridFormatterLength" >进尺奋斗计划</th>
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
					<input type="hidden" name="coalzt.id" />
					 <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
					
						<tr>					
							<td class="table_nemu_new">月份</td>
							<td class="table_con">
							<input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM'})" class="Wdate" name="coalzt.month" />
							</td>
							<td class="table_nemu_new">组别:</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="coalzt.group_type"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
						
							<td class="table_nemu_new">产量计划:</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="coalzt.planYield"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new">产量日产:</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="coalzt.dailyOutput"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
						
							<td class="table_nemu_new">产量奋斗计划:</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="coalzt.struggleYield"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new">进尺计划:</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="coalzt.footagePlan"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
						
							<td class="table_nemu_new">进尺日进:</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="coalzt.footageDaily"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new">进尺奋斗计划:</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="coalzt.fstruggleYield"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
						
							<td class="table_nemu_new">工作面:</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="coalzt.workingFace"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new">人员效率:</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="coalzt.staffEfficiency"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
						
							<td class="table_nemu_new">回采率:</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="coalzt.recoveryRatio"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new">精品煤①:</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="coalzt.boutiqueCoalOne"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
						
							<td class="table_nemu_new">精品煤②:</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="coalzt.boutiqueCoalTwo"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new">块炭:</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="coalzt.carbonBlock"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						<tr>	
							<td class="table_nemu_new">末煤:</td>
							<td class="table_con" colspan="3">
							<input type="text" class="easyui-validatebox" name="coalzt.smalls"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
				</table>
			</div>
		</form>
	</div>
	</div>
</body>
</html>