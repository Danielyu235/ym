<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>安全信誉评价-日常三违处罚</title>
	<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
</head>
<body>
	<center>
	<input type="hidden" id="employeeId" value="${param.employeeId }">
	<input type="hidden" id="date" value="${param.date }">	
	<div style="height:250px;width:800px">
	    <table id="data_list" style="display:none">
	        <thead>
		        <tr>
		            <th align="center" field="sy" width="150" formatter="gridFormatterLength" >事因</th>
		            <th align="center" field="fkje" width="150" formatter="gridFormatterLength" >三违罚款金额</th>
		            <th align="center" field="fksj" width="150" formatter="gridFormatterLength" >罚款时间</th>
		            <th align="center" field="fkmx" width="150" formatter="gridFormatterLength" >罚款明细</th>
		            <th field="id" width="120" formatter="gridFormatter">操作</th>  
		        </tr>
	        </thead>
	    </table>
    </div>
	<table id="detailTable" cellpadding="5px" style="font-size:12px;" cellspacing="1"  border="0" bgcolor="#aed0ea" width="800px">						
			<tr>
				<td class="table_nemu_new"  width="15%">员工工号</td>
				<td class="table_con" width="35%">
					<span id="bfkrjobnum"></span>
				</td>		
				<td class="table_nemu_new" width="15%">所在部门</td>
				<td class="table_con" width="35%">
					<span id="done"></span>	
					-
					<span id="dtwo"></span>	
				</td>
			</tr>
			<tr>
			<td class="table_nemu_new" width="15%">员工名称</td>
				<td class="table_con" width="35%">
					<span id="bfkrname"></span>
				</td>
				<td class="table_nemu_new">专业</td>
				<td class="table_con">
					<span id="bfkrmajor"></span>
				</td>		
				
			</tr>
			<tr>	
			<td class="table_nemu_new">岗位</td>
				<td class="table_con">
					<span id="bfkrpost"></span>
				</td>
				<td class="table_nemu_new">事因</td>
				<td class="table_con">
					<span id="sy"></span>
				</td>
			</tr>			
			<tr>
				<td class="table_nemu_new">三违罚款金额</td>
				<td class="table_con">
					<span id="fkje"></span>
				</td>			
				<td class="table_nemu_new">罚款时间</td>
				<td class="table_con">
					<span id="fksj"></span>
				</td>
			</tr>			
			<tr>
				<td class="table_nemu_new">罚款明细</td>
				<td colspan="3" class="table_con">
					<span id="fkmx"></span>
				</td>
			</tr>
		</table>
	</center>
	<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
	<script type="text/javascript">
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
			url += "<a title=\"查看\" onclick='getView(\""+rowId+"\")' class='btn2'><img src=\"${ctx}/images/select.png\"></a>";
			return url;
		}
		function getView(rowId){
			$.ajax({
        		type:'post',
        		url:'${ctx}/punishSafe/punishSafeAction!getById',
        		data:'id='+rowId,
        		success:function(data){
					if(data != null){
						$('#bfkrjobnum').text(data.bfkrjobnum);
						$('#bfkrname').text(data.bfkrname);
						$('#bfkrmajor').text(data.bfkrmajorr);
						$('#bfkrpost').text(data.bfkrpost);
						$('#sy').text(data.sy);
						$('#fkje').text(data.fkje);
						$('#fksj').text(data.fksj);
						$('#fkmx').text(data.fkmx);
						$('#done').text(data.done);
						$('#dtwo').text(data.dtwo);
						//$('#view').window('open');	
					}
        		}
			});
		}
		window.onload = function(){
			var employeeId = $('#employeeId').val();
			var date = $('#date').val();
			grid = new Grid('${ctx}/punishSafe/punishSafeAction!list?punishSafe.bfkrid='+employeeId+'&punishSafe.fksj='+date, 'data_list');
			grid.loadGrid();
		}
	</script>
</body>
</html>