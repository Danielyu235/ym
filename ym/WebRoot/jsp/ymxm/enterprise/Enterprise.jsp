<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="gb2312" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>企业信息</title>

<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<script type="text/javascript">
$(document).ready(
 	function (){
 		$.extend($.fn.validatebox.defaults.rules, {
 			corpCode : {
 				validator : function(value, param) {
 					if (value) {
 						return /^\d{8}-\d{4}-\d{1}$/.test(value);
 					} else {
 						return true;
 					}
 				},
 				message : '请输入正确的单位组织机构代码：12345678-1234-1'
 			}
 		});
 		grid = new Grid('${ctx}/enterprise/enterpriseAction!list', 'data_list');
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'enterprise',
			moduleName:'企业',
			url:'${ctx}/enterprise/enterpriseAction'
		});
 	}
 	
  ); 
         //加载表单操作列
function gridFormatter(value, rowData, rowIndex) {
	var rowId = rowData.id;
	var url = "";
	<shiro:hasPermission name="48:view">
	url += "<a title=\"查看\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"../../../images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	<shiro:hasPermission name="48:update">
	url += "<a title=\"修改\" onclick='crud.update(\""+rowId+"\");' class='btn2' ><img src=\"../../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	if(rowData.hasMap == '1') { //已定位
		url += "<a title=\"定位\" onclick='window.top.gis.showPoint(\""+rowData.corpCode+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.corpName +"\");' class='btn2' ><img src=\"${ctx}/images/showPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	} else {
		url += "<a title=\"打点\" onclick='window.top.gis.addPoint(\""+rowData.corpCode+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.corpName +"\");' class='btn2' ><img src=\"${ctx}/images/addPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	}
	return url;
}

</script>
</head>
<body>

  <div class="panel-header" style="width:100%;">
	<div class="panel-title panel-with-icon">企业信息</div>
	<div class="panel-icon icon-edit"></div>
	<div class="panel-tool"></div>
</div>

<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
 <div id="search">
        <form id="searchForm" method="post" style="display: inline;">
        <div style=" margin-top:-8px;">
       &nbsp;&nbsp;单位组织机构代码&nbsp;&nbsp;<input type="text" name="enterprise.corpCode" />
		&nbsp;&nbsp;单位名称&nbsp;&nbsp;<input type="text" name="enterprise.corpName" />
		&nbsp;&nbsp;法定代表人&nbsp;&nbsp;<input type="text" name="enterprise.legalPerson" />
		&nbsp;&nbsp;隶属关系&nbsp;&nbsp;<input type="text" name="enterprise.ordination" class="easyui-combobox" 
		data-options="valueField:'v', textField:'v', data:[{v:'央属'},{v:'省属'},{v:'市属'},
			{v:'区市属'},{v:'镇街属'},{v:'社区、村属'}],editable:false" panelHeight="auto"/>
        &nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search();">查询</a>
		&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch();">清空</a>
        </div>
        </form>
    </div>
</div>
<div class="search_add">
<shiro:hasPermission name="48:add">
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add', plain:true" onclick="crud.add();">添加</a>
	</shiro:hasPermission>
	<shiro:hasPermission name="48:delete">		
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove', plain:true" onclick="crud.remove();">删除</a>
	</shiro:hasPermission>
    </div>
<!-- 表单表头 -->
<div style="height:74%;">
    <table id="data_list" style="display:none;" >
        <thead>
        <tr>
            <th align="center" field="corpNumber" width="15%">企业工商注册号</th>
            <th align="center" field="corpCode" width="15%">单位组织机构代码</th>
            <th align="center" field="corpName" width="25%">单位名称</th>
            <th align="center" field="legalPerson" width="15%" >法定代表人</th>
            <th align="center" field="ordination" width="15%">隶属关系</th>
            <th field="id" width="15%" formatter="gridFormatter" align="center">操作</th>          
        </tr>
        </thead>
    </table>
</div>

