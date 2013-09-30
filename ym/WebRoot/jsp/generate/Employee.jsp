<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>员工基本信息</title>
	<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
	<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
	<style type="text/css">
	.passport{display:block;}
	</style>
	<script type="text/javascript">        
		$(document).ready(
			 	function (){
			 		//urlValue: 项目访问根路径;    typeId: 数据库中对应的下拉类型id; 
			 		//$('#oneId'): 一级下拉列对象;  $('#twoId'): 二级下拉列对象 ; $('#threeId'): 三级下拉列对象;
			 		//list页面查询
					onloadCombobox2('${ctx}','22d229c9278745c0b909b108011ba6f3',$('#employee_gender'),null,null);
			 		grid = new Grid('${ctx}/employees/employeesAction!list', 'data_list');
					grid.loadGrid();

					crud = new Crud({
						grid:grid, 
						addFormObject:$('#addForm'), 
						searchFormObject:$('#searchForm'),
						entityName:'employees',
						moduleName:'员工管理',
						url:'${ctx}/employees/employeesAction',
						dialogCss:{width:"1200px",height:"600px"},
						beforeSubmit:function(){
							var temp=$(window.frames["passportIframe"].document).find("#employee_passport1").val();
							$("#employee_passport").val(temp);
							return true;
							},
						afterViewLoadData:function(viewFormObject, data) {
						$(viewFormObject).find('span[name="employees.gender"]').text(data.genderName);
							$(viewFormObject).find('.img').remove();
							crud.params.viewFormObject.find('.passport').remove();
							//alert(data);
							var temp=$('<img class="img" src="${ctx}/upload/'+data.passport+'\" width="169" height="207"/>');
							
							$(temp).appendTo($(".passadd"));
						},
						afterUpdateLoadData:function(addFormObject, data) {
						  	$(window.frames["passportIframe"].document).find(".imgshow").hide();
							$(addFormObject).find('.img').remove();
						}
					});

			 	} 	
			  ); 

		function onloadCombobox2(urlValue,typeId,comboboxObj_one,comboboxObj_two,comboboxObj_three){
			comboboxObj_one.combobox({  
			   url:urlValue+'/data/dataAction!findDataByTypeFirstLevel.action?typeId='+typeId,
			   valueField:'id',  
			   textField:'dataName',
			   onSelect:function(row){
						if(comboboxObj_two != null){
						    //combobox_oneId: 父级id 
							//注意这里不能使用$('#XXX').val()方法来获取下拉框的值
							//因为这里使用的是easyui的combobox组件，所以只能使用easyui提供的getValue方法
						    var combobox_oneId = row.id;
						    comboboxObj_two.combobox({
						     	  url:urlValue+'/data/dataAction!findAllChildren.action?parentId='+combobox_oneId,
						          valueField:'id',
						          textField:'dataName',
						          onSelect:function(row){
									if(comboboxObj_three != null && comboboxObj_two !=null ){
									    //combobox_twoId: 父级id
										//注意这里不能使用$('#XXX').val()方法来获取下拉框的值
										//因为这里使用的是easyui的combobox组件，所以只能使用easyui提供的getValue方法
									    var combobox_twoId = row.id
									    comboboxObj_three.combobox({
									     	  url:urlValue+'/data/dataAction!findAllChildren.action?parentId='+combobox_twoId,
									          valueField:'id',
									          textField:'dataName'
									    });
									}
						    	}
						    });
						}
				}
			});    
		}
	     
        function gridFormatterLength(value, rowData, rowIndex) {
        	if(value==null || value == '' || value == 'undefined')
        		return '';
    		if(value.length > 25)
    			return value.substring(0, 25) + '...';
    		return value;
    	}

        function gridFormatter(value, rowData, rowIndex) {
        	var rowId = rowData.id;
        	var url = "";
        	<shiro:hasPermission name="48:view">
        	url += "<a title=\"查看\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"${ctx}/images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
        	</shiro:hasPermission>
        	<shiro:hasPermission name="48:update">
        	url += "<a title=\"修改\" onclick='crud.update(\""+rowId+"\");' class='btn2'><img src=\"${ctx}/images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
        	</shiro:hasPermission>
        	return url;
        }   
        function removepic(){
              $(window.frames["passportIframe"].document).find(".showimg").hide();
              $('.img').hide();
        	//$('#passportIframe').attr('src','${ctx}/jsp/Upload.jsp');
        	//alert($('#passportIframe'));
        }

           
	</script>
