<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="gb2312"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/jqueryhead.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>联系人信息</title>

		<script type="text/javascript" src="${ctx}/js/GridUtilNoToolBar.js"></script>
		<script type="text/javascript" src="${ctx}/js/validator.js"></script>
		<script type="text/javascript" src="${ctx}/js/json2.js"></script>
		<script type="text/javascript" src="${ctx}/js/packCrud.js"></script>
		<link rel="stylesheet" href="../../../css/crud.css" type="text/css"></link>
		<script type="text/javascript">

		//加载页面就执行
		$(document).ready(
		 	function (){
		 		// 参数1：访问路径(${ctx}/struts.xml中的namespace/action的名字);参数2：实体类名；参数3：title
		 		init('${ctx}/peoplemanage/peopleInfoAction','peopleInfo','联系人信息');
		 		//list页面查询--按部门查询
		 		onloadCombobox('${ctx}','ppartment',$('#selectbydeparment'),null,null);
		 		//添加页面
		 		onloadCombobox('${ctx}','22d229c9278745c0b909b108011ba6f3',$('#addSex'),null,null);
		 		onloadCombobox('${ctx}','ppartment',$('#adddeparment'),null,null);
		 		//更新页面
		 		onloadCombobox('${ctx}','22d229c9278745c0b909b108011ba6f3',$('#updateSex'),null,null);
		 		onloadCombobox('${ctx}','ppartment',$('#updateDeparment'),null,null);
		 		
		 	}
		 	
		  ); 
		  
  
// 填充更新表单中的数据
function fillUpdateForm(value) {
	var rowsid;
	if (typeof value == "undefined") {
		var rows = grid.getSelectNode();
		rowsid = rows.id;
	} else {
		rowsid = value;
	}
	$.ajax( {url : urlValue+'!getById.action?id=' + rowsid,
				method : 'POST',
				success : function(data) {
					for (var v in data) {
						//alert(v + ":" + data[v]);
						var key = v;
						var value = data[v];
						//文本类型赋值
						$('#updateWin [name="peopleInfo.' + key + '"]').val(value);
						//下拉框赋值
					    if(key == 'deparment'){
						    
					    $('#updateDeparment').combobox('setValue',value);
					    }
					    if(key == 'sex'){
					    $('#updateSex').combobox('setValue',value);
					    }
					}
				}
			});
}

//清空查询框
function clearSearchForm() {
		$("#selectbyname").val('');
		//下拉框清空
		$("#selectbydeparment").combobox('setValue','');
}

