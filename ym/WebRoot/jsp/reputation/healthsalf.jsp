<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>    
<%@ include file="/common/jqueryhead.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>职工信誉评价-人员职业健康</title>
	<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
</head>
<body>	
	<center>
	<div id="view">
		<input type="hidden" id="employeeId" value="${param.employeeId }">
		<input type="hidden" id="date" value="${param.date }">	
		<table id="detailTable" cellpadding="5px" style="font-size:12px;" cellspacing="1"  border="0" bgcolor="#aed0ea" width="800px">
		 	<tr>
				<td class="table_nemu_new" width="15%">员工工号</td>
				<td class="table_con" width="35%">
					<span name="checkUp.jobNum"></span>					
				</td>		
				<td class="table_nemu_new" width="15%">所在部门</td>
				<td class="table_con" width="35%">
					<span name="checkUp.done"></span>	
					-
					<span name="checkUp.dtwo"></span>	
				</td>				
			</tr>
			<tr>
				<td class="table_nemu_new" >员工名称</td>
				<td class="table_con" >
					<span name="checkUp.name"></span>
				</td>
				<td class="table_nemu_new" >专业</td>
				<td class="table_con" >
					<span name="checkUp.major" ></span>
				</td>						
			</tr>
			<tr>
				<td class="table_nemu_new" >岗位</td>
				<td class="table_con" >
					<span name="checkUp.post" ></span>
				</td>				
				<td class="table_nemu_new" >
					体检时间
				</td>
				<td class="table_con">
				<span name="checkUp.date" ></span>
				</td>
			</tr>						
			<tr>
				<td class="table_nemu_new">血压(高)(mmHg)</td>
				<td class="table_con">
				<span name="checkUp.bloodPressureHigh"></span>
				</td>
			<td class="table_nemu_new">血压(低)(mmHg)</td>
				<td class="table_con">
				<span name="checkUp.bloodPressureLow"></span>
				</td>
				</tr>
				<tr>
				<td class="table_nemu_new">脉率(bpm)</td>
				<td class="table_con">
				<span name="checkUp.pulseRate"></span>
				</td>
			
				<td class="table_nemu_new">心电图</td>
				<td class="table_con">
				<span name="checkUp.electrocardiogram"></span>
				</td>
			</tr>
			
			<tr>
				<td class="table_nemu_new">B超</td>
				<td class="table_con">
				<span name="checkUp.bc"></span>
				<td class="table_nemu_new">尘肺病</td>
				<td class="table_con">
				<span name="checkUp.pneumoconiosis"></span>
				</td>
				
			</tr>
			
			<tr>
				<td class="table_nemu_new">血液检查</td>
				<td class="table_con">
				<span name="checkUp.bloodExamination"></span>
				</td>
			
				<td class="table_nemu_new">肝肾功能</td>
				<td class="table_con">
				<span name="checkUp.lkExamination"></span>
				</td>
			</tr>
			
			<tr>
				<td class="table_nemu_new">神经系统</td>
				<td class="table_con">
				<span name="checkUp.nervousSystem"></span>
				</td>
			
				<td class="table_nemu_new">甲状腺</td>
				<td class="table_con">
				<span name="checkUp.thyroid"></span>
				</td>
			</tr>
			<tr>
				<td class="table_nemu_new">浅表淋巴结</td>
				<td class="table_con">
				<span name="checkUp.superficialLymphadenopathy"></span>
				</td>
			
				<td class="table_nemu_new">皮肤黏膜</td>
				<td class="table_con">
				<span name="checkUp.skinAndMucosa"></span>
				</td>
			</tr>
			<tr>
				<td class="table_nemu_new">备注</td>
				<td colspan="3" class="table_con">
				<span name="checkUp.remark"></span>
				</textarea>
				</td>
			</tr>
		</table>
	</div>
	</center>
	<script type="text/javascript">
		function onloadHealthSalf(){
			var pid = $('#employeeId').val();
			var date_s = $('#date').val();
			$.ajax({
        		type:'post',
        		url:'${ctx}/checkUp/checkUpAction!getView',
        		data:'pid='+pid+'&date='+date_s,
        		success:function(data){
        				data = JSON.parse(data);
		        		if(data == null) return;
						$.each(data,function(i,item){
							$("#view").find('span[name="checkUp.' + i + '"]').html(item);
					    });
        		}
        	});	
		}
		window.onload = function (){
			onloadHealthSalf();
		}
	</script>	
</body>
</html>