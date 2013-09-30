<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>试卷管理</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<style type="text/css">
.viewQuestion{display:block;}
</style>
<script type="text/javascript">
 var arr;
 var f=false;//判断是否
 $(document).ready(
 	function (){
 		$('#checkView').window({
				        width:800,
				        height:250,
				        modal:true,
				        draggable:false,
				        closed:true,
				        onOpen:function(){
				        	$(".window-mask").css("height","100%");
				        }
		});
 		onloadCombobox('${ctx}','zy',$('#majorTypeId'),null,null);
 		onloadCombobox('${ctx}','zy',$('#updateMajorTypeId'),null,null);
        grid = new Grid('${ctx}/testPaperManage/testPaperManageAction!list', 'data_list');
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'testPaperManage',
			moduleName:'试卷管理',
			url:'${ctx}/testPaperManage/testPaperManageAction',
			beforeSubmit:function() {
				var judge = 0; //判断题
				var single = 0; //单选题
				var many = 0; //多选题
					$.each(arr, function(i, v){
				 		if(v[0] == "") return;
				 		if(v[2] == "判断题") judge = judge+1;
				 		if(v[2] == "单选题") single = single+1;
				 		if(v[2] == "多选题") many = many+1;
					});
				var total = judge * $("#judge").val()+single * $("#single").val()+many * $("#many").val();
				$('input[name ="testPaperManage.paperScore"]').val(total);
				 return true;
			},
			afterUpdateLoadData:function(addFormObject, data){//加载update触发的事件
				$("#viewQuestion").css("display","block");
			 	$(addFormObject).find('.appendTable .appendClass').remove();
			 	var oldDates = new Array();//定义一维数组
			 	$.each(data.list, function(i, v){
			 	oldDates[i] = new Array();//定义二维数组
			 	oldDates[i][0] = v.id;
			 	oldDates[i][1] = v.qsName;
			 	oldDates[i][2] = v.qsTypeName;
			 	var ele = $('<tr class="appendClass">'
		 		+ '<td class="table_con" width="60%" style="border:solid 1px #aedded;">'+v.qsName+'</td>'
		 		+ '<td class="table_con" width="20%" style="text-align: center;border:solid 1px #aedded;">'+v.qsTypeName+'</td>'
		 		+ '<td class="table_con" width="20%" style="text-align: center;border:solid 1px #aedded;"><a title=\"删除\" onclick=\'deleteChild(\"'+v.id+'\",\"'+i+'\");\'><img src=\"../../images/deleteRes.png\"></a></td></tr>');
		 		$(ele).appendTo($("#addForm").find('.appendTable'));
			 	});
			 	f=true;
			 	arr = oldDates;
			 	num();
		 	},
			afterViewLoadData:function(viewFormObject, data) {//加载view触发的事件
				$(viewFormObject).find('span[name="testPaperManage.majorTypeId"]').text(data.majorTypeName);
				viewFormObject.dialog({
					titie:'查看试题信息',	
					modal:true,
					draggable:false,
					minimizable:true,
					maximizable:true,
					maximized:true
				});
				$(viewFormObject).find('.appendTable .appendClass').remove();
				crud.params.viewFormObject.find('.viewQuestion').remove();
				var oldDates = new Array();//定义一维数组
			 	$.each(data.list, function(i, v){
			 	oldDates[i] = new Array();//定义二维数组
			 	oldDates[i][0] = v.id;
			 	oldDates[i][1] = v.qsName;
			 	oldDates[i][2] = v.qsTypeName;
			 	var ele = $('<tr class="appendClass">'
		 		+ '<td class="table_con" width="60%" style="border:solid 1px #aedded;">'+v.qsName+'</td>'
		 		+ '<td class="table_con" width="20%" style="text-align: center;border:solid 1px #aedded;">'+v.qsTypeName+'</td>'
		 		+ '<td class="table_con" width="20%" style="text-align: center;border:solid 1px #aedded;"><a title=\"查看\" onclick=\'viewChild(\"'+v.qsAnswer+'\",\"'+v.qsName+'\",\"'+v.qsTypeName+'\");\'><img src=\"../../images/select.png\"></a></td></tr>');
		 		$(ele).appendTo($("#addView").find('.appendTable'));
			 	});
			 	arr = oldDates;
			 	var judge = 0; //判断题
				var single = 0; //单选题
				var many = 0; //多选题
				$.each(arr, function(i, v){
			 		if(v[0] == "") return;
			 		if(v[2] == "判断题") judge = judge+1;
			 		if(v[2] == "单选题") single = single+1;
			 		if(v[2] == "多选题") many = many+1;
					});
					$('span[name ="singleNum"]').text(single);
					$('span[name ="judgeNum"]').text(judge);
					$('span[name ="manyNum"]').text(many);
				}
		});
 	}
  ); 
  //查看试题
 function viewChild(d,n,t){
 	 $('#checkView').window('open');
 	$('span[name ="d"]').text(d);
	$('span[name ="t"]').text(t);
	$('span[name ="n"]').text(n);
 }
 //关闭窗体
 function closeAllWin() {
    $('#checkView').window('close');
}
  //清空数据
  function afterAddRemove(){
  	$("#viewQuestion").css("display","block");
  	$("#addForm").find('.appendTable .appendClass').remove();
  	if(f){
  		arr.splice(0,arr.length);
  		f=false;
  	}
  }
  //页面显示（判断每个单元格内容字符长度是否大于25，大于部分用...省略）
   function gridFormatterLength(value, rowData, rowIndex) {
        	if(value==null || value == '' || value == 'undefined')
        		return '';
    		if(value.length > 25)
    			return value.substring(0, 25) + '...';
    		return value;
    	}
