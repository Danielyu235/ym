<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>发布事故通知</title>
	<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
</head>
<body>
	<div class="datagrid-toolbar" id = "tb" style="padding-left: 0px; height:10px;">
		<div>
	        <form id="searchForm" method="post" style="display: inline;">
		        <div style="margin-top:-8px">
		        &nbsp;&nbsp;指挥中心名称:&nbsp;&nbsp;<input type="text" name="headquarters.name" />
				&nbsp;&nbsp;负责人:&nbsp;&nbsp;<input type="text" name="headquarters.personincharge" />
		        &nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search();">查询</a>
				&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch();">清空</a>
		        &nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" onclick="publish();">进入启动预案</a>
		        </div>
	        </form>
		</div>
	</div>
	<br/>
	<div style="height:74%;">
	    <table id="data_list" style="display:none">
	        <thead>
		        <tr>
		            <th align="center" field="name" width="200" formatter="gridFormatterLength" >指挥中心名称</th>
		            <th align="center" field="address" width="200" formatter="gridFormatterLength" >指挥中心地址</th>
		            <th align="center" field="phoneNumber" width="150" formatter="gridFormatterLength" >指挥中心电话</th>
		            <th align="center" field="personincharge" width="100" formatter="gridFormatterLength" >负责人</th>
		            <th align="center" field="chargePhoneNumber" width="100" formatter="gridFormatterLength" >负责人电话</th>
		            <th align="center" field="id" width="120" formatter="gridFormatter">操作</th>     
		        </tr>
	        </thead>
	    </table>
	</div>
	
	<div id="person" class="easyui-window" title="发布通知"
    	data-options="modal:true,closed:true,minimizable:false,maximizable:false,resizable:false" style="width:1000px;height:500px;top:20px;padding:10px" >  
    	<textarea rows="5" cols="80" id="messageContext"></textarea>
    	<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-save" >发布通知</a>
    	<br><br>
    	<div style="width:90%;height:75%">    		
	    	<table id="data_List2" class="easyui-datagrid" style="height:300px">
	    		<thead>  
				    <tr>
				    	<th data-options="field:'category',width:40">组别</th>
						<th data-options="field:'name',width:30,align:'center'">姓名</th>
					    <th data-options="field:'phoneNumber',width:30,align:'center'">手机</th>
					</tr>  
			    </thead>
	    	</table>
    	</div>
    </div>	
	
	<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
	<script type="text/javascript">
	var idText='';//事故id
	var typeText='';//事故类型
	var cid ='';//指挥部Id
	var accidentType='';
		$(document).ready(function (){
			var types = getArgs();
			idText=types.id;
			typeText=types.type;
	 		grid = new Grid('${ctx}/headquarters/headquartersAction!list?headquarters.type='+typeText, 'data_list');
			grid.loadGrid();
			crud = new Crud({
				grid:grid, 
				entityName:'headquarters',
				moduleName:'应急指挥中心',
				url:'${ctx}/headquarters/headquartersAction'
				
			});
		 });        
	 //获取URL参数
  function getArgs() {
	     var url = location.search; //获取url中"?"符后的字串
	   var theRequest = new Object();
	   if (url.indexOf("?") != -1) {
	      var str = url.substr(1);
	      strs = str.split("&");
	      for(var i = 0; i < strs.length; i ++) {
	         theRequest[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);//添加到对象中
	      }
	   }
	   return theRequest;                              
	} 
        function gridFormatterLength(value, rowData, rowIndex) {
        	if(value==null || value == '' || value == 'undefined')
        		return '';
    		if(value.length > 25)
    			return value.substring(0, 25) + '...';
    		return value;
    	}

        //加载表单操作列
        function gridFormatter(value, rowData, rowIndex) {
        	var rowId = rowData.id;
        	var url = "";
        	url += "<a title=\"通知\" onclick='openPerson(\""+rowData.id+"\")' class='btn2'><img src=\"${ctx}/images/fbtz.png\"></a>";
        	return url;
        }
	    function openPerson(id){
	    	$("#person").window("open");
	    	cid = id;
	    	grid2 = new Grid('${ctx}/headquarters/headquartersAction!plist?hperson.hid='+id, 'data_List2');
			grid2.loadGrid();
			$.ajax({
		        url: '${ctx}/platformRescue/platformRescueAction!getById?id=' + idText,
		        method:'POST',
		        success:function (data) {
		        	accidentType=data.bigAccidentTypes;
		        	$("#messageContext").val("在"+data.accidentOfTime+",发生了"+data.bigText+",地址："+data.accidentOfPlace);
		        }
		    });
	    }
	    
	    function publish(){
	    	if(accidentType==''||accidentType == null){
	   			$.messager.show({
	                title:'提示',
	               	msg:"请先发布通知相关人员!",
	                timeout:2000,
		            showType:'slide'
	             });
	          return;
	    	}
	    	parent.viewChildFunction('/ym/jsp/hazards/rescue/PlanRescue.jsp?bigAccidentTypes='+accidentType+"&id="+cid+"&aid="+idText,'启动应急预案');
	    }
	</script>
</body>
</html>