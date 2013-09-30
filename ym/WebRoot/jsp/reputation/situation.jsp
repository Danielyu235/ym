<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>    
<%@ include file="/common/jqueryhead.jsp" %>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>安全信誉评价-人员日常状况</title>
	<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
</head>
<body>
	<center>
	<input type="hidden" id="employeeId" value="${param.employeeId }">
	<input type="hidden" id="date" value="${param.date }">	
	<div style="height:250px;width:800px">
	    <table id="data_list2" style="display:none">
	        <thead>
		        <tr>
				    <th align="center" field="time" width="150" formatter="gridFormatterLength" >时间</th>
		            <th align="center" field="address" width="150" formatter="gridFormatterLength" >地点</th>
		            <th align="center" field="speaker" width="150" formatter="gridFormatterLength" >谈话人</th>
		            <th align="center" field="name" width="150" formatter="gridFormatterLength" >被谈话人</th>
		            <th align="center" field="id" width="120" formatter="gridFormatter">操作</th> 
		        </tr>
	        </thead>
	    </table>
    </div>
	<table id="detailTable" cellpadding="5px" style="font-size:12px;" cellspacing="1"  border="0" bgcolor="#aed0ea" width="800px">						
		<tr>
			<td class="table_nemu_new" width="15%">时间:</td>
			<td class="table_con" width="35%">
				<span id="time"></span>
			</td>	
			<td class="table_nemu_new" width="15%">地点:</td>
			<td class="table_con" width="35%">
				<span id="address"></span>
			</td>
		</tr>				
	  	<tr>
			<td class="table_nemu_new">员工工号</td>
			<td class="table_con" >
				<span id="jobNum"></span>
			</td>	
			<td class="table_nemu_new">员工名称</td>
			<td class="table_con" >
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
			<td class="table_nemu_new">谈话人:</td>				
	        <td class="table_con">
	        	<span id="speaker"></span>
	        </td>	
		</tr>
			
		<tr>
			<td class="table_nemu_new">不放心人员类型:</td>
			<td class="table_con" colspan="3" id="person">
						
			</td>			
		</tr>
		<tr>
		    <td class="table_nemu_new">谈话事由:</td>
			<td class="table_con" colspan="3">
				<span id="talkReason"></span>
			</td>
		</tr>
		<tr>
			<td class="table_nemu_new">谈话内容:</td>
			<td class="table_con" colspan="3">
				<span id="conversation"></span>
			</td>		
		</tr>
		<tr>
		   	<td class="table_nemu_new">谈话效果:</td>
			<td class="table_con" colspan="3">
				<span id="effect" style="background-color: "></span>
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
			var rowName = rowData.questionName;
			var url = "";
			url += "<a title=\"查看\" onclick='getView(\""+rowId+"\")' class='btn2'><img src=\"${ctx}/images/select.png\"></a>";
			return url;
		}
		function getView(rowId){
			$.ajax({
	     		type:'post',
	     		url:'${ctx}/dailyStatus/dailyStatusAction!getById',
	     		data:'id='+rowId,
	     		success:function(data){
						if(data != null){
							$('#time').text(data.time);
							$('#address').text(data.address);
							$('#jobNum').text(data.jobNum);
							$('#name').text(data.name);
							$('#major').text(data.major);
							$('#post').text(data.post);
							$('#speaker').text(data.speaker);
							$('#talkReason').text(data.talkReason);
							$('#conversation').text(data.conversation);
							$('#effect').text(data.effect);
							$('#done').text(data.done);
							$('#dtwo').text(data.dtwo);
							getPersonTypeText(data.personType);
						}
	     		}
			});
						
		}
		function getPersonTypeText(pt){
			$('#person').empty();
			$.ajax({
	     		type:'post',
	     		url:'${ctx}/dailyStatus/dailyStatusAction!getPersonTypeText',
	     		data:'pid='+pt,
	     		success:function(data){
		     		data = eval(data);
		     		for(var i = 0; i < data.length; i++){
		     			$('#person').append('<span style="background-color:#CCCCCC;padding:4px">' + data[i] + '</span>&nbsp;');				
		     		}
	     		}
			});
		}
		
		window.onload = function(){
			var employeeId = $('#employeeId').val();
			var date = $('#date').val();
			grid = new Grid('${ctx}/dailyStatus/dailyStatusAction!list?dailyStatus.employeeid='+employeeId+'&dailyStatus.time='+date, 'data_list2');
			grid.loadGrid();
		}
	</script>
</body>
</html>