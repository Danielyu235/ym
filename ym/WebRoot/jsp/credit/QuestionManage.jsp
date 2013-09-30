<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>试题管理</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<script type="text/javascript">
$(document).ready(
 	function (){
 		onloadCombobox('${ctx}','stlx',$('#quartersTypeId'),null,null);
 		onloadCombobox('${ctx}','stlx',$('#updQuartersTypeId'),null,null);
 		grid = new Grid('${ctx}/questionCredit/questionCreditAction!questionList', 'data_list');
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'questionCredit',
			moduleName:'试题管理',
			url:'${ctx}/questionCredit/questionCreditAction',
			afterViewLoadData:function(viewFormObject, data) {
				//$(viewFormObject).find('span[name="questionCredit.quartersTypeId"]').text(data.quartersTypeName);
			}
		});
 	}
  ); 
  //页面显示（判断每个单元格内容字符长度是否大于25，大于部分用...省略）
   function gridFormatterLength(value, rowData, rowIndex) {
        	if(value==null || value == '' || value == 'undefined')
        		return '';
    		if(value.length > 45)
    			return value.substring(0, 45) + '...';
    		return value;
    }
    //数据操作
	function gridFormatter() {
		var temp = this;
		var flag = true;
		var dates =window.parent.arr;
		var ids = new Array(); //先声明一维
		var addDates= new Array();//非第一次选择的试题数据（用于存放）
		var showDates= new Array();//非第一次选择的试题数据（用于显示）
	    var rows = grid.getSelectNodes();
	    if (rows.length == 0) {//判断是否选择了试题
	    $.messager.show({
                         title:'提示信息',
                         msg:"请选择要添加的题目！",
                         timeout:2000,
                         showType:'slide'
					});
	        return;
	    } else {
	        var i = 0;
	        if(dates == null){//判断是否是第一次添加
	        	flag = true;
		        for (i=0; i<rows.length; i++) {//一维长度为rows.length为变量，可以根据实际情况改变
			      	 ids[i]=new Array();//声明二维，每一个一维数组里面的一个元素都是一个数组
					 ids[i][0]=rows[i].id; 
					 ids[i][1]=rows[i].qsName; 
					 ids[i][2]=rows[i].qsTypeName;
				 }  
	        }else{
	        for(x=0; x<rows.length; x++){//遍历新选择的试题
	        	if(dates.length > 0){//原数组为清除空
		        	for(y=0; y<dates.length; y++){
		        		if((rows[x].id==dates[y][0]) && (dates[y][0]!="")){//判断是否是重复的数据
		        			 $.messager.show({
		                         title:'提示信息',
		                         msg:"您勾选第"+(x+1)+"题已添加，请取消勾选项再添加！",
		                         timeout:3000,
		                         showType:'slide'
							});
		        			flag =false;
		        			break;
		        		}else if((y == dates.length-1))//是否已经对比到原有 数组最后一个值
		        		{
		        			addDates[x]=new Array();
		        			for(m=0; m<dates.length; m++){
								 if(flag==true){
								 	addDates[x][0]=rows[x].id;
								 	addDates[x][1]=rows[x].qsName;
								 	addDates[x][2]=rows[x].qsTypeName;
								 	flag =true;
								 }
							 }
		        		}
		        	}
	        	}else{//原数组为空
	        		flag =true;
	        		addDates[x]=new Array();
	        		addDates[x][0]=rows[x].id;
					addDates[x][1]=rows[x].qsName;
					addDates[x][2]=rows[x].qsTypeName;
	        	}
	        }
	        for(n=0;n<addDates.length+dates.length;n++){//循环合并数组
	        	showDates[n]=new Array();
	        	if(n<dates.length){ //n小于原有数组长度
	        		showDates[n][0]=dates[n][0];
	        		showDates[n][1]=dates[n][1];
	        		showDates[n][2]=dates[n][2];
	        	}else if(addDates.length>0){//非第一次新增的数据
	        		showDates[n][0]=addDates[n-dates.length][0];
	        		showDates[n][1]=addDates[n-dates.length][1];
	        		showDates[n][2]=addDates[n-dates.length][2];
	        	}
	        }
	       }
	       if(flag){// 判断是否进行了“重复添加提示”
		      $.messager.show({
	                         title:'提示信息',
	                         msg:"添加操作已结束!",
	                         timeout:2000,
	                         showType:'slide'
							});
			}
	    }
	    if(dates == null)
	    {
	    	window.parent.arr = ids;
	    }
	    else 
	    {
	    	window.parent.arr = showDates;
	    }
	    window.parent.addTr();//调用父类添加方法
	}
</script>
</head>
<body>
<div class="panel-header" style="width:100%;">
		<div class="panel-title panel-with-icon">试题管理列表</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
	 <div>
	        <form id="searchForm" method="post" style="display: inline;">
            <div style="margin-top:-8px;">
			&nbsp;&nbsp;题目:&nbsp;&nbsp;<input type="text" name="questionCredit.qsName"style="width: 120px;" />
			&nbsp;&nbsp;岗位类型:&nbsp;&nbsp;<input type="text" name="questionCredit.quartersTypeId" id="quartersTypeId" style="width: 120px;"/>
			&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search()">查询</a>
			&nbsp;&nbsp;
			<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch();">清空</a>
            </div>
	        </form>
	    </div>
        </div>
        <div class="search_add">
		<shiro:hasPermission name="48:add">
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add', plain:true" onclick="gridFormatter()">添加</a>
		</shiro:hasPermission>
        </div>
<!-- 表单表头 -->
	<div style="height:74%;">
	    <table id="data_list" style="display:none">
	        <thead>
	        <tr>
	        <th align="center" field="qsName" width="250" formatter="gridFormatterLength" >题目</th>
	        <th align="center" field=qsTypeName width="70" formatter="gridFormatterLength" >试题类型</th>
            <th align="center" field="quartersTypeName" width="50" formatter="gridFormatterLength" >岗位类型</th>
            <th align="center" field="remarks" width="150" formatter="gridFormatterLength" >备注</th>       
        </thead>
	    </table>
	</div>
</body>
</html>