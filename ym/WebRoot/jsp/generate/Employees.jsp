<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工基本信息</title>

<link rel="stylesheet" type="text/css" href="${ctx}/css/bus.css">
<script type="text/javascript" src="${ctx}/js/GridUtilToolBar.js"></script>
<script type="text/javascript">
        var grid = null;
        var tree = null;
        var key = null;

        // 当点击添加按钮时做的操作
        function addFunction() {
        	$('#addForm').form('clear');        	
    		$('#addForm').dialog({
    			title:'增加窗口',
    			modal:true,
    			draggable:false,
    			buttons:[{
    				text:'保存',
    				iconCls:'icon-save',
    				handler:function() {    					
    					$('#addForm').form('submit',{
    		                url:'${ctx}/employees/employeesAction!add',
    		                success:function (data) {
    		                	$('#addForm').dialog('close');
    		                	var data = eval('(' + data + ')');
    		                    if (data.operateSuccess) {
    		                        $.messager.show({
    		                            title:'成功',
    		                            msg:data.operateMessage,
    		                            timeout:2000,
    		                            showType:'slide'
    		                        });
    		                        grid.reloadGrid();
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
    			}, {
    				text:'取消',
    				iconCls:'icon-cancel',
    				handler:function() {
    					$('#addForm').dialog('close');
    				}
    			}]
    		});
    		$('#addForm').form('validate');
        }
        
        function updateFunction(rowId) {
        	$.loding();
    		$.ajax({
                url:'${ctx}/employees/employeesAction!getById?id=' + rowId,
                method:'POST',
                success:function (data) {
                	var obj = {};
                	$.each(data,function(i,item){
                		obj["employees."+i] = item;
                    });
                	$('#addForm').form('load',obj);
                	$.loded();
                	
                	$('#addForm').dialog({
            			title:'更新窗口',
            			modal:true,
            			draggable:false,
            			buttons:[{
            				text:'保存',
            				iconCls:'icon-save',
            				handler:function() {
            					$('#addForm').form('submit',{
            						url:'${ctx}/employees/employeesAction!update',
            		                success:function(data) {
            						$('#addForm').dialog('close');
            		                	var data = eval('(' + data + ')');
            		                    if (data.operateSuccess) {
            		                        $.messager.show({
            		                            title:'成功',
            		                            msg:data.operateMessage,
            		                            timeout:2000,
            		                            showType:'slide'
            		                        });
            		                        grid.reloadGrid();
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
            			}, {
            				text:'取消',
            				iconCls:'icon-cancel',
            				handler:function() {
            					$('#addForm').dialog('close');
            				}
            			}]
            		});
                }
            });
        }
        
        function viewFunction(rowId) {
        	$.loding();
    		$.ajax({
                url:'${ctx}/employees/employeesAction!getById?id=' + rowId,
                method:'POST',
                success:function (data) {
                	$.each(data,function(i,item){
                		$('#viewForm span[name="employees.'+i+'"]').html(item);
                    });
                	$.loded();
                	$('#viewForm').dialog({
        				title:'查看窗口',
        				modal:true,
        				draggable:false,
        				buttons:[{
        					text:'取消',
        					iconCls:'icon-cancel',
        					handler:function() {
        						$('#viewForm').dialog('close');
        					}
        				}]
        			});
                }
            });
        }

        function deleteFunction() {
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
                            ids.push(rows[i].id);
                        }
                        $.ajax({
                            url:'${ctx}/employees/employeesAction!delete?ids=' + ids,
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
                                    grid.reloadGrid();
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
        }
        
        function searchFunction(){
        	var form = $.form2Json($("#searchForm"));
			grid.doSearch(form);  	
        }
        
        function clearSearchGrid(){
        	$('#searchForm').form('clear');
        }
        
        function viewFormInit() {
        	$('#viewForm').append($('#addForm [name="addDiv"]').clone());
			$('#viewForm td').find('input[name]').each(function(){
				var span = $('<span>')
					 .attr('name', $(this).attr('name'));
				var parent = $(this).parents('td.contentTd');
				parent.empty().append(span);
			});
			$('#viewForm td textarea').each(function(){
				$(this).after($('<span></span>')
					 .attr('name', $(this).attr('name'))
					 .attr('style', 'width:100%;height:85px;overflow-y:auto;')
					 );
				$(this).remove();
			});
        }
        
		$(document).ready(function () {
		     grid = new Grid($("title").html(), 'icon-edit',
		             '${ctx}/employees/employeesAction!list',
		             'data_list','#tb');
		     grid.loadGrid();
		     viewFormInit();
		});
        
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
        	url += "<input type='button' class='btn1' onclick='updateFunction(\"" + rowId + "\");' value='修改'/>&nbsp;&nbsp;";
        	url += "<input type='button' class='btn1' onclick='viewFunction(\"" + rowId + "\");' value='查看'/>&nbsp;&nbsp;";
        	return url;
        }
        
</script>
</head>
<body>



<div id="tb">
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add', plain:true" onclick="addFunction()">新增</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-delete', plain:true" onclick="deleteFunction()">删除</a>
<!-- 	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-exp', plain:true" onclick="expFunction()">导出</a> -->
	<div>
	<form id="searchForm" style="margin: 0;">
	
	&nbsp;&nbsp;工号:&nbsp;&nbsp;<input type="text" name="employees.jobNum" />
	&nbsp;&nbsp;姓名:&nbsp;&nbsp;<input type="text" name="employees.name" />
	&nbsp;&nbsp;性别:&nbsp;&nbsp;<input type="text" name="employees.gender" />
	&nbsp;&nbsp;身份证号:&nbsp;&nbsp;<input type="text" name="employees.idnumber" />
	&nbsp;&nbsp;民族:&nbsp;&nbsp;<input type="text" name="employees.nation" />
	&nbsp;&nbsp;出生年月:&nbsp;&nbsp;<input type="text" name="employees.dataOfBirth" />
	&nbsp;&nbsp;学历:&nbsp;&nbsp;<input type="text" name="employees.education" />
	&nbsp;&nbsp;参工时间:&nbsp;&nbsp;<input type="text" name="employees.workTime" />
	&nbsp;&nbsp;先单位:&nbsp;&nbsp;<input type="text" name="employees.unit" />
	&nbsp;&nbsp;增减工龄:&nbsp;&nbsp;<input type="text" name="employees.lenOfService" />
	&nbsp;&nbsp;工别:&nbsp;&nbsp;<input type="text" name="employees.workersNo" />
	&nbsp;&nbsp;工种:&nbsp;&nbsp;<input type="text" name="employees.workType" />
	&nbsp;&nbsp;技能:&nbsp;&nbsp;<input type="text" name="employees.skill" />
	&nbsp;&nbsp;岗位:&nbsp;&nbsp;<input type="text" name="employees.post" />
	&nbsp;&nbsp;独生:&nbsp;&nbsp;<input type="text" name="employees.only" />
	&nbsp;&nbsp;养老:&nbsp;&nbsp;<input type="text" name="employees.aged" />
	&nbsp;&nbsp;医保:&nbsp;&nbsp;<input type="text" name="employees.medical" />
	&nbsp;&nbsp;档案号:&nbsp;&nbsp;<input type="text" name="employees.fillNo" />
	&nbsp;&nbsp;本人成份:&nbsp;&nbsp;<input type="text" name="employees.composition" />
	&nbsp;&nbsp;籍贯:&nbsp;&nbsp;<input type="text" name="employees.homeTown" />
	&nbsp;&nbsp;户口所在地:&nbsp;&nbsp;<input type="text" name="employees.permanentResidence" />
	&nbsp;&nbsp;入局时间:&nbsp;&nbsp;<input type="text" name="employees.bureauTime" />
	&nbsp;&nbsp;合同期限:&nbsp;&nbsp;<input type="text" name="employees.contractPeriod" />
	&nbsp;&nbsp;合同开始时间:&nbsp;&nbsp;<input type="text" name="employees.contractStatusTime" />
	&nbsp;&nbsp;政治面貌:&nbsp;&nbsp;<input type="text" name="employees.politicalStatus" />
	&nbsp;&nbsp;职别:&nbsp;&nbsp;<input type="text" name="employees.officialRank" />
	&nbsp;&nbsp;是否班组长:&nbsp;&nbsp;<input type="text" name="employees.sfbzz" />
	&nbsp;&nbsp;入职时间:&nbsp;&nbsp;<input type="text" name="employees.rzsj" />
	&nbsp;&nbsp;单位编号:&nbsp;&nbsp;<input type="text" name="employees.dwbh" />
	&nbsp;&nbsp;血型:&nbsp;&nbsp;<input type="text" name="employees.bloodType" />
	&nbsp;&nbsp;入党团时间:&nbsp;&nbsp;<input type="text" name="employees.partyTime" />
	&nbsp;&nbsp;身体状况:&nbsp;&nbsp;<input type="text" name="employees.physiclalStatus" />
	&nbsp;&nbsp;第二职业:&nbsp;&nbsp;<input type="text" name="employees.secondaryOccupation" />
	&nbsp;&nbsp;性格特征:&nbsp;&nbsp;<input type="text" name="employees.characterTrait" />
	&nbsp;&nbsp;宗教信仰:&nbsp;&nbsp;<input type="text" name="employees.religion" />
	&nbsp;&nbsp;业务活动:&nbsp;&nbsp;<input type="text" name="employees.leisureActivities" />
	&nbsp;&nbsp;军龄:&nbsp;&nbsp;<input type="text" name="employees.militaryLen" />
	&nbsp;&nbsp;下乡:&nbsp;&nbsp;<input type="text" name="employees.countryside" />
	&nbsp;&nbsp;待业:&nbsp;&nbsp;<input type="text" name="employees.waitForEmployment" />
	&nbsp;&nbsp;人员性质:&nbsp;&nbsp;<input type="text" name="employees.personnelQuality" />
	&nbsp;&nbsp;上岗证:&nbsp;&nbsp;<input type="text" name="employees.workLicense" />
	&nbsp;&nbsp;是否管理人员:&nbsp;&nbsp;<input type="text" name="employees.sfglry" />
	&nbsp;&nbsp;岗位职务:&nbsp;&nbsp;<input type="text" name="employees.position" />
	&nbsp;&nbsp;手机号码:&nbsp;&nbsp;<input type="text" name="employees.cellphoneNumber" />
	&nbsp;&nbsp;私家车牌号:&nbsp;&nbsp;<input type="text" name="employees.plateNumber" />
	&nbsp;&nbsp;亲属姓名:&nbsp;&nbsp;<input type="text" name="employees.relativesName" />
	&nbsp;&nbsp;与本人关系:&nbsp;&nbsp;<input type="text" name="employees.relations" />
	&nbsp;&nbsp;亲属手机号码:&nbsp;&nbsp;<input type="text" name="employees.relativesCellphoneNumber" />
	&nbsp;&nbsp;卡号:&nbsp;&nbsp;<input type="text" name="employees.cardNumber" />
	&nbsp;&nbsp;照片:&nbsp;&nbsp;<input type="text" name="employees.passport" />
	&nbsp;&nbsp;部门:&nbsp;&nbsp;<input type="text" name="employees.departmentf" />
	&nbsp;&nbsp;部门职位:&nbsp;&nbsp;<input type="text" name="employees.departments" />
	&nbsp;&nbsp;专业:&nbsp;&nbsp;<input type="text" name="employees.major" />
	&nbsp;&nbsp;座机号码:&nbsp;&nbsp;<input type="text" name="employees.phoneNumber" />
	
	&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="searchFunction()">查询</a>
	&nbsp;&nbsp;
	<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="clearSearchGrid();">清空</a>
	</form>
	</div>
</div>

<div style="height: 500px">
    <table id="data_list" loadMsg="正在努力拉取数据中..." fit="true" fitColumns="true">
        <thead>
        <tr>
			
            <th align="center" field="jobNum" width="150" formatter="gridFormatterLength" >工号</th>
            <th align="center" field="name" width="150" formatter="gridFormatterLength" >姓名</th>
            <th align="center" field="gender" width="150" formatter="gridFormatterLength" >性别</th>
            <th align="center" field="idnumber" width="150" formatter="gridFormatterLength" >身份证号</th>
            <th align="center" field="nation" width="150" formatter="gridFormatterLength" >民族</th>
            <th align="center" field="dataOfBirth" width="150" formatter="gridFormatterLength" >出生年月</th>
            <th align="center" field="education" width="150" formatter="gridFormatterLength" >学历</th>
            <th align="center" field="workTime" width="150" formatter="gridFormatterLength" >参工时间</th>
            <th align="center" field="unit" width="150" formatter="gridFormatterLength" >先单位</th>
            <th align="center" field="lenOfService" width="150" formatter="gridFormatterLength" >增减工龄</th>
            <th align="center" field="workersNo" width="150" formatter="gridFormatterLength" >工别</th>
            <th align="center" field="workType" width="150" formatter="gridFormatterLength" >工种</th>
            <th align="center" field="skill" width="150" formatter="gridFormatterLength" >技能</th>
            <th align="center" field="post" width="150" formatter="gridFormatterLength" >岗位</th>
            <th align="center" field="only" width="150" formatter="gridFormatterLength" >独生</th>
            <th align="center" field="aged" width="150" formatter="gridFormatterLength" >养老</th>
            <th align="center" field="medical" width="150" formatter="gridFormatterLength" >医保</th>
            <th align="center" field="fillNo" width="150" formatter="gridFormatterLength" >档案号</th>
            <th align="center" field="composition" width="150" formatter="gridFormatterLength" >本人成份</th>
            <th align="center" field="homeTown" width="150" formatter="gridFormatterLength" >籍贯</th>
            <th align="center" field="permanentResidence" width="150" formatter="gridFormatterLength" >户口所在地</th>
            <th align="center" field="bureauTime" width="150" formatter="gridFormatterLength" >入局时间</th>
            <th align="center" field="contractPeriod" width="150" formatter="gridFormatterLength" >合同期限</th>
            <th align="center" field="contractStatusTime" width="150" formatter="gridFormatterLength" >合同开始时间</th>
            <th align="center" field="politicalStatus" width="150" formatter="gridFormatterLength" >政治面貌</th>
            <th align="center" field="officialRank" width="150" formatter="gridFormatterLength" >职别</th>
            <th align="center" field="sfbzz" width="150" formatter="gridFormatterLength" >是否班组长</th>
            <th align="center" field="rzsj" width="150" formatter="gridFormatterLength" >入职时间</th>
            <th align="center" field="dwbh" width="150" formatter="gridFormatterLength" >单位编号</th>
            <th align="center" field="bloodType" width="150" formatter="gridFormatterLength" >血型</th>
            <th align="center" field="partyTime" width="150" formatter="gridFormatterLength" >入党团时间</th>
            <th align="center" field="physiclalStatus" width="150" formatter="gridFormatterLength" >身体状况</th>
            <th align="center" field="secondaryOccupation" width="150" formatter="gridFormatterLength" >第二职业</th>
            <th align="center" field="characterTrait" width="150" formatter="gridFormatterLength" >性格特征</th>
            <th align="center" field="religion" width="150" formatter="gridFormatterLength" >宗教信仰</th>
            <th align="center" field="leisureActivities" width="150" formatter="gridFormatterLength" >业务活动</th>
            <th align="center" field="militaryLen" width="150" formatter="gridFormatterLength" >军龄</th>
            <th align="center" field="countryside" width="150" formatter="gridFormatterLength" >下乡</th>
            <th align="center" field="waitForEmployment" width="150" formatter="gridFormatterLength" >待业</th>
            <th align="center" field="personnelQuality" width="150" formatter="gridFormatterLength" >人员性质</th>
            <th align="center" field="workLicense" width="150" formatter="gridFormatterLength" >上岗证</th>
            <th align="center" field="sfglry" width="150" formatter="gridFormatterLength" >是否管理人员</th>
            <th align="center" field="position" width="150" formatter="gridFormatterLength" >岗位职务</th>
            <th align="center" field="cellphoneNumber" width="150" formatter="gridFormatterLength" >手机号码</th>
            <th align="center" field="plateNumber" width="150" formatter="gridFormatterLength" >私家车牌号</th>
            <th align="center" field="relativesName" width="150" formatter="gridFormatterLength" >亲属姓名</th>
            <th align="center" field="relations" width="150" formatter="gridFormatterLength" >与本人关系</th>
            <th align="center" field="relativesCellphoneNumber" width="150" formatter="gridFormatterLength" >亲属手机号码</th>
            <th align="center" field="cardNumber" width="150" formatter="gridFormatterLength" >卡号</th>
            <th align="center" field="passport" width="150" formatter="gridFormatterLength" >照片</th>
            <th align="center" field="departmentf" width="150" formatter="gridFormatterLength" >部门</th>
            <th align="center" field="departments" width="150" formatter="gridFormatterLength" >部门职位</th>
            <th align="center" field="major" width="150" formatter="gridFormatterLength" >专业</th>
            <th align="center" field="phoneNumber" width="150" formatter="gridFormatterLength" >座机号码</th>
            <th field="id" width="120" formatter="gridFormatter">操作</th>         
        </tr>
        </thead>
    </table>
</div>

	<!-- 添加更新窗口 -->
	<div style="display: none;">
		<form id="addForm" method="post" style="width: 960px; height: 500px;">
			<input type="hidden" name="employees.id"/>
			<div style="margin: 0 auto;" align="center" name="addDiv">
				<table class="detailTable" style="width: 80%;">
					
						<tr>
							<td class="labelTd">工号:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.jobNum"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">姓名:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.name"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">性别:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.gender"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">身份证号:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.idnumber"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">民族:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.nation"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">出生年月:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.dataOfBirth"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">学历:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.education"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">参工时间:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.workTime"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">先单位:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.unit"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">增减工龄:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.lenOfService"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">工别:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.workersNo"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">工种:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.workType"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">技能:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.skill"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">岗位:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.post"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">独生:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.only"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">养老:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.aged"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">医保:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.medical"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">档案号:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.fillNo"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">本人成份:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.composition"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">籍贯:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.homeTown"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">户口所在地:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.permanentResidence"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">入局时间:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.bureauTime"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">合同期限:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.contractPeriod"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">合同开始时间:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.contractStatusTime"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">政治面貌:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.politicalStatus"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">职别:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.officialRank"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">是否班组长:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.sfbzz"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">入职时间:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.rzsj"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">单位编号:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.dwbh"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">血型:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.bloodType"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">入党团时间:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.partyTime"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">身体状况:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.physiclalStatus"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">第二职业:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.secondaryOccupation"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">性格特征:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.characterTrait"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">宗教信仰:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.religion"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">业务活动:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.leisureActivities"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">军龄:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.militaryLen"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">下乡:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.countryside"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">待业:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.waitForEmployment"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">人员性质:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.personnelQuality"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">上岗证:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.workLicense"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">是否管理人员:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.sfglry"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">岗位职务:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.position"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">手机号码:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.cellphoneNumber"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">私家车牌号:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.plateNumber"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">亲属姓名:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.relativesName"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">与本人关系:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.relations"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">亲属手机号码:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.relativesCellphoneNumber"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">卡号:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.cardNumber"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">照片:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.passport"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">部门:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.departmentf"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">部门职位:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.departments"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">专业:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.major"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">座机号码:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="employees.phoneNumber"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
				</table>
			</div>
		</form>
	</div>
	
	<div style="display: none;">
		<div id="viewForm" style="width: 960px; height: 500px;">
			
		</div>
	</div>
	
</body>
</html>