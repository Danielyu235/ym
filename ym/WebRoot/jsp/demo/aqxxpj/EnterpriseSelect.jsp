<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="gb2312" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��ҵ��Ϣ</title>
</head>
<body>
<script type="text/javascript">
	function enterpriseGrid_selectFunction(id, corpName) {
		if(eSelect == null) {
			$.messager.alert('����','�붨��eSelect����!');  
			return;
		}
		if(typeof eSelect.callBack != 'function'){
			$.messager.alert('����','�봫�ݵĻص�����!');  
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
		url += "<a title=\"ѡ��\" onclick='enterpriseGrid_selectFunction(\""+rowId+"\",\""+rowData.corpName+"\");' class='btn2'><img src=\"${ctx}/images/choose.png\"></img></a>&nbsp;&nbsp;&nbsp;&nbsp;";
		return url;
	}
</script>
<div class="panel-header" style="width:100%;">
<div class="panel-title panel-with-icon">ѡ����ҵ��Ϣ</div>
<div class="panel-icon icon-edit"></div>
<div class="panel-tool"></div>
</div>
<div class="datagrid-toolbar" id = "tb" style="padding-left:0px;">
 <div id="search">
        <form id="enterpriseGrid_searchForm" method="post" style="display: inline;">
        &nbsp;&nbsp;����:&nbsp;&nbsp;<input type="text" name="enterprise.corpCode" />
		&nbsp;&nbsp;Ա������:&nbsp;&nbsp;<input type="text" name="enterprise.corpName" />
        &nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="enterpriseGrid_searchForm();">��ѯ</a>
		&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="enterpriseGrid_clearSearchForm();">���</a>
        </form>
    </div>
</div>
<div class="search_add">
</div>
<div style="height:78%;">
    <table class="easyui-datagrid" style="display:none" fitColumns=true pagination=true fit="true">
        <thead>
        <tr>
            <th field="carName" width="150px" align="center" title="carName">����</th>
            <th field="carStyle" width="150px" align="center" title="carStyle">Ա������</th>
            <th field="carModle" width="150px" align="center" title="carModle">��λ</th>
            <th align="center" field="id" width="50" formatter="erenterpriseGrid_gridFormatt">����</th>          
        </tr>
        </thead>
        <tbody>
          <tr>
             <td>231003</td>
             <td>���͢</td>
             <td>Ƥ��һ��</td>
          </tr>
           <tr>
             <td>231004</td>
             <td>���з�</td>
             <td>����ά��</td>
          </tr>
        </tbody>
    </table>
</div>

</body>
</html>