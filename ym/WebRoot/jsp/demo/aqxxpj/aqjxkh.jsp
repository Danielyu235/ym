<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="gb2312" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>选煤专业</title>

<script type="text/javascript" src="${ctx}/js/GridUtilNoToolBar.js"></script>
<script type="text/javascript" src="${ctx}/js/validator.js"></script>
<script type="text/javascript" src="${ctx}/js/packCrud.js"></script>
<link rel="stylesheet" href="../../../css/crud.css" type="text/css"></link>
<script type="text/javascript">

         //加载表单操作列
function gridFormatter(value, rowData, rowIndex) {
	var rowId = rowData.id;
	var url = ""
	<shiro:hasPermission name="48:view">
	+"<a title=\"查看\" onclick='viewFunction(\""+rowId+"\");' class='btn2'><img src=\"../../../images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;"
	</shiro:hasPermission>
	<shiro:hasPermission name="48:update">
	+"<a title=\"修改\" onclick='editFunction(\""+rowId+"\");' class='btn2' ><img src=\"../../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;"
	</shiro:hasPermission>
	return url;
}

// 填充更新表单中的数据
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

//清空查询框
function clearSearchForm() {
		$("#searchForm")[0].reset();
}


</script>
</head>
<body>

  <div class="panel-header" style="width:100%;">
	<div class="panel-title panel-with-icon">选煤专业</div>
	<div class="panel-icon icon-edit"></div>
	<div class="panel-tool"></div>
</div>

<div class="datagrid-toolbar" id = "tb" style="padding-left: 0px;height:10px;">
	 <div id="search">
        <form id="searchForm" method="post" style="display: inline;">
        &nbsp;&nbsp;姓名:&nbsp;&nbsp;<input class="easyui-validatebox"  name="rescueCars.carName" >
        &nbsp;&nbsp;部门:&nbsp;&nbsp;<input class="easyui-validatebox"  name="rescueCars.carStyle" >
        &nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="searchForm();">查询</a>
		&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="clearSearchForm();">清空</a>
        </form>
    </div>
    </div>
     <div class="search_add">
	<shiro:hasPermission name="48:add">
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add', plain:true" onclick="addFunction();">添加</a>
	</shiro:hasPermission>
	<shiro:hasPermission name="48:delete">		
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove', plain:true" onclick="removeFunction();">删除</a>
	</shiro:hasPermission>
    </div>
<!-- 表单表头 -->
<div style="height:78%;">
    <table class="easyui-datagrid" style="display:none" fitColumns=true pagination=true fit="true">
        <thead>
        <tr>
            <th field="carName" width="400px" align="center" title="carName">姓名</th>
            <th field="carStyle" width="200px" align="center" title="carStyle">工号</th>
            <th field="carModle" width="500px" align="center" title="carModle">部门</th>
            <th field="number" width="150px" align="center" title="number">安全培训考试得分</th>
            <th field="id" width="150px" align="center" formatter="gridFormatter">操作</th>     
        </tr>
        </thead>
        <tbody>
          <tr>
             <td>徐中彪</td>
             <td>110003</td>
             <td>通风一队</td>
             <td>78</td>
          </tr>
          <tr>
             <td>付和华</td>
             <td>150025</td>
             <td>挖掘二队</td>
             <td>85</td>
          </tr>
             <tr>
             <td>陈俊</td>
             <td>152201</td>
             <td>挖掘六队</td>
             <td>98</td>
          </tr>
          <tr>
            
             <td> <font color="red">李湘</font></td>
             <td> <font color="red">154520</font></td>
             <td> <font color="red">运输机电队</font></td>
             <td> <font color="red">56</font></td>
             
          </tr>
        </tbody>
    </table>
</div>

