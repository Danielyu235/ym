<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线考试</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtilCheckbox.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<style type="text/css">

</style>
<script type="text/javascript">
	var hr;
 $(document).ready(
 	function (){
 		onloadCombobox('${ctx}','zy',$('#majorTypeId'),null,null);
        grid = new Grid('${ctx}/testPaperManage/testPaperManageAction!listOnline?testPaperManage.testType=1', 'data_list');
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'testPaperManage',
			moduleName:'考前必读',
			dialogCss:{width:"550px",height:"500px"},
			url:'${ctx}/testPaperManage/testPaperManageAction',
			afterViewLoadData:function(viewFormObject, data) {//加载view触发的事件
				hr = "${ctx}/jsp/credit/beginTest.jsp?id="+data.id;		
			}
		});
	}
  ); 
	
   function goView(){
   	var scrWidth=screen.availWidth;
     var scrHeight=screen.availHeight;
    var self=window.open(hr,"newwindow","resizable=yes,toolbar=yes, menubar=yes,scrollbars=yes,location=no, status=yes,top=0,left=0,width="+scrWidth+",height="+scrHeight);
     $("#addView").dialog('close');
   }	
 
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
	var rowName=rowData.questionName;
	var url = "";
	url += "<a title=\"在线练习\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"${ctx}/images/onLine.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	return url;
}
</script>
</head>
<body>
<div class="panel-header" style="width:100%;">
		<div class="panel-title panel-with-icon">在线考试</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
	 <div>
	        <form id="searchForm" method="post" style="display: inline;">
            <div style="margin-top:-8px;">
			&nbsp;&nbsp;试卷名称:&nbsp;&nbsp;<input type="text" name="testPaperManage.paperName" />
			&nbsp;&nbsp;专业类型:&nbsp;&nbsp;<input type="text" data-options="panelHeight:'auto',width:'100',editable:false"name="testPaperManage.majorTypeId" id="majorTypeId" />
			&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search()">查询</a>
			&nbsp;&nbsp;
			<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch();">清空</a>
            </div>
	        </form>
	    </div>
        </div>
        <div class="search_add">
        </div>
	<!-- 表单表头 -->
	<div style="height:74%;">
	    <table id="data_list" style="display:none">
	        <thead>
	        <tr>
	        <th align="center" field="paperName" width="150" formatter="gridFormatterLength" >试卷名称</th>
	        <th align="center" field="majorTypeName" width="150" formatter="gridFormatterLength" >专业类型</th>
	         <th align="center" field="countNum" width="150" formatter="gridFormatterLength" >总题数</th>
            <th align="center" field="paperTime" width="150" formatter="gridFormatterLength" >答题时间（分钟）</th>
            <th align="center" field="paperScore" width="150" formatter="gridFormatterLength" >试卷总分</th>
            <th align="center" field="id" width="120" formatter="gridFormatter">操作</th>   
	        </tr>
	        </thead>
	    </table>
	</div>
	<div style="display: none;">
		<div id="addForm" style="width: 550px; height: 500px;" 
			data-options="iconCls:'icon-save',modal:true,
    			minimizable:true,maximizable:true,maximized:true,collapsible:true,draggable:false">
		<form method="post" >
		    <div style="padding: 20px 20px 20px 20px;" align="center" name="addDiv" id="addDiv">
		
				<table id="detailTable" cellpadding="5px" style="font-size:12px;line-height: 20px"
				 cellspacing="1"  border="0"  width="85%">
						 <tr>
							<td colspan="4" style="text-align: center;"><input type="text" class="easyui-validatebox" name="testPaperManage.paperName" />     <hr class="detail_hr"></td>
						</tr>
						<tr>
							<td rowspan="4"><img src="${ctx}/images/test.png"></img></td>
							<td >页面总分：<input type="text" class="easyui-validatebox" name="testPaperManage.paperScore" />分</td>
						</tr>
						<tr>
							<td>总题数：<input type="text" class="easyui-validatebox" name="testPaperManage.countNum" />题</td>
						</tr>
						<tr>
							<td>答题时间：<input type="text" class="easyui-validatebox" name="testPaperManage.paperTime" />分钟</td>
						</tr>
						<tr>
							<td><a href="javascript:void(null);" onclick="goView()"><img src="${ctx}/images/start.png"></a></td>
						</tr>
						 <tr>
							<td colspan="4">考前必读</td>
						</tr>
						 <tr>
							<td colspan="4">◇如果你已经准备好了，就点击”进入考试“按钮及进入考场，开始计时。</td>
						</tr>
						 <tr>
							<td colspan="4">◇开始过程中会在试卷的右侧显示倒计时，您可以随时查看考试剩余时间。</td>
						</tr>
						 <tr>
							<td colspan="4">◇当完成试卷后，可以点击“提交试卷”按钮提交试卷。</td>
						</tr>
				</table>
			</div>
		</form>
	</div>
	</div>
</body>
</html>