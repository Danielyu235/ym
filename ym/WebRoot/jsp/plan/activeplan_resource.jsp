<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看救援资源</title>
<script type="text/javascript" src="${ctx}/js/GridUtilNoToolBar.js"></script>
<script type="text/javascript" src="${ctx}/js/packCrud.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>

<script type="text/javascript">
var types;
var acId;
var id;
/*var suppliesColumn = [{checkbox:true},
                      {field:"wzmc",title:"物资名称",width:150,align:"center"},
                      {field:"wzlbtext",title:"物资类别",width:100,align:"center"},
                      {field:"wzsl", title:"物资数量",width:100,align:"center"},
                      {field:"cfwz", title:"存放位置",width:100,align:"center"}
					];*/
var carColumn = [{checkbox:true},
                 {field:"carName",title:"车辆名称",width:150,align:"center"},
                 {field:"carStyle",title:"车辆类型",width:80,align:"center"},
                 {field:"carModle",title:"车辆型号",width:80,align:"center"},
                 {field:"number",title:"数量",width:80,align:"center"},
                 {field:"hasPump",title:"自身带泵",width:80,align:"center"},
                 {field:"tonnage",title:"吨位",width:80,align:"center"}
                 ];
var teamColumn = [{checkbox:true},
                 {field:"teamname",title:"队伍名称",width:150,align:"center"},
                 {field:"teamtype",title:"队伍类型",width:80,align:"center"},
                 {field:"persons",title:"队伍人数",width:80,align:"center"},
                 {field:"headOf",title:"负责人",width:80,align:"center"},
                 {field:"headOfTel",title:"负责人电话",width:80,align:"center"},
                 {field:"headOfPhone",title:"负责人手机",width:80,align:"center"}
                 ];    
var shelterColumn = [{checkbox:true},
                  {field:"name",title:"场所名称",width:150,align:"center"},
                  {field:"address",title:"地址",width:180,align:"center"},
                  {field:"area",title:"住房面积",width:80,align:"center"},
                  {field:"number",title:"容纳人数",width:80,align:"center"}
                  ];                
var communicationOrTransportColumn = [{checkbox:true},
                     {field:"name",title:"机构名称",width:150,align:"center"},
                     {field:"carNumber",title:"车辆数量",width:180,align:"center"},
                     {field:"personnelNumber",title:"人员数量",width:80,align:"center"},
                     {field:"director",title:"负责人",width:80,align:"center"},
                     {field:"telephone",title:"负责人电话",width:80,align:"center"},
                     {field:"mobilePhone",title:"负责人手机",width:80,align:"center"}
                     ];  
var medicalColumn = [{checkbox:true},
                           {field:"jgmc",title:"机构名称",width:150,align:"center"},
                           {field:"syzxs",title:"所有制形式",width:180,align:"center"},
                           {field:"yljglbtext",title:"医疗机构类别",width:80,align:"center"},
                           {field:"yljgdj",title:"医疗机构等级",width:80,align:"center"},
                           {field:"jhry",title:"救护人员",width:80,align:"center"},
                           {field:"jhcl",title:"救护车辆",width:80,align:"center"}
                           ]; 
var expertColumn = [{checkbox:true},
                     {field:"name",title:"姓名",width:150,align:"center"},
                     {field:"age",title:"年龄",width:60,align:"center"},
                     {field:"specializedText",title:"专业",width:180,align:"center"},
                     {field:"officePhone",title:"办公室电话",width:80,align:"center"},
                     {field:"business",title:"现任职务",width:80,align:"center"}
                     ];                      
var technicalColumn = [{checkbox:true},
                    {field:"name",title:"机构名称",width:150,align:"center"},
                    {field:"mechanismSpeciality",title:"机构特长",width:60,align:"center"},
                    {field:"personnelNumber",title:"人员数量",width:180,align:"center"},
                    {field:"director",title:"负责人",width:80,align:"center"}
                    ];
						
