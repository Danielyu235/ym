<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>自定义危险物质</title>

<link rel="stylesheet" type="text/css" href="${ctx}/css/bus.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/newCrud.css">
<script type="text/javascript" src="${ctx}/js/GridUtilNoToolBar.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
</head>
<body>
<script type="text/javascript">
	$(document).ready(
		function (){
			onloadCombobox($("#type"),$("#description"),$("#thresholdQuantity"));
		}
	);
	function callBackFunction(operateCode) {
		var temp = operateCode.split(':');
		if(typeof oSelect.callBack != 'function'){
			$.messager.alert('错误','请传递的回调函数!');  
			return;
		}
		oSelect.callBack(temp[0], temp[1]);
		
	}
	function saveOtherMaterials() {
		$('#addOtherMaterialsForm').find('form').form('submit',{
            url: '${ctx}/otherMaterials/otherMaterialsAction!add',
            success:function (data) {
            	oSelect.close();
            	var data = eval('(' + data + ')');
                if (data.operateSuccess) {
                	callBackFunction(data.operateCode);
                    $.messager.show({
                        title:'成功',
                        msg:data.operateMessage,
                        timeout:2000,
                        showType:'slide'
                    });
                } else {
                    $.messager.show({
                        title:'失败',
                        msg:data.operateMessage,
                        timeout:2000,
                        showType:'slide'
                    });
                }
            }
        });
	}
	//下拉数据处理
	function onloadCombobox(comboboxObj_one,comboboxObj_two,comboboxObj_three){
	comboboxObj_one.combobox({  
	   url:'${ctx}/chemicalsHazardous/chemicalsHazardousAction!findDataByTypeFirstLevel.action',
	   valueField:'id',  
	   textField:'wxhxpmc',
	   onChange:function(){
				if(comboboxObj_two != null){
				    //combobox_oneId: 父级id
					//注意这里不能使用
					//因为这里使用的是easyui的combobox组件，所以只能使用easyui提供的getValue方法
				    var combobox_oneId = comboboxObj_one.combobox('getValue');
				    comboboxObj_two.combobox({
				     	  url:'${ctx}/chemicalsHazardous/chemicalsHazardousAction!findDataByTypeTwoLevel.action?wxhxplb='+combobox_oneId,
				          valueField:'ljz',
				          textField:'wxhxpsm',
				          onChange:function(){
				           var ljz= comboboxObj_two.combobox('getValue');
				           $("#thresholdQuantity").val(ljz);
				            $("#thresholdQuantity_1").val(ljz);
				          }
				    });
				}
		}
	});    
}         
</script>
	<div style="">
		<div id="addOtherMaterialsForm" style="width: 99%; height: 99%;" 
			data-options="iconCls:'icon-save',modal:true,
    			minimizable:true,maximizable:true,collapsible:true,draggable:false">
		<form method="post">
			<input type="hidden" name="materials.id"/>
			<div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea">
						<tr>
							<td class="table_nemu">物质名称</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="otherMaterials.name"
							data-options="validType:'maxByteLength[100]',required: true" missingMessage="请输入物质名称" />
							</td>
							<td class="table_nemu">类型</td>
							<td class="table_con">
							<input class="easyui-combobox" name="otherMaterials.type" id="type" data-options="panelHeight:'auto',width:'100',editable:false,required: true"/>
							</td>
						</tr>
						<tr>
							<td class="table_nemu">危险性分类及说明</td>
							<td class="table_con" colspan="3">
							<input class="easyui-combobox" name="otherMaterials.description" id="description" data-options="panelHeight:'auto',editable:false,required: true"  style="width: 300px"/>
							</td>
						</tr>
						<tr>
						<td class="table_nemu">临界量</td>
							<td class="table_con" colspan="3">
							<input type="text" disabled="disabled" id="thresholdQuantity_1"/>
							<input type="hidden" name="otherMaterials.thresholdQuantity" id="thresholdQuantity"/>
							</td>
						</tr>
				</table>
			</div>
			<div align="center" >
		         <a href="javascript:void(0)" class="easyui-linkbutton" icon="icon-save" onclick="saveOtherMaterials()">确定</a>
		         <a href="javascript:void(0)" class="easyui-linkbutton" icon="icon-cancel" onclick="oSelect.close()">取消</a>
		    </div> 
		</form>
		</div>
	</div>
</body>
</html>