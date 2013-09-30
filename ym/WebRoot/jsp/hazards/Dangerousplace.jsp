<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="gb2312" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>危险场所</title>

<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/validator.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<link rel="stylesheet" href="../../css/newCrud.css" type="text/css"></link>
<script type="text/javascript">
$(document).ready(function() {
 		eSelect = new Select('选择','${ctx}/jsp/ymxm/enterprise/EnterpriseSelect.jsp'
	    		 , null, function(id, corpName) {
	    	        $('input[name="dangerousplaceInfo.dwdm"]').val(id);
	    	        $('#addWin input[name="dangerousplaceInfo.corpName"]').val(corpName);
	    	        $('#updateWin input[name="dangerousplaceInfo.corpName"]').val(corpName);
	    });
	    mSelect = new Select('选择', '${ctx}/jsp/hazards/materials/MaterialsSelect.jsp'
	    		 , null, function(id, name) {
	    	        //alert(id + ":" + corpName);
	    	        $('input[name="dangerCargoInfo.id"]').val(id);
	    	        $('input[name="dangerCargoInfo.dangercargoname"]').val(name);
	    });
		oSelect = new Select('自定义危险物质', '${ctx}/jsp/hazards/materials/OtherMaterialsSelect.jsp'
	    		 , {width:'900px', height:'200px'}, function(id, name) {
	    	        //alert(id + ":" + corpName);
	    	        $('input[name="dangerCargoInfo.id"]').val(id);
	    	        $('input[name="dangerCargoInfo.dangercargoname"]').val(name);
	    });
		grid = new Grid('${ctx}/dangerplace/dangerousplaceAction!list', 'data_list');
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'dangerousplaceInfo',
			moduleName:'危险场所',
			url:'${ctx}/dangerplace/dangerousplaceAction',
			beforeSubmit:function() {
				 if($('#addForm input[name="dangerousplaceInfo.dwdm"]').val() == '') {
					$.messager.alert("错误", "请选择所属单位");
					return false;
			 	 }
				 return true;
			},
			afterUpdateLoadData:function() {
				changeIsPark($('#isParkTrue').combobox('getValue'));
			},
			afterViewLoadData:function(viewFormObject) {
				changeIsPark($(viewFormObject).find('span[name="dangerousplaceInfo.isparkTrue"]').text());
			}
		});
		$('#isParkTrue').combobox({
			onSelect: function(record){
				if(record.v)
					changeIsPark(record.v);
			}
		});
}); 

       
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
<shiro:hasPermission name="48:update">
	url += "<a title=\"物质管理\" onclick='viewChildFunction(\""+rowId+"\");' class='btn2' ><img src=\"../../images/addRes.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;"
	</shiro:hasPermission>
	return url;
}

function viewDpFunction(){
var rowsid;
 var rows = grid.getSelectNodes();
 if (rows.length == 0) {
        $.messager.show({
            title:'提示',
            msg:'请选择要预览的行',
            timeout:2000,
            showType:'slide'
        });
        return;
    } else{
		rowsid = rows[0].id;
	}
	
	testform.id.value=rowsid;
	testform.submit();
}

