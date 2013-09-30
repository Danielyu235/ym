<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="gb2312" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>生产场所</title>

<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<link rel="stylesheet" href="../../css/newCrud.css" type="text/css"></link>
<script type="text/javascript">
$(document).ready(
 	function (){
 		eSelect = new Select('选择','${ctx}/jsp/ymxm/enterprise/EnterpriseSelect.jsp'
	    		 , null, function(id, corpName) {
	    	        $('input[name="tbHazhardsWorkplace.dwdm"]').val(id);
	    	        $('input[name="tbHazhardsWorkplace.corpName"]').val(corpName);
	    });
	    mSelect = new Select('选择', '${ctx}/jsp/hazards/materials/MaterialsSelect.jsp'
	    		 , null, function(id, name) {
	    	        //alert(id + ":" + corpName);
	    	        $('input[name="tbHazhardsMaterials.materialsId"]').val(id);
	    	        $('input[name="tbHazhardsMaterials.wzmc"]').val(name);
	    });
		oSelect = new Select('自定义危险物质', '${ctx}/jsp/hazards/materials/OtherMaterialsSelect.jsp'
	    		 , {width:'900px', height:'200px'}, function(id, name) {
	    	        //alert(id + ":" + corpName);
	    	        $('input[name="tbHazhardsMaterials.materialsId"]').val(id);
	    	        $('input[name="tbHazhardsMaterials.wzmc"]').val(name);
	    });
		grid = new Grid('${ctx}/hazhardsWorkplace/hazhardsWorkplaceAction!list', 'data_list');
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'tbHazhardsWorkplace',
			moduleName:'生产场所',
			url:'${ctx}/hazhardsWorkplace/hazhardsWorkplaceAction',
			dialogCss:{width:'900px',height:'350px'},
			beforeSubmit:function() {
				if($('#addForm input[name="tbHazhardsWorkplace.dwdm"]').val() == '') {
					$.messager.alert("错误", "请选择所属单位");
					return false;
			 	 }
				 return true;
			},
			afterViewLoadData: function(viewFormObject, data){
			    if(data.list == null) return;
			 	$(viewFormObject).find('.appendTable .appendClass').remove();
			 	$.each(data.list, function(i, v){
			 		var ele = $('<tr class="appendClass">'
			 		+ '<td class="table_con">'+v.wzmc+'</td>'
			 		+ '<td class="table_con">'+v.xcwzzl+'</td>'
			 		+ '<td class="table_con">'+v.gygczdwzl+'</td>'
			 		+ '<td class="table_con">'+v.ccdwzl+'</td>'
			 		+ '<td class="table_con">'+v.fqwzl+ '</td>'
			 		+ '<td class="table_con"><a title=\"修改\" onclick=\'updateChild(\"'+v.id+'\",\"'+data.id+'\");\'><img src=\"../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a title=\"删除\" onclick=\'deleteChild(\"'+v.id+'\",\"'+v.fid+'\");\'><img src=\"../../images/deleteRes.png\"></a></td></tr>');
			 		$(ele).appendTo($(viewFormObject).find('.appendTable'));
			 	});
		 	}
		});
		//查看页面拼上子表格s
		var tr = $('<tr></tr>');
		var td = $('<td colspan="4"></td>');
		$(td).append($('.appendTable').clone()).appendTo(tr);
		$(crud.params.viewFormObject).css({width:'900px',height:'450px'});
		$(crud.params.viewFormObject).find('table').append(tr);
		crudRes = new Crud({
			addFormObject:$('#addResForm'), 
			entityName:'tbHazhardsMaterials',
			moduleName:'物质',
			url:'${ctx}/tbHazhardsMaterials/tbHazhardsMaterialsAction',
			dialogCss:{width:'900px',height:'250px'},
			beforeSubmit:function() {
				 if($('#addResForm input[name="tbHazhardsMaterials.materialsId"]').val() == '') {
					$.messager.alert("错误", "请选择危险物质");
					return false;
			 	 }
				 return true;
			},
			afterUpdateSuccess:function(){
				crud.view(fid);
			},
			afterRemoveSuccess:function(){
				crud.view(fid);
			}
		});
 	}
 	
  ); 
 function addChild(rowId) {
	 crudRes.add();
	 $('#addResForm input[name="tbHazhardsMaterials.fid"]').val(rowId);
 }
 function updateChild(rowId, id) {
	 crudRes.update(rowId);
	 fid = id;
 }
 function deleteChild(rowId, id) {
	 var ids = [];
	 ids.push(rowId);
	 crudRes.removeByIds(ids);
	 fid = id;
 }
       
 //加载表单操作列