<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" 
			data-options="iconCls:'icon-save',modal:true,
    			minimizable:true,maximizable:true,collapsible:true,draggable:false">
		<form method="post" >
		<input type="hidden" id="updateId" name="enterprise.id"/>
	    <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
	  				<tr>
							<td class="table_nemu_new" width="25%">企业工商注册号</td>
							<td class="table_con" width="25%">
							<input type="text" class="easyui-validatebox" name="enterprise.corpNumber"
							data-options="required:true,validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new" width="25%">单位组织机构代码</td>
							<td class="table_con" width="25%">
							<input type="text" class="easyui-validatebox" name="enterprise.corpCode"
							data-options="required:true,validType:'corpCode'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">集团/总公司工商注册号</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.headCorpNumber"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">单位名称</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.corpName"
							data-options="required:true,validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">传真</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.fax"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">邮编</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.postCode"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">法定代表人</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.legalPerson"
							data-options="required:true,validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">法人邮箱</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.lpersonMail"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">法人电话</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.lpersonPhone"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">法人手机</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.lpersonMobile"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">法人代表职务</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.lpersonJob"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">法人代表职称</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.lpersonTitle"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">法人代表身份证号</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.lpersonCardid"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">企业经理职务</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.corpManagerJob"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">企业经理职称</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.corpManagerPosition"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">企业分管安全领导</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.corpSafeLeader"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">隶属关系</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="enterprise.ordination"
							data-options="required:true,validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'央属'},{v:'省属'},{v:'市属'},
							{v:'区市属'},{v:'镇街属'},{v:'社区、村属'}],editable:false" 
							panelHeight="auto" />
							</td>
						
							<td class="table_nemu_new">所在网格</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.area"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">企业规模</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="enterprise.corpScale"
							data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'小'},{v:'中'},{v:'大'}],editable:false" 
							panelHeight="auto" />
							</td>
							<td class="table_nemu_new">经济类型</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="enterprise.ecoType"
							data-options="required:true,validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'国有经济'},{v:'集体经济'},{v:'私营经济'},
							{v:'有限责任公司'},{v:'联营经济'},{v:'股份合作'},
							{v:'外商投资'},{v:'港澳台投资'},{v:'个体经济'},{v:'其它经济'}],editable:false" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">注册资本(万元)</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.registerMoney"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">资产总额(万元)</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.totalMoney"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">成立时间</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.registerDate"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">主项资质及等级</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.mainGrade"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">监管分类</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.managerType"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">副监管分类 </td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.subManagerType"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">是否有重大危险源</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="enterprise.isGreatHazard"
							data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'是'},{v:'否'}],editable:false" 
							panelHeight="auto" />
							</td>
						
							<td class="table_nemu_new">监管部门</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.managerDept"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">城镇建成区</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.townBuildArea"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">年总收入(万元)</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="enterprise.yearIncome"
							data-options="max:100000000000,	groupSeparator:',', precision:2" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">资产总额(万元)</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="enterprise.yearMainIncome"
							data-options="max:100000000000,	groupSeparator:',', precision:2" />
							</td>
						
							<td class="table_con" colspan="2">
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new" style="height:100px;">企业生产所在地</td>
							<td colspan="3" class="table_con">
							<textarea class="easyui-validatebox" name="enterprise.corpProductAddr"
							 style="width: 400;height: 100;" data-options="validType:'maxByteLength[4000]'"></textarea>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new" style="height:100px;">单位注册地址</td>
							<td colspan="3" class="table_con">
							<textarea class="easyui-validatebox" name="enterprise.corpRegisterAddr"
							 style="width: 400;height: 100;" data-options="validType:'maxByteLength[4000]'"></textarea>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">行政区划代码</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.addrCode"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">行业分类 </td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.industryType"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">副行业分类</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.subIndustryType"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_con" colspan="2">
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new" style="height:100px;">生产经营范围</td>
							<td colspan="3" class="table_con">
							<textarea class="easyui-validatebox" name="enterprise.icProductRange"
							 style="width: 400;height: 100;" data-options="validType:'maxByteLength[4000]'"></textarea>
							</td>
						</tr>
				</table>
	        </div> 
   	</form>
</div>
</div>

</body>
</html>