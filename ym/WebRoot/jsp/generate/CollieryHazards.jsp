<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>煤矿</title>

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
    		                url:'${ctx}/collieryHazards/collieryHazardsAction!add',
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
                url:'${ctx}/collieryHazards/collieryHazardsAction!getById?id=' + rowId,
                method:'POST',
                success:function (data) {
                	var obj = {};
                	$.each(data,function(i,item){
                		obj["collieryHazards."+i] = item;
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
            						url:'${ctx}/collieryHazards/collieryHazardsAction!update',
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
                url:'${ctx}/collieryHazards/collieryHazardsAction!getById?id=' + rowId,
                method:'POST',
                success:function (data) {
                	$.each(data,function(i,item){
                		$('#viewForm span[name="collieryHazards.'+i+'"]').html(item);
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
                            url:'${ctx}/collieryHazards/collieryHazardsAction!delete?ids=' + ids,
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
		             '${ctx}/collieryHazards/collieryHazardsAction!list',
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
	
	&nbsp;&nbsp;所属单位:&nbsp;&nbsp;<input type="text" name="collieryHazards.dwdm" />
	&nbsp;&nbsp;矿井名称:&nbsp;&nbsp;<input type="text" name="collieryHazards.name" />
	&nbsp;&nbsp;详细地址:&nbsp;&nbsp;<input type="text" name="collieryHazards.address" />
	&nbsp;&nbsp;邮政编码:&nbsp;&nbsp;<input type="text" name="collieryHazards.postcode" />
	&nbsp;&nbsp;主要负责人:&nbsp;&nbsp;<input type="text" name="collieryHazards.chargePerson" />
	&nbsp;&nbsp;联系电话:&nbsp;&nbsp;<input type="text" name="collieryHazards.chargePersonPhone" />
	&nbsp;&nbsp;上级法人单位:&nbsp;&nbsp;<input type="text" name="collieryHazards.legalCompany" />
	&nbsp;&nbsp;建矿日期:&nbsp;&nbsp;<input type="text" name="collieryHazards.bulidDate" />
	&nbsp;&nbsp;设计能力:&nbsp;&nbsp;<input type="text" name="collieryHazards.designAblity" />
	&nbsp;&nbsp;实际产量:&nbsp;&nbsp;<input type="text" name="collieryHazards.realOutput" />
	&nbsp;&nbsp;煤的牌号:&nbsp;&nbsp;<input type="text" name="collieryHazards.brand" />
	&nbsp;&nbsp;从业人数:&nbsp;&nbsp;<input type="text" name="collieryHazards.workPersonNum" />
	&nbsp;&nbsp;固定资产:&nbsp;&nbsp;<input type="text" name="collieryHazards.fixedAssets" />
	&nbsp;&nbsp;年利润:&nbsp;&nbsp;<input type="text" name="collieryHazards.yearProfit" />
	&nbsp;&nbsp;开拓方式:&nbsp;&nbsp;<input type="text" name="collieryHazards.ktStyle" />
	&nbsp;&nbsp;通风方式:&nbsp;&nbsp;<input type="text" name="collieryHazards.tfStyle" />
	&nbsp;&nbsp;反风方式:&nbsp;&nbsp;<input type="text" name="collieryHazards.ffStyle" />
	&nbsp;&nbsp;提升方式:&nbsp;&nbsp;<input type="text" name="collieryHazards.tsStyle" />
	&nbsp;&nbsp;供电方式:&nbsp;&nbsp;<input type="text" name="collieryHazards.gdStyle" />
	&nbsp;&nbsp;主采煤层倾角:&nbsp;&nbsp;<input type="text" name="collieryHazards.zcmcqj" />
	&nbsp;&nbsp;主采煤层厚度(m):&nbsp;&nbsp;<input type="text" name="collieryHazards.zcmchd" />
	&nbsp;&nbsp;矿井开采深度(m):&nbsp;&nbsp;<input type="text" name="collieryHazards.kjkcsd" />
	&nbsp;&nbsp;生产采区个数:&nbsp;&nbsp;<input type="text" name="collieryHazards.sccqgs" />
	&nbsp;&nbsp;回采工作面个数:&nbsp;&nbsp;<input type="text" name="collieryHazards.hcgzmgs" />
	&nbsp;&nbsp;掘进工作面个数:&nbsp;&nbsp;<input type="text" name="collieryHazards.jjgzmgs" />
	&nbsp;&nbsp;工作面回采方式:&nbsp;&nbsp;<input type="text" name="collieryHazards.gzmhcStyle" />
	&nbsp;&nbsp;采高(m):&nbsp;&nbsp;<input type="text" name="collieryHazards.height" />
	&nbsp;&nbsp;主要落煤方式:&nbsp;&nbsp;<input type="text" name="collieryHazards.zylmStyle" />
	&nbsp;&nbsp;主要支护型式:&nbsp;&nbsp;<input type="text" name="collieryHazards.zyzhStyle" />
	&nbsp;&nbsp;顶板处理方法:&nbsp;&nbsp;<input type="text" name="collieryHazards.dbclStyle" />
	&nbsp;&nbsp;矿井瓦斯等级:&nbsp;&nbsp;<input type="text" name="collieryHazards.gasLevel" />
	&nbsp;&nbsp;煤层的自燃倾向性:&nbsp;&nbsp;<input type="text" name="collieryHazards.pyrophorisity" />
	&nbsp;&nbsp;煤层的煤尘爆炸性:&nbsp;&nbsp;<input type="text" name="collieryHazards.explosivity" />
	&nbsp;&nbsp;煤层顶底板含水层情况:&nbsp;&nbsp;<input type="text" name="collieryHazards.containWater" />
	&nbsp;&nbsp;水文地质条件复杂程度:&nbsp;&nbsp;<input type="text" name="collieryHazards.complexDegree" />
	&nbsp;&nbsp;矿井开采是否受地表水体或洪水的威胁:&nbsp;&nbsp;<input type="text" name="collieryHazards.waterThreat" />
	&nbsp;&nbsp;煤层冲击地压危害程度:&nbsp;&nbsp;<input type="text" name="collieryHazards.harmDegree" />
	&nbsp;&nbsp;煤层赋存状况（根据煤层厚度和倾角变化、裂隙发育情况、断层、冲刷带、陷落柱、岩浆岩侵入破坏等判断）:&nbsp;&nbsp;<input type="text" name="collieryHazards.coalOcurrence" />
	&nbsp;&nbsp;开拓巷道的围岩稳定性:&nbsp;&nbsp;<input type="text" name="collieryHazards.stability" />
	&nbsp;&nbsp;矿井相对瓦斯涌出量(m3/min):&nbsp;&nbsp;<input type="text" name="collieryHazards.relativeComingAmount" />
	&nbsp;&nbsp;矿井绝对瓦斯涌出量(m3/min):&nbsp;&nbsp;<input type="text" name="collieryHazards.absoluteComingAmount" />
	&nbsp;&nbsp;煤层自燃发火期:&nbsp;&nbsp;<input type="text" name="collieryHazards.pyrophorisityPeriod" />
	&nbsp;&nbsp;全矿近三个月瓦斯超限次数:&nbsp;&nbsp;<input type="text" name="collieryHazards.recentMonthGasOverTime" />
	&nbsp;&nbsp;近三年内瓦斯突出次数:&nbsp;&nbsp;<input type="text" name="collieryHazards.recentYearGasOverTime" />
	&nbsp;&nbsp;近三年内煤层自燃地点数:&nbsp;&nbsp;<input type="text" name="collieryHazards.recentCoalPyrophorisityTime" />
	&nbsp;&nbsp;近三年内主扇故障检修次数:&nbsp;&nbsp;<input type="text" name="collieryHazards.recentRepairTime" />
	&nbsp;&nbsp;近三年内供电系统故障检修次数:&nbsp;&nbsp;<input type="text" name="collieryHazards.recentElecRepairTime" />
	&nbsp;&nbsp;总粉尘(mg/m3):&nbsp;&nbsp;<input type="text" name="collieryHazards.totalDust" />
	&nbsp;&nbsp;呼吸性粉尘(mg/m3):&nbsp;&nbsp;<input type="text" name="collieryHazards.breathDust" />
	&nbsp;&nbsp;矿井总进风量(m3/min):&nbsp;&nbsp;<input type="text" name="collieryHazards.totalIntakeAmount" />
	&nbsp;&nbsp;矿井有效风量率(m3/min):&nbsp;&nbsp;<input type="text" name="collieryHazards.effectIntakeAmount" />
	&nbsp;&nbsp;矿井最大涌水量(m3/h):&nbsp;&nbsp;<input type="text" name="collieryHazards.WaterInMAX" />
	&nbsp;&nbsp;矿井最大综合排水量(m3/h):&nbsp;&nbsp;<input type="text" name="collieryHazards.WaterOutMAX" />
	&nbsp;&nbsp;地面消防水池容量(m3):&nbsp;&nbsp;<input type="text" name="collieryHazards.poolVolumn" />
	&nbsp;&nbsp;井下消防水管长度(m):&nbsp;&nbsp;<input type="text" name="collieryHazards.pipeLength" />
	&nbsp;&nbsp;地面爆破材料储存情况:&nbsp;&nbsp;<input type="text" name="collieryHazards.groundExplosion" />
	&nbsp;&nbsp;井下爆破材料储存情况:&nbsp;&nbsp;<input type="text" name="collieryHazards.undergroundExplosion" />
	&nbsp;&nbsp;有无瓦斯异常涌出区域:&nbsp;&nbsp;<input type="text" name="collieryHazards.hasGasOutArea" />
	&nbsp;&nbsp;有无未熄灭的火区:&nbsp;&nbsp;<input type="text" name="collieryHazards.hasUndeadFire" />
	&nbsp;&nbsp;全矿通风系统复杂程度:&nbsp;&nbsp;<input type="text" name="collieryHazards.windComplex" />
	&nbsp;&nbsp;总进风道和总回风道之间的联络巷道数量:&nbsp;&nbsp;<input type="text" name="collieryHazards.totalStreetAmount" />
	&nbsp;&nbsp;总进风道和总回风道之间的联络巷道的挡风墙坚固程度:&nbsp;&nbsp;<input type="text" name="collieryHazards.totalHardDegree" />
	&nbsp;&nbsp;有无在水淹区积水面以下的采掘工作:&nbsp;&nbsp;<input type="text" name="collieryHazards.hasUnderWaterWork" />
	&nbsp;&nbsp;是否是在建筑物下、水体下或铁路下开采:&nbsp;&nbsp;<input type="text" name="collieryHazards.isUnderBulidingWork" />
	&nbsp;&nbsp;矿井安全是否受其它小矿乱采乱掘的影响:&nbsp;&nbsp;<input type="text" name="collieryHazards.isEffected" />
	&nbsp;&nbsp;起数:&nbsp;&nbsp;<input type="text" name="collieryHazards.deadWoundNum" />
	&nbsp;&nbsp;轻伤人数:&nbsp;&nbsp;<input type="text" name="collieryHazards.slightWoundNum" />
	&nbsp;&nbsp;重伤人数:&nbsp;&nbsp;<input type="text" name="collieryHazards.badWoundNum" />
	&nbsp;&nbsp;死亡人数:&nbsp;&nbsp;<input type="text" name="collieryHazards.deadNum" />
	&nbsp;&nbsp;瓦斯（煤尘）爆炸:&nbsp;&nbsp;<input type="text" name="collieryHazards.explosionAccident" />
	&nbsp;&nbsp;火灾:&nbsp;&nbsp;<input type="text" name="collieryHazards.fireAccident" />
	&nbsp;&nbsp;水灾:&nbsp;&nbsp;<input type="text" name="collieryHazards.waterAccident" />
	&nbsp;&nbsp;瓦斯突出:&nbsp;&nbsp;<input type="text" name="collieryHazards.gasAccident" />
	&nbsp;&nbsp;其他（注明事故类型）:&nbsp;&nbsp;<input type="text" name="collieryHazards.otherAccident" />
	&nbsp;&nbsp;主风机型号,台数:&nbsp;&nbsp;<input type="text" name="collieryHazards.zfjEquip" />
	&nbsp;&nbsp;局扇型号,台数:&nbsp;&nbsp;<input type="text" name="collieryHazards.jsEquip" />
	&nbsp;&nbsp;主排水泵型号,台数:&nbsp;&nbsp;<input type="text" name="collieryHazards.zpsbEquip" />
	&nbsp;&nbsp;探放水设备型号,台数:&nbsp;&nbsp;<input type="text" name="collieryHazards.tfsEquip" />
	&nbsp;&nbsp;绞车提升设备型号,台数:&nbsp;&nbsp;<input type="text" name="collieryHazards.jctsEquip" />
	&nbsp;&nbsp;带式输送机型号,部数:&nbsp;&nbsp;<input type="text" name="collieryHazards.dsssjEquip" />
	&nbsp;&nbsp;瓦斯抽放系统型号,数量:&nbsp;&nbsp;<input type="text" name="collieryHazards.wscfEquip" />
	&nbsp;&nbsp;安全监测系统型号,数量:&nbsp;&nbsp;<input type="text" name="collieryHazards.aqjcEquip" />
	&nbsp;&nbsp;传感器使用数量:&nbsp;&nbsp;<input type="text" name="collieryHazards.sensorNum" />
	&nbsp;&nbsp;闭锁断电装置型号,数量:&nbsp;&nbsp;<input type="text" name="collieryHazards.bsdjEquip" />
	&nbsp;&nbsp;瓦检仪型号,数量:&nbsp;&nbsp;<input type="text" name="collieryHazards.wjyEquip" />
	&nbsp;&nbsp;自救器型号,数量:&nbsp;&nbsp;<input type="text" name="collieryHazards.zjqEquip" />
	&nbsp;&nbsp;井下固定敷设高压电缆型号,数量:&nbsp;&nbsp;<input type="text" name="collieryHazards.jxgydlEquip" />
	&nbsp;&nbsp;瓦检员人数:&nbsp;&nbsp;<input type="text" name="collieryHazards.inspectorNum" />
	&nbsp;&nbsp;放炮员人数:&nbsp;&nbsp;<input type="text" name="collieryHazards.blasterNum" />
	&nbsp;&nbsp;绞车司机人数:&nbsp;&nbsp;<input type="text" name="collieryHazards.driverNum" />
	&nbsp;&nbsp;电工人数:&nbsp;&nbsp;<input type="text" name="collieryHazards.electricianNum" />
	&nbsp;&nbsp;安技管理人员数:&nbsp;&nbsp;<input type="text" name="collieryHazards.safeManageManNum" />
	&nbsp;&nbsp;安全员人数:&nbsp;&nbsp;<input type="text" name="collieryHazards.safeManNum" />
	&nbsp;&nbsp;高级:&nbsp;&nbsp;<input type="text" name="collieryHazards.highLevelNum" />
	&nbsp;&nbsp;中级:&nbsp;&nbsp;<input type="text" name="collieryHazards.middleLevelNum" />
	&nbsp;&nbsp;初级:&nbsp;&nbsp;<input type="text" name="collieryHazards.lowLevelNum" />
	&nbsp;&nbsp;下井同时作业人数:&nbsp;&nbsp;<input type="text" name="collieryHazards.undergroundWorkerNum" />
	&nbsp;&nbsp;下井人员中农民工、协议工、外包工所占比例:&nbsp;&nbsp;<input type="text" name="collieryHazards.peasantPercent" />
	&nbsp;&nbsp;影响矿井安全生产的主要问题说明（不少于三条内容）:&nbsp;&nbsp;<input type="text" name="collieryHazards.mainDesc" />
	&nbsp;&nbsp;备注:&nbsp;&nbsp;<input type="text" name="collieryHazards.remark" />
	&nbsp;&nbsp;填表人:&nbsp;&nbsp;<input type="text" name="collieryHazards.saveMan" />
	&nbsp;&nbsp;联系电话:&nbsp;&nbsp;<input type="text" name="collieryHazards.contactPhone" />
	&nbsp;&nbsp;填表日期:&nbsp;&nbsp;<input type="text" name="collieryHazards.saveTime" />
	
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
			
            <th align="center" field="dwdm" width="150" formatter="gridFormatterLength" >所属单位</th>
            <th align="center" field="name" width="150" formatter="gridFormatterLength" >矿井名称</th>
            <th align="center" field="address" width="150" formatter="gridFormatterLength" >详细地址</th>
            <th align="center" field="postcode" width="150" formatter="gridFormatterLength" >邮政编码</th>
            <th align="center" field="chargePerson" width="150" formatter="gridFormatterLength" >主要负责人</th>
            <th align="center" field="chargePersonPhone" width="150" formatter="gridFormatterLength" >联系电话</th>
            <th align="center" field="legalCompany" width="150" formatter="gridFormatterLength" >上级法人单位</th>
            <th align="center" field="bulidDate" width="150" formatter="gridFormatterLength" >建矿日期</th>
            <th align="center" field="designAblity" width="150" formatter="gridFormatterLength" >设计能力</th>
            <th align="center" field="realOutput" width="150" formatter="gridFormatterLength" >实际产量</th>
            <th align="center" field="brand" width="150" formatter="gridFormatterLength" >煤的牌号</th>
            <th align="center" field="workPersonNum" width="150" formatter="gridFormatterLength" >从业人数</th>
            <th align="center" field="fixedAssets" width="150" formatter="gridFormatterLength" >固定资产</th>
            <th align="center" field="yearProfit" width="150" formatter="gridFormatterLength" >年利润</th>
            <th align="center" field="ktStyle" width="150" formatter="gridFormatterLength" >开拓方式</th>
            <th align="center" field="tfStyle" width="150" formatter="gridFormatterLength" >通风方式</th>
            <th align="center" field="ffStyle" width="150" formatter="gridFormatterLength" >反风方式</th>
            <th align="center" field="tsStyle" width="150" formatter="gridFormatterLength" >提升方式</th>
            <th align="center" field="gdStyle" width="150" formatter="gridFormatterLength" >供电方式</th>
            <th align="center" field="zcmcqj" width="150" formatter="gridFormatterLength" >主采煤层倾角</th>
            <th align="center" field="zcmchd" width="150" formatter="gridFormatterLength" >主采煤层厚度(m)</th>
            <th align="center" field="kjkcsd" width="150" formatter="gridFormatterLength" >矿井开采深度(m)</th>
            <th align="center" field="sccqgs" width="150" formatter="gridFormatterLength" >生产采区个数</th>
            <th align="center" field="hcgzmgs" width="150" formatter="gridFormatterLength" >回采工作面个数</th>
            <th align="center" field="jjgzmgs" width="150" formatter="gridFormatterLength" >掘进工作面个数</th>
            <th align="center" field="gzmhcStyle" width="150" formatter="gridFormatterLength" >工作面回采方式</th>
            <th align="center" field="height" width="150" formatter="gridFormatterLength" >采高(m)</th>
            <th align="center" field="zylmStyle" width="150" formatter="gridFormatterLength" >主要落煤方式</th>
            <th align="center" field="zyzhStyle" width="150" formatter="gridFormatterLength" >主要支护型式</th>
            <th align="center" field="dbclStyle" width="150" formatter="gridFormatterLength" >顶板处理方法</th>
            <th align="center" field="gasLevel" width="150" formatter="gridFormatterLength" >矿井瓦斯等级</th>
            <th align="center" field="pyrophorisity" width="150" formatter="gridFormatterLength" >煤层的自燃倾向性</th>
            <th align="center" field="explosivity" width="150" formatter="gridFormatterLength" >煤层的煤尘爆炸性</th>
            <th align="center" field="containWater" width="150" formatter="gridFormatterLength" >煤层顶底板含水层情况</th>
            <th align="center" field="complexDegree" width="150" formatter="gridFormatterLength" >水文地质条件复杂程度</th>
            <th align="center" field="waterThreat" width="150" formatter="gridFormatterLength" >矿井开采是否受地表水体或洪水的威胁</th>
            <th align="center" field="harmDegree" width="150" formatter="gridFormatterLength" >煤层冲击地压危害程度</th>
            <th align="center" field="coalOcurrence" width="150" formatter="gridFormatterLength" >煤层赋存状况（根据煤层厚度和倾角变化、裂隙发育情况、断层、冲刷带、陷落柱、岩浆岩侵入破坏等判断）</th>
            <th align="center" field="stability" width="150" formatter="gridFormatterLength" >开拓巷道的围岩稳定性</th>
            <th align="center" field="relativeComingAmount" width="150" formatter="gridFormatterLength" >矿井相对瓦斯涌出量(m3/min)</th>
            <th align="center" field="absoluteComingAmount" width="150" formatter="gridFormatterLength" >矿井绝对瓦斯涌出量(m3/min)</th>
            <th align="center" field="pyrophorisityPeriod" width="150" formatter="gridFormatterLength" >煤层自燃发火期</th>
            <th align="center" field="recentMonthGasOverTime" width="150" formatter="gridFormatterLength" >全矿近三个月瓦斯超限次数</th>
            <th align="center" field="recentYearGasOverTime" width="150" formatter="gridFormatterLength" >近三年内瓦斯突出次数</th>
            <th align="center" field="recentCoalPyrophorisityTime" width="150" formatter="gridFormatterLength" >近三年内煤层自燃地点数</th>
            <th align="center" field="recentRepairTime" width="150" formatter="gridFormatterLength" >近三年内主扇故障检修次数</th>
            <th align="center" field="recentElecRepairTime" width="150" formatter="gridFormatterLength" >近三年内供电系统故障检修次数</th>
            <th align="center" field="totalDust" width="150" formatter="gridFormatterLength" >总粉尘(mg/m3)</th>
            <th align="center" field="breathDust" width="150" formatter="gridFormatterLength" >呼吸性粉尘(mg/m3)</th>
            <th align="center" field="totalIntakeAmount" width="150" formatter="gridFormatterLength" >矿井总进风量(m3/min)</th>
            <th align="center" field="effectIntakeAmount" width="150" formatter="gridFormatterLength" >矿井有效风量率(m3/min)</th>
            <th align="center" field="WaterInMAX" width="150" formatter="gridFormatterLength" >矿井最大涌水量(m3/h)</th>
            <th align="center" field="WaterOutMAX" width="150" formatter="gridFormatterLength" >矿井最大综合排水量(m3/h)</th>
            <th align="center" field="poolVolumn" width="150" formatter="gridFormatterLength" >地面消防水池容量(m3)</th>
            <th align="center" field="pipeLength" width="150" formatter="gridFormatterLength" >井下消防水管长度(m)</th>
            <th align="center" field="groundExplosion" width="150" formatter="gridFormatterLength" >地面爆破材料储存情况</th>
            <th align="center" field="undergroundExplosion" width="150" formatter="gridFormatterLength" >井下爆破材料储存情况</th>
            <th align="center" field="hasGasOutArea" width="150" formatter="gridFormatterLength" >有无瓦斯异常涌出区域</th>
            <th align="center" field="hasUndeadFire" width="150" formatter="gridFormatterLength" >有无未熄灭的火区</th>
            <th align="center" field="windComplex" width="150" formatter="gridFormatterLength" >全矿通风系统复杂程度</th>
            <th align="center" field="totalStreetAmount" width="150" formatter="gridFormatterLength" >总进风道和总回风道之间的联络巷道数量</th>
            <th align="center" field="totalHardDegree" width="150" formatter="gridFormatterLength" >总进风道和总回风道之间的联络巷道的挡风墙坚固程度</th>
            <th align="center" field="hasUnderWaterWork" width="150" formatter="gridFormatterLength" >有无在水淹区积水面以下的采掘工作</th>
            <th align="center" field="isUnderBulidingWork" width="150" formatter="gridFormatterLength" >是否是在建筑物下、水体下或铁路下开采</th>
            <th align="center" field="isEffected" width="150" formatter="gridFormatterLength" >矿井安全是否受其它小矿乱采乱掘的影响</th>
            <th align="center" field="deadWoundNum" width="150" formatter="gridFormatterLength" >起数</th>
            <th align="center" field="slightWoundNum" width="150" formatter="gridFormatterLength" >轻伤人数</th>
            <th align="center" field="badWoundNum" width="150" formatter="gridFormatterLength" >重伤人数</th>
            <th align="center" field="deadNum" width="150" formatter="gridFormatterLength" >死亡人数</th>
            <th align="center" field="explosionAccident" width="150" formatter="gridFormatterLength" >瓦斯（煤尘）爆炸</th>
            <th align="center" field="fireAccident" width="150" formatter="gridFormatterLength" >火灾</th>
            <th align="center" field="waterAccident" width="150" formatter="gridFormatterLength" >水灾</th>
            <th align="center" field="gasAccident" width="150" formatter="gridFormatterLength" >瓦斯突出</th>
            <th align="center" field="otherAccident" width="150" formatter="gridFormatterLength" >其他（注明事故类型）</th>
            <th align="center" field="zfjEquip" width="150" formatter="gridFormatterLength" >主风机型号,台数</th>
            <th align="center" field="jsEquip" width="150" formatter="gridFormatterLength" >局扇型号,台数</th>
            <th align="center" field="zpsbEquip" width="150" formatter="gridFormatterLength" >主排水泵型号,台数</th>
            <th align="center" field="tfsEquip" width="150" formatter="gridFormatterLength" >探放水设备型号,台数</th>
            <th align="center" field="jctsEquip" width="150" formatter="gridFormatterLength" >绞车提升设备型号,台数</th>
            <th align="center" field="dsssjEquip" width="150" formatter="gridFormatterLength" >带式输送机型号,部数</th>
            <th align="center" field="wscfEquip" width="150" formatter="gridFormatterLength" >瓦斯抽放系统型号,数量</th>
            <th align="center" field="aqjcEquip" width="150" formatter="gridFormatterLength" >安全监测系统型号,数量</th>
            <th align="center" field="sensorNum" width="150" formatter="gridFormatterLength" >传感器使用数量</th>
            <th align="center" field="bsdjEquip" width="150" formatter="gridFormatterLength" >闭锁断电装置型号,数量</th>
            <th align="center" field="wjyEquip" width="150" formatter="gridFormatterLength" >瓦检仪型号,数量</th>
            <th align="center" field="zjqEquip" width="150" formatter="gridFormatterLength" >自救器型号,数量</th>
            <th align="center" field="jxgydlEquip" width="150" formatter="gridFormatterLength" >井下固定敷设高压电缆型号,数量</th>
            <th align="center" field="inspectorNum" width="150" formatter="gridFormatterLength" >瓦检员人数</th>
            <th align="center" field="blasterNum" width="150" formatter="gridFormatterLength" >放炮员人数</th>
            <th align="center" field="driverNum" width="150" formatter="gridFormatterLength" >绞车司机人数</th>
            <th align="center" field="electricianNum" width="150" formatter="gridFormatterLength" >电工人数</th>
            <th align="center" field="safeManageManNum" width="150" formatter="gridFormatterLength" >安技管理人员数</th>
            <th align="center" field="safeManNum" width="150" formatter="gridFormatterLength" >安全员人数</th>
            <th align="center" field="highLevelNum" width="150" formatter="gridFormatterLength" >高级</th>
            <th align="center" field="middleLevelNum" width="150" formatter="gridFormatterLength" >中级</th>
            <th align="center" field="lowLevelNum" width="150" formatter="gridFormatterLength" >初级</th>
            <th align="center" field="undergroundWorkerNum" width="150" formatter="gridFormatterLength" >下井同时作业人数</th>
            <th align="center" field="peasantPercent" width="150" formatter="gridFormatterLength" >下井人员中农民工、协议工、外包工所占比例</th>
            <th align="center" field="mainDesc" width="150" formatter="gridFormatterLength" >影响矿井安全生产的主要问题说明（不少于三条内容）</th>
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
			<input type="hidden" name="collieryHazards.id"/>
			<div style="margin: 0 auto;" align="center" name="addDiv">
				<table class="detailTable" style="width: 80%;">
					
						<tr>
							<td class="labelTd">所属单位:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.dwdm"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">矿井名称:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.name"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">详细地址:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.address"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">邮政编码:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.postcode"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">主要负责人:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.chargePerson"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">联系电话:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.chargePersonPhone"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">上级法人单位:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.legalCompany"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">建矿日期:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.bulidDate"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">设计能力:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.designAblity"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">实际产量:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.realOutput"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">煤的牌号:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.brand"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">从业人数:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.workPersonNum"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">固定资产:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.fixedAssets"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">年利润:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.yearProfit"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">开拓方式:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.ktStyle"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">通风方式:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.tfStyle"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">反风方式:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.ffStyle"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">提升方式:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.tsStyle"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">供电方式:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.gdStyle"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">主采煤层倾角:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.zcmcqj"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">主采煤层厚度(m):</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.zcmchd"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">矿井开采深度(m):</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.kjkcsd"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">生产采区个数:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.sccqgs"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">回采工作面个数:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.hcgzmgs"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">掘进工作面个数:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.jjgzmgs"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">工作面回采方式:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.gzmhcStyle"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">采高(m):</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.height"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">主要落煤方式:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.zylmStyle"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">主要支护型式:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.zyzhStyle"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">顶板处理方法:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.dbclStyle"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">矿井瓦斯等级:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.gasLevel"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">煤层的自燃倾向性:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.pyrophorisity"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">煤层的煤尘爆炸性:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.explosivity"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">煤层顶底板含水层情况:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.containWater"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">水文地质条件复杂程度:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.complexDegree"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">矿井开采是否受地表水体或洪水的威胁:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.waterThreat"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">煤层冲击地压危害程度:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.harmDegree"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">煤层赋存状况（根据煤层厚度和倾角变化、裂隙发育情况、断层、冲刷带、陷落柱、岩浆岩侵入破坏等判断）:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.coalOcurrence"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">开拓巷道的围岩稳定性:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.stability"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">矿井相对瓦斯涌出量(m3/min):</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.relativeComingAmount"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">矿井绝对瓦斯涌出量(m3/min):</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.absoluteComingAmount"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">煤层自燃发火期:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.pyrophorisityPeriod"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">全矿近三个月瓦斯超限次数:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.recentMonthGasOverTime"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">近三年内瓦斯突出次数:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.recentYearGasOverTime"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">近三年内煤层自燃地点数:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.recentCoalPyrophorisityTime"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">近三年内主扇故障检修次数:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.recentRepairTime"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">近三年内供电系统故障检修次数:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.recentElecRepairTime"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">总粉尘(mg/m3):</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.totalDust"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">呼吸性粉尘(mg/m3):</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.breathDust"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">矿井总进风量(m3/min):</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.totalIntakeAmount"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">矿井有效风量率(m3/min):</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.effectIntakeAmount"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">矿井最大涌水量(m3/h):</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.WaterInMAX"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">矿井最大综合排水量(m3/h):</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.WaterOutMAX"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">地面消防水池容量(m3):</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.poolVolumn"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">井下消防水管长度(m):</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.pipeLength"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">地面爆破材料储存情况:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.groundExplosion"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">井下爆破材料储存情况:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.undergroundExplosion"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">有无瓦斯异常涌出区域:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.hasGasOutArea"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">有无未熄灭的火区:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.hasUndeadFire"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">全矿通风系统复杂程度:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.windComplex"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">总进风道和总回风道之间的联络巷道数量:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.totalStreetAmount"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">总进风道和总回风道之间的联络巷道的挡风墙坚固程度:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.totalHardDegree"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">有无在水淹区积水面以下的采掘工作:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.hasUnderWaterWork"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">是否是在建筑物下、水体下或铁路下开采:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.isUnderBulidingWork"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">矿井安全是否受其它小矿乱采乱掘的影响:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.isEffected"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">起数:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.deadWoundNum"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">轻伤人数:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.slightWoundNum"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">重伤人数:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.badWoundNum"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">死亡人数:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.deadNum"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">瓦斯（煤尘）爆炸:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.explosionAccident"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">火灾:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.fireAccident"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">水灾:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.waterAccident"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">瓦斯突出:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.gasAccident"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">其他（注明事故类型）:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.otherAccident"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">主风机型号,台数:</td>
							<td colspan="3" class="contentTd">
							<textarea class="easyui-validatebox" name="collieryHazards.zfjEquip"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">局扇型号,台数:</td>
							<td colspan="3" class="contentTd">
							<textarea class="easyui-validatebox" name="collieryHazards.jsEquip"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">主排水泵型号,台数:</td>
							<td colspan="3" class="contentTd">
							<textarea class="easyui-validatebox" name="collieryHazards.zpsbEquip"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">探放水设备型号,台数:</td>
							<td colspan="3" class="contentTd">
							<textarea class="easyui-validatebox" name="collieryHazards.tfsEquip"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">绞车提升设备型号,台数:</td>
							<td colspan="3" class="contentTd">
							<textarea class="easyui-validatebox" name="collieryHazards.jctsEquip"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">带式输送机型号,部数:</td>
							<td colspan="3" class="contentTd">
							<textarea class="easyui-validatebox" name="collieryHazards.dsssjEquip"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">瓦斯抽放系统型号,数量:</td>
							<td colspan="3" class="contentTd">
							<textarea class="easyui-validatebox" name="collieryHazards.wscfEquip"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">安全监测系统型号,数量:</td>
							<td colspan="3" class="contentTd">
							<textarea class="easyui-validatebox" name="collieryHazards.aqjcEquip"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">传感器使用数量:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.sensorNum"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="contentTd" colspan="2">
							</td>
						</tr>
						<tr>
							<td class="labelTd">闭锁断电装置型号,数量:</td>
							<td colspan="3" class="contentTd">
							<textarea class="easyui-validatebox" name="collieryHazards.bsdjEquip"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						<tr>
							<td class="labelTd">瓦检仪型号,数量:</td>
							<td colspan="3" class="contentTd">
							<textarea class="easyui-validatebox" name="collieryHazards.wjyEquip"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">自救器型号,数量:</td>
							<td colspan="3" class="contentTd">
							<textarea class="easyui-validatebox" name="collieryHazards.zjqEquip"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">井下固定敷设高压电缆型号,数量:</td>
							<td colspan="3" class="contentTd">
							<textarea class="easyui-validatebox" name="collieryHazards.jxgydlEquip"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">瓦检员人数:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.inspectorNum"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">放炮员人数:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.blasterNum"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">绞车司机人数:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.driverNum"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">电工人数:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.electricianNum"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">安技管理人员数:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.safeManageManNum"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">安全员人数:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.safeManNum"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">高级:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.highLevelNum"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">中级:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.middleLevelNum"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">初级:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.lowLevelNum"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">下井同时作业人数:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.undergroundWorkerNum"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">下井人员中农民工、协议工、外包工所占比例:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.peasantPercent"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="contentTd" colspan="2">
							</td>
						</tr>
						<tr>
							<td class="labelTd">影响矿井安全生产的主要问题说明（不少于三条内容）:</td>
							<td colspan="3" class="contentTd">
							<textarea class="easyui-validatebox" name="collieryHazards.mainDesc"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						<tr>
							<td class="labelTd">备注:</td>
							<td colspan="3" class="contentTd">
							<textarea class="easyui-validatebox" name="collieryHazards.remark"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">填表人:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.saveMan"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="labelTd">联系电话:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.contactPhone"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="labelTd">填表日期:</td>
							<td class="contentTd">
							<input type="text" class="easyui-validatebox" name="collieryHazards.saveTime"
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