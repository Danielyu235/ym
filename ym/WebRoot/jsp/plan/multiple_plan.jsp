<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>综合应急预案</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
<link rel="stylesheet" href="${ctx}/css/planCrud.css" type="text/css"></link>
<script type="text/javascript">
$(document).ready(
 	function (){
 		//urlValue: 项目访问根路径;    typeId: 数据库中对应的下拉类型id; 
 		//$('#oneId'): 一级下拉列对象;  $('#twoId'): 二级下拉列对象 ; $('#threeId'): 三级下拉列对象;
 		//预案等级  条件查询模块
 		onloadCombobox('${ctx}','yajb',$('#yadjId'),null,null);
 		//事故类型下拉 修改与新增模块
 		onloadCombobox('${ctx}','sglx',$('#sglx_oneId'),null,null);
 		onloadCombobox('${ctx}','yajb',$('#updateYajb'),null,null);
  		onloadCombobox('${ctx}','sglx',$('#updateSglx'),null,null);
		
  		grid = new Grid('${ctx}/energencyPlan/energencyPlanAction!list', 'data_list');
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'energencyPlan',
			moduleName:'综合应急预案',
			url:'${ctx}/energencyPlan/energencyPlanAction',
			afterViewLoadData:function(viewFormObject, data) {
				var accidentTypeData = data.accidentTypeText;
				if(data.accidentTypeSubclassText != null)accidentTypeData += "/"+data.accidentTypeSubclassText;
				$(viewFormObject).find('span[name="energencyPlan.accidentType"]').text(accidentTypeData);
				$(viewFormObject).find('span[name="energencyPlan.planLevel"]').text(data.planLevelText);
			}
			
		});
 	}
  ); 
  //合并事故类型的父级和子级字段
function fatherAndSon(value,row,index){
	if(row.accidentTypeSubclassText != null && row.accidentTypeSubclassText!='' ){
		var str = value + "/" + row.accidentTypeSubclassText;
	}else {
		var str = value ;
	}
	return str;
}
  //加载表单操作列
function gridFormatter(value, rowData, rowIndex) {
	var rowId = rowData.id;
	var url = "";
	<shiro:hasPermission name="48:view">
	url += "<a title=\"查看\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"../../images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	<shiro:hasPermission name="48:update">
	url += "<a title=\"修改\" onclick='crud.update(\""+rowId+"\");'  class='btn2'><img src=\"../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	url += "<a title=\"查看指挥人员\"  onclick='peopleFunction(\""+rowId+"\");' class='btn2'><img src=\"../../images/selectExpert.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	url += "<a title=\"查看救援资源\"  onclick='resourceFunction(\""+rowId+"\");' class='btn2'><img src=\"../../images/selectResource.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	url += "<a title=\"查看附件\" onclick='attachmentFunction(\""+rowId+"\");'  class='btn2'><img src=\"../../images/selectAttachment.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	return url;
}
</script>
</head>
<body>
	 <div class="panel-header" style="width:100%;">
		<div class="panel-title panel-with-icon">综合应急预案列表</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
     <div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
    <div id="search">
	        <form id="searchForm" method="post" style="display: inline;">
            <div style="margin-top:-8px;">
	        &nbsp;&nbsp;预案名称：&nbsp;&nbsp;<input class="easyui-validatebox" id="searchPlanName" name="energencyPlan.planName" data-options="validType:'length[1,25]'">
	        &nbsp;&nbsp;事故类型：&nbsp;&nbsp;<input id="sglx_oneId" class="easyui-combobox" data-options="panelHeight:'auto',editable:false" name="energencyPlan.accidentType" value="" >
	        &nbsp;&nbsp;预案级别：&nbsp;&nbsp;<input id="yadjId" class="easyui-combobox" data-options="panelHeight:'auto',editable:false" name="energencyPlan.planLevel" value="" >
	        &nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search();">查询</a>
			&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch();">清空</a>
            </div>
	        </form>
	       </div>
          </div>
        <div class="search_add">
		<shiro:hasPermission name="48:add">
		<font face="Algerian"><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add', plain:true" onclick="crud.add();">添加</a></font>
		</shiro:hasPermission>
		<shiro:hasPermission name="48:delete">		
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove', plain:true" onclick="crud.remove();">删除</a>
		</shiro:hasPermission>
	</div>
	<!-- 表单表头 -->
	<div style="height:74%;">
	    <table id="data_list" style="display:none">
	        <thead>
	        <tr>
	          <th field="planName" width="30%" align="center" title="planName">预案名称</th>
	            <th field="accidentTypeText" width="20%" align="center" title="accidentTypeText" formatter="fatherAndSon">事故类型</th>
	            <th field="time" width="10%" align="center" title="time">建立时间</th>
	            <th field="planLevelText" width="8%" align="center" title="planLevelText">预案级别</th>
	            <th align="center" field="id" width="20%" formatter="gridFormatter">操作</th>   
	        </tr>
	        </thead>
	    </table>
	</div>