//数据操作
function gridFormatter(value, rowData, rowIndex) {
	var rowId = rowData.id;
	var rowName=rowData.questionName;
	var status = rowData.status;
	var url = "";
	<shiro:hasPermission name="48:view">
	url += "<a title=\"查看\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"${ctx}/images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	<shiro:hasPermission name="48:update">
	url += "<a title=\"修改\" onclick='crud.update(\""+rowId+"\");' class='btn2'><img src=\"${ctx}/images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	if(status == "1"){
		url += "<a title=\"发布\" onclick='publishPaper(\""+rowId+"\",\""+status+"\");' class='btn2'><img src=\"${ctx}/images/Release.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	}else{
		url += "<a title=\"取消发布\" onclick='publishPaper(\""+rowId+"\",\""+status+"\");' class='btn2'><img src=\"${ctx}/images/Unpublish.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	}
	return url;
}
//发布试卷
function publishPaper(id,status){
	var sta = "";
	if(status == "1"){
		sta = "2";
	}else{
		sta = "1";
	}
	$.ajax({
        url:"${ctx}/testPaperManage/testPaperManageAction!update.action?testPaperManage.id="+id+"&testPaperManage.status="+sta,
        method:'POST',
        success:function(data) {
        	var data = eval('(' + data + ')');
            if (data.operateSuccess) {
                $.messager.show({
                    title:'成功',
                    msg:"操作成功",
                    timeout:2000,
                    showType:'slide'
                });
            } else {
                $.messager.show({
                    title:'失败',
                    msg:"操作失败",
                    timeout:2000,
                    showType:'slide'
                });
            }
             grid.loadGrid();
        }
    });
   
}
//添加试题
function addTr()
{
		var judge = new Array(); //判断题
		var single = new Array(); //单选题
		var many = new Array(); //多选题
	 	$("#addForm").find('.appendTable .appendClass').remove();
	 	$.each(arr, function(i, v){
	 		if(v[0] == "") return;
	 		if(v[2] == "单选题")  single.push(v[0]);
	 		if(v[2] == "多选题")  many.push(v[0]);
	 		if(v[2] == "判断题")  judge.push(v[0]); 
	 		var ele = $('<tr class="appendClass">'
	 		+ '<td class="table_con" width="60%" style="border:solid 1px #aedded;">'+v[1]+'</td>'
	 		+ '<td class="table_con" width="20%" style="text-align: center;border:solid 1px #aedded;">'+v[2]+'</td>'
	 		+ '<td class="table_con"  width="20%" style="text-align: center;border:solid 1px #aedded;"><a title=\"删除\" onclick=\'deleteChild(\"'+v[0]+'\",\"'+i+'\");\'><img src=\"../../images/deleteRes.png\"></a></td></tr>');
	 		$(ele).appendTo($("#addForm").find('.appendTable'));
	 		$("#singleIds").val(single);
	 		$("#manyIds").val(many);
	 		$("#judgeIds").val(judge);
	 	});
	 	num();
}
//移除试题
function deleteChild(id,index){
     $.messager.confirm('警告', '是否要删除该记录?', function (r) {
     	if(r){
			arr.splice(index,1)	
			addTr();
		}
     });
}

