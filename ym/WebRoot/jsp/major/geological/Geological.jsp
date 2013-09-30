<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>地测专业</title>
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
	 		grid = new Grid('${ctx}/geological/geologicalAction!list', 'data_list', {
	 			onLoadSuccess: function(data) {
	 				var nameTemp = null;
	 				var index = 0;
	 				var rowspan = 1;
	 				$.each(data.rows, function(i, v){
	 					if(v.craftTypeName == nameTemp) {
	 						rowspan++;
	 					} else {
	 						if(rowspan != 1) {
				 				$('#data_list').datagrid('mergeCells',{field:'craftTypeName','index':index,'rowspan':rowspan});
	 						}
	 						nameTemp = v.craftTypeName; 
	 						index = i;
	 						rowspan = 1;
	 					}
	 				});
	 				if(rowspan != 1) {
	 					$('#data_list').datagrid('mergeCells',{field:'craftTypeName','index':index,'rowspan':rowspan});
					}
	 			}
	 			});
			grid.loadGrid();
			crud = new Crud({
				grid:grid, 
				addFormObject:$('#addForm'), 
				searchFormObject:$('#searchForm'),
				entityName:'geological',
				moduleName:'地测专业',
				url:'${ctx}/geological/geologicalAction',
				afterViewLoadData:function(viewFormObject, data) {
					$(viewFormObject).find('span[name="geological.craft"]').text(data.craftTypeName);
				}
			});
			crud.params.addFormObject.find('.remove').remove();
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
			$('#craft').combobox({  
				url: '${ctx}/data/dataAction!findAllChildren.action?parentId='+'d4de53ceaa60444699f38fec5034e034',
				valueField:'id',
		        textField:'dataName'
		 		});
			$('#updatecraft').combobox({  
				url: '${ctx}/data/dataAction!findAllChildren.action?parentId='+'d4de53ceaa60444699f38fec5034e034',
				valueField:'id',
		        textField:'dataName'
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
   //数据操作
   function gridFormatter(value, rowData, rowIndex) {
	var rowId = rowData.id;
	var rowName=rowData.craftTypeName;
	var url = "";
	<shiro:hasPermission name="48:view">
	url += "<a title=\"查看\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"../../../images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	<shiro:hasPermission name="48:update">
	url += "<a title=\"修改\" onclick='crud.update(\""+rowId+"\");' class='btn2'><img src=\"../../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
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
	$('#searchForm').attr('action','${ctx}/geological/geologicalAction!exp?id='+id_s);
	document.getElementById("searchForm").submit();
}
</script>
</head>
<body>
<div class="panel-header" style="width:100%;">
		<div class="panel-title panel-with-icon">地测专业列表</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
	 <div>
	        <form id="searchForm" method="post" style="display: inline;">
            <div style="margin-top:-8px;">
				&nbsp;&nbsp;危险源:&nbsp;&nbsp;<input type="text" name="geological.dangerous" style="width: 120px;"/>
				&nbsp;&nbsp;可能造成的伤害和损失:&nbsp;&nbsp;<input type="text" name="geological.loss" style="width: 100px;"/>
				&nbsp;&nbsp;当事人应该采取的措施:&nbsp;&nbsp;<input type="text" name="geological.step" style="width: 100px;"/>
				&nbsp;&nbsp;适用岗位:&nbsp;&nbsp;<input name="geological.craft" id="craft" style="width: 120px;"/>
				&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search();">查询</a>
				&nbsp;&nbsp;
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
            <th field="dangerous" width="150" formatter="gridFormatterLength" >危险源</th>
            <th field="loss" width="150" formatter="gridFormatterLength" >可能造成的伤害和损失</th>
            <th field="step" width="150" formatter="gridFormatterLength" >当事人应该采取的措施</th>
            <%--<th align="center" field="station" width="150" formatter="gridFormatterLength" >适用专业</th>
            --%>
            <th align="center" field="craftTypeName" width="100" formatter="gridFormatterLength" >适用岗位</th>
            <th align="center" field="id" width="50" formatter="gridFormatter">操作</th>         
	        </thead>
	    </table>
	</div>

	<!-- 添加更新窗口 -->
	<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" data-options="iconCls:'icon-save',modal:true,minimizable:true,maximizable:true,collapsible:true,draggable:false">
		<form method="post" >
	     <input type="hidden" name="geological.id"/>
	     <input type="hidden" name="geological.station" value="地测专业"/>
		    <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv" id="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;" cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
						<tr class="remove" style="height: 140px;">
							<td class="table_con" colspan="4" style="text-align: center;font-size: 28px;">
							<textarea name="geological.sszyByType" style="height: 80px;width:100%;overflow-y:hidden;overflow-x:hidden;border:0;text-align: center;font-size: 28px;" readonly="readonly"></textarea>
							<textarea name="geological.ssgzByType" style="height: 80px;width:100%;overflow-y:hidden;overflow-x:hidden;border:0;text-align: center;font-size: 28px;" readonly="readonly"></textarea>
							</td>
						</tr>
						<tr class="remove">
							<td class="table_nemu_new" colspan="4" style="text-align: left;">一、岗标操作要领</td>
						</tr>
						<tr class="remove" style="height: 140px;">
							<td class="table_con" colspan="4">
							<textarea name="geological.czyl" style="height: 80px;width:100%;overflow-y:hidden;overflow-x:hidden;border:0" readonly="readonly"></textarea>
							</td>
						</tr>
						<tr class="remove">
							<td class="table_nemu_new" colspan="4" style="text-align: left;">二、手指口述要点</td>
						</tr>
						<tr class="remove" style="height: 140px;">
							<td class="table_con" colspan="4">
							<textarea name="geological.ksyd" style="height: 80px;width:100%;overflow-y:hidden;overflow-x:hidden;border:0" readonly="readonly"></textarea>
							</td>
						</tr>
						<tr class="remove">
							<td class="table_nemu_new" colspan="4" style="text-align: left;">三、典型事故案例</td>
						</tr>
						<tr class="remove" style="height: 140px;">
							<td class="table_con" colspan="4">
							<textarea name="geological.sgal" style="height: 80px;width:100%;overflow-y:hidden;overflow-x:hidden;border:0" readonly="readonly"></textarea>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new" width="25%" style="text-align: left;">适用专业</td>
							<td class="table_con" width="25%">
							<input type="text" class="easyui-validatebox" data-options="validType:'maxByteLength[100]'" style="width:100%;border:0;" value="地测专业" readonly="readonly"/>
							</td>
							<td class="table_nemu_new" width="25%" style="text-align: left;">适用岗位</td>
							<td class="table_con" width="25%">
							<input type="text" name="geological.craft" id="updatecraft" editable = "false" style="width:100%;" required="true"/>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new" width="25%" colspan="4" style="text-align: left;">危险源</td>
						</tr>
						<tr>
							<td class="table_con" width="25%" colspan="4">
							<textarea class="easyui-validatebox" name="geological.dangerous" style="height: 80px;width:100%;" required="true"></textarea>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new" colspan="4" style="text-align: left;">可能造成的伤害和损失</td>
						</tr>
						<tr>
							<td class="table_con" colspan="4">
							<textarea class="easyui-validatebox" name="geological.loss" style="height: 80px;width:100%;" required="true"></textarea>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new" colspan="4" style="text-align: left;">当事人应该采取的措施</td>
						</tr>
						<tr>
							<td class="table_con" colspan="4">
							<textarea class="easyui-validatebox" name="geological.step" style="height: 80px;width:100%;" required="true"></textarea>
							</td>
						</tr>
				</table>
			</div>
		</form>
	</div>
	</div>
</body>
</html>