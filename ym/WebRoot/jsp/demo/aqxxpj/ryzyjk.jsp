<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="gb2312" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>人员职业健康</title>

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
 	eSelect = new Select('选择','${ctx}/jsp/demo/aqxxpj/EnterpriseSelect.jsp'
	    		 , null, function(id, corpName) {
	    	        $('input[name="rescueCars.carName"]').val("231004");
	    	        $('input[name="rescueCars.carStyle"]').val("李尚峰");
	    	        $('input[name="rescueCars.carModle"]').val("机电维修专业");
	    	        $('input[name="rescueCars.tonnage"]').val("机电维修");
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
	<div class="panel-title panel-with-icon">人员职业健康</div>
	<div class="panel-icon icon-edit"></div>
	<div class="panel-tool"></div>
</div>

<div class="datagrid-toolbar" id = "tb" style="padding-left: 0px;height:10px;">
	 <div id="search">
        <form id="searchForm" method="post" style="display: inline;">
        &nbsp;&nbsp;工号:&nbsp;&nbsp;<input class="easyui-validatebox"  name="rescueCars.carName" >
        &nbsp;&nbsp;员工姓名:&nbsp;&nbsp;<input class="easyui-validatebox"  name="rescueCars.carStyle" >
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
            <th field="carName" width="150px" align="center" title="carName">工号</th>
            <th field="carStyle" width="150px" align="center" title="carStyle">员工姓名</th>
            <th field="carModle" width="150px" align="center" title="carModle">岗位</th>
            <th field="number" width="150px" align="center" title="number">体检正常</th>
            <th field="id" width="150px" align="center" formatter="gridFormatter">操作</th>     
        </tr>
        </thead>
        <tbody>
          <tr>
             <td>231003</td>
             <td>沈风廷</td>
             <td>皮带一队</td>
             <td>正常</td>
          </tr>
           <tr>
             <td>231004</td>
             <td>李尚峰</td>
             <td>机电维修</td>
             <td>正常</td>
          </tr>
        </tbody>
    </table>
</div>

<!-- 添加窗口 -->
<div style="display:none">
<div id="addWin" iconCls="icon-save" title="添加人员职业健康信息">
    <form  style="padding: 10px 20px 10px 20px;" id="addForm"  method="post" >
	    <table cellpadding="5px" style="font-size:12px;"  cellspacing="1"  border="0" bgcolor="#aed0ea">
	  <tr >
	    <td class="table_nemu_new" width="26%">工号</td>
	    <td  class="table_con" width="26%"><input class="easyui-validatebox" name="rescueCars.carName" disabled></td>
	    <td  class="table_nemu_new" width="26%">员工姓名</td>
	    <td class="table_con" width="26%"><input class="easyui-validatebox" name="rescueCars.carStyle" disabled/></td>
	  </tr>
	  <tr >
	    <td  class="table_nemu_new" >专业</td>
	    <td class="table_con" ><input class="easyui-validatebox" name="rescueCars.carModle" disabled/></td>
	    <td class="table_nemu_new" >岗位</td>
	    <td  class="table_con" ><input  name="rescueCars.tonnage" disabled/></td>
	  </tr>
	   <tr >
		<td class="table_nemu_new" >员工信息</td>
	    <td class="table_con" ><input type="button" value="单击选择" onclick="eSelect.open()"/></td>
	    <td class="table_nemu_new" >体检结果</td>
	    <td class="table_con" ><input class="easyui-combobox" data-options="valueField: 'label',
				textField: 'value',
				data: [{
					label: '正常',
					value: '正常'
				},{
					label: '非正常',
					value: '非正常'
		        }],panelHeight:'auto',editable:false" name="rescueCars.hasPump"/></td>	   
	 </tr>
	 

	  <tr height="100">
	    <td class="table_nemu_new" width="25%">备注</td>
	    <td colspan="5" class="table_con" width="25%"><textarea  style="width: 600;height: 100;" class="easyui-validatebox" name="rescueCars.remark" type="textarea" ></textarea></td>
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
</body>
</html>