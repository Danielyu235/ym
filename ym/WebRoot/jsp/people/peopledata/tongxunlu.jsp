<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="gb2312"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/jqueryhead.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>��ϵ����Ϣ</title>

		<script type="text/javascript" src="${ctx}/js/GridUtilNoToolBar.js"></script>
		<script type="text/javascript" src="${ctx}/js/validator.js"></script>
		<script type="text/javascript" src="${ctx}/js/json2.js"></script>
		<script type="text/javascript" src="${ctx}/js/packCrud.js"></script>
		<link rel="stylesheet" href="../../../css/crud.css" type="text/css"></link>
		<script type="text/javascript">

		//����ҳ���ִ��
		$(document).ready(
		 	function (){
		 		// ����1������·��(${ctx}/struts.xml�е�namespace/action������);����2��ʵ������������3��title
		 		init('${ctx}/peoplemanage/peopleInfoAction','peopleInfo','��ϵ����Ϣ');
		 		//listҳ���ѯ--�����Ų�ѯ
		 		onloadCombobox('${ctx}','ppartment',$('#selectbydeparment'),null,null);
		 		//���ҳ��
		 		onloadCombobox('${ctx}','22d229c9278745c0b909b108011ba6f3',$('#addSex'),null,null);
		 		onloadCombobox('${ctx}','ppartment',$('#adddeparment'),null,null);
		 		//����ҳ��
		 		onloadCombobox('${ctx}','22d229c9278745c0b909b108011ba6f3',$('#updateSex'),null,null);
		 		onloadCombobox('${ctx}','ppartment',$('#updateDeparment'),null,null);
		 		
		 	}
		 	
		  ); 
		  
  
// �����±��е�����
function fillUpdateForm(value) {
	var rowsid;
	if (typeof value == "undefined") {
		var rows = grid.getSelectNode();
		rowsid = rows.id;
	} else {
		rowsid = value;
	}
	$.ajax( {url : urlValue+'!getById.action?id=' + rowsid,
				method : 'POST',
				success : function(data) {
					for (var v in data) {
						//alert(v + ":" + data[v]);
						var key = v;
						var value = data[v];
						//�ı����͸�ֵ
						$('#updateWin [name="peopleInfo.' + key + '"]').val(value);
						//������ֵ
					    if(key == 'deparment'){
						    
					    $('#updateDeparment').combobox('setValue',value);
					    }
					    if(key == 'sex'){
					    $('#updateSex').combobox('setValue',value);
					    }
					}
				}
			});
}

//��ղ�ѯ��
function clearSearchForm() {
		$("#selectbyname").val('');
		//���������
		$("#selectbydeparment").combobox('setValue','');
}

