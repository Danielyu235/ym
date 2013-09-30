<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>压力容器</title>

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
    		                url:'${ctx}/pressureVesselHazards/pressureVesselHazardsAction!add',
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
                url:'${ctx}/pressureVesselHazards/pressureVesselHazardsAction!getById?id=' + rowId,
                method:'POST',
                success:function (data) {
                	var obj = {};
                	$.each(data,function(i,item){
                		obj["pressureVesselHazards."+i] = item;
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
            						url:'${ctx}/pressureVesselHazards/pressureVesselHazardsAction!update',
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
                url:'${ctx}/pressureVesselHazards/pressureVesselHazardsAction!getById?id=' + rowId,
                method:'POST',
                success:function (data) {
                	$.each(data,function(i,item){
                		$('#viewForm span[name="pressureVesselHazards.'+i+'"]').html(item);
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
                            url:'${ctx}/pressureVesselHazards/pressureVesselHazardsAction!delete?ids=' + ids,
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
		             '${ctx}/pressureVesselHazards/pressureVesselHazardsAction!list',
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
	
	&nbsp;&nbsp;名称:&nbsp;&nbsp;<input type="text" name="pressureVesselHazards.name" />
	&nbsp;&nbsp;编号:&nbsp;&nbsp;<input type="text" name="pressureVesselHazards.ownId" />
	&nbsp;&nbsp;注册编号:&nbsp;&nbsp;<input type="text" name="pressureVesselHazards.registerId" />
	&nbsp;&nbsp;使用证编号:&nbsp;&nbsp;<input type="text" name="pressureVesselHazards.certificateId" />
	&nbsp;&nbsp;类别:&nbsp;&nbsp;<input type="text" name="pressureVesselHazards.type" />
	&nbsp;&nbsp;设计单位:&nbsp;&nbsp;<input type="text" name="pressureVesselHazards.designDept" />
	&nbsp;&nbsp;投用年月:&nbsp;&nbsp;<input type="text" name="pressureVesselHazards.useTime" />
	&nbsp;&nbsp;使用单位:&nbsp;&nbsp;<input type="text" name="pressureVesselHazards.useDept" />
	&nbsp;&nbsp;制造单位:&nbsp;&nbsp;<input type="text" name="pressureVesselHazards.createDept" />
	&nbsp;&nbsp;制造年月:&nbsp;&nbsp;<input type="text" name="pressureVesselHazards.createYear" />
	&nbsp;&nbsp;出厂编号:&nbsp;&nbsp;<input type="text" name="pressureVesselHazards.facoryId" />
	&nbsp;&nbsp;筒体:&nbsp;&nbsp;<input type="text" name="pressureVesselHazards.tongti" />
	&nbsp;&nbsp;封头:&nbsp;&nbsp;<input type="text" name="pressureVesselHazards.fengtou" />
	&nbsp;&nbsp;内衬:&nbsp;&nbsp;<input type="text" name="pressureVesselHazards.neichen" />
	&nbsp;&nbsp;内径:&nbsp;&nbsp;<input type="text" name="pressureVesselHazards.neijing" />
	&nbsp;&nbsp;设计压力:&nbsp;&nbsp;<input type="text" name="pressureVesselHazards.designPresure" />
	&nbsp;&nbsp;壁厚:&nbsp;&nbsp;<input type="text" name="pressureVesselHazards.bihou" />
	&nbsp;&nbsp;最高工作压力:&nbsp;&nbsp;<input type="text" name="pressureVesselHazards.zggzyl" />
	&nbsp;&nbsp;高（长）:&nbsp;&nbsp;<input type="text" name="pressureVesselHazards.height" />
	&nbsp;&nbsp;设计温度:&nbsp;&nbsp;<input type="text" name="pressureVesselHazards.designTemp" />
	&nbsp;&nbsp;容积:&nbsp;&nbsp;<input type="text" name="pressureVesselHazards.volume" />
	&nbsp;&nbsp;介质:&nbsp;&nbsp;<input type="text" name="pressureVesselHazards.jiezhi" />
	&nbsp;&nbsp;有无保温、绝热:&nbsp;&nbsp;<input type="text" name="pressureVesselHazards.haveBw" />
	&nbsp;&nbsp;是否有安全阀:&nbsp;&nbsp;<input type="text" name="pressureVesselHazards.haveAqf" />
	&nbsp;&nbsp;是否有爆破片:&nbsp;&nbsp;<input type="text" name="pressureVesselHazards.haveBpp" />
	&nbsp;&nbsp;是否有紧急切断阀:&nbsp;&nbsp;<input type="text" name="pressureVesselHazards.haveJjqdf" />
	&nbsp;&nbsp;是否有压力表:&nbsp;&nbsp;<input type="text" name="pressureVesselHazards.haveYlb" />
	&nbsp;&nbsp;是否有液面计:&nbsp;&nbsp;<input type="text" name="pressureVesselHazards.haveYmy" />
	&nbsp;&nbsp;安全状况等级:&nbsp;&nbsp;<input type="text" name="pressureVesselHazards.safeLevel" />
	&nbsp;&nbsp;定期检验情况:&nbsp;&nbsp;<input type="text" name="pressureVesselHazards.regularCheck" />
	&nbsp;&nbsp;备注:&nbsp;&nbsp;<input type="text" name="pressureVesselHazards.remark" />
	&nbsp;&nbsp;填表人:&nbsp;&nbsp;<input type="text" name="pressureVesselHazards.saveMan" />
	&nbsp;&nbsp;联系电话:&nbsp;&nbsp;<input type="text" name="pressureVesselHazards.contactPhone" />
	&nbsp;&nbsp;填表日期:&nbsp;&nbsp;<input type="text" name="pressureVesselHazards.saveTime" />
	
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
			
            <th align="center" field="name" width="150" formatter="gridFormatterLength" >名称</th>
            <th align="center" field="ownId" width="150" formatter="gridFormatterLength" >编号</th>
            <th align="center" field="registerId" width="150" formatter="gridFormatterLength" >注册编号</th>
            <th align="center" field="certificateId" width="150" formatter="gridFormatterLength" >使用证编号</th>
            <th align="center" field="type" width="150" formatter="gridFormatterLength" >类别</th>
            <th align="center" field="designDept" width="150" formatter="gridFormatterLength" >设计单位</th>
            <th align="center" field="useTime" width="150" formatter="gridFormatterLength" >投用年月</th>
            <th align="center" field="useDept" width="150" formatter="gridFormatterLength" >使用单位</th>
            <th align="center" field="createDept" width="150" formatter="gridFormatterLength" >制造单位</th>
            <th align="center" field="createYear" width="150" formatter="gridFormatterLength" >制造年月</th>
            <th align="center" field="facoryId" width="150" formatter="gridFormatterLength" >出厂编号</th>
            <th align="center" field="tongti" width="150" formatter="gridFormatterLength" >筒体</th>
            <th align="center" field="fengtou" width="150" formatter="gridFormatterLength" >封头</th>
            <th align="center" field="neichen" width="150" formatter="gridFormatterLength" >内衬</th>
            <th align="center" field="neijing" width="150" formatter="gridFormatterLength" >内径</th>
            <th align="center" field="designPresure" width="150" formatter="gridFormatterLength" >设计压力</th>
            <th align="center" field="bihou" width="150" formatter="gridFormatterLength" >壁厚</th>
            <th align="center" field="zggzyl" width="150" formatter="gridFormatterLength" >最高工作压力</th>
            <th align="center" field="height" width="150" formatter="gridFormatterLength" >高（长）</th>
            <th align="center" field="designTemp" width="150" formatter="gridFormatterLength" >设计温度</th>
            <th align="center" field="volume" width="150" formatter="gridFormatterLength" >容积</th>
            <th align="center" field="jiezhi" width="150" formatter="gridFormatterLength" >介质</th>
            <th align="center" field="haveBw" width="150" formatter="gridFormatterLength" >有无保温、绝热</th>
            <th align="center" field="haveAqf" width="150" formatter="gridFormatterLength" >是否有安全阀</th>
            <th align="center" field="haveBpp" width="150" formatter="gridFormatterLength" >是否有爆破片</th>
            <th align="center" field="haveJjqdf" width="150" formatter="gridFormatterLength" >是否有紧急切断阀</th>
            <th align="center" field="haveYlb" width="150" formatter="gridFormatterLength" >是否有压力表</th>
            <th align="center" field="haveYmy" width="150" formatter="gridFormatterLength" >是否有液面计</th>
            <th align="center" field="safeLevel" width="150" formatter="gridFormatterLength" >安全状况等级</th>
            <th align="center" field="regularCheck" width="150" formatter="gridFormatterLength" >定期检验情况</th>
            <th align="center" field="remark" width="150" formatter="gridFormatterLength" >备注</th>
            <th align="center" field="saveMan" width="150" formatter="gridFormatterLength" >填表人</th>
            <th align="center" field="contactPhone" width="150" formatter="gridFormatterLength" >联系电话</th>
            <th align="center" field="saveTime" width="150" formatter="gridFormatterLength" >填表日期</th>
            <th field="id" width="120" formatter="gridFormatter">操作</th>         
        </tr>
        </thead>
    </table>
</div>

	<!-- 添加更新窗口 -->
	<div style="display: none;">
		<form id="addForm" method="post" style="width: 960px; height: 500px;">
			<input type="hidden" name="pressureVesselHazards.id"/>
			<div style="margin: 0 auto;" align="center" name="addDiv">
				<table class="detailTable" style="width: 80%;">
					
						<tr>
							<td class="labelTd">名称:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.name"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">编号:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.ownId"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">注册编号:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.registerId"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">使用证编号:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.certificateId"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">类别:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.type"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">设计单位:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.designDept"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">投用年月:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.useTime"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">使用单位:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.useDept"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">制造单位:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.createDept"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">制造年月:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.createYear"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">出厂编号:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.facoryId"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">筒体:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.tongti"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">封头:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.fengtou"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">内衬:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.neichen"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">内径:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.neijing"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">设计压力:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.designPresure"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">壁厚:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.bihou"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">最高工作压力:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.zggzyl"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">高（长）:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.height"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">设计温度:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.designTemp"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">容积:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.volume"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">介质:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.jiezhi"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">有无保温、绝热:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.haveBw"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">是否有安全阀:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.haveAqf"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">是否有爆破片:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.haveBpp"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">是否有紧急切断阀:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.haveJjqdf"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">是否有压力表:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.haveYlb"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">是否有液面计:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.haveYmy"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">安全状况等级:</td>
							<td colspan="3" class="contentTd">
							<textarea class="easyui-validatebox" name="pressureVesselHazards.safeLevel"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">定期检验情况:</td>
							<td colspan="3" class="contentTd">
							<textarea class="easyui-validatebox" name="pressureVesselHazards.regularCheck"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">备注:</td>
							<td colspan="3" class="contentTd">
							<textarea class="easyui-validatebox" name="pressureVesselHazards.remark"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">填表人:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.saveMan"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">联系电话:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.contactPhone"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">填表日期:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="pressureVesselHazards.saveTime"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
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