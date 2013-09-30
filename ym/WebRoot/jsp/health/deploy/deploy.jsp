<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="gb2312" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>���������</title>
<script type="text/javascript" src="${ctx}/js/GridUtilNoToolBar.js"></script>

<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<script type="text/javascript">
$(function(){
	
	$.post('${ctx}/deploy/deployAction!getById','id=',function(data){
			$('#bloodPressureHigh').combobox('setValue', data.bloodPressureHigh);
			$('#bloodPressureLow').combobox('setValue', data.bloodPressureLow);
			$('#pulseRate').combobox('setValue', data.pulseRate);
			$('#bc').combobox('setValue', data.bc);
			$('#bloodExamination').combobox('setValue', data.bloodExamination);
			$('#lkExamination').combobox('setValue', data.lkExamination);
			$('#nervousSystem').combobox('setValue', data.nervousSystem);
			$('#thyroid').combobox('setValue', data.thyroid);
			$('#superficialLymphadenopathy').combobox('setValue', data.superficialLymphadenopathy);
			$('#skinAndMucosa').combobox('setValue', data.skinAndMucosa);
			$('#electrocardiogram').combobox('setValue', data.electrocardiogram);
			$('#pneumoconiosis').combobox('setValue', data.pneumoconiosis);
			$('#updateId').val(data.id);
			
		});
});
     function addSubmitForm() {
            $('#addForm').form({
                url:'${ctx}/deploy/deployAction!add',
                method:'POST',
                success:function (data) {
                	
                	var data = eval('(' + data + ')');
					
                    if (data.operateSuccess) {
                    	$.messager.alert('�ɹ�',data.operateMessage); 
                        
                    } else {
                    	$.messager.alert('ʧ��',data.operateMessage); 
                    }
                }
            });
            $('#addForm').submit();
        }
	
		
</script>
</head>
<body>


<div style="display: false; ">
		<div  style="width: 900px; height: 450px;" 
			data-options="iconCls:'icon-save',modal:true,
    			minimizable:true,maximizable:true,collapsible:true,draggable:false">
		<form method="post" id="addForm" action="">
		
		<input type="hidden" id="updateId" name="deploy.id"/>
	    <div style="padding: 30px 20px 10px 160px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
	  				<tr>
							<td class="table_nemu_new">Ѫѹ(��):</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" id="bloodPressureHigh" name="deploy.bloodPressureHigh"
							data-options="valueField:'v', textField:'m', data:[{v:'1',m:'��Ϊ����'},{v:'0',m:'����Ϊ����'}],editable:false" panelHeight="auto" required="true" />
							</td>
						<td class="table_nemu_new">Ѫѹ(��):</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" id="bloodPressureLow" name="deploy.bloodPressureLow"
							data-options="valueField:'v', textField:'m', data:[{v:'1',m:'��Ϊ����'},{v:'0',m:'����Ϊ����'}],editable:false" panelHeight="auto" required="true"/>
							</td>
							</tr>
							<tr>
							<td class="table_nemu_new">����:</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="deploy.pulseRate" id="pulseRate"
							data-options="valueField:'v', textField:'m', data:[{v:'1',m:'��Ϊ����'},{v:'0',m:'����Ϊ����'}],editable:false" panelHeight="auto" required="true"/>
							</td>
						
							<td class="table_nemu_new">�ĵ�ͼ:</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="deploy.electrocardiogram" id="electrocardiogram"
							data-options="valueField:'v', textField:'m', data:[{v:'1',m:'��Ϊ����'},{v:'0',m:'����Ϊ����'}],editable:false" panelHeight="auto" required="true"/>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">B��:</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="deploy.bc" id="bc"
							data-options="valueField:'v', textField:'m', data:[{v:'1',m:'��Ϊ����'},{v:'0',m:'����Ϊ����'}],editable:false" panelHeight="auto" required="true"/>
						
							<td class="table_nemu_new">���β�:</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="deploy.pneumoconiosis" id="pneumoconiosis"
							data-options="valueField:'v', textField:'m', data:[{v:'1',m:'��Ϊ����'},{v:'0',m:'����Ϊ����'}],editable:false" panelHeight="auto" required="true"/>
							</td>
							
						</tr>
						
						<tr>
							<td class="table_nemu_new">ѪҺ���:</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="deploy.bloodExamination" id="bloodExamination"
							data-options="valueField:'v', textField:'m', data:[{v:'1',m:'��Ϊ����'},{v:'0',m:'����Ϊ����'}],editable:false" panelHeight="auto" required="true"/>
							</td>
						
							<td class="table_nemu_new">��������:</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="deploy.lkExamination" id="lkExamination"
							data-options="valueField:'v', textField:'m', data:[{v:'1',m:'��Ϊ����'},{v:'0',m:'����Ϊ����'}],editable:false" panelHeight="auto" required="true"/>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">��ϵͳ:</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="deploy.nervousSystem" id="nervousSystem"
							data-options="valueField:'v', textField:'m', data:[{v:'1',m:'��Ϊ����'},{v:'0',m:'����Ϊ����'}],editable:false" panelHeight="auto" required="true"/>
							</td>
						
							<td class="table_nemu_new">��״��:</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="deploy.thyroid" id="thyroid"
							data-options="valueField:'v', textField:'m', data:[{v:'1',m:'��Ϊ����'},{v:'0',m:'����Ϊ����'}],editable:false" panelHeight="auto" required="true"/>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">ǳ���ܰͽ�:</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="deploy.superficialLymphadenopathy" id="superficialLymphadenopathy"
							data-options="valueField:'v', textField:'m', data:[{v:'1',m:'��Ϊ����'},{v:'0',m:'����Ϊ����'}],editable:false" panelHeight="auto" required="true"/>
							</td>
						
							<td class="table_nemu_new">Ƥ���Ĥ:</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="deploy.skinAndMucosa" id="skinAndMucosa"
							data-options="valueField:'v', textField:'m', data:[{v:'1',m:'��Ϊ����'},{v:'0',m:'����Ϊ����'}],editable:false" panelHeight="auto" required="true"/>
							</td>
						</tr>
						<tr>
						<td colspan='4' class="table_con">
						<div  align="center" >
				            <a href="#" class="easyui-linkbutton" icon="icon-ok" onclick="addSubmitForm();return false;">����</a>
				            
	       				 </div> 
	       				 </td>
						</tr>
						
				</table>
				
	        </div> 
   	</form>
</div>
</div>


</body>
</html>