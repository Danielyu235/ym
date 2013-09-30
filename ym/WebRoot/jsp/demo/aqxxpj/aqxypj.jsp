<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="gb2312" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��ȫ��������</title>
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


	//��ղ�ѯ��
	function clearSearchForm() {
		$("#searchForm")[0].reset();
	}


</script>
</head>
<body>

<div class="panel-header" style="width:100%;">
	<div class="panel-title panel-with-icon">��ȫ��������</div>
	<div class="panel-icon icon-edit"></div>
	<div class="panel-tool"></div>
</div>

<div class="datagrid-toolbar" id = "tb" style="padding-left: 0px; height:10px;">
	 <div id="search">
        <form id="searchForm" method="post" style="display: inline;">
        &nbsp;&nbsp;Ա������:&nbsp;&nbsp;<input class="easyui-validatebox"  name="rescueCars.carName" >
        &nbsp;&nbsp;Ա������:&nbsp;&nbsp;<input class="easyui-validatebox" id="carStyle_s" name="rescueCars.carStyle">
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
<div style="height:70%;">
    <table id="tt" class="easyui-datagrid" style="display:none" fitColumns=true pagination=true fit="true" rownumbers="true">
        <thead>
        <tr>
        	<th field="uNumber" width="200px" align="center" title="uNumber">Ա�����</th>
            <th field="carName" width="400px" align="center" title="carName">Ա������</th>
            <th field="carStyle" width="200px" align="center" title="carStyle">��Ա��ȫ��������</th>
            <th field="carModle" width="250px" align="center" title="carModle">��Աְҵ����</th>
            <th field="number" width="150px" align="center" title="number">�ճ���Υ����</th>
            <th field="ryrczt" width="150px" align="center" title="number">��Ա�ճ�״̬</th>
            <th field="ryrckqjc" width="150px" align="center" title="number">��Ա�ճ����ڡ�����</th>
            <th field="total" width="150px" align="center" title="total">�ܷ�</th>
            <th  field="id" width="150px" align="center" formatter="gridFormatter">����</th>     
        </tr>
        </thead>
        <tbody>
          <tr>
          	 <td>110003</td>
             <td>���б�</td>
             <td>30</td>
             <td>10</td>
             <td>30</td>
             <td>10</td>
             <td>20</td>
             <td>100</td>
          </tr>
          <tr>
          	 <td>110303</td>
             <td>���ͻ�</td>
             <td>30</td>
             <td>10</td>
             <td>20</td>
             <td>10</td>
             <td>20</td>
             <td>90</td>
          </tr>
          <tr>
          	 <td>113003</td>
             <td>����</td>
             <td>10</td>
             <td>10</td>
             <td>10</td>
             <td>10</td>
             <td>10</td>
             <td><font color="red">50</font></td>
          </tr>
          <tr>
          	 <td>113503</td>
             <td>����ΰ</td>
             <td>15</td>
             <td>10</td>
             <td>10</td>
             <td>10</td>
             <td>10</td>
             <td><font color="red">55</font></td>
          </tr>
          <tr>
          	 <td>113503</td>
             <td>�����</td>
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