var resourceTypeUrl = [//{url:"${ctx}/tbRescueSupplies/tbRescueSuppliesAction!list",text:"救援物资",name:"wzmc",column:suppliesColumn,selected:true},
                       {url:"${ctx}/rescueTeam/rescueTeamAction!list",text:"救援队伍",name:"teamname",column:teamColumn},
						{url:"${ctx}/rescueCars/rescueCarsAction!list",text:"救援车辆",name:"carName",column:carColumn},
						{url:"${ctx}/rescueExpert/rescueExpertAction!list",text:"救援专家",name:"carName",column:expertColumn},
						{url:"${ctx}/rescueMedical/rescueMedicalAction!list",text:"医疗保障",name:"jgmc",column:medicalColumn},
						{url:"${ctx}/tbRescueTransport/tbRescueTransportAction!list",text:"运输保障",name:"name",column:communicationOrTransportColumn},
						{url:"${ctx}/rescueCommunication/rescueCommunicationAction!list",text:"通讯保障",name:"name",column:communicationOrTransportColumn},
						{url:"${ctx}/rescueTechnical/rescueTechnicalAction!list",text:"技术支持",name:"name",column:technicalColumn},
						{url:"${ctx}/tbRescueShelter/tbRescueShelterAction!list",text:"避难场所",name:"name",column:shelterColumn}
					];
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
$(document).ready(
 	function (){
 		 types=getArgs();
 	 	 id=types.id;
 	 	acId=types.accidentId;
 	 	state=types.state;
 	 	//planRes(id);
 		 grid = new Grid('查看救援资源', 'icon-edit',
 				'${ctx}/logplanResource/logplanResourceAction!list.action?logplanResource.accidentId='+acId+'&logplanResource.id='+id,'data_list');
		//加载数据
         grid.loadGrid();
 	}
  );
  //救援资源 
  function planRes(id){
  	$.ajax({
 			url : '${ctx}/planResource/planResourceAction!getResList?id='+id,
 			success : function(data) {
			 		$.each(data.listRes,function(i,item){
			 			 $.ajax({
		                    url:'${ctx}/logplanResource/logplanResourceAction!add.action',
		                    data:{'logplanResource.resId':item.resId,'logplanResource.name':item.name,'logplanResource.type':item.type,'logplanResource.accidentId':types.accidentId},
		                    method:'POST'
		                });
			 		});
			 } 	
		});
  }
  var urlValue ='';
  var loadValue='';
  var entity = '';
  
   //抓取XX.jsp下的div
  function viewResFunction(value,type)
  {
  	var rowsid;
 	if (typeof value == "undefined") {
 		var rows = grid.getSelectNode();
 		rowsid = rows.expId;
 	} else {
 		rowsid = value;
 	}
  	//调用填充URL的方法
  	//$("#viewWin").window("destroy");
  	fillViewUrl(type);
  	dialogs = {};
  	if(dialogs['' + entity]) {
  		var crud =  dialogs['' + entity];
  		crud.params.getByIdUrl = urlValue + '!getById';
		crud.params.viewFormTitle = '查看' + type + '信息';
		crud.params.entityName = entity;
		crud.view(rowsid);
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
			crud.view(rowsid);
	  	});
  	}
  	
  }
  
  //根据救援类型判断应该抓取那些页面
  function fillViewUrl(type){
  
  	if(type == "救援车辆")
  	{
  		urlValue = '${ctx}/rescueCars/rescueCarsAction';
  		loadValue='${ctx}/jsp/ymxm/rescue/carsView.html';
  		entity ='rescueCars';
  	}
  	
  	if (type == "救援专家")
  	{
  		urlValue = '${ctx}/rescueExpert/rescueExpertAction';
  		loadValue='${ctx}/jsp/ymxm/rescue/expertView.html';
  		entity ='rescueExpert';
  	}
  	
  	if (type == "救援队伍")
  	{
  		urlValue = '${ctx}/rescueTeam/rescueTeamAction';
  		loadValue='${ctx}/jsp/ymxm/rescue/teamView.html';
  		entity ='rescueTeam';
  	}
  	
  	/*if (type == "救援物资")
  	{
  		urlValue = '${ctx}/tbRescueSupplies/tbRescueSuppliesAction';
  		loadValue='${ctx}/jsp/ymxm/rescue/suppliesView.html';
  		entity ='tbRescueSupplies';
  	}*/
  	if(type == "医疗保障"){
  		urlValue = '${ctx}/rescueMedical/rescueMedicalAction';
  		loadValue='${ctx}/jsp/ymxm/rescue/medicalView.html';
  		entity ='rescueMedical';
  	}
  	if(type == "运输保障"){
  		urlValue = '${ctx}/tbRescueTransport/tbRescueTransportAction';
  		loadValue='${ctx}/jsp/ymxm/rescue/transportView.html';
  		entity ='tbRescueTransport';
  	}
  	if(type == "通讯保障"){
  		urlValue = '${ctx}/rescueCommunication/rescueCommunicationAction';
  		loadValue='${ctx}/jsp/ymxm/rescue/communicationView.html';
  		entity ='rescueCommunication';
  	}
  	if(type == "技术支持"){
  		urlValue = '${ctx}/rescueTechnical/rescueTechnicalAction';
  		loadValue='${ctx}/jsp/ymxm/rescue/technicalView.html';
  		entity ='rescueTechnical';
  	}
  	if(type == "避难场所"){
  		urlValue = '${ctx}/tbRescueShelter/tbRescueShelterAction';
  		loadValue='${ctx}/jsp/ymxm/rescue/shelterView.html';
  		entity ='tbRescueShelter';
  	}
  }

