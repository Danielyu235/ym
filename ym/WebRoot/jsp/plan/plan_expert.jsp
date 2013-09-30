<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看指挥人员</title>
<script type="text/javascript" src="${ctx}/js/GridUtilNoToolBar.js"></script>
<script type="text/javascript" src="${ctx}/js/packCrud.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<% 
	String id = request.getParameter("id");
 %>
<script type="text/javascript">
var roleList = new Array();
var grid2 = null;
$(document).ready(
 	function (){
 		 grid = new Grid('指挥人员列表', 'icon-edit',
						'${ctx}/planExp/planExpAction!list.action?planExp.id=<%=id%>','data_list');
		//加载数据
         grid.loadGrid();
         onloadCombobox('${ctx}','drjs',$('#drjs'),null,null);
         loadList();
 	}
  ); 
  
  //抓取XX.jsp下的div
  function viewExpFunction(value)
  {
  	var rowsid;
 	if (typeof value == "undefined") {
 		var rows = grid.getSelectNode();
 		rowsid = rows.expId;
 	} else {
 		rowsid = value;
 	}
  	dialogs = {};
  	if(dialogs['rescueExpert']) {
  		var crud =  dialogs['rescueExpert'];
  		crud.params.getByIdUrl = '${ctx}/rescueExpert/rescueExpertAction!getById';
		crud.params.viewFormTitle = '查看指挥人员信息';
		crud.params.entityName = 'rescueExpert';
		crud.view(rowsid);
  	} else {
  		var dialogWrap = $('<div style="display:none;"></div>');
	  	var dialog = $('<div iconCls="icon-save" class="rescueExpert"></div>');
	  	$(dialog).appendTo($(dialogWrap));
	  	$(dialogWrap).appendTo('body');
	  	$(dialog).load("${ctx}/jsp/ymxm/rescue/expertView.html #viewWin",
	  		function(response,status,xhr){
		  	$(dialog).height($(dialog).find('#viewWin').height());
		  	$(dialog).find('#viewWin').height('auto');
		  	$(dialog).width($(dialog).find('#viewWin').width());
		  	$(dialog).find('#viewWin').width('auto');
	  		var crud = new Crud({'viewFormObject':$(dialog)});
	  		dialogs['rescueExpert'] = crud;
	  		crud.params.getByIdUrl = '${ctx}/rescueExpert/rescueExpertAction!getById';
  			crud.params.viewFormTitle = '查看指挥人员信息';
  			crud.params.entityName = 'rescueExpert';
			crud.view(rowsid);
	  	});
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
        var roles = new Array();
        $.messager.confirm('警告', '是否要删除该记录?', function (r) {
            if (r) {
                var i = 0;
                for (i=0; i<rows.length; i++) {
                    ids.push(rows[i].id);
                    roles.push(rows[i].role);
                }
                $.ajax({
                    url:'${ctx}/planExp/planExpAction!deleteByIds.action',
                    data:{'ids':ids.join(","),'roles':roles.join(",")},
                    method:'POST',
                    success:function(data) {
                    	var data = eval('(' + data + ')');
					        $.messager.show({
					            title:'提示',
					            msg:data.operateMessage,
					            timeout:2000,
					            showType:'slide'
					        });
                        if (data.operateSuccess) {
                            grid.reloadGrid();
                            $("#drjs").combobox("reload","${ctx}/data/dataAction!findDataByTypeFirstLevel.action?typeId=drjs");
                        }
                    }
                });
            }
        });
    }
}

  //加载表单操作列
function gridFormatter(value, rowData, rowIndex) {
	var rowId = rowData.expId;
	var url = "";
	<shiro:hasPermission name="48:view">
	url += "<a title=\"查看\" onclick='viewExpFunction(\""+rowId+"\");' class='btn2'><img src=\"../../images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	return url;
}
  