function gridFormatter(value, rowData, rowIndex) {
	var rowId = rowData.id;
	var url = "";
	<shiro:hasPermission name="48:view">
	url += "<a title=\"查看\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"../../images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	<shiro:hasPermission name="48:update">
	url += "<a title=\"修改\" onclick='crud.update(\""+rowId+"\");' class='btn2' ><img src=\"../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	url += "<a title=\"新增物质\" onclick='addChild(\""+rowId+"\");' class='btn2' ><img src=\"../../images/addRes.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	if(rowData.hasMap == '1') { //已定位
	url += "<a title=\"定位\" onclick='window.top.gis.showPoint(\""+rowData.dwdm+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.dymc +"\");' class='btn2' ><img src=\"${ctx}/images/showPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	} else {
	url += "<a title=\"打点\" onclick='window.top.gis.addPoint(\""+rowData.dwdm+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.dymc +"\");' class='btn2' ><img src=\"${ctx}/images/addPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	}
	return url;
}

</script>
</head>
<body>
  <div class="panel-header" style="width:100%;">
	<div class="panel-title panel-with-icon">生产场所信息列表</div>
	<div class="panel-icon icon-edit"></div>
	<div class="panel-tool"></div>
</div>
<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
	 <div>
	        <form id="searchForm" method="post" style="display: inline;">
            <div style="margin-top:-8px;">
            &nbsp;&nbsp;所属单位:&nbsp;&nbsp;<input class="easyui-validatebox"  name="tbHazhardsWorkplace.corpName" >
	        &nbsp;&nbsp;生产场所:&nbsp;&nbsp;<input class="easyui-validatebox"  name="tbHazhardsWorkplace.dymc" >
	        &nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search()">查询</a>
			&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch()">清空</a>
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
</div>
<!-- 表单表头 -->
<div style="height: 74%">
    <table id="data_list" class="easyui-datagrid" loadMsg="正在努力拉取数据中..."
           fit="true" fitColumns="true" pagination="false">
        <thead>
        <tr>
        <th field="corpName" width="150" align="center" title="corpName">所属单位</th>
           <th field="dymc" width="150" align="center" title="dymc">生产场所</th>
            <th field="gdzczz" width="150" align="center" title="gdzczz">固定资产总值</th>
            <th field="zdmj" width="150" align="center" title="zdmj">占地面积</th>
            <th align="center" field="id" width="80" align="center" formatter="gridFormatter">操作</th>         
        </tr>
        </thead>
    </table>
</div>

<!-- 添加窗口 -->
<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" 
			data-options="iconCls:'icon-save',modal:true,
    			minimizable:true,maximizable:true,collapsible:true,draggable:false">
		<form method="post" >
    	<input type="hidden" name="tbHazhardsWorkplace.id"/>
    	<input type="hidden" class="easyui-validatebox" name="tbHazhardsWorkplace.dwdm"/>
    	<div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
			<table id="detailTable" cellpadding="5px" style="font-size:12px;"
			 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
    		<tr>
    			<td class="table_nemu_new" width="25%">生产场所</td>
    			<td class="table_con" width="25%"><input class="easyui-validatebox" name="tbHazhardsWorkplace.dymc"/></td>	
    			<td class="table_nemu_new" width="25%">固定资产总值（万元）</td>
    			<td class="table_con" width="25%"><input class="easyui-validatebox" name="tbHazhardsWorkplace.gdzczz"/></td>	
    		</tr>
    		<tr>
    		<td class="table_nemu_new">所属单位</td><td class="table_con"><input type="text" class="easyui-validatebox" name="tbHazhardsWorkplace.corpName"
							data-options="validType:'maxByteLength[100]'" disabled="disabled"/>
							<input type="button" value="选择" onclick="eSelect.open()"/></td>	
    			<td class="table_nemu_new">所处环境功能区</td><td class="table_con"><input class="easyui-combobox"  id='updschjgnq' data-options="valueField: 'label',
				textField: 'value',
				data: [{
					label: '工业区',
					value: '工业区'
				},{
					label: '农业区',
					value: '农业区'
		        },{
					label: '商业区',
					value: '商业区'
		        },{
					label: '居民区',
					value: '居民区'
		        },{
					label: '行政办公区',
					value: '行政办公区'
		        },{
					label: '交通枢纽区',
					value: '交通枢纽区'
		        },{
					label: '科技文化区',
					value: '科技文化区'
		        },{
					label: '水源保护区',
					value: '水源保护区'
		        },{
					label: '文物保护区',
					value: '文物保护区'
		        }
		        ],panelHeight:'auto',editable:false"  name="tbHazhardsWorkplace.schjgnq"/></td>	
    		</tr>
    		<tr>
    			<td class="table_nemu_new">具体位置</td><td class="table_con" colspan="3"><TEXTAREA style="width: 400;height: 100;" class="easyui-validatebox" name="tbHazhardsWorkplace.jtwz"></TEXTAREA></td>	
    		</tr>
    		
    		<tr>
    			<td class="table_nemu_new">占地面积</td><td class="table_con"><input class="easyui-validatebox" name="tbHazhardsWorkplace.zdmj"/></td>	
    			<td class="table_nemu_new">正常当班人数</td><td class="table_con"><input class="easyui-validatebox" name="tbHazhardsWorkplace.zcdbrs"/></td>	
    		</tr>
    	</table>
			</div>
	  </form>