//���ر�������
function gridFormatter(value, rowData, rowIndex) {
	var rowId = rowData.id;
	var url = ""
	<shiro:hasPermission name="48:view">
	+"<a title=\"�鿴\" onclick='viewFunction(\""+rowId+"\");' class='btn2'><img src=\"../../../images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;"
	</shiro:hasPermission>
	<shiro:hasPermission name="48:update">
	+"<a title=\"�޸�\" onclick='editFunction(\""+rowId+"\");' class='btn2' ><img src=\"../../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;"
	</shiro:hasPermission>
	return url;
}
</script>
	</head>
	<body>
		<div class="panel-header" style="width: 100%;">
			<div class="panel-title panel-with-icon">��ϵ���б�</div>
			<div class="panel-icon icon-edit"></div>
			<div class="panel-tool"></div>
		</div>
        
        <!-- ��ѯ���� -->
		<div class="datagrid-toolbar" id="tb"  style="padding-left:0px; height:10px;">
			<div>
				<form id="searchForm" method="post" style="display: inline;">
                   <div style="margin-top:-8px">
					&nbsp;&nbsp;����:&nbsp;&nbsp;<input id="selectbyname" name="peopleInfo.name" data-options="validType:'length[1,25]'" />
					&nbsp;&nbsp;����:&nbsp;&nbsp;<input id="selectbydeparment" name="peopleInfo.deparment"  data-options="panelHeight:'auto',width:'100',editable:false" value="" />
					&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="searchForm();">��ѯ</a> &nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="clearSearchForm();">���</a>
                   </div>
			   </form>
		   </div>
       </div>
       
       <!-- ���ɾ����ť -->
       <div class="search_add">
			<shiro:hasPermission name="48:add">
				<a href="javascript:void(0)" class="easyui-linkbutton"
					data-options="iconCls:'icon-add', plain:true"
					onclick="addFunction();">���</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="48:delete">
				<a href="javascript:void(0)" class="easyui-linkbutton"
					data-options="iconCls:'icon-remove', plain:true"
					onclick="removeFunction();">ɾ��</a>
			</shiro:hasPermission>
		</div>
		
		<!-- ��ϵ����Ϣչʾ����ͷ -->
		<div style="height:78%;">
			<table id="data_list" style="display: none">
				<thead>
					<tr>
						<th field="name" width="150" align="center" title="name">
							����
						</th>
						<th field="age" width="150" align="center" title="age">
							����
						</th>
						<th field="deparmentText" width="150" align="center"
							title="deparmentText">
							����
						</th>
						<th field="duty" width="150" align="center" title="duty">
							����ְ��
						</th>
						<th field="mobilenumber" width="150" align="center"
							title="mobilenumber">
							�ֻ�����
						</th>
						<th align="center" field="id" width="160" align="center"
							formatter="gridFormatter">
							����
						</th>
					</tr>
				</thead>
			</table>
		</div>
		
		<!-- ������ʾ -->
		<div style ="color:red">
		    < s:fielderror />
		</div>
		
		<!-- �����ϵ����Ϣ���� -->
		<div style="display:none">
			<div id="addWin" iconCls="icon-save" title="�����ϵ����Ϣ">
			    <form  style="padding: 10px 20px 10px 20px;" id="addForm"  method="post" >
				    <table cellpadding="5px" style="font-size:12px;"  cellspacing="1"  border="0" bgcolor="#aed0ea">
						<tr>
							<td class="table_nemu">����:</td>
							<td class="table_con"><input class="easyui-validatebox" type="text" id="addName" 
							name="peopleInfo.name" data-options="required: true" missingMessage="����������" /></td>
							<td class="table_nemu">�Ա�:</td>
							<td class="table_con"><input id="addSex" 
							name="peopleInfo.sex" style="width: 50" 
							data-options="required: true,editable:false,panelHeight:'auto'" missingMessage="������ѡ���Ա�" value=""/></td>
						</tr>
						<tr>
							<td class="table_nemu">����:</td>
							<td class="table_con"><input class="easyui-validatebox" type="text" id="addAge" name="peopleInfo.age" validtype="positiveInt"/></td>
							<td class="table_nemu">����:</td>
							<td class="table_con"><input id="adddeparment" 
							name="peopleInfo.deparment" 
							data-options="panelHeight:'auto',width:'100',required: true,editable:false" missingMessage="�����벿��" /></td>
						</tr>
						<tr>
							<td class="table_nemu">����ְ��:</td>
							<td class="table_con"><input class="easyui-validatebox" type="text" id="addDuty" 
							name="peopleInfo.duty" 
							data-options="required: true" missingMessage="����������ְ��" /></td>
							<td class="table_nemu">�칫�ҵ绰:</td>
							<td class="table_con"><input class="easyui-validatebox" type="text" id="addOfficePhone" 
							name="peopleInfo.officephonenumber" validtype="phone"/></td>
						</tr>
						<tr>
							
							<td class="table_nemu">סլ�绰:</td>
							<td class="table_con"><input class="easyui-validatebox" type="text" id="addHomePhone" 
							name="peopleInfo.phonenumber" validtype="phone"/></td>
							<td class="table_nemu">�ֻ�:</td>
							<td class="table_con"><input class="easyui-validatebox" type="text" id="addMobilePhone" 
							name="peopleInfo.mobilenumber" data-options="required: true" validtype="mobile" missingMessage="�������ֻ�����"/></td>
						</tr>
						<tr>
							<td class="table_nemu">������λ:	</td>
							<td class="table_con"><input class="easyui-validatebox" type="text" id="addUnit" 
							name="peopleInfo.unit" data-options="required: false" missingMessage="������������λ" /></td>
							<td class="table_nemu">�ʱ�:</td>
							<td class="table_con"><input class="easyui-validatebox" type="text" id="addPostcode" 
							name="peopleInfo.postcode" data-options="required: false"/></td>
						</tr>
						<tr>
							<td class="table_nemu">��ͥסַ:</td>
							<td class="table_con" colspan="3"><input class="easyui-validatebox" type="text" size="70" id="addAddress" 
							name="peopleInfo.address" data-options="required: false" missingMessage="�������ͥסַ" /></td>
						</tr>
						<tr>
							<td class="table_nemu">��������:</td>
							<td class="table_con" colspan="3"><textarea  style="width: 400;height: 100;" id="addWorkExperience" 
							name="peopleInfo.workexperience " class="easyui-validatebox" 
							data-options="required: false"></textarea></td>
						</tr>
					</table>
					
					<br />
					
					<!-- sumbit -->
					<div align="center">
						<a href="#" class="easyui-linkbutton" icon="icon-ok"
							onclick="addSubmitForm();return false;">ȷ��</a>
						<a href="#" class="easyui-linkbutton" icon="icon-cancel"
							onclick="closeAllWin();return false;">ȡ��</a>
					</div>
				</form>
			</div>
		</div>

		<!-- �޸���ϵ����Ϣ���� -->
		<div style="display: none">
			<div id="updateWin" iconCls="icon-save" title="�޸���ϵ����Ϣ">
				<form style="padding: 10px 20px 10px 20px;" id="updateForm"
					method="post">
					<input type="hidden" id="updateId" name="peopleInfo.id" />
					<table cellpadding="5px" style="font-size: 12px;" cellspacing="1" border="0" bgcolor="#aed0ea">
						<tr>
							<td class="table_nemu">����:</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updateName"
									name="peopleInfo.name" data-options="required: true"
									missingMessage="����������" />
							</td>
							<td class="table_nemu">�Ա�:</td>
							<td class="table_con">
								<input type="text" id="updateSex" name="peopleInfo.sex" data-options="required: true,editable:false" missingMessage="�������Ա�" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu">����:</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updateAge" name="peopleInfo.age" validtype="positiveInt"/>
							</td>
							<td class="table_nemu">����:</td>
							<td class="table_con">
								<input type="text" 
								id="updateDeparment" name="peopleInfo.deparment" 
								data-options="panelHeight:'auto',width:'100',required: true,editable:false" missingMessage="�����벿��"/>
							</td>
						</tr>
						<tr>
							<td class="table_nemu">����ְ��:</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text"
									id="updateDuty" name="peopleInfo.duty"
									data-options="required: true" missingMessage="����������ְ��" />
							</td>
						
							<td class="table_nemu">�칫�ҵ绰:</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updateOfficePhone" name="peopleInfo.officephonenumber" validtype="phone"/>
							</td>
							</tr>
							<tr>
							<td class="table_nemu">סլ�绰:</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updateHomePhone"  name="peopleInfo.phonenumber" validtype="phone"/>
							</td>
						
							<td class="table_nemu">�ֻ�:</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updateMobilePhone" name="peopleInfo.mobilenumber" validtype="mobile" missingMessage="�������ֻ�����"/>
							</td>
						</tr>
						<tr>
							<td class="table_nemu">������λ:</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text"
									id="updateUnit" name="peopleInfo.unit"
									data-options="required: true" missingMessage="������������λ" />
							</td>
							<td class="table_nemu">�ʱ�:</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text"
									id="updatePostcode" name="peopleInfo.postcode"
									data-options="required: false" missingMessage="�������ʱ�" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu">��ͥסַ:</td>
							<td class="table_con" colspan="3">
								<input class="easyui-validatebox" type="text" size="70"
									id="updateAddress" name="peopleInfo.address"
									data-options="required: false" missingMessage="�������ͥסַ" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu">��������:</td>
							<td class="table_con" colspan="3">
								<textarea style="width: 400;height: 100;" id="updateExperience" name="peopleInfo.workexperience"></textarea>
							</td>
						</tr>
					</table>
					
					<br />
					<!-- sumbit -->
					<div align="center">
						<a href="#" class="easyui-linkbutton" icon="icon-ok"
							onclick="updateSubmitForm();return false;">ȷ��</a>
						<a href="#" class="easyui-linkbutton" icon="icon-cancel"
							onclick="closeAllWin();return false;">ȡ��</a>
					</div>
				</form>
			</div>
		</div>
		
		<!-- �鿴��ϵ����Ϣ���� -->
		<div style="display: none">
			<div id="viewWin" iconCls="icon-save" title="�鿴��ϵ����Ϣ">
				<form style="padding: 10px 20px 10px 20px;">
					<table cellpadding="5px" style="font-size: 12px;" cellspacing="1" border="0" bgcolor="#aed0ea">
						<tr>
							<td class="table_nemu">����:</td>
							<td class="table_con">
								<label type="text" id="viewName" name="peopleInfo.name">
							</td>
							<td class="table_nemu">�Ա�:</td>
							<td class="table_con">
								<label type="text" id="viewSex" name="peopleInfo.sexText">
							</td>
						</tr>
						<tr>
							<td class="table_nemu">����:</td>
							<td class="table_con">
								<label type="text" id="viewAge" name="peopleInfo.age" />
							</td>
							<td class="table_nemu"> ����:</td>
							<td class="table_con">
								<label type="text" id="viewSpecialized"
									name="peopleInfo.deparmentText" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu">����ְ��:</td>
							<td class="table_con">
								<label type="text" id="viewBusiness"
									name="peopleInfo.duty" />
							</td>
							<td class="table_nemu">�ֻ�:</td>
							<td class="table_con">
								<label type="text" id="viewMobilePhone"
									name="peopleInfo.mobilenumber" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu">�칫�ҵ绰:</td>
							<td class="table_con">
								<label type="text" id="viewOfficePhone"
									name="peopleInfo.officephonenumber" />
							</td>
							<td class="table_nemu">סլ�绰:</td>
							<td class="table_con">
								<label class="" type="text" id="viewPhonenumber"
									name="peopleInfo.phonenumber" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu">������λ:</td>
							<td class="table_con">
								<label type="text" id="viewUnit"
									name="peopleInfo.unit" />
							</td>
							<td class="table_nemu">�ʱ�:</td>
							<td class="table_con">
								<label type="text" id="viewPostcode"
									name="peopleInfo.postcode" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu">��ͥסַ:</td>
							<td class="table_con" colspan="3">
								<label type="text" size="90" id="viewAddress"
									name="peopleInfo.address" />
							</td>
						</tr>
						<tr height="100">
							<td class="table_nemu">��������:</td>
							<td class="table_con" colspan="3">
								<label 
									name="peopleInfo.workexperience"/>
							</td>
						</tr>
					</table>
					<br />
					<div align="center">
						<a href="#" class="easyui-linkbutton" icon="icon-print"
							onclick="printWin();return false;" id="print">��ӡ</a>
						<a href="#" class="easyui-linkbutton" icon="icon-cancel"
							onclick="closeAllWin();return false;" id ="cancel">ȡ��</a>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>