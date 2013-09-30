<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>危险物质</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link> 
<script type="text/javascript">
$(document).ready(
 	function (){
		mSelect = new Select('选择', '${ctx}/jsp/hazards/materials/MaterialsSelect.jsp'
	    		 , null, function(id, name) {
	    	        $('input[name="dangerousPlaceMaterialsInfo.materialsId"]').val(id);
	    	        $('#addForm input[name="dangerousPlaceMaterialsInfo.dangercargoname"]').val(name);
	    });
		oSelect = new Select('自定义危险物质', '${ctx}/jsp/hazards/materials/OtherMaterialsSelect.jsp'
	    		 , {width:'900px', height:'200px'}, function(id, name) {
	    	        //alert(id + ":" + corpName);
	    	        $('input[name="dangerousPlaceMaterialsInfo.materialsId"]').val(id);
	    	        $('#addForm input[name="dangerousPlaceMaterialsInfo.dangercargoname"]').val(name);
	    });
 		grid = new Grid('${ctx}/dangercargo/dangerCargoAction!list.action?dangerousPlaceMaterialsInfo.fid=${param.fid}'
 				, 'data_list', {
 			loadFilter: function(data){
				$.each(data.rows, function(i, v) {
						v.limited = v.materials.thresholdQuantity;
						v.dangerkind = v.materials.type;
				});	
				return data;
			}});
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'dangerousPlaceMaterialsInfo',
			moduleName:'危险物质',
			url:'${ctx}/dangercargo/dangerCargoAction',
			beforeSubmit:function() {
				 $('#addForm input[name="dangerousPlaceMaterialsInfo.fid"]').val('${param.fid}');
				 if($('#addForm input[name="dangerousPlaceMaterialsInfo.materialsId"]').val() == '') {
					$.messager.alert("错误", "请选择危险物质");
					return false;
			 	 }
				 return true;
			},
			afterViewLoadData:function(viewFormObject, data) {
				 if(data.materials) {
					$(viewFormObject).find('[name="dangerousPlaceMaterialsInfo.dangerkind"]').text(data.materials.type);
					$(viewFormObject).find('[name="dangerousPlaceMaterialsInfo.limited"]').text(data.materials.thresholdQuantity);
				 }
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
	return url;
}
 
//根据选择 删除信息
  function removeFunction() {
    var rows = grid.getSelectNodes();
    if (rows.length == 0) {
        $.messager.show({
            title:'提示',
            msg:'请选择要删除的行',
            timeout:2000,
            showType:'slide'
        });
        return;
    } else {
        var ids = new Array();
        $.messager.confirm('警告', '是否要删除该记录?', function (r) {
            if (r) {
                var i = 0;
                for (i=0; i<rows.length; i++) {
                    ids.push(rows[i].id);
                }
                $.ajax({
                    url:urlValue+'!deleteByIds.action?ids=' + ids,
                    method:'POST',
                    success:function(data) {
                    	var data = eval('(' + data + ')');
                    	 $.messager.show({
                             title:'提示',
                             msg:data.operateMessage,
                             timeout:2000,
                             showType:'slide'
                         });
                        if (data.operateSuccess) {
                            grid.reloadGrid();
                        } 
                    }
                });
            }
        });
    }
}

</script>



</head>
<body>
	 <div class="panel-header" style="width:100%;">
		<div class="panel-title panel-with-icon">危险物质信息列表</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	<div class="dataGrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
	 <div>
	        <form id="searchForm" method="post" style="display: inline;">
            <div style="margin-top:-8px;">
	       &nbsp;&nbsp;危险物质名称：&nbsp;&nbsp;
	        <input class="easyui-validatebox" id="dangercargoname" name="dangerousPlaceMaterialsInfo.dangercargoname" data-options="validType:'length[1,25]'">
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
	          <th rowspan ="2" field="dangercargoname" width="150" align="center" title="dangercargoname">危险物质名称</th>
	          <th  rowspan ="2" field="dangerkind" width="150" align="center" title="dangerkind">危险性类别</th>
	          <th  rowspan ="2" field="dangernumber" width="150" align="center" title="dangernumber">UN编号</th>
	          <th  rowspan ="2" field="dangerunitstore" width="150" align="center" title="dangerunitstore">单元内危险物质存量（t）</th>
	          <th  rowspan ="2" field="limited" width="150" align="center" title="limited">临界量</td>
	          <th  rowspan ="2" align="center" field="id" width="80" align="center" formatter="gridFormatter">操作</th>     
	        </tr>
	        </thead>
	    </table>
    </div>
	<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" 
			data-options="iconCls:'icon-save',modal:true,
    			minimizable:true,maximizable:true,collapsible:true,draggable:false">
			<form method="post" >
		  		<input type="hidden" name="dangerousPlaceMaterialsInfo.fid" />
		  		   	<input type="hidden" id="id" name="dangerousPlaceMaterialsInfo.id" />
		  		   	<input type="hidden" name="dangerousPlaceMaterialsInfo.materialsId"/>
		  		    <input type="hidden" name="dangerousPlaceMaterialsInfo.dangercargoname"/>
		  			    <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
						<table id="detailTable" cellpadding="5px" style="font-size:12px;"
						 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
		  			 	<tr>
							<td class="table_nemu_new" width="28%">危险物质名称</td>
							<td class="table_con" colspan="4">
								<input id="addWzmc" name="dangerousPlaceMaterialsInfo.dangercargoname" disabled="disabled" />
								<input type="button" value="选择" onclick="mSelect.open()"/>
								<input type="button" value="自定义" onclick="oSelect.open()"/>
							</td>
						</tr>
						<tr>
						<td class="table_nemu_new">UN编号</td>
							<td class="table_con" colspan="4">
								<input class="easyui-validatebox" id="addDangernumber"
								 name="dangerousPlaceMaterialsInfo.dangernumber" />
							</td>
							</tr>
						<tr>
							<td class="table_nemu_new">生产用途</td>
							<td class="table_con" colspan="4">
								<textarea class="easyui-validatebox" cols=50 rows=3 id="addDangeruse" name="dangerousPlaceMaterialsInfo.dangeruse"></textarea>
							</td>
					   </tr>
					   <tr>
							<td class="table_nemu_new">生产工艺</td>
							<td class="table_con" colspan="4">
								<textarea class="easyui-validatebox" cols=50 rows=3 id="addDangertech" name="dangerousPlaceMaterialsInfo.dangertech"></textarea>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new" rowspan="2">单个最大容器
							
							<td class="table_nemu_new" style="width: 20%" >物理状态</td>
							<td class="table_con" >
								<input class="easyui-validatebox" id="addPhsical" style="width: 80%"  name="dangerousPlaceMaterialsInfo.physical"/>
							</td>
						
							<td class="table_nemu_new"  style="width: 20%" >操作温度（℃）</td>
							<td class="table_con" >
								<input class="easyui-validatebox" id="addDangercartem" style="width: 80%" name="dangerousPlaceMaterialsInfo.dangercartem" validtype="positiveInt"/>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new" style="width: 15%" >操作压力（Mpa）</td>
							<td class="table_con" >
								<input class="easyui-validatebox" id="addDangermpa" style="width: 80%" name="dangerousPlaceMaterialsInfo.dangermpa" validtype="positiveInt"/>
							</td>
							<td class="table_nemu_new" style="width: 15%"  >存量（t）</td>
							<td class="table_con">
								<input class="easyui-validatebox" id="addDangerstore" style="width: 80%" name="dangerousPlaceMaterialsInfo.dangerstore" validtype="positiveInt"/>
							</td>
						</tr>
						<tr>
						
						<td class="table_nemu_new">单元内危险物质存量（t）</td>
							<td class="table_con" colspan="4">
								<input class="easyui-validatebox" id="addDangerUnitstore" 
								data-options="required: true" style="width: 23%" name="dangerousPlaceMaterialsInfo.dangerunitstore" validtype="positiveInt"/>
							</td>
							
						</tr>
		  			 </table>
				     </div> 
		  		</form>
		  	</div>
		</div>


</body>
</html>