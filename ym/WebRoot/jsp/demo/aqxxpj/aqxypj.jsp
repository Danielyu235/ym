<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="gb2312" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>安全信誉评价</title>
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


	//清空查询框
	function clearSearchForm() {
		$("#searchForm")[0].reset();
	}


</script>
</head>
<body>

<div class="panel-header" style="width:100%;">
	<div class="panel-title panel-with-icon">安全信誉评价</div>
	<div class="panel-icon icon-edit"></div>
	<div class="panel-tool"></div>
</div>

<div class="datagrid-toolbar" id = "tb" style="padding-left: 0px; height:10px;">
	 <div id="search">
        <form id="searchForm" method="post" style="display: inline;">
        &nbsp;&nbsp;员工名称:&nbsp;&nbsp;<input class="easyui-validatebox"  name="rescueCars.carName" >
        &nbsp;&nbsp;员工分数:&nbsp;&nbsp;<input class="easyui-validatebox" id="carStyle_s" name="rescueCars.carStyle">
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
<div style="height:70%;">
    <table id="tt" class="easyui-datagrid" style="display:none" fitColumns=true pagination=true fit="true" rownumbers="true">
        <thead>
        <tr>
        	<th field="uNumber" width="200px" align="center" title="uNumber">员工编号</th>
            <th field="carName" width="400px" align="center" title="carName">员工名称</th>
            <th field="carStyle" width="200px" align="center" title="carStyle">人员安全教育考核</th>
            <th field="carModle" width="250px" align="center" title="carModle">人员职业健康</th>
            <th field="number" width="150px" align="center" title="number">日常三违处罚</th>
            <th field="ryrczt" width="150px" align="center" title="number">人员日常状态</th>
            <th field="ryrckqjc" width="150px" align="center" title="number">人员日常考勤、奖惩</th>
            <th field="total" width="150px" align="center" title="total">总分</th>
            <th  field="id" width="150px" align="center" formatter="gridFormatter">操作</th>     
        </tr>
        </thead>
        <tbody>
          <tr>
          	 <td>110003</td>
             <td>徐中彪</td>
             <td>30</td>
             <td>10</td>
             <td>30</td>
             <td>10</td>
             <td>20</td>
             <td>100</td>
          </tr>
          <tr>
          	 <td>110303</td>
             <td>付和华</td>
             <td>30</td>
             <td>10</td>
             <td>20</td>
             <td>10</td>
             <td>20</td>
             <td>90</td>
          </tr>
          <tr>
          	 <td>113003</td>
             <td>李湘</td>
             <td>10</td>
             <td>10</td>
             <td>10</td>
             <td>10</td>
             <td>10</td>
             <td><font color="red">50</font></td>
          </tr>
          <tr>
          	 <td>113503</td>
             <td>王宏伟</td>
             <td>15</td>
             <td>10</td>
             <td>10</td>
             <td>10</td>
             <td>10</td>
             <td><font color="red">55</font></td>
          </tr>
          <tr>
          	 <td>113503</td>
             <td>徐佳洛</td>
             <td>15</td>
             <td>10</td>
             <td>15</td>
             <td>10</td>
             <td>10</td>
             <td>60</td>
          </tr>
        </tbody>
    </table>
</div>

</body>
</html>