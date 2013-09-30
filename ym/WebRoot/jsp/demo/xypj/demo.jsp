<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>职工信誉评价</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.PrintArea.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<script type="text/javascript">
         //加载表单操作列
function gridFormatter(value, rowData, rowIndex) {
	var rowId = rowData.id;
	var url = ""
	<shiro:hasPermission name="48:view">
	url += "<a title=\"查看\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"${ctx}/images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	<shiro:hasPermission name="48:update">
	url += "<a title=\"修改\" onclick='crud.update(\""+rowId+"\");' class='btn2'><img src=\"${ctx}/images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	url += "<a title=\"统计图\" href='${ctx}/Highcharts-3.0.1/examples/line-basic/index.htm' class='btn2'>统计图</a>&nbsp;&nbsp;&nbsp;&nbsp;";
	return url;
}Z

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
		<div class="panel-title panel-with-icon">职工信誉评价列表</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
	 <div>
	        <form id="searchForm" method="post" style="display: inline;">
            <div style="margin-top:-8px;">
				&nbsp;&nbsp;员工工号:&nbsp;&nbsp;<input type="text" name="coal.dangerous" />
				&nbsp;&nbsp;员工姓名:&nbsp;&nbsp;<input type="text" name="coal.loss" />
				&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search();">查询</a>
				&nbsp;&nbsp;
				<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch();">清空</a>
            </div>
	        </form>
	    </div>
        </div>
<br/>
<br/>
<!-- 表单表头 -->
<div style="height:68%;">
    <table class="easyui-datagrid" id="tt" style="display:none" width="1250" fitColumns=true pagination=true height="540px" fit="true">
        <thead>
        <tr>
            <th field="carName" width="150" align="center" title="carName">员工工号</th>
            <th field="carStyle" width="150" align="center" title="carStyle">员工姓名</th>
            <th field="number" width="150" align="center" title="number">所在岗位</th>
            <th field="yf" width="150" align="center" title="carModle">考核月份(月)</th>
            <th field="carModle" width="150" align="center" title="carModle">员工信誉成绩</th>
            <th align="center" field="id" width="150" formatter="gridFormatter">操作</th>     
        </tr>
        </thead>
        <tbody>
        	<tr>
             <td>ymcjb001</td>
             <td>李四</td>
             <td>采掘部</td>
             <td>2013-04</td>
             <td><a href="score.jsp" target="_blank">70</a></td>
          </tr>
          <tr>
             <td>ymjdk001</td>
             <td>张三</td>
             <td>机电科</td>
             <td>2013-03</td>
              <td><a href="score.jsp" target="_blank">80</a></td>
          </tr>
          <tr>
          	<td>ymjdk001</td>
             <td>张三</td>
             <td>机电科</td>
             <td>2013-04</td>
              <td><a href="score.jsp" target="_blank">84</a></td>
          </tr>
        </tbody>
    </table>
</div>

</body>
</html>