//根据选择 删除信息
  function removeFunction() {
    var rows = grid.getSelectNodes();
    if (rows.length == 0) {
        $.messager.show({
            title:'提示',
            msg:'请选择要删除的行',
            timeout:2000,
            showType:'slide'
        });
        return;
    } else {
        var ids = new Array();
        $.messager.confirm('警告', '是否要删除该记录?', function (r) {
            if (r) {
                var i = 0;
                for (i=0; i<rows.length; i++) {
                    ids.push(rows[i].resId);
                }
                $.ajax({
                    url:'${ctx}/logplanResource/logplanResourceAction!deleteByIds?ids=' + ids,
                    method:'POST',
                    success:function(data) {
                    	var data = eval('(' + data + ')');
                        if (data.operateSuccess) {
                        	$.messager.alert('成功',data.operateMessage); 
                            grid.reloadGrid();
                        } else {
                        	$.messager.alert('失败',data.operateMessage); 
                        }
                    }
                });
            }
        });
    }
}

  //加载表单操作列
function gridFormatter(value, rowData, rowIndex) {
	var rowId = rowData.resId;
	var type = rowData.type;
	var url = "";
	<shiro:hasPermission name="48:view">
	url += "<a title=\"查看\" onclick='viewResFunction(\""+rowId+"\",\""+type+"\");' class='btn2'><img src=\"../../images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	return url;
}
  
function addFunction(){
	$("#data_list_resource").datagrid({
			url:"${ctx}/rescueTeam/rescueTeamAction!list",
			fit:true,fitColumns:true,
			pagination:true,
			columns:[teamColumn]
		});
	pageController();
	if(!Boolean($("#resourceType").data().combobox)){
		$("#resourceType").combobox({
			data:resourceTypeUrl,
			valueField:"url",
			textField:"text",
			panelHeight:"auto",
			onSelect : function(row){
				$("#data_list_resource").datagrid({
		 			url:row.url,
		 			fit:true,fitColumns:true,
		 			pagination:true,
		 			columns:[row.column]
		 		});
				pageController();
			}
		});
	}
		
	$('#resourceList').window({
        width:800,
        height:500,
        modal:true,
        title:"添加救援信息",
        pagination:true,
        onOpen:function(){
        	$(".window-mask").css("height","100%");
        }
	});
}

