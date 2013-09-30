<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>启动应急救援平台</title>
${ctx}/platformRescue/platformRescueAction
<link rel="stylesheet" type="text/css" href="${ctx}/css/bus.css">
<script type="text/javascript" src="${ctx}/js/GridUtilToolBar.js"></script>
<script type="text/javascript">
   
</script>
</head>
<body>



<div id="tb">
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add', plain:true" onclick="addFunction()">新增</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-delete', plain:true" onclick="deleteFunction()">删除</a>
<!-- 	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-exp', plain:true" onclick="expFunction()">导出</a> -->
	<div>
	<form id="searchForm" style="margin: 0;">
	
	&nbsp;&nbsp;报警人:&nbsp;&nbsp;<input type="text" name="platformRescue.alarmPeople" />
	&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="searchFunction()">查询</a>
	&nbsp;&nbsp;
	<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="clearSearchGrid();">清空</a>
	</form>
	</div>
</div>

<div style="height: 500px">
    <table id="data_list" loadMsg="正在努力拉取数据中..." fit="true" fitColumns="true">
        <thead>
        <tr>
			
            <th align="center" field="alarmPeople" width="150" formatter="gridFormatterLength" >报警人</th>
            <th align="center" field="alarmPeopleTel" width="150" formatter="gridFormatterLength" >报警人电话</th>
            <th align="center" field="bigAccidentTypes" width="150" formatter="gridFormatterLength" >大事故类型</th>
            <th align="center" field="bigText" width="150" formatter="gridFormatterLength" >bigText</th>
            <th align="center" field="smallAccidentTypes" width="150" formatter="gridFormatterLength" >小事故类型</th>
            <th align="center" field="smallText" width="150" formatter="gridFormatterLength" >smallText</th>
            <th align="center" field="accidentOfTime" width="150" formatter="gridFormatterLength" >事故发生时间</th>
            <th align="center" field="accidentOfPlace" width="150" formatter="gridFormatterLength" >事发地点</th>
            <th align="center" field="accidentDescription" width="150" formatter="gridFormatterLength" >事故过程描述</th>
            <th align="center" field="alarm" width="150" formatter="gridFormatterLength" >接警人</th>
            <th align="center" field="alarmTel" width="150" formatter="gridFormatterLength" >接警时间</th>
            <th align="center" field="explain" width="150" formatter="gridFormatterLength" >灾难损失概要说明（对周边环境的影响）</th>
            <th align="center" field="deathToll" width="150" formatter="gridFormatterLength" >死亡人数</th>
            <th align="center" field="injuredToll" width="150" formatter="gridFormatterLength" >受伤人数</th>
            <th align="center" field="disappearToll" width="150" formatter="gridFormatterLength" >失踪人数</th>
            <th align="center" field="hospitalToll" width="150" formatter="gridFormatterLength" >住院人数</th>
            <th align="center" field="evacuatedToll" width="150" formatter="gridFormatterLength" >被疏散人数</th>
            <th align="center" field="evacuptedPlace" width="150" formatter="gridFormatterLength" >疏散地点</th>
            <th align="center" field="situation" width="150" formatter="gridFormatterLength" >目前状况</th>
            <th align="center" field="remarks" width="150" formatter="gridFormatterLength" >备注</th>
            <th align="center" field="state" width="150" formatter="gridFormatterLength" >state</th>
            <th field="id" width="120" formatter="gridFormatter">操作</th>         
        </tr>
        </thead>
    </table>
</div>

	<!-- 添加更新窗口 -->
	<div style="display: none;">
		<form id="addForm" method="post" style="width: 960px; height: 500px;">
			<input type="hidden" name="platformRescue.id"/>
			<div style="margin: 0 auto;" align="center" name="addDiv">
				<table class="detailTable" style="width: 80%;">
					
						<tr>
							<td class="labelTd">报警人:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="platformRescue.alarmPeople"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">报警人电话:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="platformRescue.alarmPeopleTel"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">大事故类型:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="platformRescue.bigAccidentTypes"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">bigText:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="platformRescue.bigText"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">小事故类型:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="platformRescue.smallAccidentTypes"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">smallText:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="platformRescue.smallText"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">事故发生时间:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="platformRescue.accidentOfTime"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">事发地点:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="platformRescue.accidentOfPlace"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">事故过程描述:</td>
							<td colspan="3" class="contentTd">
							<textarea class="easyui-validatebox" name="platformRescue.accidentDescription"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">接警人:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="platformRescue.alarm"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">接警时间:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="platformRescue.alarmTel"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">灾难损失概要说明（对周边环境的影响）:</td>
							<td colspan="3" class="contentTd">
							<textarea class="easyui-validatebox" name="platformRescue.explain"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">死亡人数:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="platformRescue.deathToll"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">受伤人数:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="platformRescue.injuredToll"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">失踪人数:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="platformRescue.disappearToll"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">住院人数:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="platformRescue.hospitalToll"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">被疏散人数:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="platformRescue.evacuatedToll"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">疏散地点:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="platformRescue.evacuptedPlace"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">目前状况:</td>
							<td colspan="3" class="contentTd">
							<textarea class="easyui-validatebox" name="platformRescue.situation"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">备注:</td>
							<td colspan="3" class="contentTd">
							<textarea class="easyui-validatebox" name="platformRescue.remarks"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">state:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="platformRescue.state"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
				</table>
			</div>
		</form>
	</div>
	
	<div style="display: none;">
		<div id="viewForm" style="width: 960px; height: 500px;">
			
		</div>
	</div>
	
</body>
</html>