<!-- 添加窗口 -->
<div style="display:none">
<div id="addWin" iconCls="icon-save" title="添加救援车辆信息">
    <form  style="padding: 10px 20px 10px 20px;" id="addForm"  method="post" >
	    <table cellpadding="5px" style="font-size:12px;"  cellspacing="1"  border="0" bgcolor="#aed0ea">
	  <tr >
	    <td class="table_nemu" >车辆名称</td>
	    <td  class="table_con" ><input class="easyui-validatebox" name="rescueCars.carName"/ data-options="required: true" missingMessage="请输入车辆名称"></td>
	    <td  class="table_nemu" >类型</td>
	    <td class="table_con" ><input class="easyui-validatebox" name="rescueCars.carStyle"/></td>
	  </tr>
	  <tr >
	    <td  class="table_nemu" >型号</td>
	    <td class="table_con" ><input class="easyui-validatebox" name="rescueCars.carModle"/></td>
	    <td class="table_nemu" >吨位</td>
	    <td  class="table_con" ><input  name="rescueCars.tonnage"/>&nbsp;吨</td>
	  </tr>
	  <tr >
	    <td class="table_nemu" >数量</td>
	    <td class="table_con" ><input style="width: 50px" class="easyui-numberbox" name="rescueCars.number" data-options="required: true" missingMessage="请输入数量"/></td>
	    <td class="table_nemu" >自身是否带泵</td>
	    <td class="table_con" ><input class="easyui-combobox" data-options="valueField: 'label',
				textField: 'value',
				data: [{
					label: '是',
					value: '是'
				},{
					label: '否',
					value: '否'
		        }],panelHeight:'auto',editable:false" style="width: 50" name="rescueCars.hasPump"/></td>
	 </tr>
	 <tr>	        
	    <td class="table_nemu" >是否自备运输车辆 </td>
	    <td class="table_con" colspan="3"><input class="easyui-combobox" data-options="valueField: 'label',
				textField: 'value',
				data: [{
					label: '是',
					value: '是'
				},{
					label: '否',
					value: '否'
		        }],panelHeight:'auto',editable:false" style="width: 50"  name="rescueCars.hasCarProvide"/></td>
	  </tr>
	  <tr >
	    <td  class="table_nemu" >所属单位</td>
	    <td class="table_con" ><input class="easyui-validatebox" name="rescueCars.organize"/></td>
	    <td class="table_nemu" >所属部门</td>
	    <td  class="table_con" ><input class="easyui-validatebox" name="rescueCars.department"/></td>
	  </tr>
	   <tr >
	    <td  class="table_nemu" >负责人</td>
	    <td class="table_con" ><input class="easyui-validatebox" name="rescueCars.principal" data-options="required: true" missingMessage="请输入负责人"/></td>
	    <td class="table_nemu" >负责人手机</td>
	    <td  class="table_con" ><input class="easyui-validatebox" name="rescueCars.mobilePhone" data-options="required: true" missingMessage="请输入负责人手机"/></td>
	  </tr>
	  <tr height="100">
	    <td class="table_nemu">备注</td>
	    <td colspan="5" class="table_con"><textarea  style="width: 400;height: 100;" class="easyui-validatebox" name="rescueCars.remark" type="textarea" ></textarea></td>
	  </tr>
		</table>
			<br/>
	        <div align="center" >
	            <a href="#" class="easyui-linkbutton" icon="icon-ok" onclick="addSubmitForm();return false;">确定</a>
	            <a href="#" class="easyui-linkbutton" icon="icon-cancel" onclick="closeAllWin();return false;">取消</a>
	        </div> 
   	</form>
</div>
</div>

