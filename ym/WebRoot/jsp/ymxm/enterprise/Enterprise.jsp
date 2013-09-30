<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="gb2312" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��ҵ��Ϣ</title>

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
 				message : '��������ȷ�ĵ�λ��֯�������룺12345678-1234-1'
 			}
 		});
 		grid = new Grid('${ctx}/enterprise/enterpriseAction!list', 'data_list');
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'enterprise',
			moduleName:'��ҵ',
			url:'${ctx}/enterprise/enterpriseAction'
		});
 	}
 	
  ); 
         //���ر�������
function gridFormatter(value, rowData, rowIndex) {
	var rowId = rowData.id;
	var url = "";
	<shiro:hasPermission name="48:view">
	url += "<a title=\"�鿴\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"../../../images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	<shiro:hasPermission name="48:update">
	url += "<a title=\"�޸�\" onclick='crud.update(\""+rowId+"\");' class='btn2' ><img src=\"../../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	if(rowData.hasMap == '1') { //�Ѷ�λ
		url += "<a title=\"��λ\" onclick='window.top.gis.showPoint(\""+rowData.corpCode+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.corpName +"\");' class='btn2' ><img src=\"${ctx}/images/showPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	} else {
		url += "<a title=\"���\" onclick='window.top.gis.addPoint(\""+rowData.corpCode+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.corpName +"\");' class='btn2' ><img src=\"${ctx}/images/addPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	}
	return url;
}

</script>
</head>
<body>

  <div class="panel-header" style="width:100%;">
	<div class="panel-title panel-with-icon">��ҵ��Ϣ</div>
	<div class="panel-icon icon-edit"></div>
	<div class="panel-tool"></div>
</div>

<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
 <div id="search">
        <form id="searchForm" method="post" style="display: inline;">
        <div style=" margin-top:-8px;">
       &nbsp;&nbsp;��λ��֯��������&nbsp;&nbsp;<input type="text" name="enterprise.corpCode" />
		&nbsp;&nbsp;��λ����&nbsp;&nbsp;<input type="text" name="enterprise.corpName" />
		&nbsp;&nbsp;����������&nbsp;&nbsp;<input type="text" name="enterprise.legalPerson" />
		&nbsp;&nbsp;������ϵ&nbsp;&nbsp;<input type="text" name="enterprise.ordination" class="easyui-combobox" 
		data-options="valueField:'v', textField:'v', data:[{v:'����'},{v:'ʡ��'},{v:'����'},
			{v:'������'},{v:'�����'},{v:'����������'}],editable:false" panelHeight="auto"/>
        &nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search();">��ѯ</a>
		&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch();">���</a>
        </div>
        </form>
    </div>
</div>
<div class="search_add">
<shiro:hasPermission name="48:add">
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add', plain:true" onclick="crud.add();">���</a>
	</shiro:hasPermission>
	<shiro:hasPermission name="48:delete">		
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove', plain:true" onclick="crud.remove();">ɾ��</a>
	</shiro:hasPermission>
    </div>
<!-- ����ͷ -->
<div style="height:74%;">
    <table id="data_list" style="display:none;" >
        <thead>
        <tr>
            <th align="center" field="corpNumber" width="15%">��ҵ����ע���</th>
            <th align="center" field="corpCode" width="15%">��λ��֯��������</th>
            <th align="center" field="corpName" width="25%">��λ����</th>
            <th align="center" field="legalPerson" width="15%" >����������</th>
            <th align="center" field="ordination" width="15%">������ϵ</th>
            <th field="id" width="15%" formatter="gridFormatter" align="center">����</th>          
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
							<td class="table_nemu_new" width="25%">��ҵ����ע���</td>
							<td class="table_con" width="25%">
							<input type="text" class="easyui-validatebox" name="enterprise.corpNumber"
							data-options="required:true,validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new" width="25%">��λ��֯��������</td>
							<td class="table_con" width="25%">
							<input type="text" class="easyui-validatebox" name="enterprise.corpCode"
							data-options="required:true,validType:'corpCode'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">����/�ܹ�˾����ע���</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.headCorpNumber"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">��λ����</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.corpName"
							data-options="required:true,validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">����</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.fax"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">�ʱ�</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.postCode"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">����������</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.legalPerson"
							data-options="required:true,validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">��������</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.lpersonMail"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">���˵绰</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.lpersonPhone"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">�����ֻ�</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.lpersonMobile"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">���˴���ְ��</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.lpersonJob"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">���˴���ְ��</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.lpersonTitle"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">���˴������֤��</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.lpersonCardid"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">��ҵ����ְ��</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.corpManagerJob"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">��ҵ����ְ��</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.corpManagerPosition"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">��ҵ�ֹܰ�ȫ�쵼</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.corpSafeLeader"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">������ϵ</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="enterprise.ordination"
							data-options="required:true,validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'����'},{v:'ʡ��'},{v:'����'},
							{v:'������'},{v:'�����'},{v:'����������'}],editable:false" 
							panelHeight="auto" />
							</td>
						
							<td class="table_nemu_new">��������</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.area"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">��ҵ��ģ</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="enterprise.corpScale"
							data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'С'},{v:'��'},{v:'��'}],editable:false" 
							panelHeight="auto" />
							</td>
							<td class="table_nemu_new">��������</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="enterprise.ecoType"
							data-options="required:true,validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'���о���'},{v:'���徭��'},{v:'˽Ӫ����'},
							{v:'�������ι�˾'},{v:'��Ӫ����'},{v:'�ɷݺ���'},
							{v:'����Ͷ��'},{v:'�۰�̨Ͷ��'},{v:'���徭��'},{v:'��������'}],editable:false" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">ע���ʱ�(��Ԫ)</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.registerMoney"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">�ʲ��ܶ�(��Ԫ)</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.totalMoney"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">����ʱ��</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.registerDate"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">�������ʼ��ȼ�</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.mainGrade"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">��ܷ���</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.managerType"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">����ܷ��� </td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.subManagerType"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">�Ƿ����ش�Σ��Դ</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="enterprise.isGreatHazard"
							data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'��'},{v:'��'}],editable:false" 
							panelHeight="auto" />
							</td>
						
							<td class="table_nemu_new">��ܲ���</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.managerDept"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">���򽨳���</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.townBuildArea"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">��������(��Ԫ)</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="enterprise.yearIncome"
							data-options="max:100000000000,	groupSeparator:',', precision:2" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">�ʲ��ܶ�(��Ԫ)</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="enterprise.yearMainIncome"
							data-options="max:100000000000,	groupSeparator:',', precision:2" />
							</td>
						
							<td class="table_con" colspan="2">
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new" style="height:100px;">��ҵ�������ڵ�</td>
							<td colspan="3" class="table_con">
							<textarea class="easyui-validatebox" name="enterprise.corpProductAddr"
							 style="width: 400;height: 100;" data-options="validType:'maxByteLength[4000]'"></textarea>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new" style="height:100px;">��λע���ַ</td>
							<td colspan="3" class="table_con">
							<textarea class="easyui-validatebox" name="enterprise.corpRegisterAddr"
							 style="width: 400;height: 100;" data-options="validType:'maxByteLength[4000]'"></textarea>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">������������</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.addrCode"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">��ҵ���� </td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.industryType"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">����ҵ����</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="enterprise.subIndustryType"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_con" colspan="2">
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new" style="height:100px;">������Ӫ��Χ</td>
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