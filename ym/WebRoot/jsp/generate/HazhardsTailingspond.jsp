<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>尾矿库</title>

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
    		                url:'${ctx}/hazhardsTailingspond/hazhardsTailingspondAction!add',
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
                url:'${ctx}/hazhardsTailingspond/hazhardsTailingspondAction!getById?id=' + rowId,
                method:'POST',
                success:function (data) {
                	var obj = {};
                	$.each(data,function(i,item){
                		obj["hazhardsTailingspond."+i] = item;
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
            						url:'${ctx}/hazhardsTailingspond/hazhardsTailingspondAction!update',
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
                url:'${ctx}/hazhardsTailingspond/hazhardsTailingspondAction!getById?id=' + rowId,
                method:'POST',
                success:function (data) {
                	$.each(data,function(i,item){
                		$('#viewForm span[name="hazhardsTailingspond.'+i+'"]').html(item);
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
                            url:'${ctx}/hazhardsTailingspond/hazhardsTailingspondAction!delete?ids=' + ids,
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
		             '${ctx}/hazhardsTailingspond/hazhardsTailingspondAction!list',
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
	
	&nbsp;&nbsp;企业名称:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.qymc" />
	&nbsp;&nbsp;主要负责人:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.zyfzr" />
	&nbsp;&nbsp;详细地址:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.xxdz" />
	&nbsp;&nbsp;联系电话:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.lxdh" />
	&nbsp;&nbsp;上级主管:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.sjzg" />
	&nbsp;&nbsp;邮政编码:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.yzbm" />
	&nbsp;&nbsp;建长日期:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.jcrq" />
	&nbsp;&nbsp;从业人数:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.cyrs" />
	&nbsp;&nbsp;经济类型:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.jjlx" />
	&nbsp;&nbsp;矿种:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.kz" />
	&nbsp;&nbsp;固定资产（万元）:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.kdzc" />
	&nbsp;&nbsp;年利润（万元）:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.nlr" />
	&nbsp;&nbsp;尾矿库名称:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.wkkmc" />
	&nbsp;&nbsp;地理位置:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.dlwz" />
	&nbsp;&nbsp;尾矿库型式:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.wkkxs" />
	&nbsp;&nbsp;尾矿库等别:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.wkkdb" />
	&nbsp;&nbsp;全库容（万m³）:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.qkr" />
	&nbsp;&nbsp;坝高（m）:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.bg" />
	&nbsp;&nbsp;设计总库容（万m³）:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.sjzkr" />
	&nbsp;&nbsp;设计总坝高:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.sjzbg" />
	&nbsp;&nbsp;坝长（m）:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.bc" />
	&nbsp;&nbsp;最小干滩度（m）:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.zxgtcd" />
	&nbsp;&nbsp;沉积干滩平均坡度（m）:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.cjgtpjpd" />
	&nbsp;&nbsp;尾矿库危害程度分类:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.wkkwhcdfl" />
	&nbsp;&nbsp;尾矿库安全度分类:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.wkkaqdfl" />
	&nbsp;&nbsp;如果尾矿库失事是否会使下游重要城镇、工矿企业、重要铁路干线遭受严重灾害:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.sfyzwh" />
	&nbsp;&nbsp;坝址区地震基本烈度:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.jbld" />
	&nbsp;&nbsp;库区有无滑坡体:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.ywhpt" />
	&nbsp;&nbsp;库区有无产生泥石流的条件:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.ywnsl" />
	&nbsp;&nbsp;库区是否处于岩溶或裂隙发育地区:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.fydq" />
	&nbsp;&nbsp;库区有无滥伐、滥垦、滥牧现象:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.ywlf" />
	&nbsp;&nbsp;坝型:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.bx" />
	&nbsp;&nbsp;坝高（m）:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.cqbg" />
	&nbsp;&nbsp;坝长（m）:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.cqbc" />
	&nbsp;&nbsp;堆坝方法:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.dbff" />
	&nbsp;&nbsp;堆高（m）:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.dg" />
	&nbsp;&nbsp;尾矿分级设备型号:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.wkfjsbxh" />
	&nbsp;&nbsp;数量:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.sl" />
	&nbsp;&nbsp;汇水面积（km²）:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.hsmj" />
	&nbsp;&nbsp;初期（年）:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.cq" />
	&nbsp;&nbsp;中、后期（年）:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.zhq" />
	&nbsp;&nbsp;尾矿坝安全超高:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.wkbaqcg" />
	&nbsp;&nbsp;尾矿库调洪库容（万m³）:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.wkkdhkr" />
	&nbsp;&nbsp;排洪系统的型式:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.phxtdxs" />
	&nbsp;&nbsp;尾矿粒度d（mm）:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.wkld" />
	&nbsp;&nbsp;尾矿比重	（t/m3）:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.wkbz" />
	&nbsp;&nbsp;尾矿坝的观测项目:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.wkkdgcxm" />
	&nbsp;&nbsp;尾矿库的尾矿浓缩分级、放矿筑坝、回水排水、防汛渡汛、抗震等工作概述:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.wkkgs" />
	&nbsp;&nbsp;如果是危库、险库或病库,对危险情况作出概述:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.wkxkbkgs" />
	&nbsp;&nbsp;尾矿库曾出现的问题及采取的解决办法:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.jjff" />
	&nbsp;&nbsp;备注:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.bz" />
	&nbsp;&nbsp;填表人:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.tbr" />
	&nbsp;&nbsp;填表人联系电话:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.tbrlxdh" />
	&nbsp;&nbsp;填表日期:&nbsp;&nbsp;<input type="text" name="hazhardsTailingspond.tbrq" />
	
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
			
            <th align="center" field="qymc" width="150" formatter="gridFormatterLength" >企业名称</th>
            <th align="center" field="zyfzr" width="150" formatter="gridFormatterLength" >主要负责人</th>
            <th align="center" field="xxdz" width="150" formatter="gridFormatterLength" >详细地址</th>
            <th align="center" field="lxdh" width="150" formatter="gridFormatterLength" >联系电话</th>
            <th align="center" field="sjzg" width="150" formatter="gridFormatterLength" >上级主管</th>
            <th align="center" field="yzbm" width="150" formatter="gridFormatterLength" >邮政编码</th>
            <th align="center" field="jcrq" width="150" formatter="gridFormatterLength" >建长日期</th>
            <th align="center" field="cyrs" width="150" formatter="gridFormatterLength" >从业人数</th>
            <th align="center" field="jjlx" width="150" formatter="gridFormatterLength" >经济类型</th>
            <th align="center" field="kz" width="150" formatter="gridFormatterLength" >矿种</th>
            <th align="center" field="kdzc" width="150" formatter="gridFormatterLength" >固定资产（万元）</th>
            <th align="center" field="nlr" width="150" formatter="gridFormatterLength" >年利润（万元）</th>
            <th align="center" field="wkkmc" width="150" formatter="gridFormatterLength" >尾矿库名称</th>
            <th align="center" field="dlwz" width="150" formatter="gridFormatterLength" >地理位置</th>
            <th align="center" field="wkkxs" width="150" formatter="gridFormatterLength" >尾矿库型式</th>
            <th align="center" field="wkkdb" width="150" formatter="gridFormatterLength" >尾矿库等别</th>
            <th align="center" field="qkr" width="150" formatter="gridFormatterLength" >全库容（万m³）</th>
            <th align="center" field="bg" width="150" formatter="gridFormatterLength" >坝高（m）</th>
            <th align="center" field="sjzkr" width="150" formatter="gridFormatterLength" >设计总库容（万m³）</th>
            <th align="center" field="sjzbg" width="150" formatter="gridFormatterLength" >设计总坝高</th>
            <th align="center" field="bc" width="150" formatter="gridFormatterLength" >坝长（m）</th>
            <th align="center" field="zxgtcd" width="150" formatter="gridFormatterLength" >最小干滩度（m）</th>
            <th align="center" field="cjgtpjpd" width="150" formatter="gridFormatterLength" >沉积干滩平均坡度（m）</th>
            <th align="center" field="wkkwhcdfl" width="150" formatter="gridFormatterLength" >尾矿库危害程度分类</th>
            <th align="center" field="wkkaqdfl" width="150" formatter="gridFormatterLength" >尾矿库安全度分类</th>
            <th align="center" field="sfyzwh" width="150" formatter="gridFormatterLength" >如果尾矿库失事是否会使下游重要城镇、工矿企业、重要铁路干线遭受严重灾害</th>
            <th align="center" field="jbld" width="150" formatter="gridFormatterLength" >坝址区地震基本烈度</th>
            <th align="center" field="ywhpt" width="150" formatter="gridFormatterLength" >库区有无滑坡体</th>
            <th align="center" field="ywnsl" width="150" formatter="gridFormatterLength" >库区有无产生泥石流的条件</th>
            <th align="center" field="fydq" width="150" formatter="gridFormatterLength" >库区是否处于岩溶或裂隙发育地区</th>
            <th align="center" field="ywlf" width="150" formatter="gridFormatterLength" >库区有无滥伐、滥垦、滥牧现象</th>
            <th align="center" field="bx" width="150" formatter="gridFormatterLength" >坝型</th>
            <th align="center" field="cqbg" width="150" formatter="gridFormatterLength" >坝高（m）</th>
            <th align="center" field="cqbc" width="150" formatter="gridFormatterLength" >坝长（m）</th>
            <th align="center" field="dbff" width="150" formatter="gridFormatterLength" >堆坝方法</th>
            <th align="center" field="dg" width="150" formatter="gridFormatterLength" >堆高（m）</th>
            <th align="center" field="wkfjsbxh" width="150" formatter="gridFormatterLength" >尾矿分级设备型号</th>
            <th align="center" field="sl" width="150" formatter="gridFormatterLength" >数量</th>
            <th align="center" field="hsmj" width="150" formatter="gridFormatterLength" >汇水面积（km²）</th>
            <th align="center" field="cq" width="150" formatter="gridFormatterLength" >初期（年）</th>
            <th align="center" field="zhq" width="150" formatter="gridFormatterLength" >中、后期（年）</th>
            <th align="center" field="wkbaqcg" width="150" formatter="gridFormatterLength" >尾矿坝安全超高</th>
            <th align="center" field="wkkdhkr" width="150" formatter="gridFormatterLength" >尾矿库调洪库容（万m³）</th>
            <th align="center" field="phxtdxs" width="150" formatter="gridFormatterLength" >排洪系统的型式</th>
            <th align="center" field="wkld" width="150" formatter="gridFormatterLength" >尾矿粒度d（mm）</th>
            <th align="center" field="wkbz" width="150" formatter="gridFormatterLength" >尾矿比重	（t/m3）</th>
            <th align="center" field="wkkdgcxm" width="150" formatter="gridFormatterLength" >尾矿坝的观测项目</th>
            <th align="center" field="wkkgs" width="150" formatter="gridFormatterLength" >尾矿库的尾矿浓缩分级、放矿筑坝、回水排水、防汛渡汛、抗震等工作概述</th>
            <th align="center" field="wkxkbkgs" width="150" formatter="gridFormatterLength" >如果是危库、险库或病库,对危险情况作出概述</th>
            <th align="center" field="jjff" width="150" formatter="gridFormatterLength" >尾矿库曾出现的问题及采取的解决办法</th>
            <th align="center" field="bz" width="150" formatter="gridFormatterLength" >备注</th>
            <th align="center" field="tbr" width="150" formatter="gridFormatterLength" >填表人</th>
            <th align="center" field="tbrlxdh" width="150" formatter="gridFormatterLength" >填表人联系电话</th>
            <th align="center" field="tbrq" width="150" formatter="gridFormatterLength" >填表日期</th>
            <th field="id" width="120" formatter="gridFormatter">操作</th>         
        </tr>
        </thead>
    </table>
</div>

	<!-- 添加更新窗口 -->
	<div style="display: none;">
		<form id="addForm" method="post" style="width: 960px; height: 500px;">
			<input type="hidden" name="hazhardsTailingspond.id"/>
			<div style="margin: 0 auto;" align="center" name="addDiv">
				<table class="detailTable" style="width: 80%;">
					
						<tr>
							<td class="labelTd">企业名称:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.qymc"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">主要负责人:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.zyfzr"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">详细地址:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.xxdz"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">联系电话:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.lxdh"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">上级主管:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.sjzg"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">邮政编码:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.yzbm"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">建长日期:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.jcrq"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">从业人数:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.cyrs"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">经济类型:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.jjlx"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">矿种:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.kz"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">固定资产（万元）:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.kdzc"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">年利润（万元）:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.nlr"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">尾矿库名称:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.wkkmc"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">地理位置:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.dlwz"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">尾矿库型式:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.wkkxs"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">尾矿库等别:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.wkkdb"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">全库容（万m³）:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.qkr"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">坝高（m）:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.bg"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">设计总库容（万m³）:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.sjzkr"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">设计总坝高:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.sjzbg"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">坝长（m）:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.bc"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">最小干滩度（m）:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.zxgtcd"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">沉积干滩平均坡度（m）:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.cjgtpjpd"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">尾矿库危害程度分类:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.wkkwhcdfl"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">尾矿库安全度分类:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.wkkaqdfl"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">如果尾矿库失事是否会使下游重要城镇、工矿企业、重要铁路干线遭受严重灾害:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.sfyzwh"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">坝址区地震基本烈度:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.jbld"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">库区有无滑坡体:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.ywhpt"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">库区有无产生泥石流的条件:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.ywnsl"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">库区是否处于岩溶或裂隙发育地区:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.fydq"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">库区有无滥伐、滥垦、滥牧现象:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.ywlf"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">坝型:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.bx"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">坝高（m）:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.cqbg"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">坝长（m）:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.cqbc"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">堆坝方法:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.dbff"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">堆高（m）:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.dg"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">尾矿分级设备型号:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.wkfjsbxh"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">数量:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.sl"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">汇水面积（km²）:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.hsmj"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">初期（年）:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.cq"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">中、后期（年）:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.zhq"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">尾矿坝安全超高:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.wkbaqcg"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">尾矿库调洪库容（万m³）:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.wkkdhkr"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">排洪系统的型式:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.phxtdxs"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">尾矿粒度d（mm）:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.wkld"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">尾矿比重	（t/m3）:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.wkbz"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">尾矿坝的观测项目:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.wkkdgcxm"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="contentTd" colspan="2">
							</td>
						</tr>
						<tr>
							<td class="labelTd">尾矿库的尾矿浓缩分级、放矿筑坝、回水排水、防汛渡汛、抗震等工作概述:</td>
							<td colspan="3" class="contentTd">
							<textarea class="easyui-validatebox" name="hazhardsTailingspond.wkkgs"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						<tr>
							<td class="labelTd">如果是危库、险库或病库,对危险情况作出概述:</td>
							<td colspan="3" class="contentTd">
							<textarea class="easyui-validatebox" name="hazhardsTailingspond.wkxkbkgs"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">尾矿库曾出现的问题及采取的解决办法:</td>
							<td colspan="3" class="contentTd">
							<textarea class="easyui-validatebox" name="hazhardsTailingspond.jjff"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">备注:</td>
							<td colspan="3" class="contentTd">
							<textarea class="easyui-validatebox" name="hazhardsTailingspond.bz"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">填表人:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.tbr"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">填表人联系电话:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.tbrlxdh"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">填表日期:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="hazhardsTailingspond.tbrq"
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