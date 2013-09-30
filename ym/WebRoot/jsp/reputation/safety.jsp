<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>职工信誉评价-安全教育考核</title>
	<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
	<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
	<script type="text/javascript">
		//页面显示（判断每个单元格内容字符长度是否大于25，大于部分用...省略）
	    function gridFormatterLength(value, rowData, rowIndex) {
        	if(value==null || value == '' || value == 'undefined')
        		return '';
    		if(value.length > 25)
    			return value.substring(0, 25) + '...';
    		return value;
	   	}
		function gridFormatter(value, rowData, rowIndex) {
			var rowId = rowData.paperId;
			var url = "";
			<shiro:hasPermission name="48:view">
			url += "<a title=\"查看\" onclick='goView(\""+rowId+"\",\""+rowData.id+"\");' class='btn2'><img src=\"../../images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
			</shiro:hasPermission>
			return url;
		}
		function goView(paperId,id){
		   	var scrWidth=screen.availWidth;
		    var scrHeight=screen.availHeight;
		    var self=window.open("${ctx}/jsp/credit/selectTest.jsp?id="+paperId+"&testId="+id,"newwindow","resizable=yes,toolbar=yes, menubar=yes,scrollbars=yes,location=yes, status=yes,top=0,left=0,width="+scrWidth+",height="+scrHeight);
	    }	
		$(document).ready(
		 	function (){
		 		var employeeId = $('#employeeId').val();
				var date = $('#date').val();
		 		grid = new Grid('${ctx}/selectPaper/selectPaperAction!list?selectPaper.username='+employeeId+'&selectPaper.time='+date, 'data_list');
				grid.loadGrid();
		 	}
		); 
	</script>
</head>
<body>
	<center>
		<div style="height:350px;width:800px">
		<input type="hidden" id="employeeId" value="${param.employeeId }">
		<input type="hidden" id="date" value="${param.date }">	
		<table id="data_list" style="display:none">
	        <thead>
		        <tr>
		            <th align="center" field="paperName" width="150" formatter="gridFormatterLength" >试卷名称</th>
		            <th align="center" field="username" width="150" formatter="gridFormatterLength" >参试人</th>
		            <th align="center" field="scores" width="150" formatter="gridFormatterLength" >试卷得分</th>
		            <th align="center" field="time" width="150" formatter="gridFormatterLength" >考试时间</th>
		            <th align="center" field="id" width="120" formatter="gridFormatter">操作</th>         
		        </tr>
	        </thead>
	    </table>
	    </div>
	</center>
</body>
</html>