//计算试题个数
function num(){
	if(arr == null||arr.length <= 0 ) {
		$.messager.show({
             title:'提示信息',
             msg:"请添加试题！",
             timeout:2000,
             showType:'slide'
		   });
			return false;
	}
	if($("#judge").val()== ""||$("#single").val()== ""||$("#many").val()== "" ){
		$.messager.show({
           title:'提示信息',
           msg:"请先输入试题类型分数！",
           timeout:2000,
           showType:'slide'
		});
		return false;
	}
	var judge = 0; //判断题
	var single = 0; //单选题
	var many = 0; //多选题
		$.each(arr, function(i, v){
 		if(v[0] == "") return;
 		if(v[2] == "判断题") judge = judge+1;
 		if(v[2] == "单选题") single = single+1;
 		if(v[2] == "多选题") many = many+1;
		});
	var total = judge * $("#judge").val()+single * $("#single").val()+many * $("#many").val();
	$('input[name ="singleNum"]').val(single);
	$('input[name ="judgeNum"]').val(judge);
	$('input[name ="manyNum"]').val(many);
	$('input[name ="testPaperManage.paperScore"]').val(total);
}
</script>
</head>
<body>
<div class="panel-header" style="width:100%;">
		<div class="panel-title panel-with-icon">试题管理</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
	 <div>
	        <form id="searchForm" method="post" style="display: inline;">
            <div style="margin-top:-8px;">
			&nbsp;&nbsp;试卷名称:&nbsp;&nbsp;<input type="text" name="testPaperManage.paperName" style="width: 120px;" />
			&nbsp;&nbsp;专业类型:&nbsp;&nbsp;<input type="text" data-options="panelHeight:'auto',width:'100',editable:false"name="testPaperManage.majorTypeId" id="majorTypeId" style="width: 120px;"/>
			&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search()">查询</a>
			&nbsp;&nbsp;
			<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch();">清空</a>
            </div>
	        </form>
	    </div>
        </div>
        <div class="search_add">
		<shiro:hasPermission name="48:add">
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add', plain:true" onclick="afterAddRemove();crud.add();">添加</a>
		</shiro:hasPermission>
		<shiro:hasPermission name="48:delete">		
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove', plain:true" onclick="crud.remove();">删除</a>
		</shiro:hasPermission>
        </div>
	<!-- 表单表头 -->
	<div style="height:74%;">
	    <table id="data_list" style="display:none">
	        <thead>
	        <tr>
	        <th align="center" field="paperName" width="150" formatter="gridFormatterLength" >试卷名称</th>
	         <th align="center" field="majorTypeName" width="150" formatter="gridFormatterLength" >专业类型</th>
            <th align="center" field="paperTime" width="150" formatter="gridFormatterLength" >答题时间（分钟）</th>
            <th align="center" field="paperScore" width="150" formatter="gridFormatterLength" >试卷总分</th>
            <th align="center" field="id" width="120" formatter="gridFormatter">操作</th>   
	        </tr>
	        </thead>
	    </table>
	</div>
	
	<!-- 添加更新窗口 -->
	<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" 
			data-options="iconCls:'icon-save',modal:true,
    			minimizable:true,maximizable:true,maximized:true,collapsible:true,draggable:false">
		<form method="post" >
	     <input type="hidden" name="testPaperManage.id"/>
	     <input type="hidden" name="testPaperManage.manyIds" id="manyIds"/>
	     <input type="hidden" name="testPaperManage.judgeIds" id="judgeIds"/>
	     <input type="hidden" name="testPaperManage.singleIds" id="singleIds"/>
	     <input type="hidden" name="testPaperManage.paperScore" id="paperScore"/>
		    <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv" id="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
						 <tr>
							<td class="table_nemu_new"  width="25%">试卷名称</td>
							<td class="table_con" width="25%" colspan="3">
							<input type="text" class="easyui-validatebox" name="testPaperManage.paperName"
							data-options="required: true,validType:'maxByteLength[100]'" width="100%"/>
							</td>
							
						</tr>
						<tr>
							<td class="table_nemu_new"  width="25%">考试类型</td>
							<td class="table_con" width="25%">
							<input type="text"name="testPaperManage.testType"
							data-options="valueField: 'id',textField: 'value',data: [{id: '1',value: '在线练习'},{id: '2',value: '在线考试'}],panelHeight:'auto',width:'100',required: true,editable:false" class="easyui-combobox"/>
							</td>
							<td class="table_nemu_new"  width="25%">专业类型</td>
							<td class="table_con" width="25%">
							<input type="text"name="testPaperManage.majorTypeId" id="updateMajorTypeId"
							data-options="panelHeight:'auto',width:'100',required: true,editable:false" class="easyui-combobox"/>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new"  width="25%">答题时间（分钟）</td>
							<td class="table_con" width="25%">
							<input type="text" class="easyui-validatebox" name="testPaperManage.paperTime"
							data-options="required: true,validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new"  width="25%">试卷分数</td>
							<td class="table_con" width="25%">
							<input type="text" class="easyui-validatebox" name="testPaperManage.paperScore"
							data-options="required: true,validType:'maxByteLength[100]'" disabled="disabled"/>
							</td>
							</tr>
						<tr>
							<td class="table_nemu_new"  width="25%">单选题分数</td>
							<td class="table_con" width="25%">
							<input type="text" class="easyui-validatebox" name="testPaperManage.singleScore"
							data-options="required: true,validType:'maxByteLength[100]'" id="single" />
							</td>
							<td class="table_nemu_new"  width="25%">单选题个数</td>
							<td class="table_con" width="25%">
							<input type="text" class="easyui-validatebox" name="singleNum" disabled="disabled"/>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new"  width="25%">多选题分数</td>
							<td class="table_con" width="25%">
							<input type="text" class="easyui-validatebox" name="testPaperManage.manyScore"
							data-options="required: true,validType:'maxByteLength[100]'" id="many"/>
							</td>
							<td class="table_nemu_new"  width="25%" >多选题个数</td>
							<td class="table_con" width="25%">
							<input type="text" class="easyui-validatebox" name="manyNum" disabled="disabled" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new"  width="25%">判断题分数</td>
							<td class="table_con" width="25%">
							<input type="text" class="easyui-validatebox" name="testPaperManage.judgeScore"
							data-options="required: true,validType:'maxByteLength[100]'" id="judge"/>
							</td>
							<td class="table_nemu_new"  width="25%">判断题个数</td>
							<td class="table_con" width="25%">
							<input type="text" class="easyui-validatebox" name="judgeNum" disabled="disabled"/>
							</td>
						</tr>
						<tr>
						<td colspan="4"  class="table_con">
							<br />
							<div style="width: 100%;" id="viewQuestion" class="viewQuestion">
								<div style="float:left;font-size: 16pt;"><font style="color:red;"><b>题目设置</b>&nbsp;&nbsp;</font></div>
								<div style="float:right;">
									<a href="#" onClick="viewChildFunction()" value="添加试题" ><img src="${ctx}/images/addQuestion.png"></img></a>
								</div>
							</div>
							<div  style="width: 100%" id="addQuestion" class="addQuestion">
								<table style="width: 100%;">
								<tr>
									<td>
										<table style="border:solid 1px #aedded;width: 100%;" class="appendTable" >
											<tr >
												<td class="table_nemu_new" width="60%" style="text-align: center;border:solid 1px #aedded;">题目内容</td>
												<td class="table_nemu_new" width="20%" style="text-align: center;border:solid 1px #aedded;">题型</td>
												<td class="table_nemu_new" width="20%" style="text-align: center;border:solid 1px #aedded;">操作</td>
											</tr>
										</table>
									</td>
								</tr>
								</table>
							</div>
						</td>
						</tr>
				</table>
			</div>
		</form>
	</div>
	</div>
	<div style="display: none;">
	<div id="checkView" title="查看试题" style="width: 900px; height: 450px;text-align: center;" 
			data-options="iconCls:'icon-save',modal:true,
    			minimizable:true,maximizable:true,collapsible:true,draggable:false">
    	<div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv" id="addDiv">
			<table cellpadding="5px" style="font-size:12px;"
					 cellspacing="1"  border="0" bgcolor="#aed0ea" width="90%">
				<tr>
					<td class="table_nemu_new"  width="25%">题目内容</td>
					<td class="table_con" width="25%" colspan="3">
					<span type="text" class="easyui-validatebox" name="n"></span>
					</td>
				</tr>
				<tr>
					<td class="table_nemu_new"  width="25%">题型</td>
					<td class="table_con" width="25%">
					<span type="text" class="easyui-validatebox" name="t" ></span>
					</td>
					<td class="table_nemu_new"  width="25%">答案</td>
					<td class="table_con" width="25%">
					<span type="text" class="easyui-validatebox" name="d"></span>
					</td>
				</tr>
			</table>
			<br/>
			<br/>
			<br/>
			 <a href="#" class="easyui-linkbutton" icon="icon-cancel" onclick="closeAllWin();return false;">取消</a>
		 </div>
	</div>
	</div>
		<script type="text/javascript">
		function viewChildFunction() {
			if($("#judge").val()== ""||$("#single").val()== ""||$("#many").val()== "" ){
				$.messager.show({
		                         title:'提示信息',
		                         msg:"请先输入试题类型分数！",
		                         timeout:2000,
		                         showType:'slide'
					});
				return false;
			}
				
			$('#childFrame').attr('src', 'QuestionManage.jsp');
			$('#viewChildForm').dialog({
				title:'新增试题',
				modal:true,
				draggable:false,
				minimizable:true,
				maximizable:true,
				width: 900,  
				height: 600,  
				buttons:[{
					text:'取消',
					iconCls:'icon-cancel',
					handler:function() {
						$('#viewChildForm').dialog('close');
					}
				}]
			});
		}
	</script>
	<div style="display: none;">
		<div id="viewChildForm" style="width: 960px; height: 400px;" data-options="iconCls:'icon-save'">
			<iframe frameborder="0" id="childFrame" width="100%" height="98%" scrolling-x="no"></iframe>
		</div>
	</div>
</body>
</html>