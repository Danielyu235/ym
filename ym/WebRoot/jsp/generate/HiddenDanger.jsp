<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>安全隐患排查</title>

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
    		                url:'${ctx}/hiddenDanger/hiddenDangerAction!add',
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
                url:'${ctx}/hiddenDanger/hiddenDangerAction!getById?id=' + rowId,
                method:'POST',
                success:function (data) {
                	var obj = {};
                	$.each(data,function(i,item){
                		obj["hiddenDanger."+i] = item;
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
            						url:'${ctx}/hiddenDanger/hiddenDangerAction!update',
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
                url:'${ctx}/hiddenDanger/hiddenDangerAction!getById?id=' + rowId,
                method:'POST',
                success:function (data) {
                	$.each(data,function(i,item){
                		$('#viewForm span[name="hiddenDanger.'+i+'"]').html(item);
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
                            url:'${ctx}/hiddenDanger/hiddenDangerAction!delete?ids=' + ids,
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
		             '${ctx}/hiddenDanger/hiddenDangerAction!list',
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
	
	&nbsp;&nbsp;序号:&nbsp;&nbsp;<input type="text" name="hiddenDanger.corpKey" />
	&nbsp;&nbsp;隐患类别:&nbsp;&nbsp;<input type="text" name="hiddenDanger.hiddenDangerType" />
	&nbsp;&nbsp;存在问题及具体隐患内容:&nbsp;&nbsp;<input type="text" name="hiddenDanger.quession" />
	&nbsp;&nbsp;整改期限:&nbsp;&nbsp;<input type="text" name="hiddenDanger.periodTime" />
	&nbsp;&nbsp;煤矿整改负责人:&nbsp;&nbsp;<input type="text" name="hiddenDanger.periodPerson" />
	&nbsp;&nbsp;验收情况:&nbsp;&nbsp;<input type="text" name="hiddenDanger.acceptance" />
	&nbsp;&nbsp;是否销号:&nbsp;&nbsp;<input type="text" name="hiddenDanger.pin" />
	&nbsp;&nbsp;验收人员签字:&nbsp;&nbsp;<input type="text" name="hiddenDanger.accepter" />
	&nbsp;&nbsp;备注:&nbsp;&nbsp;<input type="text" name="hiddenDanger.bz" />
	
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
			
            <th align="center" field="corpKey" width="150" formatter="gridFormatterLength" >序号</th>
            <th align="center" field="hiddenDangerType" width="150" formatter="gridFormatterLength" >隐患类别</th>
            <th align="center" field="quession" width="150" formatter="gridFormatterLength" >存在问题及具体隐患内容</th>
            <th align="center" field="periodTime" width="150" formatter="gridFormatterLength" >整改期限</th>
            <th align="center" field="periodPerson" width="150" formatter="gridFormatterLength" >煤矿整改负责人</th>
            <th align="center" field="acceptance" width="150" formatter="gridFormatterLength" >验收情况</th>
            <th align="center" field="pin" width="150" formatter="gridFormatterLength" >是否销号</th>
            <th align="center" field="accepter" width="150" formatter="gridFormatterLength" >验收人员签字</th>
            <th align="center" field="bz" width="150" formatter="gridFormatterLength" >备注</th>
            <th field="id" width="120" formatter="gridFormatter">操作</th>         
        </tr>
        </thead>
    </table>
</div>

	<!-- 添加更新窗口 -->
	<div style="display: none;">
		<form id="addForm" method="post" style="width: 960px; height: 500px;">
			<input type="hidden" name="hiddenDanger.id"/>
			<div style="margin: 0 auto;" align="center" name="addDiv">
				<table class="detailTable" style="width: 80%;">
					
						<tr>
							<td class="labelTd">序号:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hiddenDanger.corpKey"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">隐患类别:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hiddenDanger.hiddenDangerType"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">存在问题及具体隐患内容:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hiddenDanger.quession"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">整改期限:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hiddenDanger.periodTime"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">煤矿整改负责人:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hiddenDanger.periodPerson"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">验收情况:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hiddenDanger.acceptance"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">是否销号:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hiddenDanger.pin"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">验收人员签字:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hiddenDanger.accepter"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">备注:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hiddenDanger.bz"
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