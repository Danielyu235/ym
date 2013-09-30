<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="gb2312" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>ѡúרҵ</title>

<script type="text/javascript" src="${ctx}/js/GridUtilNoToolBar.js"></script>
<script type="text/javascript" src="${ctx}/js/validator.js"></script>
<script type="text/javascript" src="${ctx}/js/packCrud.js"></script>
<link rel="stylesheet" href="../../../css/crud.css" type="text/css"></link>
<script type="text/javascript">

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
					$.each(data,function(key, value) {
						//alert(key);
								$('#updateWin [name="rescueCars.' + key + '"]').val(value);
								if(key == 'hasPump')
									{
								$('#updHasPump').combobox('setValue',value);	
									}
								if(key == 'hasCarProvide')
									{
									$('#updHasCarProvide').combobox('setValue',value);	
								    }
							});
				}
			});
}

//��ղ�ѯ��
function clearSearchForm() {
		$("#searchForm")[0].reset();
}


</script>
</head>
<body>

  <div class="panel-header" style="width:100%;">
	<div class="panel-title panel-with-icon">ѡúרҵ</div>
	<div class="panel-icon icon-edit"></div>
	<div class="panel-tool"></div>
</div>

<div class="datagrid-toolbar" id = "tb" style="padding-left: 0px;height:10px;">
	 <div id="search">
        <form id="searchForm" method="post" style="display: inline;">
        &nbsp;&nbsp;����:&nbsp;&nbsp;<input class="easyui-validatebox"  name="rescueCars.carName" >
        &nbsp;&nbsp;����:&nbsp;&nbsp;<input class="easyui-validatebox"  name="rescueCars.carStyle" >
        &nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="searchForm();">��ѯ</a>
		&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="clearSearchForm();">���</a>
        </form>
    </div>
    </div>
     <div class="search_add">
	<shiro:hasPermission name="48:add">
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add', plain:true" onclick="addFunction();">���</a>
	</shiro:hasPermission>
	<shiro:hasPermission name="48:delete">		
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove', plain:true" onclick="removeFunction();">ɾ��</a>
	</shiro:hasPermission>
    </div>
<!-- ����ͷ -->
<div style="height:78%;">
    <table class="easyui-datagrid" style="display:none" fitColumns=true pagination=true fit="true">
        <thead>
        <tr>
            <th field="carName" width="400px" align="center" title="carName">����</th>
            <th field="carStyle" width="200px" align="center" title="carStyle">����</th>
            <th field="carModle" width="500px" align="center" title="carModle">����</th>
            <th field="number" width="150px" align="center" title="number">��ȫ��ѵ���Ե÷�</th>
            <th field="id" width="150px" align="center" formatter="gridFormatter">����</th>     
        </tr>
        </thead>
        <tbody>
          <tr>
             <td>���б�</td>
             <td>110003</td>
             <td>ͨ��һ��</td>
             <td>78</td>
          </tr>
          <tr>
             <td>���ͻ�</td>
             <td>150025</td>
             <td>�ھ����</td>
             <td>85</td>
          </tr>
             <tr>
             <td>�¿�</td>
             <td>152201</td>
             <td>�ھ�����</td>
             <td>98</td>
          </tr>
          <tr>
            
             <td> <font color="red">����</font></td>
             <td> <font color="red">154520</font></td>
             <td> <font color="red">��������</font></td>
             <td> <font color="red">56</font></td>
             
          </tr>
        </tbody>
    </table>
</div>

