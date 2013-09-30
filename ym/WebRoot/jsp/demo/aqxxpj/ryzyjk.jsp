<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="gb2312" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��Աְҵ����</title>

<script type="text/javascript" src="${ctx}/js/GridUtilNoToolBar.js"></script>
<script type="text/javascript" src="${ctx}/js/validator.js"></script>
<script type="text/javascript" src="${ctx}/js/packCrud.js"></script>
<link rel="stylesheet" href="../../../css/newCrud.css" type="text/css"></link>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<script type="text/javascript">
$(document).ready(
 	function (){
 	eSelect = new Select('ѡ��','${ctx}/jsp/demo/aqxxpj/EnterpriseSelect.jsp'
	    		 , null, function(id, corpName) {
	    	        $('input[name="rescueCars.carName"]').val("231004");
	    	        $('input[name="rescueCars.carStyle"]').val("���з�");
	    	        $('input[name="rescueCars.carModle"]').val("����ά��רҵ");
	    	        $('input[name="rescueCars.tonnage"]').val("����ά��");
	    });
		$('#updateWin').window({
						        width:800,
						        height:450,
						        modal:true,
						        draggable:false,
						        closed:true,
						        onOpen:function(){
						        	$(".window-mask").css("height","100%");
						        }
		});
		
	   $('#addWin').window({
	                width:800,
	                height:450,
	                modal:true,
	                draggable:false,
	                closed:true,
	                onOpen:function(){
	                $(".window-mask").css("height","100%");
	                }
	    });
	  
	    $('#viewWin').window({
			         width:800,
			         height:450,
			         modal:true,
			         draggable:false,
			         closed:true,
			         onOpen:function(){
			         	$(".window-mask").css("height","100%");
			         }
	     });
	   });
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
	<div class="panel-title panel-with-icon">��Աְҵ����</div>
	<div class="panel-icon icon-edit"></div>
	<div class="panel-tool"></div>
</div>

<div class="datagrid-toolbar" id = "tb" style="padding-left: 0px;height:10px;">
	 <div id="search">
        <form id="searchForm" method="post" style="display: inline;">
        &nbsp;&nbsp;����:&nbsp;&nbsp;<input class="easyui-validatebox"  name="rescueCars.carName" >
        &nbsp;&nbsp;Ա������:&nbsp;&nbsp;<input class="easyui-validatebox"  name="rescueCars.carStyle" >
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
            <th field="carName" width="150px" align="center" title="carName">����</th>
            <th field="carStyle" width="150px" align="center" title="carStyle">Ա������</th>
            <th field="carModle" width="150px" align="center" title="carModle">��λ</th>
            <th field="number" width="150px" align="center" title="number">�������</th>
            <th field="id" width="150px" align="center" formatter="gridFormatter">����</th>     
        </tr>
        </thead>
        <tbody>
          <tr>
             <td>231003</td>
             <td>���͢</td>
             <td>Ƥ��һ��</td>
             <td>����</td>
          </tr>
           <tr>
             <td>231004</td>
             <td>���з�</td>
             <td>����ά��</td>
             <td>����</td>
          </tr>
        </tbody>
    </table>
</div>

<!-- ��Ӵ��� -->
<div style="display:none">
<div id="addWin" iconCls="icon-save" title="�����Աְҵ������Ϣ">
    <form  style="padding: 10px 20px 10px 20px;" id="addForm"  method="post" >
	    <table cellpadding="5px" style="font-size:12px;"  cellspacing="1"  border="0" bgcolor="#aed0ea">
	  <tr >
	    <td class="table_nemu_new" width="26%">����</td>
	    <td  class="table_con" width="26%"><input class="easyui-validatebox" name="rescueCars.carName" disabled></td>
	    <td  class="table_nemu_new" width="26%">Ա������</td>
	    <td class="table_con" width="26%"><input class="easyui-validatebox" name="rescueCars.carStyle" disabled/></td>
	  </tr>
	  <tr >
	    <td  class="table_nemu_new" >רҵ</td>
	    <td class="table_con" ><input class="easyui-validatebox" name="rescueCars.carModle" disabled/></td>
	    <td class="table_nemu_new" >��λ</td>
	    <td  class="table_con" ><input  name="rescueCars.tonnage" disabled/></td>
	  </tr>
	   <tr >
		<td class="table_nemu_new" >Ա����Ϣ</td>
	    <td class="table_con" ><input type="button" value="����ѡ��" onclick="eSelect.open()"/></td>
	    <td class="table_nemu_new" >�����</td>
	    <td class="table_con" ><input class="easyui-combobox" data-options="valueField: 'label',
				textField: 'value',
				data: [{
					label: '����',
					value: '����'
				},{
					label: '������',
					value: '������'
		        }],panelHeight:'auto',editable:false" name="rescueCars.hasPump"/></td>	   
	 </tr>
	 

	  <tr height="100">
	    <td class="table_nemu_new" width="25%">��ע</td>
	    <td colspan="5" class="table_con" width="25%"><textarea  style="width: 600;height: 100;" class="easyui-validatebox" name="rescueCars.remark" type="textarea" ></textarea></td>
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
</body>
</html>