<!-- 修改窗口 -->
<div style="display:none">
<div id="updateWin" iconCls="icon-save" title="修改救援车辆信息">
    <form  style="padding: 10px 20px 10px 20px;" id="updateForm"  method="post">
    <input type="hidden" id="updateId" name="rescueCars.id"/>
	   <table cellpadding="5px" style="font-size:12px;"  cellspacing="1"  border="0" bgcolor="#aed0ea">
	<tr >
	    <td class="table_nemu" >车辆名称</td>
	    <td  class="table_con" ><input class="easyui-validatebox" name="rescueCars.carName"/ data-options="required: true" missingMessage="请输入车辆名称"></td>
	    <td  class="table_nemu" >类型</td>
	    <td class="table_con" ><input class="easyui-validatebox" name="rescueCars.carStyle"/></td>
	  </tr>
	  <tr >
	    <td  class="table_nemu" >型号</td>
	    <td class="table_con" ><input class="easyui-validatebox" name="rescueCars.carModle"/></td>
	    <td class="table_nemu" >吨位</td>
	    <td  class="table_con" ><input  name="rescueCars.tonnage"/>&nbsp;吨</td>
	  </tr>
	  <tr >
	    <td class="table_nemu" >数量</td>
	    <td class="table_con" ><input style="width: 50px"  name="rescueCars.number" data-options="required: true" missingMessage="请输入数量"/></td>
	    <td class="table_nemu" >自身是否带泵</td>
	    <td class="table_con" ><input class="easyui-combobox"  id="updHasPump" data-options="valueField: 'label',
				textField: 'value',
				data: [{
					label: '是',
					value: '是'
				},{
					label: '否',
					value: '否'
		        }],panelHeight:'auto',editable:false" style="width: 50" name="rescueCars.hasPump"/></td>
	 </tr>
	 <tr>	        
	    <td class="table_nemu" >是否自备运输车辆 </td>
	    <td class="table_con" colspan="3"><input class="easyui-combobox" id="updHasCarProvide" data-options="valueField: 'label',
				textField: 'value',
				data: [{
					label: '是',
					value: '是'
				},{
					label: '否',
					value: '否'
		        }],panelHeight:'auto',editable:false" style="width: 50"  name="rescueCars.hasCarProvide"/></td>
	  </tr>
	  <tr >
	    <td  class="table_nemu" >所属单位</td>
	    <td class="table_con" ><input class="easyui-validatebox" name="rescueCars.organize"/></td>
	    <td class="table_nemu" >所属部门</td>
	    <td  class="table_con" ><input class="easyui-validatebox" name="rescueCars.department"/></td>
	  </tr>
	   <tr >
	    <td  class="table_nemu" >负责人</td>
	    <td class="table_con" ><input class="easyui-validatebox" name="rescueCars.principal" data-options="required: true" missingMessage="请输入负责人"/></td>
	    <td class="table_nemu" >负责人手机</td>
	    <td  class="table_con" ><input class="easyui-validatebox" name="rescueCars.mobilePhone" data-options="required: true" missingMessage="请输入负责人手机"/></td>
	  </tr>
	  <tr height="100">
	    <td class="table_nemu">备注</td>
	    <td colspan="5" class="table_con"><textarea  style="width: 400;height: 100;" class="easyui-validatebox" name="rescueCars.remark" type="textarea" ></textarea></td>
	  </tr>
		</table>
			<br/>
	        <div align="center" >
	            <a href="#" class="easyui-linkbutton" icon="icon-ok" onclick="updateSubmitForm();return false;">确定</a>
	            <a href="#" class="easyui-linkbutton" icon="icon-cancel" onclick="closeAllWin();return false;">取消</a>
	        </div> 
   	</form>
</div>
</div>
<!-- 查看窗口 -->
<div style="display: none">
	<div id="viewWin" iconCls="icon-save" title="查看救援车辆信息">
	<form style="padding: 10px 20px 10px 20px;">
	    <table cellpadding="5px" style="font-size:12px;"  cellspacing="1"  border="0" bgcolor="#aed0ea">
	   		 <tr >
	    <td class="table_nemu" >车辆名称</td>
	    <td  class="table_con" ><label name="rescueCars.carName"/></td>
	    <td  class="table_nemu" >类型</td>
	    <td class="table_con" ><label name="rescueCars.carStyle"/></td>
	  </tr>
	  <tr >
	    <td  class="table_nemu" >型号</td>
	    <td class="table_con" ><label name="rescueCars.carModle"/></td>
	    <td class="table_nemu" >吨位</td>
	    <td  class="table_con" ><label name="rescueCars.tonnage"/>&nbsp;吨</td>
	  </tr>
	  <tr >
	    <td class="table_nemu" >数量</td>
	    <td class="table_con" ><label name="rescueCars.number"/></td>
	    <td class="table_nemu" >自身是否带泵</td>
	    <td class="table_con" ><label  style="width: 50" name="rescueCars.hasPump"/></td>
	  </tr>
	  <tr>  
	    <td class="table_nemu" >是否自备运输车辆 </td>
	    <td class="table_con" colspan="3"><label style="width: 50"  name="rescueCars.hasCarProvide"/></td>
	  </tr>
	  <tr >
	    <td  class="table_nemu" >所属单位</td>
	    <td class="table_con" ><label name="rescueCars.organize"/></td>
	    <td class="table_nemu" >所属部门</td>
	    <td  class="table_con" ><label name="rescueCars.department"/></td>
	  </tr>
	   <tr >
	    <td  class="table_nemu" >负责人</td>
	    <td class="table_con" ><label name="rescueCars.principal"/></td>
	    <td class="table_nemu" >负责人手机</td>
	    <td  class="table_con" ><label name="rescueCars.mobilePhone"/></td>
	  </tr>
	  <tr height="100">
	    <td class="table_nemu">备注</td>
	    <td colspan="5" class="table_con"><label   class="easyui-validatebox" name="rescueCars.remark" /></td>
	  </tr>
			
		</table>
					<br />
					<div align="center">
						<a href="#" class="easyui-linkbutton" icon="icon-print"
							onclick="printWin();return false;" id="print">打印</a>
						<a href="#" class="easyui-linkbutton" icon="icon-cancel"
							onclick="closeAllWin();return false;"id="cancel">取消</a>
					</div>
				</form>
			</div>
		</div>
</body>
</html>