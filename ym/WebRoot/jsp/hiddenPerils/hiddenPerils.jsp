<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>干部走动隐患</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<style type="text/css">
* {
    font-size:12px;
    margin:0;
    padding:0;
}
fieldset.test{
    padding:4px;
    margin:0 auto;
    width:90%;
    color:#333;
    border:#aed0ea dashed 2px;
}
fieldset.tests{
    padding:4px;
    margin:0 auto;
    width:90%;
    color:#333;
    border:#aed0ea dashed 2px;
}
fieldset.sta{
    padding:4px;
    margin:0 auto;
    width:90%;
    color:#333;
    border:#aed0ea dashed 2px;
}
legend {
	font-size:15px;
    color:#2496ec;
    padding:4px 4px;
    font-weight:800;
    /*background:white;*/
}

</style>
<script type="text/javascript">
$(document).ready(
 	function (){
 		onloadCombobox('${ctx}','zy',$('#type'),null,null);
 		grid = new Grid('${ctx}/hiddenPerils/hiddenPerilsAction!list', 'data_list', {
 			onLoadSuccess: function(data) {
 			//onloadCombobox ：合并list列表中相同数据列  workingFaceName是索要合并的字段
 				var nameTemp = null;
 				var index = 0;
 				var rowspan = 1;
 				$.each(data.rows, function(i, v){
 					if(v.cadresId == nameTemp) {
 						rowspan++;
 					} else {
 						if(rowspan != 1) {
			 				$('#data_list').datagrid('mergeCells',{field:'cadresId','index':index,'rowspan':rowspan});
			 				$('#data_list').datagrid('mergeCells',{field:'name','index':index,'rowspan':rowspan});
		 					$('#data_list').datagrid('mergeCells',{field:'cadresLevel','index':index,'rowspan':rowspan});
		 					$('#data_list').datagrid('mergeCells',{field:'position','index':index,'rowspan':rowspan});
		 					$('#data_list').datagrid('mergeCells',{field:'department','index':index,'rowspan':rowspan});
 						}
 						nameTemp = v.cadresId; 
 						index = i;
 						rowspan = 1;
 					}
 				});
 				if(rowspan != 1) {
 					$('#data_list').datagrid('mergeCells',{field:'cadresId','index':index,'rowspan':rowspan});
 					$('#data_list').datagrid('mergeCells',{field:'name','index':index,'rowspan':rowspan});
 					$('#data_list').datagrid('mergeCells',{field:'cadresLevel','index':index,'rowspan':rowspan});
 					$('#data_list').datagrid('mergeCells',{field:'position','index':index,'rowspan':rowspan});
 					$('#data_list').datagrid('mergeCells',{field:'department','index':index,'rowspan':rowspan});
				}
 			}
 			});
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'hiddenPerils',
			moduleName:'干部走动隐患',
			url:'${ctx}/hiddenPerils/hiddenPerilsAction'
		});
 	}
  ); 
  //页面显示（判断每个单元格内容字符长度是否大于25，大于部分用...省略）
   function gridFormatterLength(value, rowData, rowIndex) {
        	if(value==null || value == '' || value == 'undefined')
        		return '';
    		if(value.length > 15)
    			return value.substring(0, 15) + '...';
    		return value;
    	}
	//数据操作
	function gridFormatter(value, rowData, rowIndex) {
		var rowId = rowData.id;
		var rowName=rowData.questionName;
		var url = "";
		<shiro:hasPermission name="48:update">
		url += "<a title=\"添加隐患\" onclick='openDangerWindow(\""+rowId+"\");' class='btn2' ><img src=\"${ctx}/images/tjyh.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
		</shiro:hasPermission>
		return url;
	}
	function openDangerWindow(pid){
		$("#addDanger").window("open");
		$("#findPeople_id").val(pid);
	}
</script>
</head>
<body>

