<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>事故总结报告</title>
	<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
</head>
<body>
	<div>		
		<form method="post" action="${ctx}/accidentConclusion/accidentConclusionAction!add" id="addForm">
			<input type="hidden" name="accidentConclusion.aid" value="<%=request.getParameter("aid") %>"/>
	       	<div style="padding:10px 20px 10px 20px;" align="center">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;" cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">						
					<tr>
						<td class="table_nemu_new">报告名称</td>
						<td class="table_con" colspan="3">
							<input type="text" class="easyui-validatebox" name="accidentConclusion.reportName" data-options="validType:'maxByteLength[100]'" size="100"/>
						</td>
					</tr>
					<tr>
						<td class="table_nemu_new">事故信息</td>
						<td class="table_con" colspan="3">
							<TEXTAREA type="text" class="easyui-validatebox" style="width:80%;height:80px;" name="accidentConclusion.accidentInfo"
								data-options="validType:'maxByteLength[100]'" ></TEXTAREA>
						</td>
					</tr>						
					<tr>
						<td class="table_nemu_new" width="15%">事故类型</td>
						<td class="table_con" width="35%">
							<input type="text" class="easyui-validatebox" name="accidentConclusion.type" id="type"
								data-options="validType:'maxByteLength[100]'" size="50"/>
						</td>						
						<td class="table_nemu_new" width="15%">事故发生时间</td>
						<td class="table_con" width="35%">
							<input type="text"  name="accidentConclusion.happenTime" id="happenTime" class="easyui-my97 easyui-validatebox" data-options="required:true,readOnly:true" />
						</td>
					</tr>						
					<tr>
						<td class="table_nemu_new">事故地点</td>
						<td class="table_con" colspan="3">
							<input type="text" class="easyui-validatebox" name="accidentConclusion.accidentAddress" id="accidentAddress" data-options="validType:'maxByteLength[100]'" size="100"/>
						</td>
					</tr>
					<tr>
						<td class="table_nemu_new">事故过程描述</td>
						<td class="table_con" colspan="3">
							<textarea type="text" class="easyui-validatebox" style="width:80%;height:80px;" name="accidentConclusion.accidentProcess" id="accidentProcess"
								data-options="validType:'maxByteLength[100]'" ></textarea>
						</td>
					</tr>						
					<tr>
						<td class="table_nemu_new">报警人</td>
						<td class="table_con">
							<input type="text" class="easyui-validatebox" name="accidentConclusion.callPolice" id="callPolice"
								data-options="validType:'maxByteLength[100]'" />
						</td>						
						<td class="table_nemu_new">报警人电话</td>
						<td class="table_con">
							<input type="text" class="easyui-validatebox" name="accidentConclusion.callPhone" data-options="validType:'maxByteLength[100]'" />
						</td>
					</tr>						
					<tr>
						<td class="table_nemu_new">接警人</td>
						<td class="table_con">
							<input type="text" class="easyui-validatebox" name="accidentConclusion.calledMan" id="calledMan" data-options="validType:'maxByteLength[100]'" />
						</td>
					
						<td class="table_nemu_new">接警时间</td>
						<td class="table_con">
							<input type="text" name="accidentConclusion.calledTime" id="calledTime" class="easyui-my97 easyui-validatebox" data-options="required:true,readOnly:true" />
						</td>
					</tr>						
					<tr>
						<td class="table_nemu_new">启用预案名称</td>
						<td class="table_con" colspan="3">
							<input type="text" class="easyui-validatebox" name="accidentConclusion.planName" data-options="validType:'maxByteLength[100]'" />
						</td>
					</tr>
					<tr>
						<td class="table_nemu_new">预案级别</td>
						<td class="table_con">
						<input type="text" class="easyui-validatebox" name="accidentConclusion.planLevel"
						data-options="validType:'maxByteLength[100]'" />
						</td>
						<td class="table_nemu_new">预案类型</td>
						<td class="table_con">
						<input type="text" class="easyui-validatebox" name="accidentConclusion.planType"
						data-options="validType:'maxByteLength[100]'" />
						</td>
				    </tr>
				    <tr>	
						<td class="table_nemu_new">死亡人数</td>
						<td class="table_con">
						<input type="text" class="easyui-validatebox" name="accidentConclusion.deadNum" id="deadNum"
						data-options="validType:'maxByteLength[100]'" />
						</td>
						<td class="table_nemu_new">受伤人数</td>
						<td class="table_con">
						<input type="text" class="easyui-validatebox" name="accidentConclusion.injuredNum" id="injuredNum"
						data-options="validType:'maxByteLength[100]'" />
						</td>
					</tr>
					<tr>
						<td class="table_nemu_new">失踪人数</td>
						<td class="table_con">
						<input type="text" class="easyui-validatebox" name="accidentConclusion.missingNum" id="missingNum"
						data-options="validType:'maxByteLength[100]'" />
						</td>
						<td class="table_nemu_new">住院人数</td>
						<td class="table_con">
						<input type="text" class="easyui-validatebox" name="accidentConclusion.hospitalNum" id="hospitalNum"
						data-options="validType:'maxByteLength[100]'" />
						</td>
						</tr>
					 <tr>
						<td class="table_nemu_new">直接财产损失</td>
						<td class="table_con">
						<input type="text" class="easyui-validatebox" name="accidentConclusion.directLose"
						data-options="validType:'maxByteLength[100]'" />
						</td>
						<td class="table_nemu_new">间接财产损失</td>
						<td class="table_con">
						<input type="text" class="easyui-validatebox" name="accidentConclusion.indirectLose"
						data-options="validType:'maxByteLength[100]'" />
						</td>
					</tr>
					<tr>
						<td class="table_nemu_new">事故评价</td>
						<td class="table_con" colspan="3">
						<textarea type="text" class="easyui-validatebox" style="width:80%;height:80px;" name="accidentConclusion.accidentEvaluation"
						data-options="validType:'maxByteLength[100]'" ></textarea>
						</td>
					</tr>						
					<tr>
						<td class="table_nemu_new">专家意见</td>
						<td class="table_con" colspan="3">
						<textarea type="text" class="easyui-validatebox" style="width:80%;height:80px;" name="accidentConclusion.expertOpinion"
						data-options="validType:'maxByteLength[100]'" ></textarea>
						</td>
					</tr>
					<tr>
						<td class="table_nemu_new">总指挥意见</td>
						<td class="table_con" colspan="3">
						<textarea type="text" class="easyui-validatebox"  style="width:80%;height:80px;" name="accidentConclusion.zzhOpinion"
						data-options="validType:'maxByteLength[100]'" ></textarea>
						</td>
					</tr>						
					<tr>
						<td class="table_nemu_new">备注</td>
						<td class="table_con" colspan="3">
						<textarea type="text" class="easyui-validatebox" style="width:80%;height:80px;" name="accidentConclusion.note"
						data-options="validType:'maxByteLength[100]'" ></textarea>
						</td>
					</tr>
				</table><br/><br/>
				<center>
					<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" onclick="$('#addForm').submit();" id="addButton">添 加</a>
				</center>
			</div>
		</form>
	</div>	
	
	<script type="text/javascript">
		//获取URL参数
	 	function getArgs() {
 	  		var url = location.search; //获取url中"?"符后的字串
 	   		var theRequest = new Object();
	 	   	if (url.indexOf("?") != -1) {
	 	      var str = url.substr(1);
	 	      strs = str.split("&");
	 	      for(var i = 0; i < strs.length; i ++) {
	 	         theRequest[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);//添加到对象中
	 	      }
	 	   }
	 	   return theRequest;                              
	 	}
		//查询事故中是数据
	 	function assignment(){
	 		var types = getArgs();
	 		var aid = types.aid;
	 		$.ajax( {
	 			type : 'post',
	 			url : '${ctx}/platformRescue/platformRescueAction!getById?id='+aid,
	 			data : null,
	 			success : function(data) {
		 			$("#type").val(data.bigText);
					$("#happenTime").val(data.accidentOfTime);
					$("#accidentAddress").val(data.accidentOfPlace);
					$("#accidentProcess").val(data.accidentDescription);
					$("#calledMan").val(data.alarm);
					$("#calledTime").val(data.alarmTel);
					$("#deadNum").val(data.deathToll);
					$("#missingNum").val(data.disappearToll);
					$("#injuredNum").val(data.injuredToll);
					$("#hospitalNum").val(data.hospitalToll);
	 			}
	 		});
	 	}
		//检查是否已添加
	 	function check(){
	 		var types = getArgs();
	 		var aid = types.aid;
	 		$.ajax( {
	 			type : 'post',
	 			url : '${ctx}/accidentConclusion/accidentConclusionAction!getCountByAid?accidentConclusion.aid=' + aid,
	 			success : function(data) {
		 			if(data > 0){
						//查数据，赋值
		 				setValue();
		 				$("#addForm input").attr("disabled","disabled");
		    			$("#addForm textarea").attr("disabled","disabled");
		    			$("#addButton").remove();//删除添加按钮
		 			}else {
		 				assignment();
		 			}
	 			}
	 		});
	 	}
		//查询已添加的事故总结报告，并且赋值到页面上
	 	function setValue(){
	 		var types = getArgs();
	 		var aid = types.aid;
	 		$.ajax( {
	 			type : 'post',
	 			url : '${ctx}/accidentConclusion/accidentConclusionAction!getById?id=' + aid,
	 			success : function(data) {
	 				var obj = {};
	 				$.each(data,function(i,item){
	 					obj['accidentConclusion.' + i] = item;
	 			    });
	 				$('#addForm').form('load',obj);
	 			}
	 		});
	 	}
	 	$(function(){
            $('#addForm').form({
                success:function(data){ 
	            	$.messager.show({
	                    title:'成功',
	                    msg:'添加成功',
	                    timeout:2000,
	                    showType:'slide'
	                });             	
	            	$("#addForm input").attr("disabled","disabled");
	    			$("#addForm textarea").attr("disabled","disabled");
	    			$("#addButton").remove();//删除添加按钮
                }
            	
            });  
            check();
        });
	</script>			
</body>
</html>