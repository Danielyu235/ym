<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>群众登记</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
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
 		grid = new Grid('${ctx}/registerMesses/registerMessesAction!list?registerMesses.state=1', 'data_list');
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'registerMesses',
			moduleName:'群众性隐患',
			url:'${ctx}/registerMesses/registerMessesAction',
			afterUpdateLoadData:function(addFormObject, data){//加载update触发的事件
			 	$(addFormObject).find('.appendTable .appendClass').remove();
			 	$(addFormObject).find('#addDiv .tests').remove();
  				$(addFormObject).find('#addDiv .sta').remove();
			 	var ele = $('<tr class="appendClass">'
				+'<td class="table_nemu_new" width="25%">隐患类型</td>'
				+'<td class="table_con" width="25%" colspan="3"><input type="radio" value="C类" checked="checked" name="type" id="type_c" onclick="hiddentType(\'C类\')"/>C类。需区队解决的隐患<br/>'
				+'<input type="radio" value="B类" name="type" id="type_b" onclick="hiddentType(\'B类\')"/>B类。需矿（厂，处）处理的隐患<br/>'
				+'<input type="radio" value="A类" name="type" id="type_a" onclick="hiddentType(\'A类\')"/>A类。需集团公司处理的隐患<br/>'
				+'</td></tr>'
				+'<tr class="appendClass"><td class="table_nemu_new" width="25%">三色单</td>'
				+'<td class="table_con" width="25%" colspan="3">'
				+'<input type="radio" value="白色" checked="checked" name="color" id="color_w" onclick="threeColor(\'白色\');"/>白色，一般隐患'
				+'<input type="radio" value="黄色" name="color" id="color_y" onclick="threeColor(\'黄色\');"/>黄色，较大隐患'
				+'<input type="radio" value="红色" name="color" id="color_r" onclick="threeColor(\'红色\');"/>红色，重大隐患'
				+'</td></tr>');
		 		$(ele).appendTo($("#addForm").find('.appendTable'));
		 		var eles = $('<fieldset class="tests">'
					+'<legend>整改要求</legend>'
					+'<table cellpadding="5px" style="font-size:12px;margin: 0 auto;" cellspacing="1" bgcolor="#aed0ea" width="95%" class="appendTables">'
					+'	<tr>'
					+'		<td class="table_nemu_new">整改措施</td>'
					+'		<td colspan="3" class="table_con">'
					+'		<textarea class="easyui-validatebox" name="registerMesses.measure" style="width: 97%; height: 70px;" data-options="validType:\"maxByteLength[255]\""></textarea>'
					+'		</td>'
					+'	</tr>'
					+'	<tr>'
					+'		<td class="table_nemu_new" width="25%">整改人</td>'
					+'		<td class="table_con" width="25%">'
					+'		<input type="text" class="easyui-validatebox" name="registerMesses.correctivePeople"data-options="validType:\"maxByteLength[100]\""/>'
					+'		</td>'
					+'		<td class="table_nemu_new" width="25%">单位</td>'
					+'		<td class="table_con" width="25%">'
					+'		<input type="text"  name="registerMesses.correctivePeopleUnits"/>'
					+'		</td>'
					+'	</tr>'
					+'	<tr>'
					+'		<td class="table_nemu_new" width="25%">姓名</td>'
					+'		<td class="table_con" width="25%">'
					+'		<input type="text" class="easyui-validatebox" name="registerMesses.correctivePeopleName"'
					+'		data-options="validType:\"maxByteLength[100]\""/>'
					+'		</td>'
					+'		<td class="table_nemu_new" width="25%">整改期限</td>'
					+'		<td class="table_con" width="25%">'
					+'		<input type="text" class="Wdate"onfocus="WdatePicker()" name="registerMesses.deadline"/>'
					+'		</td>'
					+'	</tr>'
					+'</table>'
					+'</fieldset>');
				$(eles).appendTo($("#addForm").find('#addDiv'));
				var el = $('<fieldset class="sta">'
					+'<legend>整改情况</legend>'
					+'<table cellpadding="5px" style="font-size:12px;margin: 0 auto;" cellspacing="1" bgcolor="#aed0ea" width="95%" class="appendTables">'
					+'	<tr>'
					+'		<td class="table_nemu_new">整改结果</td>'
					+'		<td colspan="3" class="table_con">'
					+'		<textarea class="easyui-validatebox" name="registerMesses.correctionReport"style="width: 97%; height: 70px;" data-options="validType:\"maxByteLength[255]\""></textarea>'
					+'		</td>'
					+'	</tr>'
					+'	<tr>'
					+'		<td class="table_nemu_new" width="25%">完成时间</td>'
					+'		<td class="table_con" width="25%">'
					+'		</td>'
					+'		<td class="table_nemu_new" width="25%">跟踪落实</td>'
					+'		<td class="table_con" width="25%">'
					+'		</td>'
					+'	</tr>'
					+'</table>'
					+'</fieldset>');
				$(el).appendTo($("#addForm").find('#addDiv'));
				$.each(data,function(i,item){
					$("#addForm").find('[name="registerMesses.'+i+'"]').val(item);
					if(i == "threeColorForm"){
						if(item == "白色"){
							$("#color_w").attr("checked", true)
						}else if(item == "黄色"){
							$("#color_y").attr("checked", true)
						}else{
							$("#color_r").attr("checked", true)
						}
					}
					if(i == "hiddenType"){
						if(item == "C类"){
							$("#type_c").attr("checked", true)
						}else if(item == "B类"){
							$("#type_b").attr("checked", true)
						}else{
							$("#type_a").attr("checked", true)
						}
					}
			    });
		 	}
		});
 	}
  ); 
  function crearAddTr(){
  	$("#addForm").find('.appendTable .appendClass').remove();
  	$("#addForm").find('#addDiv .tests').remove();
  	$("#addForm").find('#addDiv .sta').remove();
  }
  //页面显示（判断每个单元格内容字符长度是否大于25，大于部分用...省略）
   function gridFormatterLength(value, rowData, rowIndex) {
        	if(value==null || value == '' || value == 'undefined')
        		return '';
    		if(value.length > 25)
    			return value.substring(0, 25) + '...';
    		return value;
    	}
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
//三色单
function threeColor(value){
	$("#threeColors").val(value);
}  
//隐患类型
function hiddentType(value){
	$("#hiddentTypes").val(value);
}
</script>
</head>
<body>

	 <div class="panel-header" style="width:100%;">
		<div class="panel-title panel-with-icon">群众性隐患信息列表</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
	 <div>
	        <form id="searchForm" method="post" style="display: inline;">
            <div style="margin-top:-8px;">
			&nbsp;&nbsp;发现人:&nbsp;&nbsp;<input type="text" name="registerMesses.find" />
			&nbsp;&nbsp;发现单位:&nbsp;&nbsp;<input type="text" name="registerMesses.foundUnit" />
			&nbsp;&nbsp;发现时间:&nbsp;&nbsp;<input type="text" class="easyui-my97 easyui-validatebox" data-options="readOnly:true" name="registerMesses.registerTime" />
			&nbsp;&nbsp; <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search();">查询</a>
			&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch();">清空</a>
            </div>
	        </form>
	    </div>
        </div>
        <div class="search_add">
		<shiro:hasPermission name="48:add">
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add', plain:true" onclick="crearAddTr();crud.add();">添加</a>
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
            <th align="center" field="theUnit" width="50" formatter="gridFormatterLength" >隐患所在单位</th>
            <th align="center" field="registerTime" width="80" formatter="gridFormatterLength" >发现时间</th>
            <th align="center" field="place" width="150" formatter="gridFormatterLength" >隐患地点</th>
            <th align="center" field="foundUnit" width="150" formatter="gridFormatterLength" >发现单位</th>
            <th align="center" field="find" width="50" formatter="gridFormatterLength" >发现人</th>
            <th align="center" field="post" width="80" formatter="gridFormatterLength" >职务</th>
            <th align="center" field="content" width="200" formatter="gridFormatterLength" >隐患内容</th>
            <th align="center" field="id" width="120" formatter="gridFormatter">操作</th>         
	        </tr>
	        </thead>
	    </table>
	</div>

	<!-- 添加更新窗口 -->
