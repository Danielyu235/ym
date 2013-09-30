<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>贮罐区</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link> 
<link rel="stylesheet" href="${ctx}/css/bus.css" type="text/css"></link> 
<script type="text/javascript">
$(document).ready(
 	function (){
 		eSelect = new Select('选择', '${ctx}/jsp/ymxm/enterprise/EnterpriseSelect.jsp'
	    		 , null, function(id, corpName) {
	    	        $('input[name="tankAraeHazards.dwdm"]').val(id);
	    	        $('input[name="tankAraeHazards.corpName"]').val(corpName);
	    });
	    grid = new Grid('${ctx}/tankAraeHazards/tankAraeHazardsAction!list', 'data_list');
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'),
			searchFormObject:$('#searchForm'),
			entityName:'tankAraeHazards',
			moduleName:'贮罐区',
			url:'${ctx}/tankAraeHazards/tankAraeHazardsAction',
			beforeSubmit:function() {
				 if($('#addForm input[name="tankAraeHazards.dwdm"]').val() == '') {
					$.messager.alert("错误", "请选择所属单位");
					return false;
			 	 }
				 return true;
			}
		});
	}
  ); 
function gridFormatter(value, rowData, rowIndex) {
	var rowId = rowData.id;
	var url = "";
	<shiro:hasPermission name="48:view">
	url += "<a title=\"查看\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"../../images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	<shiro:hasPermission name="48:update">
	url += "<a title=\"修改\" onclick='crud.update(\""+rowId+"\");' class='btn2'><img src=\"../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	<shiro:hasPermission name="48:update">
	url += "<a title=\"查看贮罐\" onclick='viewChildFunction(\""+rowId+"\");' class='btn2'><img src=\"../../images/selectTank.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	if(rowData.hasMap == '1') { //已定位
	url += "<a title=\"定位\" onclick='window.top.gis.showPoint(\""+rowData.dwdm+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.tankName +"\");' class='btn2' ><img src=\"${ctx}/images/showPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	} else {
	url += "<a title=\"打点\" onclick='window.top.gis.addPoint(\""+rowData.dwdm+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.tankName +"\");' class='btn2' ><img src=\"${ctx}/images/addPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	}
	return url;
}
</script>
</head>
<body>
	 <div class="panel-header" style="width:100%;">
		<div class="panel-title panel-with-icon">贮罐区信息列表</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
	 <div>
	        <form id="searchForm" method="post" style="display: inline;">
            <div style="margin-top:-8px;">
             &nbsp;&nbsp;所属单位：&nbsp;&nbsp;
	        <input class="easyui-validatebox" id="corpName" name="tankAraeHazards.corpName" data-options="validType:'length[1,25]'">
	       &nbsp;&nbsp;贮罐区名称：&nbsp;&nbsp;
	        <input class="easyui-validatebox" id="tankName" name="tankAraeHazards.tankName" data-options="validType:'length[1,25]'">
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
	<div style="height:78%;">
	    <table id="data_list" style="display:none">
	        <thead>
	        <tr>
	        <th field="corpName" width="20%" align="center" title="corpName">所属单位</th>
	          <th field="tankName" width="20%" align="center" title="tankName">贮罐区名称</th>
	            <th field="tankArea" width="20%" align="center" title="tankArea">贮罐区面积</th>
	            <th field="tankNumber" width="10%" align="center" title="tankNumber">贮罐个数</th>
	            <th align="center" field="id" width="10%" align="center" formatter="gridFormatter">操作</th>     
	        </tr>
	        </thead>
	    </table>
	</div>
	<!-- 窗口 -->
	<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" 
			data-options="iconCls:'icon-save',modal:true,
    			minimizable:true,maximizable:true,collapsible:true,draggable:false">
		<form method="post" >
	     <input type="hidden" id="updateId" name="tankAraeHazards.id"/>
	     <input type="hidden" class="easyui-validatebox" name="tankAraeHazards.dwdm"/>
		    <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
				    <tr>
				  		  <td class="table_nemu_new" width="25%">所属单位</td>
								<td class="table_con" colspan="3">
									<input type="text" class="easyui-validatebox" name="tankAraeHazards.corpName"
									data-options="validType:'maxByteLength[100]',required:true" disabled="disabled"/>
									<input type="button" value="选择" onclick="eSelect.open()"/>
								</td>
				    </tr>
		   			<tr>
							<td class="table_nemu_new" width="25%">编号</td>
							<td class="table_con" width="25%">
							<input type="text" class="easyui-validatebox" id="updateNumber" name="tankAraeHazards.number"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new" width="25%">贮罐区名称</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" id="updateTankName" name="tankAraeHazards.tankName"
							data-options="required: true" missingMessage="请输入贮罐区名称"/>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">具体位置</td>
							<td class="table_con" colspan="3">
							<textarea type="text" id="upadteAddress" name="tankAraeHazards.address" rows="3" cols="70"></textarea>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">所处环境功能区</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" id="updateAmbientDomain" name="tankAraeHazards.ambientDomain"
							data-options="valueField: 'id',textField: 'value',data: [{id: '工业区',value: '工业区'},{id: '农业区',value: '农业区'},{id: '商业区',value: '商业区'},{id: '居民区',value: '居民区'},
							{id: '行政办公区',value: '行政办公区'},{id: '交通枢纽区',value: '交通枢纽区'},{id: '科技文化区',value: '科技文化区'},{id: '水源保护区',value: '水源保护区'},{id: '文物保护区',value: '文物保护区'}],panelHeight:'auto',width:'100',editable:false " />
							</td>
						
							<td class="table_nemu_new">贮罐区面积（m²）</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" id="updateTankArea" name="tankAraeHazards.tankArea"
							data-options="validType:'maxByteLength[100]'" validtype="positiveInt"/>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">有无防护堤</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" id="updateIsNonBulwark" name="tankAraeHazards.isNonBulwark"
							data-options="valueField: 'id',textField: 'value',data: [{id: '有',value: '有'},{id: '无',value: '无'}],panelHeight:'auto',width:'100',editable:false " />
							</td>
						
							<td class="table_nemu_new">防护堤所围面积（m²）</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" id="updateBulwarkArea" name="tankAraeHazards.bulwarkArea"
							data-options="validType:'maxByteLength[100]'" validtype="positiveInt"/>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">最小距离（m）</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="tankAraeHazards.minRange"
							data-options="validType:'maxByteLength[100]'" id="updateMinRange" validtype="positiveInt"/>
							</td>
							<td class="table_nemu_new">填报人</td>
						<td class="table_con" ><input type="text" class="easyui-validatebox" name="tankAraeHazards.tbr" id="updateTbr"/></td>
						</tr>
						<td class="table_nemu_new">联系电话</td>
						<td class="table_con" ><input type="text" class="easyui-validatebox" name="tankAraeHazards.tblxdh" id="updatedTblxdh" validtype="phone" /></td>
						<td class="table_nemu_new">填报日期</td>
						<td class="table_con" ><input type="text" class="easyui-my97 easyui-validatebox" data-options="required:true,readOnly:true" name="tankAraeHazards.tbrq" id="updateTbrq"/></td>
			</table>
		   </div> 
	   	</form>
	</div>
	</div>
	<script type="text/javascript">
	function viewChildFunction(rowId) {
			$('#childFrame').attr('src', 'TankHazards.jsp?tankAraeID=' + rowId);
			$('#viewChildForm').dialog({
				title:'新增贮罐信息',
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
						$('#viewChildForm').dialog('close');
					}
				}]
			});
		}
	</script>
	<div style="display: none;">
		<div id="viewChildForm" style="width: 960px; height: 400px;" data-options="iconCls:'icon-save'">
			<iframe frameborder="0" id="childFrame" width="100%" height="98%" scrolling-x="no"></iframe>
		</div>
	</div>
</body>
</html>