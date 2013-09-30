<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>启动应急救援平台</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtilCheckbox.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtilState.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<script type="text/javascript">
$(document).ready(
 	function (){
 	onloadCombobox('${ctx}', 'sglx', $('#bigId'),null, null);
 	onloadCombobox('${ctx}', 'sglx', $('#big'),null, null);
 		var state = getArgs();
 		grid = new Grid('${ctx}/platformRescue/platformRescueAction!list', 'data_list');
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'platformRescue',
			moduleName:'事故',
			url:'${ctx}/platformRescue/platformRescueAction',
			afterViewLoadData: function(viewFormObject, data){
			   $("#addView").height($(window).height());
			    $("#addView").width($(window).width());
		 	}
		});
		if(state == "1"){
			crud.add();
		}
 	}
  ); 
  //获取URL参数
  function getArgs( ) {
    var query = location.search.substring(1);    
    var pos =query.indexOf('=');   
    var argname = query.substring(0,pos); 
    var value = query.substring(pos+1);   
    value = decodeURIComponent(value);               
    return value;                                  
} 
</script>
</head>
<body>
	<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;border: 0px;" 
			data-options="modal:true,minimizable:true,maximizable:true,maximized:true,collapsible:true,draggable:false">    			
			<form method="post" >
				<input type="hidden" name="platformRescue.id"/>
			    <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
					<table id="detailTable" cellpadding="5px" style="font-size:12px;border: 0px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
						<tr>
							<td class="table_nemu_new" width="15%">报警人</td>
							<td class="table_con" width="35%">
							<input type="text" class="easyui-validatebox" name="platformRescue.alarmPeople"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new" width="15%">报警人电话</td>
							<td class="table_con" width="35%">
							<input type="text" class="easyui-validatebox" name="platformRescue.alarmPeopleTel"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">事故类型</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" data-options="panelHeight:'auto',width:'100'" name="platformRescue.bigAccidentTypes" style="width: 100px" id="big"/>
							</td>
							<td class="table_nemu_new">事故发生时间</td>
							<td class="table_con">
							<input type="text" class="easyui-my97" onfocus="WdatePicker({dateFmt:'yyyy年MM月dd日 HH时mm分ss秒'})" data-options="required:true,readOnly:true" name="platformRescue.accidentOfTime" style="width:150px "/>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new" width="25%">事发地点</td>
							<td class="table_con" colspan="3">
							<textarea name="platformRescue.accidentOfPlace" style="width: 80%; height: 80px;"></textarea>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">事故过程描述</td>
							<td colspan="3" class="table_con">
							<textarea name="platformRescue.accidentDescription"style="width: 80%; height: 80px;" ></textarea>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">接警人</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="platformRescue.alarm"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">接警时间</td>
							<td class="table_con">
							<input type="text" name="platformRescue.alarmTel" onfocus="WdatePicker({dateFmt:'yyyy年MM月dd日 HH时mm分ss秒'})" class="easyui-my97" data-options="required:true,readOnly:true" style="width:150px "/>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">灾难损失概要说明（对周边环境的影响）</td>
							<td colspan="3" class="table_con">
							<textarea name="platformRescue.explain"  style="width: 80%; height: 80px;" ></textarea>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">死亡人数</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="platformRescue.deathToll"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">受伤人数</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="platformRescue.injuredToll"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">失踪人数</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="platformRescue.disappearToll"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">住院人数</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="platformRescue.hospitalToll"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
							<td class="table_nemu_new">被疏散人数</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="platformRescue.evacuatedToll"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new"></td>
							<td class="table_con">
							</td>
						</tr>
							
						<tr>
							<td class="table_nemu_new">疏散地点</td>
							<td colspan="3" class="table_con">
							<textarea name="platformRescue.evacuptedPlace" style="width: 80%; height: 80px;" ></textarea>
						</tr>
						
						<tr>
							<td class="table_nemu_new">目前状况</td>
							<td colspan="3" class="table_con">
							<textarea name="platformRescue.situation" style="width: 80%; height: 80px;"></textarea>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">备注</td>
							<td colspan="3" class="table_con">
							<textarea name="platformRescue.remarks"style="width: 80%; height: 80px;"></textarea>
							</td>
						</tr>
				</table>
				</div>
			</form>
		</div>
	</div>
</body>
</html>