<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>高级查询</title>
	<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
</head>
<body>
	<div style="margin:auto;text-align: center">
		<form action="">
			<table style="border:0;padding:5px;width:100%">
				<tr>
					<td style="width:25%">
						<label>员工号</label>
					</td>
					<td>
						<input type="text" id="jobNum" style="width:205px"><br/>
					</td>
				</tr>
				<tr>
					<td>
						<label>员工姓名</label>
					</td>
					<td>
						<input type="text" id="ename" style="width:205px"><br/>
					</td>
				</tr>
				<tr>
					<td>
						<label>身份证号</label>
					</td>
					<td>
						<input type="text" id="idNumber" style="width:205px"><br/>
					</td>
				</tr>
				<%--<tr>
					<td>
						<label>所在部门</label>
					</td>
					<td>
						<input type="text" class="easyui-combobox" id="done" data-options="panelHeight:'auto',editable:false" style="width:100px">
						<input type="text" class="easyui-combobox" id="dtwo" data-options="panelHeight:'auto',editable:false" style="width:100px"><br/>
					</td>
				</tr>
				--%><tr>
					<td>
						<label>专业</label>
					</td>
					<td>
						<input class="easyui-combobox" name="employee.major" id="major" data-options="panelHeight:'auto',editable:false" style="width:205px"/>
					</td>
				</tr>
				<tr>
					<td>
						<label>岗位</label>
					</td>
					<td>
						<input class="easyui-combobox" name="employee.post" id="post" data-options="panelHeight:'auto',editable:false" style="width:205px"/>
					</td>
				</tr>
			</table>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="setSearchVal()">确 定</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="back()">取 消</a>
		</form>		
	</div>
	<script type="text/javascript">
		function setSearchVal(){
			var parentWindow = parent.document;
			//父页面原有表单
			parentWindow.getElementById("employee.jobnum").value = $('#jobNum').val();
			parentWindow.getElementById("employee.ename").value = $('#ename').val();
			
			//父页面隐藏表单
			parentWindow.getElementById("employee.idNumber").value = $('#idNumber').val();			
			//parentWindow.getElementById("employee.departmentf").value = $('#done').combo('getValue');
			//parentWindow.getElementById("employee.departments").value = $('#dtwo').combo('getValue');
			parentWindow.getElementById("employee.major").value = $('#major').combo('getValue');
			parentWindow.getElementById("employee.post").value = $('#post').combo('getValue');
			
			window.parent.$("#advancedsearch").window('close');
			window.parent.crud.search();
		}

		function back(){
			window.parent.$("#advancedsearch").window('close');
		}
		
		function onloadCombobox2(urlValue,typeId,comboboxObj_one,comboboxObj_two,comboboxObj_three){
			comboboxObj_one.combobox({  
			   url:urlValue+'/data/dataAction!findDataByTypeFirstLevel.action?typeId='+typeId,
			   valueField:'id',  
			   textField:'dataName',
			   onSelect:function(row){
						if(comboboxObj_two != null){
						   
						    var combobox_oneId = row.id;
						    comboboxObj_two.combobox({
						     	  url:urlValue+'/data/dataAction!findAllChildren.action?parentId='+combobox_oneId,
						          valueField:'id',
						          textField:'dataName',
						          onSelect:function(row){
									if(comboboxObj_three != null && comboboxObj_two !=null ){
									   
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
		
		$(document).ready(
		 	function (){
		 		onloadCombobox2('${ctx}','zy',$('#major'),$('#post'),null);
		 		//onloadCombobox2('${ctx}','deparment',$('#done'),$('#dtwo'),null);
		 	} 	
		);
	</script>
</body>
</html>