</div>
</div>
<!-- 添加物品 -->
<div style="display: none;">
		<div id="addResForm" style="width: 900px; height: 450px;" 
			data-options="iconCls:'icon-save',modal:true,
    			minimizable:true,maximizable:true,collapsible:true,draggable:false">
		<form method="post" >
			<input type="hidden" class="easyui-validatebox" id="id" name="tbHazhardsMaterials.id" />
  			<input type="hidden" class="easyui-validatebox" id="fid" name="tbHazhardsMaterials.fid" />
  		   	<input type="hidden" name="tbHazhardsMaterials.materialsId"/>
	   		 <input type="hidden" name="tbHazhardsMaterials.wzmc"/>
  			 <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
  			 	<tr>
					<td class="table_nemu_new" width="25%">物质名称</td>
					<td class="table_con" colspan="3">
						<input id="addWzmc" name="tbHazhardsMaterials.wzmc" disabled="disabled" />
						<input type="button" value="选择" onclick="mSelect.open()"/>
						<input type="button" value="自定义" onclick="oSelect.open()"/>
					</td>
				</tr>
				 <tr>
					<td class="table_nemu_new" width="25%">现存物质总量（t）</td>
					<td class="table_con" width="25%">
						<input class="easyui-validatebox" id="addXcwzzl" name="tbHazhardsMaterials.xcwzzl"/>
					</td>
					<td class="table_nemu_new" width="25%">工艺过程中的物质量（t）</td>
					<td class="table_con" width="25%">
						<input class="easyui-validatebox" id="addGygczdwzl" name="tbHazhardsMaterials.gygczdwzl" />
					</td>
				</tr>
				<tr>
					<td class="table_nemu_new">存储的物质量（t）</td>
					<td class="table_con">
						<input class="easyui-validatebox" id="addCcdwzl" name="tbHazhardsMaterials.ccdwzl"/>
					</td>
					<td class="table_nemu_new">废弃物质量（t）</td>
					<td class="table_con">
						<input class="easyui-validatebox" id="addFqwzl" name="tbHazhardsMaterials.fqwzl"/>
					</td>
				</tr>
  			 </table>
  			 </div>
  		</form>
  	</div>
</div>
<div style="display: none;">
<table class="appendTable" width="100%" border="1">
<tr text-align="center">
	<td class="table_nemu_new" rowspan="2">物质名称</td>
	<td colspan="5" class="table_nemu_new" text-align="center">单  元  内  危  险  物  质  量</td>
</tr>
<tr>
	<td class="table_nemu_new">现存物质总量(t)</td>
	<td class="table_nemu_new">工艺过程中的物质量(t)</td>
	<td class="table_nemu_new">存储的物质量(t)</td>
	<td class="table_nemu_new">废弃物质量(t)</td>
	<td class="table_nemu_new">操作</td>
</tr>	
</table>
</div>
</body>
</html>