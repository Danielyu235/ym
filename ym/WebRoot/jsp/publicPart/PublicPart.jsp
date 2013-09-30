<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>公共部分</title>
	<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
</head>
<body>
	<div class="panel-header" style="width:100%;">
		<div class="panel-title panel-with-icon">公共部分列表</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	
	<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
	 	<div>
	        <form id="searchForm" method="post" style="display: inline;">
	        	<div style="margin-top:-8px;">
					&nbsp;&nbsp;危险源:&nbsp;&nbsp;<input type="text" name="publicPart.dangerous" style="width: 120px;"/>
					&nbsp;&nbsp;可能造成的伤害和损失:&nbsp;&nbsp;<input type="text" name="publicPart.loss" style="width: 120px;"/>
					&nbsp;&nbsp;当事人应该采取的措施:&nbsp;&nbsp;<input type="text" name="publicPart.step" style="width: 120px;"/>
					&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search();">查询</a>&nbsp;&nbsp;
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
	<div style="height:318px">
	    <table id="data_list" style="display:none">
	        <thead>
	        	<tr>
		            <th data-options="field:'dangerous',width:150,align:'left',formatter:gridFormatterLength">危险源</th>		            
		            <th data-options="field:'loss',width:150,align:'left',formatter:gridFormatterLength">可能造成的伤害和损失</th>
		            <th data-options="field:'step',width:150,align:'left',formatter:gridFormatterLength">当事人应该采取的措施</th>
		            <%--<th align="center" field="station" width="150" formatter="gridFormatterLength" >适用岗位</th>--%>		            
		            <th data-options="field:'id',width:50,align:'center',formatter:gridFormatter">操 作</th>	        		
	        	</tr>
	        </thead>
	    </table>
	</div>

	<!-- 添加更新窗口 -->
	<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" data-options="iconCls:'icon-save',modal:true,minimizable:true,maximizable:true,collapsible:true,draggable:false">
			<form method="post" >
	     		<input type="hidden" name="publicPart.id"/>
	     		<input type="hidden" name="publicPart.station" value="所有岗位"/>
	    		<div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv" id="addDiv">
					<table id="detailTable" cellpadding="5px" style="font-size:12px;" cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
						<tr>
							<td class="table_nemu_new" width="25%" colspan="2" style="text-align: left;">危险源</td>
						</tr>
						<tr>
							<td class="table_con" width="25%" colspan="2">
								<textarea class="easyui-validatebox" name="publicPart.dangerous" style="height: 80px;width:100%;" required="true"></textarea>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new" colspan="2" style="text-align: left;">可能造成的伤害和损失</td>
						</tr>
						<tr>
							<td class="table_con" colspan="2">
								<textarea class="easyui-validatebox" name="publicPart.loss" style="height: 80px;width:100%;" required="true"></textarea>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new" colspan="2" style="text-align: left;">当事人应该采取的措施</td>
						</tr>
						<tr>
							<td class="table_con" colspan="2">
								<textarea class="easyui-validatebox" name="publicPart.step" style="height: 80px;width:100%;" required="true"></textarea>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
	
	<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/jquery.PrintArea.js"></script>
	<script type="text/javascript">
		$(document).ready(
		 	function (){
		 		grid = new Grid('${ctx}/publicPart/publicPartAction!list', 'data_list');
				grid.loadGrid();
				crud = new Crud({
					grid:grid, 
					addFormObject:$('#addForm'), 
					searchFormObject:$('#searchForm'),
					entityName:'publicPart',
					moduleName:'公共部分',
					url:'${ctx}/publicPart/publicPartAction'
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
									iconCls:'icon-print',
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
		 	}
		 );
		  
	    //页面显示（判断每个单元格内容字符长度是否大于30，大于部分用...省略）
		function gridFormatterLength(value, rowData, rowIndex) {
        	if(value==null || value == '' || value == 'undefined')
        		return '';
    		if(value.length > 30)
    			return value.substring(0, 30) + '...';
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
	
		//导出方法
		function expFunction() {
			var rows = $("#data_list").datagrid("getSelections");
			var ids = new Array();
			var i = 0;
			for(i=0; i<rows.length; i++){
				ids.push(rows[i].id);
			}
			var id_s = ids.join(",");
			$('#searchForm').attr('action','${ctx}//publicPart//publicPartAction!exp?id='+id_s);
			document.getElementById("searchForm").submit();
		}
	</script>
</body>
</html>