</head>
<body>
	<div class="panel-header" style="width: 100%;">
		<div class="panel-title panel-with-icon">
			员工管理
		</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	<div class="datagrid-toolbar" id="tb"  style="padding-left:0px; height:10px;">
		<div>
			<form id="searchForm" method="post" style="display: inline;">
                  <div style="margin-top:-8px">
					&nbsp;&nbsp;员工号:&nbsp;&nbsp;<input type="text" name="employees.jobNum" />&nbsp;&nbsp;
					&nbsp;&nbsp;员工姓名:&nbsp;&nbsp;<input type="text" name="employees.name" />&nbsp;&nbsp;
					&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search();">查询</a> &nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch();">清空</a>
                   </div>
			</form>
		</div>
           </div>
           <div class="search_add">
		<shiro:hasPermission name="48:add">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-add', plain:true"
				onclick="crud.add();removepic()">添加</a>
		</shiro:hasPermission>
		<shiro:hasPermission name="48:delete">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-remove', plain:true"
				onclick="crud.remove();">删除</a>
		</shiro:hasPermission>
	</div>
	<!-- 表单表头 -->
	<div style="height:78%;">
		<table id="data_list" style="display: none">
			<thead>
				<tr>
					<th align="center" field="jobNum" width="50" formatter="gridFormatterLength" >员工号</th>
		            <th align="center" field="name" width="50" formatter="gridFormatterLength" >员工姓名</th>
		            <th align="center" field="unit" width="80" formatter="gridFormatterLength" >现单位</th>
		            <th align="center" field="workType" width="80" formatter="gridFormatterLength" >工种</th>
		            <th align="center" field="personnelQuality" width="150" formatter="gridFormatterLength" >人员性质</th>
		            <th align="center" field="education" width="50" formatter="gridFormatterLength" >学历</th>
		            <th field="id" width="120" formatter="gridFormatter" align="center">操作</th>   
				</tr>		                  
			</thead>
		</table>
	</div>	
	<div style="display: none;">
		<div id="addForm" style="width: 1500px; height: 450px;" data-options="iconCls:'icon-save',modal:true,minimizable:true,maximizable:true,collapsible:true,draggable:false">
			<form method="post" >
		    	<input type="hidden" name="employees.id"/>
			    <div style="padding: 10px 10px 10px 10px;" align="center" name="addDiv">
					<table id="detailTable" cellpadding="5px" style="font-size:12px;" cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">					
						<tr>
							<td class="table_nemu_new">员工号</td>
							<td class="table_con">
								<input type="text" class="easyui-validatebox" name="employees.jobNum" data-options="required:true" />
							</td>						
							<td class="table_nemu_new">员工姓名</td>
							<td class="table_con">
								<input type="text" class="easyui-validatebox" name="employees.name" data-options="required:true" />
							</td>
							<td class="table_con" colspan="2" rowspan="6" style="text-align: center;">
								<div class="passport" align="center">
									  <iframe id="passportIframe" src="${ctx}/jsp/Upload.jsp" style="width:390px;height:230px" frameborder="no" scrolling="no"></iframe>
								</div>
								<div class="passadd"></div>
								<input type="hidden" name="employees.passport" id="employee_passport" value="">
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">性别</td>
							<td class="table_con">
								<input class="easyui-combobox" name="employees.gender" id="employee_gender" data-options="panelHeight:'auto',editable:false"/>
							</td>
							<td class="table_nemu_new">文化程度</td>
							<td class="table_con">
								<input type="text" class="easyui-validatebox" name="employees.education" data-options="validType:'maxByteLength[100]'" />
							</td>						
						</tr>
						<tr>
							<td class="table_nemu_new">出生年月</td>
							<td class="table_con">
								<input type="text" class="easyui-my97 easyui-validatebox" name="employees.dataOfBirth" data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new">身份证号</td>
							<td class="table_con">
								<input type="text" class="easyui-validatebox" name="employees.idnumber" data-options="required:true" />
							</td>						
						</tr>
						<tr>				
											
							<td class="table_nemu_new">民族</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employees.nation"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new">增减工龄</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employees.lenOfService"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">参加工作时间</td>
							<td class="table_con">
								<input type="text" class="easyui-my97 easyui-validatebox" name="employees.workTime" data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new">调入本单位时间</td>
							<td class="table_con">
								<input type="text" class="easyui-my97 easyui-validatebox" name="employees.transferTime" data-options="validType:'maxByteLength[100]'" />
							</td>				
						</tr>
						<tr>
							<td class="table_nemu_new">现单位</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employees.unit"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new">工种</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employees.workType"
							data-options="validType:'maxByteLength[100]'" />
							</td>	
						</tr>
						<tr>
							<td class="table_nemu_new">人员性质</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employees.personnelQuality"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new">上岗证</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employees.workLicense"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new">是否管理人员</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="employees.sfglry"
							data-options="valueField:'v', textField:'m', data:[{v:'是',m:'是'},{v:'否',m:'否'}],editable:false" panelHeight="auto" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">工别</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employees.workersNo"
							data-options="validType:'maxByteLength[100]'" />
							</td>
								<td class="table_nemu_new" width="12%">岗位</td>
							<td class="table_con">
								<input type="text" class="easyui-validatebox"  name="employees.post" />
							</td>	
							<td class="table_nemu_new">技能</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employees.skill"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">独生</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employees.only"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">养老</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employees.aged"
							data-options="validType:'maxByteLength[100]'" />
							</td>
					
							<td class="table_nemu_new">医保</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employees.medical"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">档案号</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employees.fillNo"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new">本人成份</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employees.composition"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">籍贯</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employees.homeTown"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">户口所在地</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employees.permanentResidence"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">入局时间</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employees.bureauTime"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new">合同期限</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employees.contractPeriod"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							</tr>
						
						<tr>
							<td class="table_nemu_new">合同开始时间</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employees.contractStatusTime"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new">政治面貌</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employees.politicalStatus"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">职别</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employees.officialRank"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">是否班组长</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="employees.sfbzz"
							data-options="valueField:'v', textField:'m', data:[{v:'是',m:'是'},{v:'否',m:'否'}],editable:false" panelHeight="auto"/>
							</td>
						
							<td class="table_nemu_new">入职时间</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employees.rzsj"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new">单位编号</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employees.dwbh"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">血型</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employees.bloodType"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new">手机号码</td>
							<td class="table_con" >
								<input type="text" class="easyui-validatebox" name="employees.cellphoneNumber" data-options="required:true" />
							</td>
							<td class="table_nemu_new">电话号码</td>
							<td class="table_con">
								<input type="text" class="easyui-validatebox" name="employees.phoneNumber" data-options="validType:'maxByteLength[100]'"/>
							</td>	
						</tr>
						<tr>
							<td class="table_nemu_new">入党团时间</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employees.partyTime"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">身体状况</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employees.physiclalStatus"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new">第二职业</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employees.secondaryOccupation"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">性格特征</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employees.characterTrait"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new">宗教信仰</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employees.religion"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new">业务活动</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employees.leisureActivities"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">军龄</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employees.militaryLen"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new">下乡</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employees.countryside"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new">待业</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employees.waitForEmployment"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						
						<tr>
							<td class="table_nemu_new">岗位职务</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employees.position"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new">私家车牌号</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employees.plateNumber"
							data-options="validType:'maxByteLength[100]'" />
							</td>
								
							<td class="table_nemu_new">卡号</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employees.cardNumber"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">与本人关系</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employees.relations"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">亲属手机号码</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employees.relativesCellphoneNumber"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new">亲属姓名</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="employees.relativesName"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>	
						<tr>
							
							<td class="table_nemu_new">家庭住址</td>
							<td class="table_con" colspan="5">
								<input type="text" class="easyui-validatebox" name="employees.homeAddress" data-options="validType:'maxByteLength[100]'" style="width:450px"/>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
</body>
</html>