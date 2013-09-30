<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>机电系统主题</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<script type="text/javascript">
	//页面初始化各窗体
	$(document).ready(
			function() {
				onloadCombobox('${ctx}', 'deparment', $('#searchXm'), null, null);
				onloadCombobox('${ctx}', 'deparment', $('#updateXm'), null, null);
				grid = new Grid('${ctx}/elect/electAction!list?elect.ysType=${param.ysType}', 'data_list');
				grid.loadGrid();
				crud = new Crud({
				grid:grid, 
				addFormObject:$('#addForm'), 
				searchFormObject:$('#searchForm'),
				entityName:'elect',
				moduleName:'机电系统主题',
				url:'${ctx}/elect/electAction',
				afterViewLoadData:function(viewFormObject, data) {
					$(viewFormObject).find('span[name="elect.xm"]').text(data.xmType);
				}
				});
			}
		);

	//工具栏按钮
	function gridFormatter(value, rowData, rowIndex) {
		var rowId = rowData.id;
		var rowYsrq = rowData.ysrq;
		var rowYsType = rowData.ysType;
		if(rowYsType==0){
			document.getElementById("ys").innerHTML=rowYsrq+"月份 部门电耗预算";
		}
		var url = "";
		url += "<a title=\"查看\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"${ctx}/images/select.png\"></img></a>&nbsp;&nbsp;&nbsp;&nbsp;";
		url += "<a title=\"修改\" onclick='crud.update(\""+rowId+"\");' class='btn2'><img src=\"${ctx}/images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
		return url;
	}
</script>
</head>
<body>
<div id="tb">
	<div class="panel-header" style="width: 100%;">
		<div class="panel-title panel-with-icon">机电系统主题</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
	<div>
			<form id="searchForm" method="post" style="display: inline;">
            <div style=" margin-top:-8px;">
            		&nbsp;&nbsp;项目:&nbsp;&nbsp;<input type="text" id="searchXm" name="elect.xm" />
					&nbsp;&nbsp;预算月份:&nbsp;&nbsp;
					<input type="text" name="elect.ysrq" class="easyui-my97 easyui-validatebox" data-options="readOnly:true,dateFmt:'yyyy-MM'"/>
					&nbsp;&nbsp;
					<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search();">查询</a> &nbsp;&nbsp;
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
		<div style="text-align: center;font-size: 28px;"><span id="ys" style="color:red;"></span></div>
	</div>
<div style="height: 450px;">
    <table id="data_list" loadMsg="正在努力拉取数据中..." fit="true" fitColumns="true">
        <thead>
        <tr>
            <th align="center" field="xmType" width="150">项目</th>
            <th align="center" field="dl" width="150">电量（万千瓦时）</th>
            <th align="center" field="df" width="150">电费（万元）</th>
            <th align="center" field="dh" width="150">单耗（千瓦时/吨）</th>
            <th align="center" field="dmdf" width="150">吨煤电费（元/吨）</th>
            <th align="center" field="fgb" width="150">峰谷比</th>
            <th align="center" field="jhdj" width="150">计划电价（元/千瓦时）</th>
            <th align="center" field="ysrq" width="150">填报日期</th>
            <th align="center" field="id" width="120" formatter="gridFormatter">操作</th>         
        </tr>
        </thead>
    </table>
</div>

<!-- 更新窗口 -->
<div style="display: none;">
	<div id="addForm" style="width: 900px; height: 450px;" data-options="iconCls:'icon-save',modal:true,minimizable:true,maximizable:true,collapsible:true,draggable:false">
	<form method="post" >
   	<input type="hidden" name="elect.id"/>
   	<div style="display: none;">
   		<input type="text" name="elect.ysType" value="${param.ysType}"/>
   	</div>
	  <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
						<tr>
							<td class="table_nemu_new">项目:</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" id="updateXm" name="elect.xm" data-options="readOnly:true,validType:'maxByteLength[100]'"/>
							</td>
						
							<td class="table_nemu_new">电量（万千瓦时）:</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="elect.dl" data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">电费（万元）:</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="elect.df" data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">单耗（千瓦时/吨）:</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="elect.dh" data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">吨煤电费（元/吨）:</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="elect.dmdf" data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">峰谷比:</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="elect.fgb" data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">计划电价（元/千瓦时）:</td>
							<td class="table_con" >
							<input type="text" class="easyui-validatebox" name="elect.jhdj" data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new">填报日期:</td>
							<td class="table_con" >
							<input type="text" name="elect.ysrq" class="easyui-my97 easyui-validatebox" data-options="readOnly:true,dateFmt:'yyyy-MM'" readonly="readonly"/>
							</td>
						</tr>
				</table>
				</div>
			</form>
		</div>
	</div>
	</div>
</body>
</html>