//加载已经添加好的角色
function loadList(){
//获取后台传过来的json格式JSON.stringify(list[i]);
	 $.ajax({
        url:'${ctx}/planExp/planExpAction!list.action',
        data:{'planExp.id':'<%=id%>'},
        method:'POST',
        success:function(data) {
	          var data = eval('(' + data + ')');
	          for(var i = 0;i<data.rows.length;i++){
	         	 roleList.push(data.rows[i].role);
	          }
	          moveFunction ();
	      }
      });	
}
//移除已添加的数据
function moveFunction (){
	var list = $("#drjs").combobox("getData");
	for(var i = 0 ; i<list.length; i++){
		for (var s = 0 ; s<roleList.length; s++){
			if(list[i].dataName == roleList[s]){
				list.splice(i,1);
			}
		}
	}
	$("#drjs").combobox("loadData",list);
}  
  
//点击添加按钮，查选所有专家信息
function addFunction(){
	grid2 = new Grid('救援专家列表', 'icon-edit',
			'${ctx}/rescueExpert/rescueExpertAction!list','data_expert');
	grid2.loadGrid();
	$("#expertWin").window({
		 width:800,
         height:500,
         title:"救援专家列表",
         modal:true,
         onOpen:function(){
         	$(".window-mask").css("height","100%");
         }
	});
}

	//添加指挥专家到综合应急预案中
	function addExpFunction () {
		if(!Boolean($("#drjs").combobox("getValue"))){
			$.messager.alert("提示","请选择角色");
			return;
		}
	   var rows = grid2.getSelectNodes();
	   var text = $('#drjs').combobox('getText');
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
	  		var expId = null;
	       $.messager.confirm('警告', '是否要添加该记录?', function (r) {
	           if (r) {
	               var i = 0;
	               for (i=0; i<rows.length; i++) {
	                   expId = rows[i].id;
	               }
	              $.ajax({
	                   url:'${ctx}/planExp/planExpAction!add.action',
	                   data:{'planExp.id':'<%=id%>','planExp.expId':expId,'planExp.role':text},
	                   method:'POST',
	                   success:function(data) {
	                   	var data = eval('(' + data + ')');
	                   	 $.messager.show({
					           title:'提示',
					           msg:data.operateMessage,
					           timeout:2000,
					           showType:'slide'
					       });
	                       if (data.operateSuccess) {
	                       	window.location.href='plan_expert.jsp?id=<%=id%>';
	                       	loadList();
	                       } 
	                   }
	               });
	           }
	       });
	   }
	  
	}
</script>
</head>
<body>
 <div class="panel-header" style="width:100%;">
		<div class="panel-title panel-with-icon">指挥人员列表</div>
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
	          	<th field="name" width="100" align="center" title="name">专家姓名</th>
	            <th field="role" width="60" align="center" title="role">担任角色</th>
	            <th field="mobilePhone" width="60" align="center" title="mobilePhone">联系电话</th>
	            <th field="age" width="30" align="center" title="age">年龄</th>
	            <th field="organize" width="60" align="center" title="organize">工作单位</th>
	            <th align="center" field="expId" width="160" align="center" formatter="gridFormatter">操作</th>     
	        </tr>
	        </thead>
	    </table>
	</div>
	<div style="display:none">
	<div id="expertWin">
		<div class="datagrid-toolbar">
			<shiro:hasPermission name="48:add">
				<a href="javascript:void(0)" class="easyui-linkbutton"
					data-options="iconCls:'icon-add', plain:true"
					onclick="addExpFunction()">添加</a>
			</shiro:hasPermission>
			&nbsp;&nbsp;请选择指挥人员担任角色：&nbsp;&nbsp;<input id="drjs"
				class="easyui-combobox"
				data-options="panelHeight:'auto',width:'100'" name="role" value=""></input>
		</div>
		<div style="height:400px">
			<table id="data_expert">
		        <thead>
		        <tr>
		          	<th field="name" width="100" align="center" title="name">专家姓名</th>
		            <th field="mobilePhone" width="100" align="center" title="mobilePhone">联系电话</th>
		            <th field="age" width="100" align="center" title="age">年龄</th>
		            <th field="organize" width="100" align="center" title="organize">工作单位</th> 
		        </tr>
		        </thead>
			</table>
		</div>
	</div>
	</div>
	<div id="myLoad" style="display:none;" iconCls="icon-save"></div>
</body>
</html>