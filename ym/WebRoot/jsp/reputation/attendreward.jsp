<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>人员日常考勤与奖罚</title>
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
		            <th align="center" field="jobNum" width="150" formatter="gridFormatterLength" >员工工号</th>
		            <th align="center" field="jlTime" width="150" formatter="gridFormatterLength" >记录时间</th>
		            <th align="center" field="attend" width="150" formatter="gridFormatterLength" >考勤状况</th>
		            <th align="center" field="reward" width="150" formatter="gridFormatterLength" >奖惩情况</th>
		            <th align="center" field="id" width="120" formatter="gridFormatter">操作</th> 
		        </tr>
	        </thead>
	    </table>
    </div>
	<table id="detailTable" cellpadding="5px" style="font-size:12px;" cellspacing="1"  border="0" bgcolor="#aed0ea" width="800px">						
		<tr>
			<td class="table_nemu_new" width="15%">员工工号</td>
			<td class="table_con" width="35%">
				<span id="jobNum"></span>
			</td>		
			<td class="table_nemu_new" width="15%">员工名称</td>
			<td class="table_con" width="35%">
				<span id="name"></span>
			</td>
		</tr>
		<tr>
			<td class="table_nemu_new">专业</td>
			<td class="table_con">
				<span id="major"></span>
			</td>		
			<td class="table_nemu_new">岗位</td>
			<td class="table_con">
				<span id="post"></span>
			</td>
		</tr>
		<tr>
			<td class="table_nemu_new" width="15%">所在部门</td>
			<td class="table_con" width="35%">
				<span id="done"></span>	
				-
				<span id="dtwo"></span>	
			</td>
			<td class="table_nemu_new">记录时间:</td>
			<td class="table_con">
				<span id="jlTime"></span>
			</td>
		</tr>			
		<tr>
			<td class="table_nemu_new">考勤状况:</td>
			<td class="table_con">
			     <span id="attend"></span>
			</td>
		
			<td class="table_nemu_new">奖惩情况:</td>
			<td class="table_con">
			     <span id="reward"></span>
			</td>
		</tr>		
		<tr>
			<td class="table_nemu_new">奖惩原因:</td>
			<td class="table_con" colspan="3">
				<span id="rewardReason"></span>
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
        		url:'${ctx}/attendReward/attendRewardAction!getById',
        		data:'id='+rowId,
        		success:function(data){
					if(data != null){
						$('#jobNum').text(data.jobNum);
						$('#name').text(data.name);
						$('#major').text(data.major);
						$('#post').text(data.post);
						$('#jlTime').text(data.jlTime);
						$('#attend').text(data.attend);
						$('#reward').text(data.reward);
						$('#rewardReason').text(data.rewardReason);
						$('#done').text(data.done);
						$('#dtwo').text(data.dtwo);
					}
        		}
			});
		}
		window.onload = function(){
			var employeeId = $('#employeeId').val();
			var date = $('#date').val();
			grid = new Grid('${ctx}/attendReward/attendRewardAction!list?attendReward.employeeId='+employeeId+'&attendReward.jlTime='+date, 'data_list');
			grid.loadGrid();
		}
	</script>
</body>
</html>