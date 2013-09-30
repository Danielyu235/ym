<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>采煤系统主题</title>

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
    		                url:'${ctx}/coal/coalAction!add',
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
                url:'${ctx}/coal/coalAction!getById?id=' + rowId,
                method:'POST',
                success:function (data) {
                	var obj = {};
                	$.each(data,function(i,item){
                		obj["coal."+i] = item;
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
            						url:'${ctx}/coal/coalAction!update',
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
                url:'${ctx}/coal/coalAction!getById?id=' + rowId,
                method:'POST',
                success:function (data) {
                	$.each(data,function(i,item){
                		$('#viewForm span[name="coal.'+i+'"]').html(item);
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
                            url:'${ctx}/coal/coalAction!delete?ids=' + ids,
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
		             '${ctx}/coal/coalAction!list',
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
	
	&nbsp;&nbsp;serialVersionUID:&nbsp;&nbsp;<input type="text" name="coal.serialVersionUID" />
	&nbsp;&nbsp;月份:&nbsp;&nbsp;<input type="text" name="coal.month" />
	&nbsp;&nbsp;组别:&nbsp;&nbsp;<input type="text" name="coal.group" />
	&nbsp;&nbsp;产量计划:&nbsp;&nbsp;<input type="text" name="coal.planYield" />
	&nbsp;&nbsp;产量日产:&nbsp;&nbsp;<input type="text" name="coal.dailyOutput" />
	&nbsp;&nbsp;产量奋斗计划:&nbsp;&nbsp;<input type="text" name="coal.struggleYield" />
	&nbsp;&nbsp;进尺计划:&nbsp;&nbsp;<input type="text" name="coal.footagePlan" />
	&nbsp;&nbsp;进尺日进:&nbsp;&nbsp;<input type="text" name="coal.footageDaily" />
	&nbsp;&nbsp;进尺奋斗计划:&nbsp;&nbsp;<input type="text" name="coal.fstruggleYield" />
	&nbsp;&nbsp;工作面:&nbsp;&nbsp;<input type="text" name="coal.workingFace" />
	&nbsp;&nbsp;人员效率:&nbsp;&nbsp;<input type="text" name="coal.StaffEfficiency" />
	&nbsp;&nbsp;回采率:&nbsp;&nbsp;<input type="text" name="coal.recoveryRatio" />
	&nbsp;&nbsp;精品煤①:&nbsp;&nbsp;<input type="text" name="coal.boutiqueCoalOne" />
	&nbsp;&nbsp;精品煤②:&nbsp;&nbsp;<input type="text" name="coal.boutiqueCoalTwo" />
	&nbsp;&nbsp;块炭:&nbsp;&nbsp;<input type="text" name="coal.carbonBlock" />
	&nbsp;&nbsp;末煤:&nbsp;&nbsp;<input type="text" name="coal.smalls" />
	
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
			
            <th align="center" field="serialVersionUID" width="150" formatter="gridFormatterLength" >serialVersionUID</th>
            <th align="center" field="month" width="150" formatter="gridFormatterLength" >月份</th>
            <th align="center" field="group" width="150" formatter="gridFormatterLength" >组别</th>
            <th align="center" field="planYield" width="150" formatter="gridFormatterLength" >产量计划</th>
            <th align="center" field="dailyOutput" width="150" formatter="gridFormatterLength" >产量日产</th>
            <th align="center" field="struggleYield" width="150" formatter="gridFormatterLength" >产量奋斗计划</th>
            <th align="center" field="footagePlan" width="150" formatter="gridFormatterLength" >进尺计划</th>
            <th align="center" field="footageDaily" width="150" formatter="gridFormatterLength" >进尺日进</th>
            <th align="center" field="fstruggleYield" width="150" formatter="gridFormatterLength" >进尺奋斗计划</th>
            <th align="center" field="workingFace" width="150" formatter="gridFormatterLength" >工作面</th>
            <th align="center" field="StaffEfficiency" width="150" formatter="gridFormatterLength" >人员效率</th>
            <th align="center" field="recoveryRatio" width="150" formatter="gridFormatterLength" >回采率</th>
            <th align="center" field="boutiqueCoalOne" width="150" formatter="gridFormatterLength" >精品煤①</th>
            <th align="center" field="boutiqueCoalTwo" width="150" formatter="gridFormatterLength" >精品煤②</th>
            <th align="center" field="carbonBlock" width="150" formatter="gridFormatterLength" >块炭</th>
            <th align="center" field="smalls" width="150" formatter="gridFormatterLength" >末煤</th>
            <th field="id" width="120" formatter="gridFormatter">操作</th>         
        </tr>
        </thead>
    </table>
</div>

	<!-- 添加更新窗口 -->
	<div style="display: none;">
		<form id="addForm" method="post" style="width: 960px; height: 500px;">
			<input type="hidden" name="coal.id"/>
			<div style="margin: 0 auto;" align="center" name="addDiv">
				<table class="detailTable" style="width: 80%;">
					
						<tr>
							<td class="labelTd">serialVersionUID:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="coal.serialVersionUID"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">月份:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="coal.month"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">组别:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="coal.group"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">产量计划:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="coal.planYield"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">产量日产:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="coal.dailyOutput"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">产量奋斗计划:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="coal.struggleYield"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">进尺计划:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="coal.footagePlan"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">进尺日进:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="coal.footageDaily"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">进尺奋斗计划:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="coal.fstruggleYield"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">工作面:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="coal.workingFace"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">人员效率:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="coal.StaffEfficiency"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">回采率:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="coal.recoveryRatio"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">精品煤①:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="coal.boutiqueCoalOne"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">精品煤②:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="coal.boutiqueCoalTwo"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">块炭:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="coal.carbonBlock"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">末煤:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="coal.smalls"
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