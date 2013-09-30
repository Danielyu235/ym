<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>库房</title>

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
    		                url:'${ctx}/reservoirHazards/reservoirHazardsAction!add',
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
                url:'${ctx}/reservoirHazards/reservoirHazardsAction!getById?id=' + rowId,
                method:'POST',
                success:function (data) {
                	var obj = {};
                	$.each(data,function(i,item){
                		obj["reservoirHazards."+i] = item;
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
            						url:'${ctx}/reservoirHazards/reservoirHazardsAction!update',
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
                url:'${ctx}/reservoirHazards/reservoirHazardsAction!getById?id=' + rowId,
                method:'POST',
                success:function (data) {
                	$.each(data,function(i,item){
                		$('#viewForm span[name="reservoirHazards.'+i+'"]').html(item);
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
                            url:'${ctx}/reservoirHazards/reservoirHazardsAction!delete?ids=' + ids,
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
		             '${ctx}/reservoirHazards/reservoirHazardsAction!list',
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
	
	&nbsp;&nbsp;库区ID:&nbsp;&nbsp;<input type="text" name="reservoirHazards.areaId" />
	&nbsp;&nbsp;库房序号:&nbsp;&nbsp;<input type="text" name="reservoirHazards.no" />
	&nbsp;&nbsp;库房名称:&nbsp;&nbsp;<input type="text" name="reservoirHazards.name" />
	&nbsp;&nbsp;库房形式:&nbsp;&nbsp;<input type="text" name="reservoirHazards.style" />
	&nbsp;&nbsp;库房结构:&nbsp;&nbsp;<input type="text" name="reservoirHazards.structure" />
	&nbsp;&nbsp;设计使用年限:&nbsp;&nbsp;<input type="text" name="reservoirHazards.useYearTime" />
	&nbsp;&nbsp;竣工时间:&nbsp;&nbsp;<input type="text" name="reservoirHazards.buildTime" />
	&nbsp;&nbsp;占地面积:&nbsp;&nbsp;<input type="text" name="reservoirHazards.area" />
	&nbsp;&nbsp;有无防火墙:&nbsp;&nbsp;<input type="text" name="reservoirHazards.hasFireWall" />
	&nbsp;&nbsp;起爆器材:&nbsp;&nbsp;<input type="text" name="reservoirHazards.explosionEquipment" />
	&nbsp;&nbsp;工业炸药:&nbsp;&nbsp;<input type="text" name="reservoirHazards.explosionExplosive" />
	&nbsp;&nbsp;爆炸危险原材料:&nbsp;&nbsp;<input type="text" name="reservoirHazards.explosionMaterials" />
	&nbsp;&nbsp;烟火剂、烟花爆竹:&nbsp;&nbsp;<input type="text" name="reservoirHazards.firecracker" />
	&nbsp;&nbsp;闪点＜28℃:&nbsp;&nbsp;<input type="text" name="reservoirHazards.liquidLess" />
	&nbsp;&nbsp;28℃≤闪点＜60℃:&nbsp;&nbsp;<input type="text" name="reservoirHazards.liquidMore" />
	&nbsp;&nbsp;爆炸下限＜10%:&nbsp;&nbsp;<input type="text" name="reservoirHazards.gasLess" />
	&nbsp;&nbsp;爆炸下限≥10%:&nbsp;&nbsp;<input type="text" name="reservoirHazards.gasMore" />
	&nbsp;&nbsp;剧毒品:&nbsp;&nbsp;<input type="text" name="reservoirHazards.poisonMost" />
	&nbsp;&nbsp;有毒品:&nbsp;&nbsp;<input type="text" name="reservoirHazards.poisonMore" />
	&nbsp;&nbsp;有害品:&nbsp;&nbsp;<input type="text" name="reservoirHazards.poisonLittle" />
	
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
			
            <th align="center" field="areaId" width="150" formatter="gridFormatterLength" >库区ID</th>
            <th align="center" field="no" width="150" formatter="gridFormatterLength" >库房序号</th>
            <th align="center" field="name" width="150" formatter="gridFormatterLength" >库房名称</th>
            <th align="center" field="style" width="150" formatter="gridFormatterLength" >库房形式</th>
            <th align="center" field="structure" width="150" formatter="gridFormatterLength" >库房结构</th>
            <th align="center" field="useYearTime" width="150" formatter="gridFormatterLength" >设计使用年限</th>
            <th align="center" field="buildTime" width="150" formatter="gridFormatterLength" >竣工时间</th>
            <th align="center" field="area" width="150" formatter="gridFormatterLength" >占地面积</th>
            <th align="center" field="hasFireWall" width="150" formatter="gridFormatterLength" >有无防火墙</th>
            <th align="center" field="explosionEquipment" width="150" formatter="gridFormatterLength" >起爆器材</th>
            <th align="center" field="explosionExplosive" width="150" formatter="gridFormatterLength" >工业炸药</th>
            <th align="center" field="explosionMaterials" width="150" formatter="gridFormatterLength" >爆炸危险原材料</th>
            <th align="center" field="firecracker" width="150" formatter="gridFormatterLength" >烟火剂、烟花爆竹</th>
            <th align="center" field="liquidLess" width="150" formatter="gridFormatterLength" >闪点＜28℃</th>
            <th align="center" field="liquidMore" width="150" formatter="gridFormatterLength" >28℃≤闪点＜60℃</th>
            <th align="center" field="gasLess" width="150" formatter="gridFormatterLength" >爆炸下限＜10%</th>
            <th align="center" field="gasMore" width="150" formatter="gridFormatterLength" >爆炸下限≥10%</th>
            <th align="center" field="poisonMost" width="150" formatter="gridFormatterLength" >剧毒品</th>
            <th align="center" field="poisonMore" width="150" formatter="gridFormatterLength" >有毒品</th>
            <th align="center" field="poisonLittle" width="150" formatter="gridFormatterLength" >有害品</th>
            <th field="id" width="120" formatter="gridFormatter">操作</th>         
        </tr>
        </thead>
    </table>
</div>

	<!-- 添加更新窗口 -->
	<div style="display: none;">
		<form id="addForm" method="post" style="width: 960px; height: 500px;">
			<input type="hidden" name="reservoirHazards.id"/>
			<div style="margin: 0 auto;" align="center" name="addDiv">
				<table class="detailTable" style="width: 80%;">
					
						<tr>
							<td class="labelTd">库区ID:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="reservoirHazards.areaId"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">库房序号:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="reservoirHazards.no"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">库房名称:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="reservoirHazards.name"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">库房形式:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="reservoirHazards.style"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">库房结构:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="reservoirHazards.structure"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">设计使用年限:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="reservoirHazards.useYearTime"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">竣工时间:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="reservoirHazards.buildTime"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">占地面积:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="reservoirHazards.area"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">有无防火墙:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="reservoirHazards.hasFireWall"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">起爆器材:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="reservoirHazards.explosionEquipment"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">工业炸药:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="reservoirHazards.explosionExplosive"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">爆炸危险原材料:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="reservoirHazards.explosionMaterials"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">烟火剂、烟花爆竹:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="reservoirHazards.firecracker"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">闪点＜28℃:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="reservoirHazards.liquidLess"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">28℃≤闪点＜60℃:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="reservoirHazards.liquidMore"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">爆炸下限＜10%:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="reservoirHazards.gasLess"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">爆炸下限≥10%:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="reservoirHazards.gasMore"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">剧毒品:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="reservoirHazards.poisonMost"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">有毒品:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="reservoirHazards.poisonMore"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">有害品:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="reservoirHazards.poisonLittle"
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