function viewChildFunction(rowId) {
	$('#childFrame').attr('src', 'DangerousMaterials.jsp?fid=' + rowId);
	$('#viewChildForm').dialog({
		title:'查看物质',
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

function changeIsPark(value){
	if(value == '是') {
		$('#ispark').val('');
		$('.ispark').show();
	} else {
		$('#ispark').val('');
		$('.ispark').hide();
	}
}
</script>
</head>

<body>
<div id="hidden" align="center" >
			<form  name="testform" id="testform" action="${ctx}/dangerplace/dangerousplaceAction!getByIds" target="_target">
		    	<input type="hidden" name="id" id="id" />
		    </form>
		    </div>
  <div class="panel-header" style="width:100%;">
	<div class="panel-title panel-with-icon">危险场所信息列表</div>
	<div class="panel-icon icon-edit"></div>
	<div class="panel-tool"></div>
	</div>
	<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
		 <div>
		        <form id="searchForm" method="post" style="display: inline;">
	            <div style="margin-top:-8px;">
	            &nbsp;&nbsp;所属单位:&nbsp;&nbsp;<input class="easyui-validatebox"  name="dangerousplaceInfo.corpName" >
		        &nbsp;&nbsp;危险场所名称:&nbsp;&nbsp;<input class="easyui-validatebox"  name="dangerousplaceInfo.dangerplacename" >
		        &nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search();">查询</a>
				&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch();">清空</a>
	            </div>
		        </form>
		    </div>
	        </div>
	        <div class="search_add">
			<shiro:hasPermission name="48:add">
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add', plain:true" onclick="changeIsPark();crud.add();">添加</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="48:delete">		
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove', plain:true" onclick="crud.remove();">删除</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="48:view">		
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove', plain:true" onclick="viewDpFunction();">打印预览</a>
			</shiro:hasPermission>
	        </div>
	</div>


<!-- 危险场所信息展示表单表头 -->
		<div style="height:78%;">
			<table id="data_list" style="display: none">
				<thead>
					<tr>
					<th field="corpName" width="150" align="center">所属单位</th>
					<th field="dangerplacename" width="150" align="center">危险场所名称</th>
					<th field="dangerplacelevel" width="150" align="center">危险场所级别</th>
					<th field="dangerplacetime" width="150" align="center">危险场所投用时间</th>
					<th align="center" field="id" width="80" align="center" formatter="gridFormatter">操作</th>
					</tr>
				</thead>
			</table>
		</div>
		
		<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" 
			data-options="iconCls:'icon-save',modal:true,
    			minimizable:true,maximizable:true,collapsible:true,draggable:false">
			<form method="post" >
			    <input type="hidden" name="dangerousplaceInfo.id"/>
			    <input type="hidden" name="dangerousplaceInfo.dwdm"/>
				    <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
					<table id="detailTable" cellpadding="5px" style="font-size:12px;"
					 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
						<tr>
							<td class="table_nemu_new" width="25%">所属单位</td>
							<td class="table_con" colspan="3"><input type="text" class="easyui-validatebox" name="dangerousplaceInfo.corpName"
							 disabled="disabled"/>
							<input type="button" value="选择" onclick="eSelect.open()"/></td>
						</tr>
						<tr>
							<td class="table_nemu_new">危险场所名称</td>
							<td class="table_con" colspan="3"><input class="easyui-validatebox" type="text" id="addName" 
							name="dangerousplaceInfo.dangerplacename" 
							data-options="required: true,editable:false,panelHeight:'auto'" missingMessage="请输入危险场所名称" value=""/></td>
						</tr>
						<tr>
							<td class="table_nemu_new" width="25%">危险场所所在地址</td>
							<td class="table_con" colspan="1" width="25%"><input style="width:95%" class="easyui-validatebox" type="text" id="addAddess" name="dangerousplaceInfo.dangerplaceadress"/></td>
							<td class="table_nemu_new" width="25%">危险场所投用时间</td>
							<td class="table_con" colspan="1" width="25%"><input onfocus="WdatePicker({readOnly:true})"  class="Wdate"  id="updateDp" name="dangerousplaceInfo.dangerplacetime" 
							data-options="required: true,editable:false"/></td>
						</tr>
						<tr>
						<td class="table_nemu_new">危险场所级别</td>
							<td class="table_con" colspan="1"><input class="easyui-validatebox" type="text" id="addLevel" name="dangerousplaceInfo.dangerplacelevel"/></td>
						<td class="table_nemu_new">R值</td>
							<td class="table_con" colspan="1"><input class="easyui-validatebox" style ="width: 60%" type="text" 
							validtype="positiveInt" id="addRvalue" name="dangerousplaceInfo.rvalue"/></td>
						</tr>
						<tr>
							<td class="table_nemu_new">单元内主要装置、设施及生产（储存）规模</td>
							<td class="table_con" colspan="3"><textarea cols="70" rows="3" class="easyui-validatebox" type="text" id="addUnitSize" 
							name="dangerousplaceInfo.unitsize" /></textarea></td>
						</tr>
						<tr>
							<td class="table_nemu_new">是否位于化工（工业）园区</td>
							<td class="table_con" colspan="3">
							<input type="text" name="dangerousplaceInfo.isparkTrue" id="isParkTrue"	data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'是'},{v:'否'}],editable:false" panelHeight="auto" style="width:40px;"/>
							<font style="display:none;" class="ispark">&nbsp;&nbsp;&nbsp;&nbsp;园区名称:</font>
							<input type="text" class="ispark" id="ispark" name="dangerousplaceInfo.ispark" style="display:none;"/>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">危险场所与周边重点防护目标最近距离情况（m）</td>
							<td class="table_con" colspan="3"><textarea class="easyui-validatebox" type="text" id="adddistance" 
							cols="70" rows="3" name="dangerousplaceInfo.distance" ></textarea></td>
							</tr>
							<tr>
							<td class="table_nemu_new">厂区边界外500m范围内人数估算值</td>
							<td class="table_con" colspan="3"><input class="easyui-validatebox" type="text" id="addestimatedvalue" 
							  name="dangerousplaceInfo.estimatedvalue" validtype="positiveInt"/></td>
						</tr>
						<tr>
							<td class="table_nemu_new">近三年内危险化学品事故情况	</td>
							<td class="table_con" colspan="3"><textarea class="easyui-validatebox" type="text" id="addsituation" 
							cols="70" rows="5" name="dangerousplaceInfo.situation" data-options="required: false"></textarea></td>
							</tr>
						<tr>
						<td class="table_nemu_new">填表人</td>
							<td class="table_con"><input class="easyui-validatebox" type="text" id="addPostcode" 
							name="dangerousplaceInfo.formpeople" data-options="required: false"/></td>
							<td class="table_nemu_new">联系电话</td>
							<td class="table_con" ><input class="easyui-validatebox" type="text" id="addPhonenumber" 
							name="dangerousplaceInfo.phonenumber" data-options="required: true" validtype="phone" missingMessage="请输入联系电话" /></td>
						</tr>
						<tr>
							<td class="table_nemu_new">填表时间</td>
							<td class="table_con"><input  onfocus="WdatePicker({readOnly:true})"  class="Wdate"  id="updateFormdate" name="dangerousplaceInfo.formdate" required: true,editable:false"/></td>
							<td class="table_con" colspan="2"></td>
						</tr>
					</table>
					</div>
				</form>
			</div>
		</div>
	<div style="display: none;">
		<div id="viewChildForm" style="width: 960px; height: 400px;" data-options="iconCls:'icon-save'">
			<iframe frameborder="0" id="childFrame" width="100%" height="98%" scrolling-x="no"></iframe>
		</div>
	</div>
		
</body>
</html>