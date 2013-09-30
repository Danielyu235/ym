<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询成绩</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>

<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
	<%
		String departmentf =request.getParameter("departmentf");
		String departments =request.getParameter("departments");
		if(departmentf == null){
			departmentf ="";
		}
		if(departments == null){
			departments ="";
		}
	 %>
<script type="text/javascript">
$(document).ready(
 	function (){
 		onloadCombobox('${ctx}','zy',$('#employee_major_v'),$('#employee_post_v'),null);	
 		grid = new Grid('${ctx}/selectPaper/selectPaperAction!list?selectPaper.done=<%=departmentf%>&selectPaper.dtwo=<%=departments%>', 'data_list');
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'selectPaper',
			moduleName:'成绩',
			url:'${ctx}/selectPaper/selectPaperAction'
		});
 	}
  ); 
   //页面显示（判断每个单元格内容字符长度是否大于25，大于部分用...省略）
   function gridFormatterLength(value, rowData, rowIndex) {
        	if(value==null || value == '' || value == 'undefined')
        		return '';
    		if(value.length > 25)
    			return value.substring(0, 25) + '...';
    		return value;
    	}
  	 function gridFormatters(value, rowData, rowIndex) {
    	return rowData.done+"-"+rowData.dtwo
    }
function gridFormatter(value, rowData, rowIndex) {
	var rowId = rowData.paperId;
	var url = "";

	url += "<a title=\"查看\" onclick='goView(\""+rowId+"\",\""+rowData.id+"\");' class='btn2'><img src=\"../../images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";

	return url;
}
function goView(paperId,id){
   	var scrWidth=screen.availWidth;
     var scrHeight=screen.availHeight;
     var self=window.open("${ctx}/jsp/credit/selectTest.jsp?id="+paperId+"&testId="+id,"newwindow","resizable=yes,toolbar=yes, menubar=yes,scrollbars=yes,location=no, status=yes,top=0,left=0,width="+scrWidth+",height="+scrHeight);
   }	
</script>
</head>
<body>
<div class="panel-header" style="width:100%;">
		<div class="panel-title panel-with-icon">查询试卷列表</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
	 <div>
	        <form id="searchForm" method="post" style="display: inline;">
            <div style="margin-top:-8px;">
            &nbsp;&nbsp; 试卷名称:&nbsp;&nbsp;<input type="text" class="easyui-validatebox" name="selectPaper.paperName" style="width: 120px;"/>
            &nbsp;&nbsp;员工工号:&nbsp;&nbsp;<input type="text" name="selectPaper.employeeName" style="width: 120px;"/>
            <!--&nbsp;&nbsp; 参试人:&nbsp;&nbsp;<input type="text" class="easyui-validatebox" name="selectPaper.sysuser" style="width: 120px;" />  -->
            &nbsp;&nbsp; 考试时间:&nbsp;&nbsp;<input type="text" class="easyui-my97 easyui-validatebox" data-options="readOnly:true" name="selectPaper.time" style="width: 120px;"/>&nbsp;&nbsp;
	       <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search();">查询</a>
			&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch();">清空</a>
            </div>
	        </form>
	    </div>
        </div>
        <div class="search_add">
		<shiro:hasPermission name="48:delete">		
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove', plain:true" onclick="crud.remove();">删除</a>
		</shiro:hasPermission>
        </div>
<div style="height:74%;">
	    <table id="data_list" style="display:none">
	        <thead>
	        <tr>
            <th align="center" field="paperName" width="150" formatter="gridFormatterLength" >试卷名称</th>
            <th align="center" field="employeeName" width="80" formatter="gridFormatterLength" >员工工号</th>
		    <th align="center" field="username" width="80" formatter="gridFormatterLength" >参试人</th>
	        <th align="center" field="major" width="80" formatter="gridFormatterLength" >专业</th>
	        <th align="center" field="post" width="80" formatter="gridFormatterLength" >岗位</th>
	        <th align="center" field="done" width="80" formatter="gridFormatters" >所属部门</th>
            <th align="center" field="scores" width="50" formatter="gridFormatterLength" >试卷得分</th>
            <th align="center" field="time" width="80" formatter="gridFormatterLength" >考试时间</th>
            <th align="center" field="id" width="50" formatter="gridFormatter">操作</th>         
	        </tr>
	        </thead>
	    </table>
	</div>
</body>
</html>