<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="gb2312" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<title>Ա����Ϣ</title>
</head>
<body>
	<div class="panel-header" style="width:100%;">
		<div class="panel-title panel-with-icon">Ա����Ϣ</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	<div class="datagrid-toolbar" id = "tb" style="padding-left:0px;">
		<div id="search">
	        <form id="employeeGrid_searchForm" method="post">
	        &nbsp;&nbsp;����:&nbsp;&nbsp;<input type="text" name="employees.jobNum" style="width:100px"/>
			&nbsp;&nbsp;Ա������:&nbsp;&nbsp;<input type="text" name="employees.name" style="width:100px"/>
			&nbsp;&nbsp;���ڲ���:&nbsp;&nbsp;<input class="easyui-combobox" id="done" name="employees.done" data-options="editable:false" style="width:100px"/>
			&nbsp;&nbsp;&nbsp;&nbsp;<input class="easyui-combobox" id="dtwo" name="employees.dtwo" data-options="editable:false" style="width:100px"/>
	        &nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="employeeGrid_searchForm();">��ѯ</a>
	        &nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="advancedsearch2()">�߼���ѯ</a>
			&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-clear" onclick="employeeGrid_clearSearchForm();">���</a>
	        </form>
	    </div>
	</div>
	<div class="search_add"></div>
	<div style="height:50%">
	    <table id="employeeGrid_" style="display:none">
	        <thead>
		        <tr>
		            <th align="center" field="jobNum" width="150">����</th>
		            <th align="center" field="name" width="150">Ա������</th>
		            <th align="center" field="majorName" width="150">רҵ</th>
		            <th align="center" field="postName" width="150">��λ</th>
		            <th align="center" field="doneName" width="150" formatter="strsum">����</th>
		            <th align="center" field="id" width="50" formatter="eremployeeGrid_gridFormatt">����</th>          
		        </tr>
	        </thead>
	    </table>
	</div>
	
	<!-- �����㣨�߼���ѯ�� -->
	<div id="advancedsearch2" class="easyui-window" style="width: 360px; height: 280px" title="�߼���ѯ"
		data-options="modal:true,closed:true,minimizable:false,maximizable:false,resizable:false" align="center">
		<form id="advanced2">
			<table style="border:0;padding:5px;width:auto">
				<tr>
					<td style="width:100px">
						<label>Ա�����ţ�</label>
					</td>
					<td>
						<input type="text" name="jobNum" style="width:150px">
					</td>
				</tr>
				<tr>
					<td>
						<label>Ա��������</label>
					</td>
					<td >
						<input type="text" name="name" style="width:150px">
					</td>
				</tr>
				<tr>
					<td>
						<label>���֤�ţ�</label>
					</td>
					<td >
						<input type="text" name="idNumber" style="width:150px">
					</td>
				</tr>
				<tr>
					<td>
						<label>רҵ��</label>
					</td>
					<td>
						<input class="easyui-combobox" name="major" id="major_s" data-options="panelHeight:'150',editable:false,valueField: 'label',textField: 'value'" style="width:150px"/>
					</td>
				</tr>
				<tr>
					<td>
						<label>��λ��</label>
					</td>
					<td>
						<input class="easyui-combobox" name="post" id="post_s" data-options="panelHeight:'150',valueField: 'label',textField: 'value'" style="width:150px"/>
					</td>
				</tr>
				<tr>
					<td>
						<label>���ڲ��ţ�</label>
					</td>
					<td >
						<input class="easyui-combobox" id="done_s" name="done" data-options="panelHeight:'150',valueField: 'label',textField: 'value'" style="width:150px"/><br>
						<input class="easyui-combobox" id="dtwo_s" name="dtwo" data-options="panelHeight:'150',valueField: 'label',textField: 'value'" style="width:150px"/>
					</td>
				</tr>				
			</table>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="submitSearchForm()">ȷ ��</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-back" onclick="crud.clearSearch()">�� ��</a>
		</form>
	</div>
	<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
	<script type="text/javascript">
		function employeeGrid_selectFunction(id, jobNum,name,major,post,done,dtwo) {
			if(eSelect == null) {
				$.messager.alert('����','�붨��eSelect����!');  
				return;
			}
			if(typeof eSelect.callBack != 'function'){
				$.messager.alert('����','�봫�ݵĻص�����!');  
				return;
			}
			eSelect.callBack(id,jobNum,name,major,post,done,dtwo);
		}
		function employeeGrid_searchForm() { 
			var params = {
					'employees.id':$('input[name="employees.id"]').val(),
					'employees.jobNum':$('input[name="employees.jobNum"]').val(),
					'employees.name':$('input[name="employees.name"]').val(),
					'employees.majorName':$('input[name="employees.majorName"]').val(),
					'employees.postName':$('input[name="employees.postName"]').val(),
					'employees.done':$('input[name="employees.done"]').val(),
					'employees.dtwo':$('input[name="employees.dtwo"]').val()
			};
			$('#employeeGrid_').datagrid('load', params);
		}
		function employeeGrid_clearSearchForm() {
			Crud.clearForm($('#employeeGrid_searchForm'));
		}
		function eremployeeGrid_gridFormatt(value, rowData, rowIndex) {
			var rowId = rowData.id;
			var url = "";
			url += "<a title=\"ѡ��\" onclick='employeeGrid_selectFunction(\""+rowId+"\",\""+rowData.jobNum+"\",\""+rowData.name+"\",\""+rowData.majorName+"\",\""+rowData.postName+"\",\""+rowData.doneName+"\",\""+rowData.dtwoName+"\");' class='btn2'><img src=\"${ctx}/images/choose.png\"></img></a>&nbsp;&nbsp;&nbsp;&nbsp;";
			return url;
		}
	
		function strsum(value, rowData, rowIndex){
			var url = rowData.doneName + "  " + rowData.dtwoName;
			return url;
		}

		function onloadCombobox2(urlValue,typeId,comboboxObj_one,comboboxObj_two,comboboxObj_three){
			comboboxObj_one.combobox({  
			   url:urlValue+'/data/dataAction!findDataByTypeFirstLevel.action?typeId='+typeId,
			   valueField:'id',  
			   textField:'dataName',
			   onSelect:function(row){
						if(comboboxObj_two != null){
						    //combobox_oneId: ����id 
							//ע�����ﲻ��ʹ��$('#XXX').val()��������ȡ�������ֵ
							//��Ϊ����ʹ�õ���easyui��combobox���������ֻ��ʹ��easyui�ṩ��getValue����
						    var combobox_oneId = row.id;
						    comboboxObj_two.combobox({
						     	  url:urlValue+'/data/dataAction!findAllChildren.action?parentId='+combobox_oneId,
						          valueField:'id',
						          textField:'dataName',
						          onSelect:function(row){
									if(comboboxObj_three != null && comboboxObj_two !=null ){
									    //combobox_twoId: ����id
										//ע�����ﲻ��ʹ��$('#XXX').val()��������ȡ�������ֵ
										//��Ϊ����ʹ�õ���easyui��combobox���������ֻ��ʹ��easyui�ṩ��getValue����
									    var combobox_twoId = row.id
									    comboboxObj_three.combobox({
									     	  url:urlValue+'/data/dataAction!findAllChildren.action?parentId='+combobox_twoId,
									          valueField:'id',
									          textField:'dataName'
									    });
									}
						    	}
						    });
						}
				}
			});    
		}
		
		$(document).ready( function() {
			var employeeGrid_setting = {
					title : '',
					iconCls : 'icon-edit',
					nowrap : false,
					striped : true,
					border : true,
					collapsible : false,
					fit : true,
					url : '${ctx}/employees/employeesAction!list.action',
					remoteSort : false,
					idField : 'id',
					singleSelect : true,
					pagination : true,
					rownumbers : true,
					loadMsg:"����Ŭ����ȡ������...",
					fit : true,
				    fitColumns:true,
					frozenColumns : [],
					toolbar : '',
				    onLoadSuccess: function(data){}		          
			};
			$('#employeeGrid_').datagrid(employeeGrid_setting);
			var employeeGrid_pageController = $('#employeeGrid_').datagrid('getPager');
	
			var employeeGrid_pageSettings = {
				pageSize : 10,
				pageList : [ 10, 15, 20, 30 ],
				beforePageText : '��',
				afterPageText : 'ҳ    ��{pages} ҳ',
				displayMsg : '��ǰ��ʾ {from} - {to} ����¼  ��{total}����¼',
				buttons :[{
					iconCls:"icon-search",
					handler : function(){
						var num = employeeGrid_pageController.data().pagination.bb.num.val();
						employeeGrid_pageController.pagination("select",num);
					}
				}]				
			};
			$(employeeGrid_pageController).pagination(employeeGrid_pageSettings);			

			onloadCombobox2('${ctx}','deparment',$('#done'),$('#dtwo'),null);
			onloadCombobox2('${ctx}','deparment',$('#done_s'),$('#dtwo_s'),null);
			onloadCombobox2('${ctx}','zy',$('#major_s'),$('#post_s'),null);
		});

		//�򿪸߼���ѯ����
		function advancedsearch2(){
			$('#advancedsearch2').window('open');
		}
		//ִ�и߼���ѯ
		function submitSearchForm(){
			var params = {
					'employees.jobNum':$('input[name="jobNum"]').val(),
					'employees.name':$('input[name="name"]').val(),
					'employees.idNumber':$('input[name="idNumber"]').val(),
					'employees.major':$('input[name="major"]').val(),
					'employees.post':$('input[name="post"]').val(),
					'employees.done':$('input[name="done"]').val(),
					'employees.dtwo':$('input[name="dtwo"]').val()
			};
			$('#employeeGrid_').datagrid('load', params);
			Crud.clearForm($('#advanced2'));
			$('#advancedsearch2').window('close');
		}
	</script>
</body>
</html>