<!-- ��Ӵ��� -->
<div style="display:none">
<div id="addWin" iconCls="icon-save" title="��Ӿ�Ԯ������Ϣ">
    <form  style="padding: 10px 20px 10px 20px;" id="addForm"  method="post" >
	    <table cellpadding="5px" style="font-size:12px;"  cellspacing="1"  border="0" bgcolor="#aed0ea">
	  <tr >
	    <td class="table_nemu" >��������</td>
	    <td  class="table_con" ><input class="easyui-validatebox" name="rescueCars.carName"/ data-options="required: true" missingMessage="�����복������"></td>
	    <td  class="table_nemu" >����</td>
	    <td class="table_con" ><input class="easyui-validatebox" name="rescueCars.carStyle"/></td>
	  </tr>
	  <tr >
	    <td  class="table_nemu" >�ͺ�</td>
	    <td class="table_con" ><input class="easyui-validatebox" name="rescueCars.carModle"/></td>
	    <td class="table_nemu" >��λ</td>
	    <td  class="table_con" ><input  name="rescueCars.tonnage"/>&nbsp;��</td>
	  </tr>
	  <tr >
	    <td class="table_nemu" >����</td>
	    <td class="table_con" ><input style="width: 50px" class="easyui-numberbox" name="rescueCars.number" data-options="required: true" missingMessage="����������"/></td>
	    <td class="table_nemu" >�����Ƿ����</td>
	    <td class="table_con" ><input class="easyui-combobox" data-options="valueField: 'label',
				textField: 'value',
				data: [{
					label: '��',
					value: '��'
				},{
					label: '��',
					value: '��'
		        }],panelHeight:'auto',editable:false" style="width: 50" name="rescueCars.hasPump"/></td>
	 </tr>
	 <tr>	        
	    <td class="table_nemu" >�Ƿ��Ա����䳵�� </td>
	    <td class="table_con" colspan="3"><input class="easyui-combobox" data-options="valueField: 'label',
				textField: 'value',
				data: [{
					label: '��',
					value: '��'
				},{
					label: '��',
					value: '��'
		        }],panelHeight:'auto',editable:false" style="width: 50"  name="rescueCars.hasCarProvide"/></td>
	  </tr>
	  <tr >
	    <td  class="table_nemu" >������λ</td>
	    <td class="table_con" ><input class="easyui-validatebox" name="rescueCars.organize"/></td>
	    <td class="table_nemu" >��������</td>
	    <td  class="table_con" ><input class="easyui-validatebox" name="rescueCars.department"/></td>
	  </tr>
	   <tr >
	    <td  class="table_nemu" >������</td>
	    <td class="table_con" ><input class="easyui-validatebox" name="rescueCars.principal" data-options="required: true" missingMessage="�����븺����"/></td>
	    <td class="table_nemu" >�������ֻ�</td>
	    <td  class="table_con" ><input class="easyui-validatebox" name="rescueCars.mobilePhone" data-options="required: true" missingMessage="�����븺�����ֻ�"/></td>
	  </tr>
	  <tr height="100">
	    <td class="table_nemu">��ע</td>
	    <td colspan="5" class="table_con"><textarea  style="width: 400;height: 100;" class="easyui-validatebox" name="rescueCars.remark" type="textarea" ></textarea></td>
	  </tr>
		</table>
			<br/>
	        <div align="center" >
	            <a href="#" class="easyui-linkbutton" icon="icon-ok" onclick="addSubmitForm();return false;">ȷ��</a>
	            <a href="#" class="easyui-linkbutton" icon="icon-cancel" onclick="closeAllWin();return false;">ȡ��</a>
	        </div> 
   	</form>
</div>
</div>

<!-- �޸Ĵ��� -->
<div style="display:none">
<div id="updateWin" iconCls="icon-save" title="�޸ľ�Ԯ������Ϣ">
    <form  style="padding: 10px 20px 10px 20px;" id="updateForm"  method="post">
    <input type="hidden" id="updateId" name="rescueCars.id"/>
	   <table cellpadding="5px" style="font-size:12px;"  cellspacing="1"  border="0" bgcolor="#aed0ea">
	<tr >
	    <td class="table_nemu" >��������</td>
	    <td  class="table_con" ><input class="easyui-validatebox" name="rescueCars.carName"/ data-options="required: true" missingMessage="�����복������"></td>
	    <td  class="table_nemu" >����</td>
	    <td class="table_con" ><input class="easyui-validatebox" name="rescueCars.carStyle"/></td>
	  </tr>
	  <tr >
	    <td  class="table_nemu" >�ͺ�</td>
	    <td class="table_con" ><input class="easyui-validatebox" name="rescueCars.carModle"/></td>
	    <td class="table_nemu" >��λ</td>
	    <td  class="table_con" ><input  name="rescueCars.tonnage"/>&nbsp;��</td>
	  </tr>
	  <tr >
	    <td class="table_nemu" >����</td>
	    <td class="table_con" ><input style="width: 50px"  name="rescueCars.number" data-options="required: true" missingMessage="����������"/></td>
	    <td class="table_nemu" >�����Ƿ����</td>
	    <td class="table_con" ><input class="easyui-combobox"  id="updHasPump" data-options="valueField: 'label',
				textField: 'value',
				data: [{
					label: '��',
					value: '��'
				},{
					label: '��',
					value: '��'
		        }],panelHeight:'auto',editable:false" style="width: 50" name="rescueCars.hasPump"/></td>
	 </tr>
	 <tr>	        
	    <td class="table_nemu" >�Ƿ��Ա����䳵�� </td>
	    <td class="table_con" colspan="3"><input class="easyui-combobox" id="updHasCarProvide" data-options="valueField: 'label',
				textField: 'value',
				data: [{
					label: '��',
					value: '��'
				},{
					label: '��',
					value: '��'
		        }],panelHeight:'auto',editable:false" style="width: 50"  name="rescueCars.hasCarProvide"/></td>
	  </tr>
	  <tr >
	    <td  class="table_nemu" >������λ</td>
	    <td class="table_con" ><input class="easyui-validatebox" name="rescueCars.organize"/></td>
	    <td class="table_nemu" >��������</td>
	    <td  class="table_con" ><input class="easyui-validatebox" name="rescueCars.department"/></td>
	  </tr>
	   <tr >
	    <td  class="table_nemu" >������</td>
	    <td class="table_con" ><input class="easyui-validatebox" name="rescueCars.principal" data-options="required: true" missingMessage="�����븺����"/></td>
	    <td class="table_nemu" >�������ֻ�</td>
	    <td  class="table_con" ><input class="easyui-validatebox" name="rescueCars.mobilePhone" data-options="required: true" missingMessage="�����븺�����ֻ�"/></td>
	  </tr>
	  <tr height="100">
	    <td class="table_nemu">��ע</td>
	    <td colspan="5" class="table_con"><textarea  style="width: 400;height: 100;" class="easyui-validatebox" name="rescueCars.remark" type="textarea" ></textarea></td>
	  </tr>
		</table>
			<br/>
	        <div align="center" >
	            <a href="#" class="easyui-linkbutton" icon="icon-ok" onclick="updateSubmitForm();return false;">ȷ��</a>
	            <a href="#" class="easyui-linkbutton" icon="icon-cancel" onclick="closeAllWin();return false;">ȡ��</a>
	        </div> 
   	</form>