<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" data-options="iconCls:'icon-save',modal:true,minimizable:true,maximizable:true,collapsible:true,draggable:false">
		<form method="post" >
	    	<input type="hidden" name="registerMesses.id"/>
		    <div style="padding: 10px 20px 10px 20px;" name="addDiv" id="addDiv">
		    <fieldset class="test" id="append">
			<legend>隐患信息</legend>
				<table id="detailTable" cellpadding="5px" style="font-size:12px;margin: 0 auto;" cellspacing="1" bgcolor="#aed0ea" width="95%" class="appendTable">
						<tr>
							<td class="table_nemu_new" width="25%">隐患所在单位</td>
							<td class="table_con" width="25%">
							<input type="hidden" class="easyui-validatebox" name="registerMesses.threeColorForm" value="白色"id="threeColors"/>
							<input type="text" class="easyui-validatebox" name="registerMesses.theUnit"
							data-options="validType:'maxByteLength[100]'" value="新景矿"/>
							<input type="hidden" class="easyui-validatebox" name="registerMesses.hiddenType" id="hiddentTypes" value="C类"/>
							</td>
							<td class="table_nemu_new" width="25%">发现时间</td>
							<td class="table_con" width="25%">
							<input type="text" class="easyui-my97 easyui-validatebox" data-options="required:true,readOnly:true" name="registerMesses.registerTime"/>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new" width="25%">隐患地点</td>
							<td class="table_con" colspan="3" width="25%">
							<input type="text" class="easyui-validatebox" name="registerMesses.place"
							data-options="validType:'maxByteLength[100]'"style="width:97%;" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">发现单位</td>
							<td class="table_con" colspan="3">
							<input type="text" class="easyui-validatebox" name="registerMesses.foundUnit"
							data-options="validType:'maxByteLength[100]'" style="width:97%;" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">发现人</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="registerMesses.find"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new">职务</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="registerMesses.post"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">隐患内容</td>
							<td colspan="3" class="table_con">
							<textarea class="easyui-validatebox" name="registerMesses.content"style="width: 97%; height: 70px;" data-options="validType:'maxByteLength[255]'"></textarea>
							</td>
						</tr>
				</table>
				</fieldset>
			</div>
		</form>
	</div>
	
</body>
</html>