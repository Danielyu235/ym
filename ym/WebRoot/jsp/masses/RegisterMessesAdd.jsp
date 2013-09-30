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
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'registerMesses',
			moduleName:'群众性隐患',
			url:'${ctx}/registerMesses/registerMessesAction',
			});
			crud.add();
 	}
  ); 

</script>
</head>
<body style="background-image: url('${ctx}/images/YMpeople.jpg')">
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