<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>事故调查报告</title>
	<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
</head>
<body>
	<div>
		<form method="post" action="${ctx}/accidentSurvery/accidentSurveryAction!add" id="addForm2">
			<input type="hidden" name="accidentSurvery.aid" value="<%=request.getParameter("aid") %>" />
        	<div style="padding:10px 20px 10px 20px;" align="center">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;" cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">						
					<tr>
						<td class="table_nemu_new" width="15%">事故类型</td>
						<td class="table_con"  width="35%">
							<input class="easyui-validatebox" name="accidentSurvery.type" id="atype" data-options="validType:'maxByteLength[100]'" size="50"/>
						</td>
					
						<td class="table_nemu_new" width="15%">事故发生时间</td>
						<td class="table_con"  width="35%">
							<input class="easyui-my97 easyui-validatebox" data-options="required:true,readOnly:true" name="accidentSurvery.happenTime" id="ahappenTime"/>
						</td>
					</tr>
					
					<tr>
						<td class="table_nemu_new">事故地点</td>
						<td class="table_con" colspan="3">
							<input type="text"  class="easyui-validatebox" size="100" name="accidentSurvery.address" id="address" data-options="validType:'maxByteLength[100]'" />
						</td>
					</tr>
					<tr>
						<td class="table_nemu_new">事故地点概况</td>
						<td class="table_con" colspan="3">
						<textarea class="easyui-validatebox" style="width:80%;height:80px;" name="accidentSurvery.siteProfile"></textarea>
						</td>
					</tr>
					<tr>
						<td class="table_nemu_new">事故前安全监管情况</td>
						<td class="table_con" colspan="3">
						<textarea type="text" class="easyui-validatebox" style="width:80%;height:80px;" name="accidentSurvery.safetyRegulation"
						data-options="validType:'maxByteLength[100]'" ></textarea>
						</td>
					</tr>
					<tr>
						<td class="table_nemu_new">事故发生情况及抢救情况</td>
						<td class="table_con" colspan="3">
						<textarea type="text" class="easyui-validatebox" style="width:80%;height:80px;" name="accidentSurvery.safeRescueSituation"
						data-options="validType:'maxByteLength[100]'" ></textarea>
						</td>
					</tr>
					
					<tr>
						<td class="table_nemu_new">人员伤亡和直接经济损失</td>
						<td class="table_con" colspan="3">
						<textarea type="text" class="easyui-validatebox" style="width:80%;height:80px;" name="accidentSurvery.losses"
						data-options="validType:'maxByteLength[100]'" ></textarea>
						</td>
					</tr>
					<tr>
						<td class="table_nemu_new">直接原因</td>
						<td class="table_con" colspan="3">
						<textarea type="text" class="easyui-validatebox" style="width:80%;height:80px;" name="accidentSurvery.immediateCause"
						data-options="validType:'maxByteLength[100]'" ></textarea>
						</td>
					</tr>
					
					<tr>
						<td class="table_nemu_new">间接原因</td>
						<td class="table_con" colspan="3">
						<textarea type="text" class="easyui-validatebox" style="width:80%;height:80px;" name="accidentSurvery.indirectReason"
						data-options="validType:'maxByteLength[100]'" ></textarea>
						</td>
					</tr>
					<tr>
						<td class="table_nemu_new">事故性质</td>
						<td class="table_con" colspan="3">
						<textarea type="text" class="easyui-validatebox" style="width:80%;height:80px;" name="accidentSurvery.accdientNature"
						data-options="validType:'maxByteLength[100]'" ></textarea>
						</td>
					</tr>
					
					<tr>
						<td class="table_nemu_new">责任划分与处理建议</td>
						<td class="table_con" colspan="3">
						<textarea type="text" class="easyui-validatebox" style="width:80%;height:80px;" name="accidentSurvery.responsibility"
						data-options="validType:'maxByteLength[100]'" ></textarea>
						</td>
				   </tr>
				</table><br/><br/>
				<center>
					<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" onclick="$('#addForm2').submit();" id="addButton">添 加</a>
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
		//查询事故中是数据，带入到页面中
	 	function assignment(){
	 		var types = getArgs();
	 		var aid = types.aid;
	 		$.ajax( {
	 			type : 'post',
	 			url : '${ctx}/platformRescue/platformRescueAction!getById?id='+aid,
	 			data : null,
	 			success : function(data) {
		 			//alert(data.bigText);
	 				$("#atype").val(data.bigText);
	 				$("#ahappenTime").val(data.accidentOfTime);
	 				$("#address").val(data.accidentOfPlace);
	 			}
	 		});
	 	}
	 	//检查是否已添加
	 	function check(){
	 		var types = getArgs();
	 		var aid = types.aid;
	 		$.ajax( {
	 			type : 'post',
	 			url : '${ctx}/accidentSurvery/accidentSurveryAction!getCountByAid?accidentSurvery.aid=' + aid,
	 			success : function(data) {
		 			if(data > 0){
						//查数据，赋值
		 				setValue();
		 				$("#addForm2 input").attr("disabled","disabled");
		    			$("#addForm2 textarea").attr("disabled","disabled");
		    			$("#addButton").remove();//删除添加按钮
		 			}else {
		 				assignment();
		 			}
	 			}
	 		});
	 	}
		//查询已添加的事故调查报告，并且赋值到页面上
	 	function setValue(){
	 		var types = getArgs();
	 		var aid = types.aid;
	 		$.ajax( {
	 			type : 'post',
	 			url : '${ctx}/accidentSurvery/accidentSurveryAction!getById?id=' + aid,
	 			success : function(data) {
	 				var obj = {};
	 				$.each(data,function(i,item){
	 					obj['accidentSurvery.' + i] = item;
	 			    });
	 				$('#addForm2').form('load',obj);
	 			}
	 		});
	 	}
		$(function(){
            $('#addForm2').form({
                success:function(data){ 
	            	$.messager.show({
	                    title:'成功',
	                    msg:'添加成功',
	                    timeout:2000,
	                    showType:'slide'
	                });             	
	            	$("#addForm2 input").attr("disabled","disabled");
	    			$("#addForm2 textarea").attr("disabled","disabled");
	    			$("#addButton").remove();//删除添加按钮
                }
            	
            }); 
            check();   
        });
	</script>
</body>
</html>