<div class="panel-header" style="width:100%;">
		<div class="panel-title panel-with-icon">干部走动隐患</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
	 <div>
	        <form id="searchForm" method="post" style="display: inline;">
            <div style="margin-top:-8px;">
	&nbsp;&nbsp;干部ID:&nbsp;&nbsp;<input type="text" name="hiddenPerils.cadresId" />
	&nbsp;&nbsp;姓名:&nbsp;&nbsp;<input type="text" name="hiddenPerils.name" />
		&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search()">查询</a>
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
        </div>
	<!-- 表单表头 -->
	<div style="height:74%;">
	    <table id="data_list" style="display:none">
	        <thead>
	        <tr>
	       <!--  <th align="center" field="cadresId" width="50" formatter="gridFormatterLength" >干部ID</th> -->
            <th align="center" field="name" width="100" formatter="gridFormatterLength" >姓名</th>
            <th align="center" field="cadresLevel" width="70" formatter="gridFormatterLength" >干部级别</th>
            <th align="center" field="position" width="100" formatter="gridFormatterLength" >职务</th>
            <th align="center" field="department" width="100" formatter="gridFormatterLength" >部门</th>
            <th align="center" field="htAddress" width="200" formatter="gridFormatterLength" >隐患地点</th>
            <th align="center" field="htDepartment" width="200" formatter="gridFormatterLength" >隐患点部门</th>
            <th align="center" field="task" width="200" formatter="gridFormatterLength" >任务</th>
            <th align="center" field="shift" width="50" formatter="gridFormatterLength" >班次</th>
            <th align="center" field="walkDate" width="100" formatter="gridFormatterLength" >走动日期</th>
            <th align="center" field="state" width="100" formatter="gridFormatterLength" >录入状态</th>
            <th align="center" field="listedDate" width="100" formatter="gridFormatterLength" >挂牌时间</th>
            <th align="center" field="id" width="100" formatter="gridFormatter">操作</th>       
	        </tr>
	        </thead>
	    </table>
	</div>

	<!-- 添加更新窗口 -->
	<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" 
			data-options="iconCls:'icon-save',modal:true,minimizable:true,maximizable:true,collapsible:true,draggable:false">    			
			<form method="post" >
				<input type="hidden" name="hiddenPerils.id"/>
			    <div style="padding: 10px 20px 10px 20px;" name="addDiv">
			     <fieldset class="tests">
					<legend>走动管理信息</legend>
					<table id="detailTable" cellpadding="5px" style="font-size:12px;margin: 0 auto;" cellspacing="1" bgcolor="#aed0ea" width="95%">
						<tr>
							<td class="table_nemu_new" width="25%">干部ID</td>
							<td class="table_con" width="25%">
							<input type="text" class="easyui-validatebox" name="hiddenPerils.cadresId"
							data-options="validType:'maxByteLength[100]',required:true" />
							</td>
							<td class="table_nemu_new" width="25%">姓名</td>
							<td class="table_con" width="25%">
							<input type="text" class="easyui-validatebox" name="hiddenPerils.name"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">干部级别</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="hiddenPerils.cadresLevel"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">职务</td>
							<td class="table_con" >
							<input type="text" class="easyui-validatebox" name="hiddenPerils.position"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">部门</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="hiddenPerils.department"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new">隐患点部门</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="hiddenPerils.htDepartment"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							
						</tr>
						<tr>
							<td class="table_nemu_new">任务</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="hiddenPerils.task"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new">班次</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="hiddenPerils.shift"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">走动日期</td>
							<td class="table_con">
							<input type="text" class="easyui-my97 easyui-validatebox" data-options="required:true,readOnly:true" name="hiddenPerils.walkDate"/>
							</td>
							<td class="table_nemu_new">挂牌时间</td>
							<td class="table_con">
							<input type="text" class="easyui-my97 easyui-validatebox" data-options="required:true,readOnly:true" name="hiddenPerils.listedDate"/>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">隐患地点</td>
							<td class="table_con" colspan="3">
							<textarea style="height: 100px;width: 550px;" name="hiddenPerils.htAddress"></textarea>
							</td>
						</tr>
					</tr>
				</table>
				</fieldset>
				</div>
			</form>
		</div>
	</div>
	
	<!-- 添加更新窗口 -->
	<div id="addDanger" class="easyui-window" title="添加隐患"
		data-options="modal:true,closed:true,minimizable:false,maximizable:false,resizable:false" style="width:1000px;height:auto">
		<form id="dForm" action="${ctx}/hiddenDanger/hiddenDangerAction!add" method="post">
     		<input type="hidden" name="hiddenDanger.id"/>
     		<input type="hidden" name="hiddenDanger.findPeople_Id" id="findPeople_id">
     		<input type="hidden" name="hiddenDanger.state" value="1">
	    	<div style="padding:10px;" name="addDiv" id="addDiv">
	    		<fieldset class="tests">
				<legend>隐患信息</legend>
				<table id="detailTable" cellpadding="5px" style="font-size:12px;margin: 0 auto;" cellspacing="1" bgcolor="#aed0ea" width="95%">
					<tr>
						<td class="table_nemu_new" width="25%">发现时间</td>
						<td class="table_con" width="25%" colspan="3">
							<input class="easyui-my97 easyui-validatebox" name="hiddenDanger.discoveryTime" />
						</td>
					</tr>
					<tr>
						<td class="table_nemu_new">地点</td>
						<td class="table_con" colspan="3">
							<input class="easyui-validatebox" name="hiddenDanger.location" style="width:550px"/>
						</td>
					</tr>
					<tr>
						<td class="table_nemu_new" width="25%">专业</td>
						<td class="table_con" width="25%">
							<input class="easyui-combobox" name="hiddenDanger.specialty" id="type"/>
						</td>
						<td class="table_nemu_new" width="25%">检查项目</td>
						<td class="table_con" width="25%">
							<input class="easyui-validatebox" name="hiddenDanger.checkItem"/>
						</td>							
					</tr>
					<tr>
						<td class="table_nemu_new">检查线路</td>
						<td class="table_con">
							<input class="easyui-validatebox" name="hiddenDanger.checkLine"/>
						</td>
						<td class="table_nemu_new">检查地点</td>
						<td class="table_con">
							<input class="easyui-validatebox" name="hiddenDanger.checkLocation"/>
						</td>
					</tr>
					<tr>
						<td class="table_nemu_new">检查标准</td>
						<td class="table_con" colspan="3">
							<textarea  name="hiddenDanger.checkLabel" style="width: 97%; height: 70px;"></textarea>
						</td>							
					</tr>
					<tr>
						<td class="table_nemu_new">检查内容</td>
						<td class="table_con" colspan="3">
							<textarea  name="hiddenDanger.hiddenContent" style="width: 97%; height: 70px;"></textarea>
						</td>							
					</tr>
					<tr>
						<td class="table_nemu_new">隐患类型</td>
						<td class="table_con">
							<input class="easyui-combobox" name="hiddenDanger.hiddenType" data-options="panelHeight:'auto',editable:false,valueField: 'value',textField: 'label',
								data: [{
									label: 'A类。需集团公司处理的隐患。',
									value: 'A类。需集团公司处理的隐患。'
								},{
									label: 'B类。需矿（厂、处）处理的问题。',
									value: 'B类。需矿（厂、处）处理的问题。'
								},{
									label: 'C类。需区队解决的隐患。',
									value: 'C类。需区队解决的隐患。'
								}]" style="width:150px"/>			
						</td>	
						<td class="table_nemu_new">三色单</td>
						<td class="table_con">
							<input class="easyui-combobox" name="hiddenDanger.threeColorForm" data-options="panelHeight:'auto',editable:false,valueField: 'value',textField: 'label',
								data: [{
									label: '白色，一般隐患。',
									value: '白色，一般隐患。'
								},{
									label: '黄色，较大隐患。',
									value: '黄色，较大隐患。'
								},{
									label: '红色，严重隐患。',
									value: '红色，严重隐患。'
								}]" style="width:150px"/>
						</td>						
					</tr>
					</table>
					</fieldset>
					<fieldset class="tests">
					<legend>整改要求</legend>
					<table cellpadding="5px" style="font-size:12px;margin: 0 auto;" cellspacing="1" bgcolor="#aed0ea" width="95%" >
					<tr>
						<td class="table_nemu_new" width="25%">整改措施</td>
						<td class="table_con" colspan="3">
							<textarea  name="hiddenDanger.measure" style="width: 97%; height: 70px;"></textarea>
						</td>							
					</tr>
					<tr>
						<td class="table_nemu_new" width="25%">整改人</td>
						<td class="table_con">
							<input class="easyui-validatebox" name="hiddenDanger.correctivePeople"/>
						</td>
						<td class="table_nemu_new" width="25%">整改期限</td>
						<td class="table_con">
							<input class="easyui-my97 easyui-validatebox" name="hiddenDanger.deadline"/>
						</td>
					</tr>
					</table>
					</fieldset>
					<fieldset class="tests">
					<legend>整改结果</legend>
					<table cellpadding="5px" style="font-size:12px;margin: 0 auto;" cellspacing="1" bgcolor="#aed0ea" width="95%" >
						<tr>
							<td class="table_nemu_new" width="25%">整改结果</td>
							<td class="table_con" colspan="3">
								<textarea name="hiddenDanger.correctionReport" style="width: 97%; height: 70px;"></textarea>
							</td>							
						</tr>
						<tr>
							<td class="table_nemu_new" width="25%">跟踪落实</td>
							<td class="table_con" width="25%">
								<!--input class="easyui-validatebox" name="hiddenDanger.followUp"/-->
							</td>
							<td class="table_nemu_new" width="25%">完成时间</td>
							<td class="table_con" width="25%">
								<!--input class="easyui-my97 easyui-validatebox" name="hiddenDanger.completionTime"/-->
							</td>
						</tr>
					</table>
					</fieldset><br/><br/>
				<center>
					<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="$('#dForm').submit();">添加</a>
					<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="colseDanger()">取消</a>
				</center>				
			</div>
		</form>
	</div>
	
	<script type="text/javascript">
		function colseDanger(){
			$("#addDanger").window("close");
			$("#dForm").form("clear");		 
		}
		$(function(){
	        $('#dForm').form({
	            success:function(data){
	        		$("#addDanger").window("close");
	        		$("#dForm").form("clear");	
	        		data = eval('(' + data + ')');
	        		$.messager.show({
                        title:'成功',
                        msg:data.operateMessage,
                        timeout:2000,
                        showType:'slide'
                    });
                   grid.loadGrid();
	            }
	        });
	    });
	</script>
	

	
</body>
</html>