<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>隐患确认</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtilCheckbox.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<script type="text/javascript">
$(document).ready(
 	function (){
 		grid = new Grid('${ctx}/hiddenPerils/hiddenPerilsAction!listPerils2', 'data_list', {
 			onLoadSuccess: function(data) {
 			//onloadCombobox ：合并list列表中相同数据列  workingFaceName是索要合并的字段
 				var nameTemp = null;
 				var index = 0;
 				var rowspan = 1;
 				$.each(data.rows, function(i, v){
 					if(v.cadresId == nameTemp) {
 						rowspan++;
 					} else {
 						if(rowspan != 1) {
			 				$('#data_list').datagrid('mergeCells',{field:'cadresId','index':index,'rowspan':rowspan});
			 				$('#data_list').datagrid('mergeCells',{field:'name','index':index,'rowspan':rowspan});
		 					$('#data_list').datagrid('mergeCells',{field:'cadresLevel','index':index,'rowspan':rowspan});
		 					$('#data_list').datagrid('mergeCells',{field:'position','index':index,'rowspan':rowspan});
		 					$('#data_list').datagrid('mergeCells',{field:'department','index':index,'rowspan':rowspan});
 						}
 						nameTemp = v.cadresId; 
 						index = i;
 						rowspan = 1;
 					}
 				});
 				if(rowspan != 1) {
 					$('#data_list').datagrid('mergeCells',{field:'cadresId','index':index,'rowspan':rowspan});
 					$('#data_list').datagrid('mergeCells',{field:'name','index':index,'rowspan':rowspan});
 					$('#data_list').datagrid('mergeCells',{field:'cadresLevel','index':index,'rowspan':rowspan});
 					$('#data_list').datagrid('mergeCells',{field:'position','index':index,'rowspan':rowspan});
 					$('#data_list').datagrid('mergeCells',{field:'department','index':index,'rowspan':rowspan});
				}
 			}
 			});
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'hiddenPerils',
			moduleName:'干部走动隐患',
			url:'${ctx}/hiddenPerils/hiddenPerilsAction'
		});
 	}
  ); 
  //页面显示（判断每个单元格内容字符长度是否大于25，大于部分用...省略）
   function gridFormatterLength(value, rowData, rowIndex) {
        	if(value==null || value == '' || value == 'undefined')
        		return '';
    		if(value.length > 15)
    			return value.substring(0, 15) + '...';
    		return value;
    	}
   function gridFormatterlevelLength(value, rowData, rowIndex) {
   	if(value==null || value == '' || value == 'undefined')
   		return '';
		
			return value.substring(0, 2);
		
	}
   function gridFormatterColor(value, rowData, rowIndex) {
      	if(value=="红色，较大隐患。")
      		return '<div style="background-color: red;height: 20px;width:30px;border: 1px;border-style:outset"></div>';
   		if(value=="黄色，较大隐患。")
   			return '<div style="background-color: yellow;height: 20px;width:30px;border: 1px;border-style:outset"></div>';
      	if(value == "白色，一般隐患。")
      		return '<div style="background-color: white;height: 20px;width:30px;border: 1px;border-style:outset"></div>';
  	}
//数据操作
function gridFormatter(value, rowData, rowIndex) {
	var rowId = rowData.hiddenId;
	var url = "";
	<shiro:hasPermission name="48:update">
	url += "<a title=\"确认完成\" onclick='confirms(\""+rowId+"\");' class='btn2' ><img src=\"${ctx}/images/qrwc.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	return url;
}
//确认是否完成
function confirms(id) {
	$.messager.confirm('警告', '该记录是否已落实?', function (r) {
            if (r) {
            	$.ajax({
			        url: '${ctx}/hiddenPerils/hiddenPerilsAction!updatePerils.action?perilsData.id=' + id+'&perilsData.status=2',
			        method:'POST',
			        success:function (data) {
			        	grid.loadGrid();
			        }
			    });
            }
        });
}
</script>
</head>
<body>

<div class="panel-header" style="width:100%;">
		<div class="panel-title panel-with-icon">隐患确认</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
	 <div>
	        <form id="searchForm" method="post" style="display: inline;">
            <div style="margin-top:-8px;">
	&nbsp;&nbsp;挂牌ID:&nbsp;&nbsp;<input type="text" name="hiddenPerils.cadresId" />
	&nbsp;&nbsp;挂牌姓名:&nbsp;&nbsp;<input type="text" name="hiddenPerils.name"/>
		&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search()">查询</a>
		&nbsp;&nbsp;
	<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch();">清空</a>
            </div>
	        </form>
	    </div>
        </div>
	<!-- 表单表头 -->
	<div style="height:74%;">
	    <table id="data_list" style="display:none">
	        <thead>
	        <tr>
	        <th align="center" field="cadresId" width="50" formatter="gridFormatterLength" >挂牌ID</th>
            <th align="center" field="name" width="100" formatter="gridFormatterLength" >挂牌姓名</th>
            <th align="center" field="department" width="100" formatter="gridFormatterLength" >部门</th>
            <th align="center" field="level" width="50" formatter="gridFormatterlevelLength" >隐患级别</th>
            <th align="center" field="color" width="50" formatter="gridFormatterColor" >三色单</th>
            <th align="center" field="htAddress" width="200" formatter="gridFormatterLength" >隐患地点</th>
            <th align="center" field="measure" width="150" formatter="gridFormatterLength" >整改措施</th>
            <th align="center" field="report" width="150" formatter="gridFormatterLength" >整改结果</th>
            <th align="center" field="shift" width="50" formatter="gridFormatterLength" >班次</th>
            <th align="center" field="people" width="100" formatter="gridFormatterLength" >整改人</th>
            <th align="center" field="walkDate" width="100" formatter="gridFormatterLength" >走动日期</th>
            <th align="center" field="listedDate" width="100" formatter="gridFormatterLength" >挂牌时间</th>
           <!--  <th align="center" field="id" width="100" formatter="gridFormatter">操作</th> -->   
	        </tr>
	        </thead>
	    </table>
	</div>
</body>
</html>