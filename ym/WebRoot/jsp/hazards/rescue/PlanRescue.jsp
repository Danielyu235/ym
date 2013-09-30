<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>启动预案</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtilCheckbox.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
<link rel="stylesheet" href="${ctx}/css/planCrud.css" type="text/css"></link>
<script type="text/javascript">
var sta;
var types;
var beginTime;
var planTypeText;//预案类型
$(document).ready(
 	function (){
	 	onloadCombobox('${ctx}', 'sglx', $('#big'),null, null);
	 	onloadCombobox('${ctx}', 'xyjb', $('#xyjb'),null, null);
	 	onloadCombobox('${ctx}', 'yajb', $('#yajb'),null, null);
	 	onloadCombobox('${ctx}', 'yalx', $('#yalx'),null, null);
 		 types = getArgs()//获取URL 参数值
 		 getPlan();//查询已启动的预案
		$('#cm').tabs({  //tab选项卡时事件
		   border:false,  
		   onSelect:function(title){  
			   if(title == "综合应急预案"){
		       		sta = 1;
		       }else if(title=="专项应急预案"){
		       		sta = 2;
		       }else{
		       		sta = 3;
		       }
			       init(types.bigAccidentTypes,sta);//初始化list
			   }  
		}); 
		$('#yalx').combobox({//下拉select事件
			onSelect: function(param){
			var peo = $('#yalx').combobox('getText');
			var ind=0;
			 if(peo == "综合应急预案"){
		       		ind = 0;
		       }else if(peo="专项应急预案"){
		       		ind = 1;
		       }else{
		       		ind = 2;
		       }
			$('#cm').tabs('select', ind);
		}
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
	//初始化
	function init(ty,sta){
		var src = null;
		$('#big').combobox('setValue',ty);  
		$('#sg').val(ty);
		if(sta == "1"){//判断预案类型
			src = '${ctx}/planRescue/planRescueAction!list';
		}else if(sta =="2"){
			src = '${ctx}/planRescue/planRescueAction!listSpe';
		}else{
			src = '${ctx}/planRescue/planRescueAction!listDis';
		}
		grid = new Grid(src, 'data_list_'+sta);
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'planRescue',
			moduleName:'预案',
			url:'${ctx}/planRescue/planRescueAction'
		});
		if(sta=="1"||sta=="2"){//保障预案不需带条件
			setTimeout(setTimes,1000);
		}
	}
	//调用查询
	function setTimes(){
		crud.search();
	}
	//获取预案信息
	function getPlan(){
		$.ajax({
        url:'${ctx}/logRescue/logRescueAction!getById?id='+types.aid,
        method:'POST',
        success:function(data) {
        if(data==null){
        	return;
        }
        sta=data.ptype;//更改预案类型
        planTypeText = data.ptype;
        beginTime=data.time;
        $('#cm').tabs('select', parseFloat(sta)-1);
        addPlan(data.pid);
        }
    });
	}
	//页面显示（判断每个单元格内容字符长度是否大于25，大于部分用...省略）
   function gridFormatterLength(value, rowData, rowIndex) {
        	if(value==null || value == '' || value == 'undefined')
        		return '';
    		if(value.length > 19)
    			return value.substring(0, 19) ;
    		return value;
   }
   //数据操作
function gridFormatter(value, rowData, rowIndex) {
	var rowId = rowData.id;
	var rowName=rowData.questionName;
	var url = "";
	<shiro:hasPermission name="48:view">
	url += "<a title=\"启动\" onclick='isFlagPwd(\""+rowData.pid+"\");planRes(\""+rowData.pid+"\")' class='btn2'><img src=\"${ctx}/images/jypt.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	<shiro:hasPermission name="48:view">
	url += "<a title=\"查看\" onclick='fillViewUrl(\""+rowData.pid+"\");' class='btn2'><img src=\"${ctx}/images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	return url;
}
//保障预案数据操作
function gridFormatters(value, rowData, rowIndex) {
	var rowId = rowData.id;
	var rowName=rowData.questionName;
	var url = "";
	<shiro:hasPermission name="48:view">
	url += "<a title=\"查看\" onclick='fillViewUrl(\""+rowData.pid+"\");' class='btn2'><img src=\"${ctx}/images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	return url;
}
//根据救援类型判断应该抓取那些页面 预案查看页面
  function fillViewUrl(id){
  var urlValue ='';
  var loadValue='';
  var entity = '';
  var type = '';
  	if(sta =="1"){
  		urlValue = '${ctx}/energencyPlan/energencyPlanAction';
  		loadValue='${ctx}/jsp/plan/multiple.html';
  		entity ='energencyPlan';
  		type="综合应急预案";
  	}else if(sta == "2"){
  		urlValue = '${ctx}/specialPlan/specialPlanAction';
  		loadValue='${ctx}/jsp/plan/special.html';
  		entity ='specialPlan';
  		type="专项应急预案";
  	}else{
  		urlValue = '${ctx}/tbPlanDisposal/tbPlanDisposalAction';
  		loadValue='${ctx}/jsp/plan/disposal.html';
  		entity ='tbPlanDisposal';
  		type="保障应急预案";
  	}
  	dialogs = {};
  	if(dialogs['' + entity]) {
  		var crud =  dialogs['' + entity];
  		crud.params.getByIdUrl = urlValue + '!getById';
		crud.params.viewFormTitle = '查看' + type + '信息';
		crud.params.entityName = entity;
		crud.view(id);
  	} else {
  		var dialogWrap = $('<div style="display:none;"></div>');
	  	var dialog = $('<div iconCls="icon-save" class="' + entity + '"></div>');
	  	$(dialog).appendTo($(dialogWrap));
	  	$(dialogWrap).appendTo('body');
	  	$(dialog).load(loadValue+" #viewWin",
	  		function(response,status,xhr){
		  	$(dialog).height($(dialog).find('#viewWin').height());
		  	$(dialog).find('#viewWin').height('auto');
		  	$(dialog).width($(dialog).find('#viewWin').width());
		  	$(dialog).find('#viewWin').width('auto');
	  		var crud = new Crud({'viewFormObject':$(dialog)});
	  		dialogs['' + entity] = crud;
	  		crud.params.getByIdUrl = urlValue + '!getById';
			crud.params.viewFormTitle = '查看' + type + '信息';
			crud.params.entityName = entity;
			crud.view(id);
	  	});
	  	
	  	}
  }
  //启动预案
function funDown(id,order){
	var cid = types.id;//指挥部Id
	var aid = types.aid;//事故Id
	var pid = id;//预案id
	var level = $("#xyjb").combobox('getValue');
	if(level==null||level == ''){
		$.messager.show({
                    title:'提示',
                    msg:"请选择事故响应级别!",
                    timeout:2000,
                    showType:'slide'
             });
             return;
	}
	var pwdData = order;//数据库存放值
	var pwdJsp = $("#pwd").val();//页面输入值
	if(pwdData != pwdJsp){
		$.messager.show({
                    title:'提示',
                    msg:"指令密码输入错误!",
                    timeout:2000,
                    showType:'slide'
             });
          return;
	}
	$.ajax({
        url:'${ctx}/logRescue/logRescueAction!add?logRescue.pid='+pid+'&logRescue.cid='+cid+'&logRescue.aid='+aid+'&logRescue.ptype='+sta+"&logRescue.level="+level,
        method:'POST',
        success:function(data) {
        	var data = eval('(' + data + ')');
            if (data.operateSuccess) {
                $.messager.show({
                    title:'成功',
                    msg:data.operateMessage,
                    timeout:2000,
                    showType:'slide'
                });
               updateOrder(aid);//修改指令密码
               addPlan(pid);//显示已启动的预案
            } else {
                $.messager.show({
                    title:'失败',
                    msg:data.operateMessage,
                    timeout:2000,
                    showType:'slide'
                });
            }
        }
    });
	
}
//根据事故Id获取指令密码
function isFlagPwd(id){
	var order ="";
	$.ajax({
        url:'${ctx}/platformRescue/platformRescueAction!getById?id='+types.aid,
        method:'POST',
        success:function(data) {
       	order = data.order;
        funDown(id,order);
        }
    });
   
}
//预案启动后修改密码
function updateOrder(aid){
	$.ajax({
        url:'${ctx}/platformRescue/platformRescueAction!update?platformRescue.id='+aid,
        method:'POST',
        success:function(data) {
        }
    });
}
//显示已启动预案
function addPlan(pid){
	var urlData='';
	$("#tc").find('.appendTable .appendClass').remove();
	if(sta == "1"){
		urlData = '${ctx}/energencyPlan/energencyPlanAction';
	}else if(sta == "2"){
		urlData ='${ctx}/specialPlan/specialPlanAction';
	}
	$.ajax({
		url: urlData+'!getById?id=' + pid,
		method:'POST',
		success:function (data) {
			$("#tc").height(110);
			 var ele = $('<table class="appendClass" style="padding-left: 0px;width:100%;border: 1 solid #c8f2ff;"><tr>'
			+'<td class="table_con" style="width:80px">预案名称：</td><td class="table_con">'+data.planName+'</td>'
			+'<td class="table_con" style="width:80px">事故类型：</td><td class="table_con">'+data.accidentTypeText+'</td>'
			+'<td rowspan="2" class="table_con" style="width:80px"><a title=\"删除\" onclick=\'deleteChild(\"'+data.id+'\");\'><img src="${ctx}/images/deleteRes.png" /></a>&nbsp;&nbsp;'
			+'<a title=\"应急职守\" onclick=\'activate(\"'+data.id+'\");\'><img src=\"${ctx}/images/yjzs.jpg\"></a></td></tr>'
			+'<tr><td class="table_con" style="width:80px">预案级别：</td><td class="table_con">'+data.planLevelText+'</td>'
			+'<td class="table_con" style="width:80px">建立时间：</td><td class="table_con">'+data.time+'</td>'
			+'</tr></table>');
			planTypeText = sta;//查询应急职守时所需预案类型
			$(ele).appendTo($("#tc").find('.appendTable'));
		 }
	});
}

function planRes(id){
  	$.ajax({
 			url : '${ctx}/planResource/planResourceAction!getResList?id='+id,
 			success : function(data) {
			 		$.each(data.listRes,function(i,item){
			 			 $.ajax({
		                    url:'${ctx}/logplanResource/logplanResourceAction!add.action',
		                    data:{'logplanResource.resId':item.resId,'logplanResource.name':item.name,'logplanResource.type':item.type,'logplanResource.accidentId':types.aid},
		                    method:'POST'
		                });
			 		});
			 } 	
		});
  }
//打开应急职守
function activate(ids){
	window.parent.viewChildFunction('/ym/jsp/emergencyRescue/activatePlans.jsp?cid='+types.id+'&aid='+types.aid+"&type="+planTypeText+'&pid='+ids+"&beginTime="+beginTime,'应急职守');
}
//删除启动预案
function deleteChild(ids){
$.messager.confirm('警告', '是否要删除该记录?', function (r) {
            if (r) {
				$.ajax({
			        url:'${ctx}/logRescue/logRescueAction!delete?logRescue.pid=' + ids + '&logRescue.cid=' +types.id + '&logRescue.aid='+types.aid,
			        method:'POST',
			        success:function(data) {
			        	var data = eval('(' + data + ')');
			            if (data.operateSuccess) {
			                $.messager.show({
			                    title:'成功',
			                    msg:data.operateMessage,
			                    timeout:2000,
			                    showType:'slide'
			                });
			                $("#tc").find('.appendTable .appendClass').remove();
			                  $("#tc").height(20);
			            } else {
			                $.messager.show({
			                    title:'失败',
			                    msg:data.operateMessage,
			                    timeout:2000,
			                    showType:'slide'
			                });
			               
			            }
			        }
			    });
            }
        });

}
</script>
</head>
<body>
 <div class="datagrid-toolbar" id = "tb" style="height:10px;padding-left: 0px;border: 1 solid #c8f2ff">
	 <div>
	        <form id="searchForm" method="post" style="display: inline;">
            <div style="margin-top:-8px;">
            <input type="hidden" id="sg"name="planRescue.bigAccidentType"/>
            &nbsp;&nbsp;预案类型：&nbsp;&nbsp;<input type="text" class="easyui-combobox" value="" id="yalx" data-options="panelHeight:'auto',width:'120'" style="width: 120px;" />
            &nbsp;&nbsp;事故类型：&nbsp;&nbsp;<input type="text" class="easyui-combobox" value="" id="big" data-options="panelHeight:'auto',width:'120'" style="width: 120px;"name="planRescue.accidentType" />
            &nbsp;&nbsp;预案级别：&nbsp;&nbsp;<input type="text" class="easyui-combobox" value="" id="yajb" data-options="panelHeight:'auto',width:'120'" style="width: 120px;"name="planRescue.planLevel" />
			&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search()">查询</a>
			</div>
			</form>
	</div>
   </div>
   <br/>
    <div class="datagrid-toolbar" id = "tc" style="padding-left: 0px;height:20px;border: 1 solid #c8f2ff">
	 <div class="appendTable">
	     已启动预案:
	</div>
   </div>
   <br/>
   <div class="datagrid-toolbar" id = "ta" style="padding-left: 0px;height:10px;border: 1 solid #c8f2ff">
	 <div>
           &nbsp;&nbsp;设置响应级别：&nbsp;&nbsp;<input type="text" class="easyui-combobox" value="" id="xyjb" data-options="panelHeight:'auto',width:'120'" style="width: 120px;" />
         &nbsp;&nbsp;启动预案指令密码：&nbsp;&nbsp;<input type="password" class="easyui-validatebox" value="" id="pwd" style="width: 120px;" />
	</div>
   </div>
   <br/>
   <div class="easyui-tabs" style="padding-left: 0px;height:400px;border: 1 solid #c8f2ff" id="cm">  
	   <div id="1" title="综合应急预案" style="padding:10px;" data-options="selected:true">  
		<div style="height:70%;">
			    <table id="data_list_1" style="display:none">
			        <thead>
			        <tr>
			        <th align="center" field="planName" width="100" formatter="gridFormatterLength" >预案名称</th>
					<th align="center" field="accidentTypeName" width="80" formatter="gridFormatterLength" >事故类型</th>
		            <th align="center" field="pCreateTime" width="80" formatter="gridFormatterLength" >建立时间</th>
		            <th align="center" field="planLevelName" width="50" formatter="gridFormatterLength" >预案等级</th>
		            <th align="center" field="id" width="50" formatter="gridFormatter">操作</th>         
		   			</tr>
			        </thead>
			    </table>
			</div>
		</div>
		<div id="2" title="专项应急预案" style="padding:10px;" data-options="selected:true">  
		<div style="height:70%;">
			    <table id="data_list_2" style="display:none">
			        <thead>
			        <tr>
			        <th align="center" field="planName" width="150" formatter="gridFormatterLength" >预案名称</th>
					<th align="center" field="accidentTypeName" width="150" formatter="gridFormatterLength" >预案事故类型</th>
		            <th align="center" field="pCreateTime" width="150" formatter="gridFormatterLength" >建立时间</th>
		            <th align="center" field="planLevelName" width="150" formatter="gridFormatterLength" >预案等级</th>
		            <th align="center" field="id" width="120" formatter="gridFormatter">操作</th>         
		   			</tr>
			        </thead>
			    </table>
			</div>
		</div>
		<div id="3" title="保障应急预案" style="padding:10px;" data-options="selected:true">  
		<div style="height:70%;">
			    <table id="data_list_3" style="display:none">
			        <thead>
			        <tr>
		            <th align="center" field="planName" width="150" formatter="gridFormatterLength" >预案名称</th>
					<th align="center" field="accidentTypeName" width="150" formatter="gridFormatterLength" >预案事故类型</th>
		            <th align="center" field="pCreateTime" width="150" formatter="gridFormatterLength" >建立时间</th>
		            <th align="center" field="planLevelName" width="150" formatter="gridFormatterLength" >预案等级</th>
		            <th align="center" field="id" width="120" formatter="gridFormatters">操作</th>         
		   			</tr>
			        </thead>
			    </table>
			</div>
		</div>
	</div>
</body>
</html>