//加载表单操作列
function gridFormatter(value, rowData, rowIndex) {
	var rowId = rowData.id;
	var url = ""
	<shiro:hasPermission name="48:view">
	+"<a title=\"查看\" onclick='viewFunction(\""+rowId+"\");' class='btn2'><img src=\"../../../images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;"
	</shiro:hasPermission>
	<shiro:hasPermission name="48:update">
	+"<a title=\"修改\" onclick='editFunction(\""+rowId+"\");' class='btn2' ><img src=\"../../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;"
	</shiro:hasPermission>
	return url;
}
</script>
	</head>
	<body>
		<div class="panel-header" style="width: 100%;">
			<div class="panel-title panel-with-icon">联系人列表</div>
			<div class="panel-icon icon-edit"></div>
			<div class="panel-tool"></div>
		</div>
        
        <!-- 查询窗口 -->
		<div class="datagrid-toolbar" id="tb"  style="padding-left:0px; height:10px;">
			<div>
				<form id="searchForm" method="post" style="display: inline;">
                   <div style="margin-top:-8px">
					&nbsp;&nbsp;姓名:&nbsp;&nbsp;<input id="selectbyname" name="peopleInfo.name" data-options="validType:'length[1,25]'" />
					&nbsp;&nbsp;部门:&nbsp;&nbsp;<input id="selectbydeparment" name="peopleInfo.deparment"  data-options="panelHeight:'auto',width:'100',editable:false" value="" />
					&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="searchForm();">查询</a> &nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="clearSearchForm();">清空</a>
                   </div>
			   </form>
		   </div>
       </div>
       
       <!-- 添加删除按钮 -->
       <div class="search_add">
			<shiro:hasPermission name="48:add">
				<a href="javascript:void(0)" class="easyui-linkbutton"
					data-options="iconCls:'icon-add', plain:true"
					onclick="addFunction();">添加</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="48:delete">
				<a href="javascript:void(0)" class="easyui-linkbutton"
					data-options="iconCls:'icon-remove', plain:true"
					onclick="removeFunction();">删除</a>
			</shiro:hasPermission>
		</div>
		
		<!-- 联系人信息展示表单表头 -->
		<div style="height:78%;">
			<table id="data_list" style="display: none">
				<thead>
					<tr>
						<th field="name" width="150" align="center" title="name">
							姓名
						</th>
						<th field="age" width="150" align="center" title="age">
							年龄
						</th>
						<th field="deparmentText" width="150" align="center"
							title="deparmentText">
							部门
						</th>
						<th field="duty" width="150" align="center" title="duty">
							现任职务
						</th>
						<th field="mobilenumber" width="150" align="center"
							title="mobilenumber">
							手机号码
						</th>
						<th align="center" field="id" width="160" align="center"
							formatter="gridFormatter">
							操作
						</th>
					</tr>
				</thead>
			</table>
		</div>
		
		<!-- 错误提示 -->
		<div style ="color:red">
		    < s:fielderror />
		</div>
		
		<!-- 添加联系人信息窗口 -->
		<div style="display:none">
			<div id="addWin" iconCls="icon-save" title="添加联系人信息">
			    <form  style="padding: 10px 20px 10px 20px;" id="addForm"  method="post" >
				    <table cellpadding="5px" style="font-size:12px;"  cellspacing="1"  border="0" bgcolor="#aed0ea">
						<tr>
							<td class="table_nemu">姓名:</td>
							<td class="table_con"><input class="easyui-validatebox" type="text" id="addName" 
							name="peopleInfo.name" data-options="required: true" missingMessage="请输入姓名" /></td>
							<td class="table_nemu">性别:</td>
							<td class="table_con"><input id="addSex" 
							name="peopleInfo.sex" style="width: 50" 
							data-options="required: true,editable:false,panelHeight:'auto'" missingMessage="请输入选择性别" value=""/></td>
						</tr>
						<tr>
							<td class="table_nemu">年龄:</td>
							<td class="table_con"><input class="easyui-validatebox" type="text" id="addAge" name="peopleInfo.age" validtype="positiveInt"/></td>
							<td class="table_nemu">部门:</td>
							<td class="table_con"><input id="adddeparment" 
							name="peopleInfo.deparment" 
							data-options="panelHeight:'auto',width:'100',required: true,editable:false" missingMessage="请输入部门" /></td>
						</tr>
						<tr>
							<td class="table_nemu">现任职务:</td>
							<td class="table_con"><input class="easyui-validatebox" type="text" id="addDuty" 
							name="peopleInfo.duty" 
							data-options="required: true" missingMessage="请输入现任职务" /></td>
							<td class="table_nemu">办公室电话:</td>
							<td class="table_con"><input class="easyui-validatebox" type="text" id="addOfficePhone" 
							name="peopleInfo.officephonenumber" validtype="phone"/></td>
						</tr>
						<tr>
							
							<td class="table_nemu">住宅电话:</td>
							<td class="table_con"><input class="easyui-validatebox" type="text" id="addHomePhone" 
							name="peopleInfo.phonenumber" validtype="phone"/></td>
							<td class="table_nemu">手机:</td>
							<td class="table_con"><input class="easyui-validatebox" type="text" id="addMobilePhone" 
							name="peopleInfo.mobilenumber" data-options="required: true" validtype="mobile" missingMessage="请输入手机号码"/></td>
						</tr>
						<tr>
							<td class="table_nemu">所属单位:	</td>
							<td class="table_con"><input class="easyui-validatebox" type="text" id="addUnit" 
							name="peopleInfo.unit" data-options="required: false" missingMessage="请输入所属单位" /></td>
							<td class="table_nemu">邮编:</td>
							<td class="table_con"><input class="easyui-validatebox" type="text" id="addPostcode" 
							name="peopleInfo.postcode" data-options="required: false"/></td>
						</tr>
						<tr>
							<td class="table_nemu">家庭住址:</td>
							<td class="table_con" colspan="3"><input class="easyui-validatebox" type="text" size="70" id="addAddress" 
							name="peopleInfo.address" data-options="required: false" missingMessage="请输入家庭住址" /></td>
						</tr>
						<tr>
							<td class="table_nemu">工作经历:</td>
							<td class="table_con" colspan="3"><textarea  style="width: 400;height: 100;" id="addWorkExperience" 
							name="peopleInfo.workexperience " class="easyui-validatebox" 
							data-options="required: false"></textarea></td>
						</tr>
					</table>
					
					<br />
					
					<!-- sumbit -->
					<div align="center">
						<a href="#" class="easyui-linkbutton" icon="icon-ok"
							onclick="addSubmitForm();return false;">确定</a>
						<a href="#" class="easyui-linkbutton" icon="icon-cancel"
							onclick="closeAllWin();return false;">取消</a>
					</div>
				</form>
			</div>
		</div>

		<!-- 修改联系人信息窗口 -->
		<div style="display: none">
			<div id="updateWin" iconCls="icon-save" title="修改联系人信息">
				<form style="padding: 10px 20px 10px 20px;" id="updateForm"
					method="post">
					<input type="hidden" id="updateId" name="peopleInfo.id" />
					<table cellpadding="5px" style="font-size: 12px;" cellspacing="1" border="0" bgcolor="#aed0ea">
						<tr>
							<td class="table_nemu">姓名:</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updateName"
									name="peopleInfo.name" data-options="required: true"
									missingMessage="请输入姓名" />
							</td>
							<td class="table_nemu">性别:</td>
							<td class="table_con">
								<input type="text" id="updateSex" name="peopleInfo.sex" data-options="required: true,editable:false" missingMessage="请输入性别" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu">年龄:</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updateAge" name="peopleInfo.age" validtype="positiveInt"/>
							</td>
							<td class="table_nemu">部门:</td>
							<td class="table_con">
								<input type="text" 
								id="updateDeparment" name="peopleInfo.deparment" 
								data-options="panelHeight:'auto',width:'100',required: true,editable:false" missingMessage="请输入部门"/>
							</td>
						</tr>
						<tr>
							<td class="table_nemu">现任职务:</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text"
									id="updateDuty" name="peopleInfo.duty"
									data-options="required: true" missingMessage="请输入现任职务" />
							</td>
						
							<td class="table_nemu">办公室电话:</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updateOfficePhone" name="peopleInfo.officephonenumber" validtype="phone"/>
							</td>
							</tr>
							<tr>
							<td class="table_nemu">住宅电话:</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updateHomePhone"  name="peopleInfo.phonenumber" validtype="phone"/>
							</td>
						
							<td class="table_nemu">手机:</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text" id="updateMobilePhone" name="peopleInfo.mobilenumber" validtype="mobile" missingMessage="请输入手机号码"/>
							</td>
						</tr>
						<tr>
							<td class="table_nemu">所属单位:</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text"
									id="updateUnit" name="peopleInfo.unit"
									data-options="required: true" missingMessage="请输入所属单位" />
							</td>
							<td class="table_nemu">邮编:</td>
							<td class="table_con">
								<input class="easyui-validatebox" type="text"
									id="updatePostcode" name="peopleInfo.postcode"
									data-options="required: false" missingMessage="请输入邮编" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu">家庭住址:</td>
							<td class="table_con" colspan="3">
								<input class="easyui-validatebox" type="text" size="70"
									id="updateAddress" name="peopleInfo.address"
									data-options="required: false" missingMessage="请输入家庭住址" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu">工作经历:</td>
							<td class="table_con" colspan="3">
								<textarea style="width: 400;height: 100;" id="updateExperience" name="peopleInfo.workexperience"></textarea>
							</td>
						</tr>
					</table>
					
					<br />
					<!-- sumbit -->
					<div align="center">
						<a href="#" class="easyui-linkbutton" icon="icon-ok"
							onclick="updateSubmitForm();return false;">确定</a>
						<a href="#" class="easyui-linkbutton" icon="icon-cancel"
							onclick="closeAllWin();return false;">取消</a>
					</div>
				</form>
			</div>
		</div>
		
		<!-- 查看联系人信息窗口 -->
		<div style="display: none">
			<div id="viewWin" iconCls="icon-save" title="查看联系人信息">
				<form style="padding: 10px 20px 10px 20px;">
					<table cellpadding="5px" style="font-size: 12px;" cellspacing="1" border="0" bgcolor="#aed0ea">
						<tr>
							<td class="table_nemu">姓名:</td>
							<td class="table_con">
								<label type="text" id="viewName" name="peopleInfo.name">
							</td>
							<td class="table_nemu">性别:</td>
							<td class="table_con">
								<label type="text" id="viewSex" name="peopleInfo.sexText">
							</td>
						</tr>
						<tr>
							<td class="table_nemu">年龄:</td>
							<td class="table_con">
								<label type="text" id="viewAge" name="peopleInfo.age" />
							</td>
							<td class="table_nemu"> 部门:</td>
							<td class="table_con">
								<label type="text" id="viewSpecialized"
									name="peopleInfo.deparmentText" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu">现任职务:</td>
							<td class="table_con">
								<label type="text" id="viewBusiness"
									name="peopleInfo.duty" />
							</td>
							<td class="table_nemu">手机:</td>
							<td class="table_con">
								<label type="text" id="viewMobilePhone"
									name="peopleInfo.mobilenumber" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu">办公室电话:</td>
							<td class="table_con">
								<label type="text" id="viewOfficePhone"
									name="peopleInfo.officephonenumber" />
							</td>
							<td class="table_nemu">住宅电话:</td>
							<td class="table_con">
								<label class="" type="text" id="viewPhonenumber"
									name="peopleInfo.phonenumber" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu">所属单位:</td>
							<td class="table_con">
								<label type="text" id="viewUnit"
									name="peopleInfo.unit" />
							</td>
							<td class="table_nemu">邮编:</td>
							<td class="table_con">
								<label type="text" id="viewPostcode"
									name="peopleInfo.postcode" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu">家庭住址:</td>
							<td class="table_con" colspan="3">
								<label type="text" size="90" id="viewAddress"
									name="peopleInfo.address" />
							</td>
						</tr>
						<tr height="100">
							<td class="table_nemu">工作经历:</td>
							<td class="table_con" colspan="3">
								<label 
									name="peopleInfo.workexperience"/>
							</td>
						</tr>
					</table>
					<br />
					<div align="center">
						<a href="#" class="easyui-linkbutton" icon="icon-print"
							onclick="printWin();return false;" id="print">打印</a>
						<a href="#" class="easyui-linkbutton" icon="icon-cancel"
							onclick="closeAllWin();return false;" id ="cancel">取消</a>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>