<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" 
			data-options="iconCls:'icon-save',modal:true,
    			minimizable:true,maximizable:true,collapsible:true,draggable:false">
		<form method="post" >
					<input type="hidden" id="updateId" name="energencyPlan.id"/>
					 <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
			   	<tr>
					<td class="table_nemu_new" width="15%">预案名称</td>
					<td class="table_con" width="15%"><input class="easyui-validatebox" type="text"  id="updatePlanname" name="energencyPlan.planName" data-options="required: true" missingMessage="请输入预案名称"/></td>
					<td class="table_nemu_new" width="15%">预案类型</td>
					<td class="table_con" width="15%">
					综合应急预案
						<input type="hidden" name="energencyPlan.planType" id="updatePlanType" value="综合应急预案" id="updateType"/></td>
				</tr>
					<tr>
					<td class="table_nemu_new" >事故类型</td>
					<td class="table_con"><input id="updateSglx" class="easyui-combobox" data-options="panelHeight:'auto',editable:false,width:'100'" name="energencyPlan.accidentType" value="--请选择--" />
					</td>
					<td class="table_nemu_new">预案级别</td>
					<td class="table_con"><input id="updateYajb" class="easyui-combobox" data-options="panelHeight:'auto',editable:false" name="energencyPlan.planLevel" value="--请选择--" /></td>
				</tr>
				<tr height="100%">
					<td class="table_nemu_new" rowspan="60" width="15%">具体内容</td>
					<td class="table_nemu_new" colspan="3" width="15%">
						<FONT SIZE="5"><B>1 总则</B></FONT></br></br>
						<FONT SIZE="4"><B>1.1 编制目的</B></FONT></td>
				</tr>
				<tr height="100%" width="15%">
					<td class="table_con" colspan="3"><textarea name="energencyPlan.planContentBzmd" style="width:80%;height:80px;"></textarea></td>
				</tr>
				<tr height="100%">
					<td class="table_nemu_new" colspan="3"><FONT SIZE="4"><B>1.2 编制依据</B></FONT></td>
				</tr>
				<tr height="100%">
					<td class="table_con" colspan="3"><textarea name="energencyPlan.planContentBzyj" style="width:80%;height:80px;"></textarea></td>
				</tr>
				<tr height="100%">
					<td class="table_nemu_new" colspan="3"><FONT SIZE="4"><B>1.3 适用范围</B></FONT></td>
				</tr>
				<tr height="100%">
					<td class="table_con" colspan="3"><textarea name="energencyPlan.planContentSyfw" style="width:80%;height:80px;"></textarea></td>
				</tr>
				<tr height="100%">
					<td class="table_nemu_new" colspan="3"><FONT SIZE="4"><B>1.4 应急预案体系</B></FONT></td>
				</tr>
				<tr height="100%">
					<td class="table_con" colspan="3"><textarea name="energencyPlan.planContentYjyatx" style="width:80%;height:80px;"></textarea></td>
				</tr>
				<tr height="100%">
					<td class="table_nemu_new" colspan="3"><FONT SIZE="4"><B>1.5 应急工作原则</B></FONT></td>
				</tr>
				<tr height="100%">
					<td class="table_con" colspan="3"><textarea name="energencyPlan.planContentYjgzyz" style="width:80%;height:80px;"></textarea></td>
				</tr>

				<tr height="100%">
					<td class="table_nemu_new" colspan="3">
						<FONT SIZE="5"><B>2 生产经营单位的危险性分析</B></FONT></br></br>
						<FONT SIZE="4"><B>2.1 生产经营单位概况</B></FONT></td>
				</tr>
				<tr height="100%">
					<td class="table_con" colspan="3"><textarea name="energencyPlan.planContentScjydw" style="width:80%;height:80px;"></textarea></td>
				</tr>
				<tr height="100%">
					<td class="table_nemu_new" colspan="3"><FONT SIZE="4"><B>2.2 危险源与风险分析</B></FONT></td>
				</tr>
				<tr height="100%">
					<td class="table_con" colspan="3"><textarea name="energencyPlan.planContentWxyyfxfx" style="width:80%;height:80px;"></textarea></td>
				</tr>
				<tr height="100%">
					<td class="table_nemu_new" colspan="3">
						<FONT SIZE="5"><B>3 组织机构及职责</B></FONT></br></br>
						<FONT SIZE="4"><B>3.1 应急组织体系</B></FONT></td>
				</tr>
				<tr height="100%">
					<td class="table_con" colspan="3"><textarea name="energencyPlan.planContentYjzztx" style="width:80%;height:80px;"></textarea></td>
				</tr>
				<tr height="100%">
					<td class="table_nemu_new" colspan="3"><FONT SIZE="4"><B>3.2 指挥机构及职责</B></FONT></td>
				</tr>
				<tr height="100%">
					<td class="table_con" colspan="3"><textarea name="energencyPlan.planContentZhjgzz" style="width:80%;height:80px;"></textarea></td>
				</tr>
				<tr height="100%">
					<td class="table_nemu_new" colspan="3">
						<FONT SIZE="5"><B>4 预防与预警</B></FONT></br></br>
						<FONT SIZE="4"><B>4.1 危险源监控</B></FONT></td>
				</tr>
				<tr height="100%">
					<td class="table_con" colspan="3"><textarea name="energencyPlan.planContentWxyjg" style="width:80%;height:80px;"></textarea></td>
				</tr>
				<tr height="100%">
					<td class="table_nemu_new" colspan="3"><FONT SIZE="4"><B>4.2 预警行动</B></FONT></td>
				</tr>
				<tr height="100%">
					<td class="table_con" colspan="3"><textarea name="energencyPlan.planContentYjxd" style="width:80%;height:80px;"></textarea></td>
				</tr>
				<tr height="100%">
					<td class="table_nemu_new" colspan="3"><FONT SIZE="4"><B>4.3 信息报告与处置</B></FONT></td>
				</tr>
				<tr height="100%">
					<td class="table_con" colspan="3"><textarea name="energencyPlan.planContentXxbgycz" style="width:80%;height:80px;"></textarea></td>
				</tr>

				<tr height="100%">
					<td class="table_nemu_new" colspan="3"><FONT SIZE="4"><B>5 应急响应</B></FONT></br></br>
						<FONT SIZE="4"><B>5.1 响应分级</B></FONT></td>
				</tr>
				<tr height="100%">
					<td class="table_con" colspan="3"><textarea name="energencyPlan.planContentXyfj" style="width:80%;height:80px;"></textarea></td>
				</tr>
				<tr height="100%">
					<td class="table_nemu_new" colspan="3"><FONT SIZE="4"><B>5.2 响应程序</B></FONT></td>
				</tr>
				<tr height="100%">
					<td class="table_con" colspan="3"><textarea name="energencyPlan.planContentXycy" style="width:80%;height:80px;"></textarea></td>
				</tr>
				<tr height="100%">
					<td class="table_nemu_new" colspan="3"><FONT SIZE="4"><B>5.3 应急结束</B></FONT></td>
				</tr>
				<tr height="100%">
					<td class="table_con" colspan="3"><textarea name="energencyPlan.planContentYjjs" style="width:80%;height:80px;"></textarea></td>
				</tr>
				<tr height="100%">
					<td class="table_nemu_new" colspan="3"><FONT SIZE="5"><B>6 信息发布</B></FONT></td>
				</tr>
				<tr height="100%">
					<td class="table_con" colspan="3"><textarea name="energencyPlan.planContentXxfb" style="width:80%;height:80px;"></textarea></td>
				</tr>
				<tr height="100%">
					<td class="table_nemu_new" colspan="3"><FONT SIZE="5"><B>7 后期处置</B></FONT></td>
				</tr>
				<tr height="100%">
					<td class="table_con" colspan="3"><textarea name="energencyPlan.planContentHqcz" style="width:80%;height:80px;"></textarea></td>
				</tr>
				<tr height="100%">
					<td class="table_nemu_new" colspan="3"><FONT SIZE="5"><B>8 保障措施</B></FONT></br></br>
						<FONT SIZE="4"><B>8.1 通信与信息保障</B></FONT></td>
				</tr>
				<tr height="100%">
					<td class="table_con" colspan="3"><textarea name="energencyPlan.planContentTxyxxbz" style="width:80%;height:80px;"></textarea></td>
				</tr>
				<tr height="100%">
					<td class="table_nemu_new" colspan="3"><FONT SIZE="4"><B>8.2 应急队伍保障</B></FONT></td>
				</tr>
				<tr height="100%">
					<td class="table_con" colspan="3"><textarea name="energencyPlan.planContentYjdwbz" style="width:80%;height:80px;"></textarea></td>
				</tr>
				<tr height="100%">
					<td class="table_nemu_new" colspan="3"><FONT SIZE="4"><B>8.3 应急物资装备保障</B></FONT></td>
				</tr>
				<tr height="100%">
					<td class="table_con" colspan="3"><textarea name="energencyPlan.planContentYjwzzbbz" style="width:80%;height:80px;"></textarea></td>
				</tr>
				<tr height="100%">
					<td class="table_nemu_new" colspan="3"><FONT SIZE="4"><B>8.4 经费保障</B></FONT></td>
				</tr>
				<tr height="100%">
					<td class="table_con" colspan="3"><textarea name="energencyPlan.planContentJfbz" style="width:80%;height:80px;"></textarea></td>
				</tr>
				<tr height="100%">
					<td class="table_nemu_new" colspan="3"><FONT SIZE="4"><B>8.5 其他保障</B></FONT></td>
				</tr>
				<tr height="100%">
					<td class="table_con" colspan="3"><textarea name="energencyPlan.planContentQtbz" style="width:80%;height:80px;"></textarea></td>
				</tr>
				
				<tr height="100%">
					<td class="table_nemu_new" colspan="3">
						<FONT SIZE="5"><B>9 培训与演练</B></FONT></br></br>
						<FONT SIZE="4"><B>9.1 培训</B></FONT></td>
				</tr>
				<tr height="100%">
					<td class="table_con" colspan="3"><textarea name="energencyPlan.planContentPx" style="width:80%;height:80px;"></textarea></td>
				</tr>
				<tr height="100%">
					<td class="table_nemu_new" colspan="3"><FONT SIZE="4"><B>9.2 演练</B></FONT></td>
				</tr>
				<tr height="100%">
					<td class="table_con" colspan="3"><textarea name="energencyPlan.planContentYl" style="width:80%;height:80px;"></textarea></td>
				</tr>
				<tr height="100%">
					<td class="table_nemu_new" colspan="3"><FONT SIZE="5"><B>10 奖惩</B></FONT></td>
				</tr>
				<tr height="100%">
					<td class="table_con" colspan="3"><textarea name="energencyPlan.planContentJc" style="width:80%;height:80px;"></textarea></td>
				</tr>

				<tr height="100%">
					<td class="table_nemu_new" colspan="3">
						<FONT SIZE="5"><B>11 附则</B></FONT></br></br>
						<FONT SIZE="4"><B>11.1 术语和定义</B></FONT>
					</td>
				</tr>
				<tr height="100%">
					<td class="table_con" colspan="3"><textarea name="energencyPlan.planContentSyhdy" style="width:80%;height:80px;"></textarea></td>
				</tr>
				<tr height="100%">
					<td class="table_nemu_new" colspan="3"><FONT SIZE="4"><B>11.2 应急预案备案</B></FONT></td>
				</tr>
				<tr height="100%">
					<td class="table_con" colspan="3"><textarea name="energencyPlan.planContentYjyaba" style="width:80%;height:80px;"></textarea></td>
				</tr>
				<tr height="100%">
					<td class="table_nemu_new" colspan="3"><FONT SIZE="4"><B>11.3 维护和更新</B></FONT></td>
				</tr>
				<tr height="100%">
					<td class="table_con" colspan="3"><textarea name="energencyPlan.planContentWhhgx" style="width:80%;height:80px;"></textarea></td>
				</tr>
				<tr height="100%">
					<td class="table_nemu_new" colspan="3"><FONT SIZE="4"><B>11.4 制定与解释</B></FONT></td>
				</tr>
				<tr height="100%">
					<td class="table_con" colspan="3"><textarea name="energencyPlan.planContentZdyjs" style="width:80%;height:80px;"></textarea></td>
				</tr>
				<tr height="100%">
					<td class="table_nemu_new" colspan="3"><FONT SIZE="4"><B>11.5 应急预案实施</B></FONT></td>
				</tr>
				<tr height="100%">
					<td class="table_con" colspan="3"><textarea name="energencyPlan.planContentYjyass" style="width:80%;height:80px;"></textarea></td>
				</tr>
		    </table>
				<br/>
		        </div> 
	   	</form>
	</div>
	</div>
	<script type="text/javascript">
	
	//调用指挥人员list页面
	function peopleFunction(rowId) {
			$('#peopleFrame').attr('src', 'plan_expert.jsp?id=' + rowId);
			$('#viewPeopleForm').dialog({
				title:'查看指挥人员',
				modal:true,
				draggable:false,
				minimizable:true,
				maximizable:true,
				maximized:true,
				onClose:function(){
					$('#data_list').datagrid('reload');
				},
				buttons:[{
					text:'取消',
					iconCls:'icon-cancel',
					handler:function() {
						$('#viewPeopleForm').dialog('close');
					}
				}]
			});
		}
	//调用救援资源list页面
	function resourceFunction(rowId) {
			$('#resourceFrame').attr('src', 'plan_resource.jsp?id=' + rowId);
			$('#viewResourceForm').dialog({
				title:'查看救援资源',
				modal:true,
				draggable:false,
				minimizable:true,
				maximizable:true,
				maximized:true,
				onClose:function(){
					$('#data_list').datagrid('reload');
				},
				buttons:[{
					text:'取消',
					iconCls:'icon-cancel',
					handler:function() {
						$('#viewResourceForm').dialog('close');
					}
				}]
			});
		}
		//调用附件页面
	function attachmentFunction(rowId) {
			$('#attachmentFrame').attr('src', '${ctx}/jsp/sys/fileUpload/uploadFile.jsp?relationId=' + rowId);
			$('#viewAttachmentForm').dialog({
				title:'查看救援资源',
				modal:true,
				draggable:false,
				minimizable:true,
				maximizable:true,
				maximized:true,
				buttons:[{
					text:'取消',
					iconCls:'icon-cancel',
					handler:function() {
						$('#viewAttachmentForm').dialog('close');
					}
				}]
			});
	}
	</script>
	<!-- 指挥人员层 -->
	<div style="display: none;">
		<div id="viewPeopleForm" style="width: 960px; height: 400px;" data-options="iconCls:'icon-save'">
			<iframe frameborder="0" id="peopleFrame" width="100%" height="98%" scrolling-x="no"></iframe>
		</div>
	</div>
	<!-- 救援资源层 -->
	<div style="display: none;">
		<div id="viewResourceForm" style="width: 960px; height: 400px;" data-options="iconCls:'icon-save'">
			<iframe frameborder="0" id="resourceFrame" width="100%" height="98%" scrolling-x="no"></iframe>
		</div>
	</div>
		<!--附件层 -->
	<div style="display: none;">
		<div id="viewAttachmentForm" style="width: 960px; height: 400px;" data-options="iconCls:'icon-save'">
			<iframe frameborder="0" id="attachmentFrame" width="100%" height="98%" scrolling-x="no"></iframe>
		</div>
	</div>
</body>
</html>