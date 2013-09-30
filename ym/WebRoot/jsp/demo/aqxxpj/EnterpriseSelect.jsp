<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="gb2312" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>企业信息</title>
</head>
<body>
<script type="text/javascript">
	function enterpriseGrid_selectFunction(id, corpName) {
		if(eSelect == null) {
			$.messager.alert('错误','请定义eSelect变量!');  
			return;
		}
		if(typeof eSelect.callBack != 'function'){
			$.messager.alert('错误','请传递的回调函数!');  
			return;
		}
		eSelect.callBack(id, corpName);
	}
	function enterpriseGrid_searchForm() { 
		var params = {
				'enterprise.corpCode':$('input[name="enterprise.corpCode"]').val(),
				'enterprise.corpName':$('input[name="enterprise.corpName"]').val()
		};
		$('#enterpriseGrid_').datagrid('load', params);
	}
	function enterpriseGrid_clearSearchForm() {
		$('#enterpriseGrid_searchForm')[0].reset();
	}
	function erenterpriseGrid_gridFormatt(value, rowData, rowIndex) {
		var rowId = rowData.id;
		var url = "";
		url += "<a title=\"选择\" onclick='enterpriseGrid_selectFunction(\""+rowId+"\",\""+rowData.corpName+"\");' class='btn2'><img src=\"${ctx}/images/choose.png\"></img></a>&nbsp;&nbsp;&nbsp;&nbsp;";
		return url;
	}
</script>
<div class="panel-header" style="width:100%;">
<div class="panel-title panel-with-icon">选择企业信息</div>
<div class="panel-icon icon-edit"></div>
<div class="panel-tool"></div>
</div>
<div class="datagrid-toolbar" id = "tb" style="padding-left:0px;">
 <div id="search">
        <form id="enterpriseGrid_searchForm" method="post" style="display: inline;">
        &nbsp;&nbsp;工号:&nbsp;&nbsp;<input type="text" name="enterprise.corpCode" />
		&nbsp;&nbsp;员工姓名:&nbsp;&nbsp;<input type="text" name="enterprise.corpName" />
        &nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="enterpriseGrid_searchForm();">查询</a>
		&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="enterpriseGrid_clearSearchForm();">清空</a>
        </form>
    </div>
</div>
<div class="search_add">
</div>
<div style="height:78%;">
    <table class="easyui-datagrid" style="display:none" fitColumns=true pagination=true fit="true">
        <thead>
        <tr>
            <th field="carName" width="150px" align="center" title="carName">工号</th>
            <th field="carStyle" width="150px" align="center" title="carStyle">员工姓名</th>
            <th field="carModle" width="150px" align="center" title="carModle">岗位</th>
            <th align="center" field="id" width="50" formatter="erenterpriseGrid_gridFormatt">操作</th>          
        </tr>
        </thead>
        <tbody>
          <tr>
             <td>231003</td>
             <td>沈风廷</td>
             <td>皮带一队</td>
          </tr>
           <tr>
             <td>231004</td>
             <td>李尚峰</td>
             <td>机电维修</td>
          </tr>
        </tbody>
    </table>
</div>

</body>
</html>