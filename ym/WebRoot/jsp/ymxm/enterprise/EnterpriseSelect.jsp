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
	$(document).ready( function() {
		var enterpriseGrid_setting = {
				title : '',
				iconCls : 'icon-edit',
				nowrap : false,
				striped : true,
				border : true,
				collapsible : false,
				fit : true,
				url : '${ctx}/enterprise/enterpriseAction!list.action',
				remoteSort : false,
				idField : 'id',
				singleSelect : true,
				pagination : true,
				rownumbers : true,
				loadMsg:"正在努力拉取数据中...",
				fit : true,
			    fitColumns:true,
				frozenColumns : [],
				toolbar : '',
			    onLoadSuccess: function(data){}		          
		};
		$('#enterpriseGrid_').datagrid(enterpriseGrid_setting);
		var enterpriseGrid_pageController = $('#enterpriseGrid_').datagrid('getPager');

		var enterpriseGrid_pageSettings = {
			pageSize : 10,
			pageList : [ 10, 15, 20, 30 ],
			beforePageText : '第',
			afterPageText : '页    共{pages} 页',
			displayMsg : '当前显示 {from} - {to} 条记录  共{total}条记录',
			buttons :[{
				iconCls:"icon-search",
				handler : function(){
					var num = enterpriseGrid_pageController.data().pagination.bb.num.val();
					enterpriseGrid_pageController.pagination("select",num);
				}
			}]
			
		};
		$(enterpriseGrid_pageController).pagination(enterpriseGrid_pageSettings);
		
	});
</script>
<div class="panel-header" style="width:100%;">
<div class="panel-title panel-with-icon">选择企业信息</div>
<div class="panel-icon icon-edit"></div>
<div class="panel-tool"></div>
</div>
<div class="datagrid-toolbar" id = "tb" style="padding-left:0px;">
 <div id="search">
        <form id="enterpriseGrid_searchForm" method="post" style="display: inline;">
        &nbsp;&nbsp;单位组织机构代码:&nbsp;&nbsp;<input type="text" name="enterprise.corpCode" />
		&nbsp;&nbsp;单位名称:&nbsp;&nbsp;<input type="text" name="enterprise.corpName" />
        &nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="enterpriseGrid_searchForm();">查询</a>
		&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="enterpriseGrid_clearSearchForm();">清空</a>
        </form>
    </div>
</div>
<div class="search_add">
</div>
<div style="height:50%;">
    <table id="enterpriseGrid_" style="display:none">
        <thead>
        <tr>
            <th align="center" field="corpCode" width="150">单位组织机构代码</th>
            <th align="center" field="corpName" width="150">单位名称</th>
            <th align="center" field="id" width="50" formatter="erenterpriseGrid_gridFormatt">操作</th>          
        </tr>
        </thead>
    </table>
</div>

</body>
</html>