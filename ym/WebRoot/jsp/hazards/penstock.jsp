<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="gb2312" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>管道信息列表</title>

<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<script type="text/javascript">
$(document).ready(
 	function (){
 			// 参数1：访问路径;参数2：实体类名；参数3：title
 		//init('${ctx}/tbHazhardsPenstock/tbHazhardsPenstockAction','tbHazhardsPenstock','压力管道');
         //加载数据
 		eSelect = new Select('选择','${ctx}/jsp/ymxm/enterprise/EnterpriseSelect.jsp'
	    		 , null, function(id, corpName) {
	    	        $('input[name="tbHazhardsPenstock.dwdm"]').val(id);
	    	        $('input[name="tbHazhardsPenstock.corpName"]').val(corpName);
	    });
 		 mSelect = new Select('选择', '${ctx}/jsp/hazards/materials/MaterialsSelect.jsp'
	    		 , null, function(id, name) {
	    	        //alert(id + ":" + corpName);
	    	        $('input[name="tbHazhardsPenstock.materialsId"]').val(id);
	    	        $('input[name="tbHazhardsPenstock.csjz"]').val(name);
	    });
		oSelect = new Select('自定义危险物质', '${ctx}/jsp/hazards/materials/OtherMaterialsSelect.jsp'
	    		 , {width:'900px', height:'200px'}, function(id, name) {
	    	        //alert(id + ":" + corpName);
	    	        $('input[name="tbHazhardsPenstock.materialsId"]').val(id);
	    	        $('input[name="tbHazhardsPenstock.csjz"]').val(name);
	    });
 		grid = new Grid('${ctx}/tbHazhardsPenstock/tbHazhardsPenstockAction!list', 'data_list');
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'tbHazhardsPenstock',
			moduleName:'压力管道',
			url:'${ctx}/tbHazhardsPenstock/tbHazhardsPenstockAction',
			beforeSubmit:function() {
					 if($('#addForm input[name="tbHazhardsPenstock.dwdm"]').val() == '') {
						$.messager.alert("错误", "请选择所属单位");
						return false;
				 	 }
				 	  if($('input[name="tbHazhardsPenstock.materialsId"]').val() == '') {
			                	$.messager.alert("错误", "请选择危险物质");
	        					return;
	        			 }
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
	url += "<a title=\"查看\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"../../images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	<shiro:hasPermission name="48:update">
	url += "<a title=\"修改\" onclick='crud.update(\""+rowId+"\");' class='btn2'><img src=\"../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	if(rowData.hasMap == '1') { //已定位
	url += "<a title=\"定位\" onclick='window.top.gis.showPoint(\""+rowData.dwdm+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.gdmc +"\");' class='btn2' ><img src=\"${ctx}/images/showPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	} else {
	url += "<a title=\"打点\" onclick='window.top.gis.addPoint(\""+rowData.dwdm+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.gdmc +"\");' class='btn2' ><img src=\"${ctx}/images/addPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	}
	return url;
}
</script>
</head>
<body>

  <div class="panel-header" style="width:100%;">
	<div class="panel-title panel-with-icon">压力管道信息列表</div>
	<div class="panel-icon icon-edit"></div>
	<div class="panel-tool"></div>
</div>

<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
<div>
        <form id="searchForm" method="post" style="display: inline;">
        <div style="margin-top:-8px;">
        &nbsp;&nbsp;所属单位:&nbsp;&nbsp;<input class="easyui-validatebox" id="corpName" name="tbHazhardsPenstock.corpName" >
        &nbsp;&nbsp;管道名称:&nbsp;&nbsp;<input class="easyui-validatebox"  name="tbHazhardsPenstock.gdmc">
        &nbsp;&nbsp;管道类别:&nbsp;&nbsp;<input type="text" class="easyui-combobox" name="tbHazhardsPenstock.gdlb"
							data-options="valueField:'v', textField:'v', data:
							[{v:'长输管道'},{v:'公用管道'},{v:'工业管道'}],editable:false" panelHeight="auto"/>
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

<div style="height: 500px">
    <table id="data_list" class="easyui-datagrid" loadMsg="正在努力拉取数据中..."
           fit="true" fitColumns="true">
        <thead>
        <tr>
            <th field="corpName" width="150" align="center" title="corpName">所属单位</th>
            <th field="gdmc" width="150" align="center" title="gdmc">管道名称</th>
            <th field="gdlb" width="150" align="center" title="gdlb">管道类别</th>
            <th field="gdcd" width="150" align="center" title="gdcd">管道长度</th>
            <th field="gzyl" width="150" align="center" title="gzyl">工作压力</th>
            <th align="center" field="id" width="80" formatter="gridFormatter">操作</th>       
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
	    	<input type="hidden" name="tbHazhardsPenstock.id"/>
	    	<input type="hidden" name="tbHazhardsPenstock.materialsId"/>
	   		 <input type="hidden" name="tbHazhardsPenstock.csjz"/>
	   		 <input type="hidden" name="tbHazhardsPenstock.dwdm"/>
    	 <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
    	<tr>
    			<td class="table_nemu_new" width="25%">所属单位</td>
    			<td class="table_con" colspan="3">
    			<input type="text" class="easyui-validatebox" name="tbHazhardsPenstock.corpName"
							data-options="validType:'maxByteLength[100]'" disabled="disabled"/>
							<input type="button" value="选择" onclick="eSelect.open()"/>
    			</td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new" width="25%">管道名称</td><td class="table_con" width="25%"><input class="easyui-validatebox" name="tbHazhardsPenstock.gdmc" data-options="required: true" missingMessage="请输入管道名称"/></td>	
    			<td  class="table_nemu_new" width="25%">管道编号</td><td class="table_con" width="25%"><input class="easyui-validatebox" name="tbHazhardsPenstock.gdbh" data-options="required: true" missingMessage="请输入管道编号"/></td>	
    		</tr>
    		<tr>
    			<td  class="table_nemu_new">管道类别</td><td class="table_con">
    			<input type="text" class="easyui-combobox" name="tbHazhardsPenstock.gdlb"
							data-options="required:true,
							valueField:'v', textField:'v', data:
							[{v:'长输管道'},{v:'公用管道'},{v:'工业管道'}],editable:false" panelHeight="auto"/>
    			</td>	
    			<td  class="table_nemu_new">公称直径（mm）</td><td class="table_con"><input class="easyui-validatebox" name="tbHazhardsPenstock.gdzj" data-options="required: true" validtype="positiveInt"/></td>	
    	   </tr>
    	   <tr>
    			<td  class="table_nemu_new">材  质</td><td class="table_con"><input class="easyui-validatebox" name="tbHazhardsPenstock.cz"/></td>	
    			<td  class="table_nemu_new">壁    厚（mm）</td><td class="table_con"><input class="easyui-validatebox" name="tbHazhardsPenstock.bh" validtype="positiveInt"/></td>	
    		</tr>
    			<td  class="table_nemu_new">管道长度（m）</td>
    			<td class="table_con">
    			<input class="easyui-validatebox" name="tbHazhardsPenstock.gdcd" data-options="required: true" validtype="positiveInt"/></td>	
    			<td class="table_nemu_new" >工作压力（MPa）</td><td class="table_con"><input class="easyui-validatebox" name="tbHazhardsPenstock.gzyl" data-options="required: true" validtype="decimal"/></td>	
    		</tr>
    		<tr>
    			<td  class="table_nemu_new">强度试验压力（MPa）</td><td class="table_con"><input class="easyui-validatebox" name="tbHazhardsPenstock.qdsyyl" validtype="decimal"/></td>	
    			<td  class="table_nemu_new">严密性试验压力（MPa）</td><td class="table_con"><input class="easyui-validatebox" name="tbHazhardsPenstock.ymxsyyl" validtype="decimal"/></td>	
    		</tr>
    		<tr>
    			<td  class="table_nemu_new">输送介质</td><td class="table_con" colspan="3"><input id="updateCsjz" name="tbHazhardsPenstock.csjz" disabled="disabled" />
						<input type="button" value="选择" onclick="mSelect.open()"/>
						<input type="button" value="自定义" onclick="oSelect.open()"/></td>	
    			
    		</tr>
    		<tr>
    			<td class="table_nemu_new" >投用日期</td><td class="table_con"><input id="updtyrq" onfocus="WdatePicker({readOnly:true})"  class="Wdate"  name="tbHazhardsPenstock.tyrq"/></td>	
    			<td  class="table_nemu_new">敷设方式</td><td class="table_con"><input class="easyui-combobox"  id='updfsfs' data-options="valueField: 'label',
				textField: 'value',
				data: [{
					label: '埋地',
					value: '埋地'
				},{
					label: '架空',
					value: '架空'
		        }],panelHeight:'auto',editable:false"  name="tbHazhardsPenstock.fsfs"/></td>	
    		</tr>
    		<tr>
    			<td  class="table_nemu_new">防腐方式</td><td class="table_con"><input class="easyui-combobox"  id='updfffs' data-options="valueField: 'label',textField: 'value',data:[{label:'阴极保护 ',value:'阴极保护 '},{label:'无阴极保护 ',value:'无阴极保护 '}],panelHeight:'auto',editable:false" name="tbHazhardsPenstock.fffs"/></td>	
    			<td  class="table_nemu_new">绝热方式</td><td class="table_con"><input class="easyui-combobox"   id="updjrfs" data-options="valueField: 'label',textField: 'value',data:[{label:'绝热措施 ',value:'绝热措施 '},{label:'无绝热措施 ',value:'无绝热措施 '}],panelHeight:'auto',editable:false" name="tbHazhardsPenstock.jrfs"/></td>	
    		</tr>
    		<tr>
    			<td  class="table_nemu_new">设计规范</td><td class="table_con"><input class="easyui-validatebox" name="tbHazhardsPenstock.sjgf"/></td>	
    			<td  class="table_nemu_new">设计单位</td><td class="table_con"><input class="easyui-validatebox" name="tbHazhardsPenstock.sjdw"/></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new" >安装规范</td><td class="table_con"><input class="easyui-validatebox" name="tbHazhardsPenstock.azgf"/></td>	
    			<td  class="table_nemu_new">安装单位</td><td class="table_con"><input class="easyui-validatebox" name="tbHazhardsPenstock.azdw"/></td>	
    		</tr>
    		<tr>
    		<td  class="table_nemu_new">工作温度（℃）</td><td class="table_con"><input class="easyui-validatebox" name="tbHazhardsPenstock.gzwd" data-options="required: true" validtype="positiveInt"/></td>	
    			<td class="table_nemu_new" >管道图号</td><td class="table_con"><input class="easyui-validatebox" name="tbHazhardsPenstock.gdth"/></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new" >管道经过地区（厂区）</td><td class="table_con" colspan="3"><TEXTAREA rows="3" cols="70" class="easyui-validatebox" name="tbHazhardsPenstock.gdjgdq"></TEXTAREA></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new" >与管道相联的调压站（箱）数量</td><td class="table_con"><input class="easyui-validatebox" name="tbHazhardsPenstock.ygdxldtyz" validtype="positiveInt"/></td>	
    		    <td class="table_nemu_new" >填表人</td><td class="table_con"><input class="easyui-validatebox" name="tbHazhardsPenstock.tbr"/></td>	
    			</tr>
    		<tr>
    			<td  class="table_nemu_new">联系电话</td><td class="table_con"><input class="easyui-validatebox" name="tbHazhardsPenstock.lxdh" validtype="phone"/></td>	
    			<td class="table_nemu_new" >填表日期</td><td class="table_con"><input  id="updtbrq" class="easyui-my97 easyui-validatebox" data-options="required:true,readOnly:true" name="tbHazhardsPenstock.tbrq"/></td>	
    		</tr>
    	</table>
        </div>
    </form>
</div>
</div>
</body>
</html>