function pageController(){
	var pageController = $("#data_list_resource").datagrid('getPager');
	var pageSettings = {
		pageSize : 10,
		pageList : [ 10, 15, 20, 30 ],
		beforePageText : '第',
		afterPageText : '页    共{pages} 页',
		displayMsg : '当前显示 {from} - {to} 条记录  共{total}条记录',
		buttons :[{
			iconCls:"icon-search",
			handler : function(){
				var num = pageController.data().pagination.bb.num.val();
				pageController.pagination("select",num);
			}
		}]
		
	};
	$(pageController).pagination(pageSettings);
}

function addResourceFunction(){
	var grid = $("#data_list_resource");
	var rows = grid.datagrid("getSelections");
    if (rows.length == 0) 
    {
        $.messager.show({
            title:'提示',
            msg:'请选择要添加的行',
            timeout:2000,
            showType:'slide'
        });
        return;
   }else if(rows.length>1)
   {
   		 $.messager.show({
            title:'提示',
            msg:'只可添加一条数据',
            timeout:2000,
            showType:'slide'
        });
        return;
   }else
   {
   		var resId = null;
        $.messager.confirm('警告', '是否要添加该记录?', function (r) {
            if (r) {
                var i = 0;
                var arr = null;
                for (i=0; i<rows.length; i++) {
                    resId = rows[i].id;
                    arr = getResourceName(rows[i]);
                }
               $.ajax({
                    url:'${ctx}/logplanResource/logplanResourceAction!add.action',
                    data:{'logplanResource.resId':resId,'logplanResource.name':arr[0],'logplanResource.type':arr[1],'logplanResource.accidentId':acId},
                    method:'POST',
                    success:function(data) {
                    	var data = eval('(' + data + ')');
                        if (data.operateSuccess) {
                        	$.messager.alert('成功',data.operateMessage); 
                        	window.location.href='activeplan_resource.jsp?id='+id+"&accidentId="+acId+"&state="+1+"&init="+1;
                        } else {
                        	$.messager.alert('失败',data.operateMessage); 
                        }
                    }
                });
            }
        });
    }
}

/**获得应急资源名称和类型*/
function getResourceName(row){
	var val = $("#resourceType").combobox("getValue");
	var list =  $("#resourceType").combobox("getData");
	var arr = new Array();
	for(var i in list){
		if(val==list[i].url){
			arr[0]=row[list[i].name];
			break;
		}
	}
	arr[1] = $("#resourceType").combobox("getText");
	return arr;
}
</script>
</head>
<body>
 <div class="panel-header" style="width:100%;">
		<div class="panel-title panel-with-icon">救援资源列表</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	<div class="datagrid-toolbar">
		<shiro:hasPermission name="48:add">
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add', plain:true" onclick="addFunction();">添加</a>
		</shiro:hasPermission>
		<shiro:hasPermission name="48:delete">		
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove', plain:true" onclick="removeFunction();">删除</a>
		</shiro:hasPermission>
	</div>
	<!-- 表单表头 -->
	<div style="height:78%;">
	    <table id="data_list" style="display:none">
	        <thead>
	        <tr>
	          	<th field="type" width="100" align="center" title="name">救援资源类型</th>
	            <th field="name" width="100" align="center" title="role">救援资源名称</th>
	            <th align="center" field="resId" width="160" align="center" formatter="gridFormatter">操作</th>     
	        </tr>
	        </thead>
	    </table>
	</div>
	<div style="display:none;">
	<div id="resourceList" >
		<div class="datagrid-toolbar">
			<shiro:hasPermission name="48:add">
				<a href="javascript:void(0)" class="easyui-linkbutton"
					data-options="iconCls:'icon-add', plain:true"
					onclick="addResourceFunction()">添加</a>
			</shiro:hasPermission>
			<label style="font-size: 13px;"> &nbsp;&nbsp;请选择要添加的救援资源类型：</label>&nbsp;&nbsp;<input
				id="resourceType"></input>
		</div>
		<div style="height:90%;width:100%">
			<table id="data_list_resource"></table>
		</div>
	</div>
	</div>
	<div id="myLoad" style="" iconCls="icon-save"></div>
</body>
</html>