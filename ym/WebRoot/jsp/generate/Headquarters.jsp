<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>应急指挥中心</title>	
	<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
</head>
<body>
	<div class="panel-header" style="width:100%">
		<div class="panel-title panel-with-icon">应急指挥中心</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	
	<div class="datagrid-toolbar" id = "tb" style="padding-left: 0px; height:10px;">
		<div>
	        <form id="searchForm" method="post" style="display: inline;">
		        <div style="margin-top:-8px">
		        &nbsp;&nbsp;指挥中心名称:&nbsp;&nbsp;<input type="text" name="headquarters.name" />
				&nbsp;&nbsp;指挥中心地址:&nbsp;&nbsp;<input type="text" name="headquarters.address" />
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
	
	<div style="height:74%;">
	    <table id="data_list" style="display:none">
	        <thead>
		        <tr>
		            <th align="center" field="name" width="200" formatter="gridFormatterLength" >指挥中心名称</th>
		            <th align="center" field="address" width="200" formatter="gridFormatterLength" >指挥中心地址</th>
		            <th align="center" field="phoneNumber" width="150" formatter="gridFormatterLength" >指挥中心电话</th>
		            <th align="center" field="personincharge" width="100" formatter="gridFormatterLength" >负责人</th>
		            <th align="center" field="chargePhoneNumber" width="100" formatter="gridFormatterLength" >负责人电话</th>
		            <th align="center" field="id" width="120" formatter="gridFormatter">操作</th>     
		        </tr>
	        </thead>
	    </table>
	</div>
	
	
	<!-- 添加更新窗口 -->
	<div style="display: none;">
		<div id="addForm" style="width:900px;height:150px;" data-options="iconCls:'icon-save',modal:true,minimizable:true,maximizable:true,collapsible:true,draggable:false">
			<form id="addForm" method="post">
				<input type="hidden" name="headquarters.id" id="updateId"/>
				<div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
					<table id="detailTable" cellpadding="5px" style="font-size:12px;" cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
						<tr>
							<td class="table_nemu_new" width="15%">事故类型:</td>
							<td class="table_con" width="35%" colspan="3">
							<input type="text" class="easyui-combobox" name="headquarters.type" id="bigId"
								data-options="validType:'maxByteLength[100]'" />
							</td>
						    

						</tr>
						
						<tr>
							<td class="table_nemu_new" width="15%">指挥中心名称:</td>
							<td class="table_con" width="35%">
							<input type="text" class="easyui-validatebox" name="headquarters.name"
								data-options="validType:'maxByteLength[100]'" />
							</td>
						    
						    <td class="table_nemu_new">指挥中心电话:</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="headquarters.phoneNumber"
								data-options="validType:'maxByteLength[100]'" />
							</td>

						</tr>
						
						<tr>
							<td class="table_nemu_new">指挥中心地址:</td>
							<td class="table_con" colspan="3">
							<input type="text" class="easyui-validatebox" name="headquarters.address" size="60"
								data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">负责人:</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="headquarters.personincharge"
								data-options="validType:'maxByteLength[100]'" />
							</td>
						    
							<td class="table_nemu_new" width="15%">负责人电话:</td>
							<td class="table_con" width="35%">
							<input type="text" class="easyui-validatebox" name="headquarters.chargePhoneNumber"
								data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>							
					</table>
				</div>
			</form>
		</div>
	</div>
	
	<div id="person" class="easyui-window" title="查看人员"
    	data-options="modal:true,closed:true,minimizable:false,maximizable:true,resizable:true" style="width:1000px;height:500px;top:20px;padding:10px" >  
    	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add', plain:true" onclick="$('#addPerson').window('open')">添加人员</a>&nbsp;&nbsp;&nbsp;&nbsp;
    	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove', plain:true" onclick="delPerson()">删除人员</a>
    	<br><br>
    	<div style="width:90%;height:75%">    		
	    	<table id="data_List2" class="easyui-datagrid" style="height:300px">
	    		<thead>  
				    <tr>
				    	<th data-options="field:'category',width:40">组别</th>
						<th data-options="field:'name',width:30,align:'center'">姓名</th>
					    <th data-options="field:'phoneNumber',width:30,align:'center'">手机</th>
					    <%--<th data-options="field:'id',width:15,align:'center'" formatter="gridFormatterPerson">操作</th>
				    --%></tr>  
			    </thead>
	    	</table>
    	</div>
    </div>	
    
    <div id="addPerson" class="easyui-window" title="添加人员"
    	data-options="modal:true,closed:true,minimizable:false,maximizable:false,resizable:false" style="width:800px;height:auto;top:50px;padding:10px" >  
    	<form action="${ctx}/headquarters/headquartersAction!addHperson" method="post" id="pform">
    		<input type="hidden" name="hperson.hid" id="hperson_hid">
    		<table id="detailTable" cellpadding="5px" style="font-size:12px;" cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
				<tr>
					<td class="table_nemu_new" width="25%">组别：</td>
					<td class="table_con" width="75%">
						<input type="text" class="easyui-validatebox" name="hperson.category" data-options="validType:'maxByteLength[100]'" />
					</td>
				</tr>
				<tr>
					<td class="table_nemu_new">姓名：</td>
					<td class="table_con">
						<input type="text" class="easyui-validatebox" name="hperson.name" data-options="validType:'maxByteLength[100]'" />
					</td>
				</tr>
				<tr>
					<td class="table_nemu_new">手机：</td>
					<td class="table_con">
						<input type="text" class="easyui-validatebox" name="hperson.phoneNumber" data-options="validType:'maxByteLength[100]'" />
					</td>
				</tr>
			</table>
    	</form>
    	<br/><br/>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save', plain:true" onclick="$('#pform').submit();">保存</a>	
    </div>	
	
	<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
	<script type="text/javascript">
		$(document).ready(function (){
			onloadCombobox('${ctx}', 'sglx', $('#bigId'),null, null);
	 		grid = new Grid('${ctx}/headquarters/headquartersAction!list', 'data_list');
			grid.loadGrid();
			crud = new Crud({
				grid:grid, 
				addFormObject:$('#addForm'), 
				searchFormObject:$('#searchForm'),
				entityName:'headquarters',
				moduleName:'应急指挥中心',
				url:'${ctx}/headquarters/headquartersAction'
				
			});
			$('#pform').form({
                success:function(data){
					$.messager.show({
	                   title:'成功',
	                   msg:'添加成功',
	                   timeout:2000,
	                   showType:'slide'
	                });
                    grid2 = new Grid('${ctx}/headquarters/headquartersAction!plist?hperson.hid='+$('#hperson_hid').val(), 'data_List2');
        			grid2.loadGrid();
        			$('#addPerson').window('close');
        			pform.reset();
                }
            });
		 });        
        
        function gridFormatterLength(value, rowData, rowIndex) {
        	if(value==null || value == '' || value == 'undefined')
        		return '';
    		if(value.length > 25)
    			return value.substring(0, 25) + '...';
    		return value;
    	}

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
        	url += "<a title=\"查看人员\" onclick='addPerson(\""+rowId+"\");' class='btn2'><img src=\"../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
        	return url;
        }

        //添加人员
        function addPerson(hid){
			$('#person').window('open');
			grid2 = new Grid('${ctx}/headquarters/headquartersAction!plist?hperson.hid='+hid, 'data_List2');
			grid2.loadGrid();
			$('#hperson_hid').val(hid);
        }

    	//删除人员
        function delPerson(){
			var rows = $("#data_List2").datagrid("getSelections");
			if(rows.length == 0){
				$.messager.show({
                    title:'提示',
                    msg:'请选择要删除的行',
                    timeout:2000,
                    showType:'slide'
                });
			}else{
				var ids = new Array();
				for(var i in rows){
					ids.push(rows[i].id);
				}
				var str = ids.join(",");
				$.ajax( {
					type : 'post',
					url : '${ctx}/headquarters/headquartersAction!pdel',
					data : 'id=' + str,
					success : function(data) {
						if(data != "false"){
							$.messager.show({
	                            title:'成功',
	                            msg:'删除成功',
	                            timeout:2000,
	                            showType:'slide'
	                        });
							grid2.loadGrid();
						}else if(data == "false"){
							 $.messager.show({
	                            title:'失败',
	                            msg:'删除失败',
	                            timeout:2000,
	                            showType:'slide'
	                        });
						}
					}
				});
			}
        }

        function gridFormatterPerson(value, rowData, rowIndex) {
        	var url = "<a title=\"修改\" onclick='updatePerson(\""+rowData.id+"\");' class='btn2'><img src=\"../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
			return url;
        }

        function updatePerson(id){
        	$.ajax({
				type : 'post',
				url : '${ctx}/headquarters/headquartersAction!updatePerson',
				data : 'id=' + id,
				success : function(data) {
					 $.messager.show({
                         title:'提示',
                         msg:data,
                         timeout:2000,
                         showType:'slide'
                     });
				}
        	});
        }
	        
	</script>
	
</body>
</html>