</div>
</div>
<!-- �鿴���� -->
<div style="display: none">
	<div id="viewWin" iconCls="icon-save" title="�鿴��Ԯ������Ϣ">
	<form style="padding: 10px 20px 10px 20px;">
	    <table cellpadding="5px" style="font-size:12px;"  cellspacing="1"  border="0" bgcolor="#aed0ea">
	   		 <tr >
	    <td class="table_nemu" >��������</td>
	    <td  class="table_con" ><label name="rescueCars.carName"/></td>
	    <td  class="table_nemu" >����</td>
	    <td class="table_con" ><label name="rescueCars.carStyle"/></td>
	  </tr>
	  <tr >
	    <td  class="table_nemu" >�ͺ�</td>
	    <td class="table_con" ><label name="rescueCars.carModle"/></td>
	    <td class="table_nemu" >��λ</td>
	    <td  class="table_con" ><label name="rescueCars.tonnage"/>&nbsp;��</td>
	  </tr>
	  <tr >
	    <td class="table_nemu" >����</td>
	    <td class="table_con" ><label name="rescueCars.number"/></td>
	    <td class="table_nemu" >�����Ƿ����</td>
	    <td class="table_con" ><label  style="width: 50" name="rescueCars.hasPump"/></td>
	  </tr>
	  <tr>  
	    <td class="table_nemu" >�Ƿ��Ա����䳵�� </td>
	    <td class="table_con" colspan="3"><label style="width: 50"  name="rescueCars.hasCarProvide"/></td>
	  </tr>
	  <tr >
	    <td  class="table_nemu" >������λ</td>
	    <td class="table_con" ><label name="rescueCars.organize"/></td>
	    <td class="table_nemu" >��������</td>
	    <td  class="table_con" ><label name="rescueCars.department"/></td>
	  </tr>
	   <tr >
	    <td  class="table_nemu" >������</td>
	    <td class="table_con" ><label name="rescueCars.principal"/></td>
	    <td class="table_nemu" >�������ֻ�</td>
	    <td  class="table_con" ><label name="rescueCars.mobilePhone"/></td>
	  </tr>
	  <tr height="100">
	    <td class="table_nemu">��ע</td>
	    <td colspan="5" class="table_con"><label   class="easyui-validatebox" name="rescueCars.remark" /></td>
	  </tr>
			
		</table>
					<br />
					<div align="center">
						<a href="#" class="easyui-linkbutton" icon="icon-print"
							onclick="printWin();return false;" id="print">��ӡ</a>
						<a href="#" class="easyui-linkbutton" icon="icon-cancel"
							onclick="closeAllWin();return false;"id="cancel">ȡ��</a>
					</div>
				</form>
			</div>
		</div>
</body>
</html>