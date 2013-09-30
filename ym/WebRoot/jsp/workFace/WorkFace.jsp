<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>工作面部分</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.PrintArea.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<script type="text/javascript">
$(document).ready(function (){
	 		// onloadCombobox('${ctx}','zy',$('#craft'),$('#craft'),null);
	 		// onloadCombobox('${ctx}','tfaqzy',$('#updatecraft'),null,null);
	 		grid = new Grid('${ctx}/workFace/workFaceAction!list', 'data_list', {
	 			onLoadSuccess: function(data) {
	 				var nameTemp = null;
	 				var index = 0;
	 				var rowspan = 1;
	 				$.each(data.rows, function(i, v){
	 					if(v.workFaceName == nameTemp) {
	 						rowspan++;
	 					} else {
	 						if(rowspan != 1) {
				 				$('#data_list').datagrid('mergeCells',{field:'workFaceName','index':index,'rowspan':rowspan});
				 				$('#data_list').datagrid('mergeCells',{field:'number','index':index,'rowspan':rowspan});
	 						}
	 						nameTemp = v.workFaceName; 
	 						index = i;
	 						rowspan = 1;
	 					}
	 				});
	 				if(rowspan != 1) {
	 					$('#data_list').datagrid('mergeCells',{field:'workFaceName','index':index,'rowspan':rowspan});
	 					$('#data_list').datagrid('mergeCells',{field:'number','index':index,'rowspan':rowspan});
					}
	 			}
	 			});
			grid.loadGrid();
			crud = new Crud({
				grid:grid, 
				addFormObject:$('#addForm'), 
				searchFormObject:$('#searchForm'),
				entityName:'workFace',
				moduleName:'工作面部分',
				url:'${ctx}/workFace/workFaceAction'
			});
			crud.view = function (rowId) {
				var temp = crud;
				$.loding();
				$.ajax({
			        url: temp.params.getByIdUrl + '?id=' + rowId,
			        method:'POST',
			        success:function (data) {
				        temp.viewLoadData(data);
			        	if(typeof temp.params.afterViewLoadData == 'function') {
				        	temp.params.afterViewLoadData($(temp.params.viewFormObject), data);
				        } 
			        	$.loded();
			        	$(temp.params.viewFormObject).dialog({
							title:temp.params.viewFormTitle,
							modal:true,
							draggable:false,
							buttons:[{
								text:'打印',
								iconCls:'icon-cancel',
								handler:function() {
									$("div#addDiv").printArea();
								}
							},{
								text:'取消',
								iconCls:'icon-cancel',
								handler:function() {
									$(temp.params.viewFormObject).dialog('close');
									if(typeof temp.params.afterViewDialogClose == 'function') {
			    	                	temp.params.afterViewDialogClose(rowId);
			    	                }
								}
							}]
						});
			        }
			    });
			};
	 	}); 
  //页面显示（判断每个单元格内容字符长度是否大于10，大于部分用...省略）
   function gridFormatterLength(value, rowData, rowIndex) {
        	if(value==null || value == '' || value == 'undefined')
        		return '';
    		if(value.length > 10)
    			return value.substring(0, 10) + '...';
    		return value;
    	}
    	//数据操作
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
	
	//导出方法
	function expFunction() {
		var rows = $("#data_list").datagrid("getSelections");
		var ids = new Array();
		var i = 0;
		for(i=0; i<rows.length; i++){
			ids.push(rows[i].id);
		}
		var id_s = "'"+ids.join("','")+"'";
		$('#searchForm').attr('action','${ctx}/workFace/workFaceAction!exp?id='+id_s);
		document.getElementById("searchForm").submit();
	}
</script>
</head>
<body>
<div class="panel-header" style="width:100%;">
		<div class="panel-title panel-with-icon">工作面部分</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
	 <div>
	        <form id="searchForm" method="post" style="display: inline;">
            <div style="margin-top:-8px;">
				&nbsp;&nbsp;工作面编号:&nbsp;&nbsp;<input type="text" name="workFace.number" />
				&nbsp;&nbsp;工作面名称:&nbsp;&nbsp;<input type="text" name="workFace.workFaceName" />
				&nbsp;&nbsp;工作面位置:&nbsp;&nbsp;<input type="text" name="workFace.workFacePlace" />
				&nbsp;&nbsp;危险源:&nbsp;&nbsp;<input type="text" name="workFace.dangerous" />
				&nbsp;&nbsp;
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search();">查询</a>
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
		<shiro:hasPermission name="48:exp">	
		<a href="javascript:expFunction()" class="l-btn l-btn-plain">
			<span class="l-btn-left">
				<span class="l-btn-text icon-search" style="padding-left: 20px;">导出</span>
			</span>
		</a>
		</shiro:hasPermission>
        </div>
	<!-- 表单表头 -->
	<div style="height:74%;">
	    <table id="data_list" style="display:none">
	        <thead>
            <th align="center" field="number" width="150" formatter="gridFormatterLength" >工作面编号</th>
            <th align="center" field="workFaceName" width="150" formatter="gridFormatterLength" >工作面名称</th>
            <th align="center" field="workFacePlace" width="150" formatter="gridFormatterLength" >工作面位置</th>
            <th align="center" field="workFaceCase" width="150" formatter="gridFormatterLength" >工作面情况</th>
            <th align="center" field="dangerous" width="150" formatter="gridFormatterLength" >危险源</th>
            <th field="id" width="120" formatter="gridFormatter">操作</th>               
	        </thead>
	    </table>
	</div>

	<!-- 添加更新窗口 -->
	<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" data-options="iconCls:'icon-save',modal:true,minimizable:true,maximizable:true,collapsible:true,draggable:false">
		<form method="post" >
	     <input type="hidden" name="workFace.id"/>
		    <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv" id="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;" cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
						<tr>
							<td class="table_nemu_new">工作面编号:</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="workFace.number" data-options="validType:'maxByteLength[100]'" required="true"/>
							</td>
						
							<td class="table_nemu_new">工作面名称:</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="workFace.workFaceName" data-options="validType:'maxByteLength[100]'" required="true"/>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">工作面位置:</td>
							<td class="table_con" colspan="5">
							<input type="text" class="easyui-validatebox" name="workFace.workFacePlace" style="width: 100%;" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">工作面情况:</td>
							<td class="table_con" colspan="5">
							<textarea name="workFace.workFaceCase" style="height: 80px;width:100%;"></textarea>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">危险源:</td>
							<td class="table_con" colspan="5">
							<textarea name="workFace.dangerous" style="height: 80px;width:100%;"></textarea>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">可能造成的伤害和损失:</td>
							<td class="table_con" colspan="5">
							<textarea name="workFace.loss" style="height: 80px;width:100%;"></textarea>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">当事人应该采取的措施:</td>
							<td class="table_con" colspan="5">
							<textarea name="workFace.step" style="height: 80px;width:100%;"></textarea>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">备注:</td>
							<td class="table_con" colspan="5">
							<textarea name="workFace.bz" style="height: 80px;width:100%;"></textarea>
							</td>
						</tr>
				</table>
			</div>
		</form>
	</div>
	</div>
</body>
</html>