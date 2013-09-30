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
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript">
	$(function(){
		eSelect = new Select('选择', '${ctx}/jsp/ymxm/enterprise/EnterpriseSelect.jsp'
	    		 , null, function(id, corpName) {
	    	        $('input[name="collieryHazards.dwdm"]').val(id);
	    	        $('input[name="collieryHazards.corpName"]').val(corpName);
	    });
	});
		$(document).ready(function () {
		     grid = new Grid('${ctx}/collieryHazards/collieryHazardsAction!list','data_list');
		     grid.loadGrid();
		     crud = new Crud({
		     	grid:grid, 
		     	addFormObject:$('#addForm'),
		     	searchFormObject: $('#searchForm'),
		     	entityName:'collieryHazards',
		     	moduleName:'煤矿',
		     	url:'${ctx}/collieryHazards/collieryHazardsAction',
		     	beforeSubmit:function() {
		    			 if($('input[name="collieryHazards.dwdm"]').val() == '') {
	    						$.messager.alert("错误", "请选择所属单位");
	    						return false;
	    				 }
		    			 return true;
		    		 }
		    });
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
        	url += "<a title=\"查看\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"../../images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
        	url += "<a title=\"修改\" onclick='crud.update(\""+rowId+"\");' class='btn2'><img src=\"../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
        	if(rowData.hasMap == '1') { //已定位
				url += "<a title=\"定位\" onclick='window.top.gis.showPoint(\""+rowData.dwdm+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.name +"\");' class='btn2' ><img src=\"${ctx}/images/showPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
			} else {
				url += "<a title=\"打点\" onclick='window.top.gis.addPoint(\""+rowData.dwdm+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.name +"\");' class='btn2' ><img src=\"${ctx}/images/addPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
			}
        	return url;
        }
        
</script>
</head>
<body>
<div class="panel-header" style="width:100%;">
<div class="panel-title panel-with-icon">煤矿信息列表</div>
<div class="panel-icon icon-edit"></div>
<div class="panel-tool"></div>
</div>
<div class="datagrid-toolbar" id ="tb" style="padding-left:0px;height:10px;">
<div>
	<form id="searchForm" style="display: inline;">
	<div style="margin-top:-8px;">
	&nbsp;&nbsp;所属单位:&nbsp;&nbsp;<input type="text" name="collieryHazards.corpName" />
	&nbsp;&nbsp;矿井名称:&nbsp;&nbsp;<input type="text" name="collieryHazards.name" />
	&nbsp;&nbsp;主要负责人:&nbsp;&nbsp;<input type="text" name="collieryHazards.chargePerson" />
	
	&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search()">查询</a>
	&nbsp;&nbsp;
	<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch()">清空</a>
	</div>
	</form>
</div>
</div>
<div class="search_add">
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add', plain:true" onclick="crud.add()">添加</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-delete', plain:true" onclick="crud.remove()">删除</a>
<!-- 	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-exp', plain:true" onclick="expFunction()">导出</a> -->
</div>

<div style="height:74%;">
    <table id="data_list" loadMsg="正在努力拉取数据中..." fit="true" fitColumns="true">
        <thead>
        <tr>
            <th align="center" field="corpName" width="150" formatter="gridFormatterLength" >所属单位</th>
            <th align="center" field="name" width="150" formatter="gridFormatterLength" >矿井名称</th>
            <th align="center" field="address" width="150" formatter="gridFormatterLength" >详细地址</th>
            <th align="center" field="chargePerson" width="150" formatter="gridFormatterLength" >主要负责人</th>
            <th align="center" field="id" width="120" formatter="gridFormatter">操作</th>         
        </tr>
        </thead>
    </table>
</div>

	<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" 
			data-options="iconCls:'icon-save',modal:true,
    			minimizable:true,maximizable:true,collapsible:true,draggable:false">
		<form method="post">
			<input type="hidden" name="collieryHazards.id"/>
			<input type="hidden" class="easyui-validatebox" name="collieryHazards.dwdm"/>
			<div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
						<tr>
							<td class="table_nemu_new" width="25%">所属单位</td>
							<td class="table_con" colspan="3">
							<input type="text" class="easyui-validatebox" name="collieryHazards.corpName"
							data-options="required:true,validType:'maxByteLength[100]'" disabled="disabled"/>
							<input type="button" value="选择" onclick="eSelect.open()"/>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">矿井名称</td>
							<td class="table_con" colspan="3">
							<input type="text" class="easyui-validatebox" name="collieryHazards.name"
							data-options="required:true,validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">详细地址</td>
							<td class="table_con" colspan="3">
							<input type="text" class="easyui-validatebox" name="collieryHazards.address"
							data-options="required:true,validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new" width="25%">主要负责人</td>
							<td class="table_con" width="25%">
							<input type="text" class="easyui-validatebox" name="collieryHazards.chargePerson"
							data-options="required:true,validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new" width="25%">联系电话</td>
							<td class="table_con" width="25%">
							<input type="text" class="easyui-validatebox" name="collieryHazards.chargePersonPhone"
							data-options="required:true,validType:'phoneNumber'" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">邮政编码</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="collieryHazards.postcode"
							data-options="validType:'zip'" />
							</td>
							<td class="table_nemu_new">建矿日期</td>
							<td class="table_con">
							<input type="text" onfocus="WdatePicker({readOnly:true})"  class="Wdate"  name="collieryHazards.bulidDate"
							data-options="validType:'maxByteLength[100]',editable:false" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">上级法人单位</td>
							<td class="table_con" colspan="3">
							<input type="text" class="easyui-validatebox" name="collieryHazards.legalCompany"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
						</tr>
						
						<tr>
							<td class="table_nemu_new">设计能力（万t/年）</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="collieryHazards.designAblity"
							data-options="max:100000000000,	groupSeparator:',', precision:2" />
							</td>
						
							<td class="table_nemu_new">实际产量（万t/年）</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="collieryHazards.realOutput"
							data-options="max:100000000000,	groupSeparator:',', precision:2" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">煤的牌号</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="collieryHazards.brand"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">从业人数</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="collieryHazards.workPersonNum"
							data-options="max:100000000000,	groupSeparator:','" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">固定资产（万元）</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="collieryHazards.fixedAssets"
							data-options="max:100000000000,	groupSeparator:',', precision:2" />
							</td>
						
							<td class="table_nemu_new">年利润（万元）</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="collieryHazards.yearProfit"
							data-options="max:100000000000,	groupSeparator:',', precision:2" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">开拓方式</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="collieryHazards.ktStyle"
							data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'立井'},{v:'斜井'},{v:'平峒'}],editable:false" panelHeight="auto"/>
							</td>
						
							<td class="table_nemu_new">通风方式</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="collieryHazards.tfStyle"
							data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'中央并列'},{v:'中央分列'},{v:'两翼对角'},{v:'分区对角'},{v:'其它'}],editable:false" panelHeight="auto"/>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">反风方式</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="collieryHazards.ffStyle"
							data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'反风道反风'},{v:'主要通风机反转反风'},{v:'备用主要通风机的无反风道反风'}],editable:false" panelHeight="auto"/>
							</td>
						
							<td class="table_nemu_new">提升方式</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="collieryHazards.tsStyle"
							data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'罐笼'},{v:'箕斗井'},{v:'串车'},{v:'带式输送机'},{v:'其它'}],editable:false" panelHeight="auto"/>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">供电方式</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="collieryHazards.gdStyle"
							data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'双回路'},{v:'双电源'},{v:'其它'}],editable:false" panelHeight="auto"/>
							</td>
						
							<td class="table_nemu_new">主采煤层倾角</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="collieryHazards.zcmcqj"
							data-options="max:100000000000,	groupSeparator:','" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">主采煤层厚度（m）</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="collieryHazards.zcmchd"
							data-options="max:100000000000,	groupSeparator:',', precision:2" />
							</td>
						
							<td class="table_nemu_new">矿井开采深度（m）</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="collieryHazards.kjkcsd"
							data-options="max:100000000000,	groupSeparator:',', precision:2" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">生产采区个数</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="collieryHazards.sccqgs"
							data-options="max:100000000000,	groupSeparator:','" />
							</td>
						
							<td class="table_nemu_new">回采工作面个数</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="collieryHazards.hcgzmgs"
							data-options="max:100000000000,	groupSeparator:','" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">掘进工作面个数</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="collieryHazards.jjgzmgs"
							data-options="max:100000000000,	groupSeparator:','" />
							</td>
						
							<td class="table_nemu_new">工作面回采方式</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="collieryHazards.gzmhcStyle"
							data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'前进式'},{v:'后退式'}],editable:false" panelHeight="auto"/>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">采高（m）</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="collieryHazards.height"
							data-options="max:100000000000,	groupSeparator:',', precision:2" />
							</td>
						
							<td class="table_nemu_new">主要落煤方式</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="collieryHazards.zylmStyle"
							data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'机采'},{v:'炮采'},{v:'水采'},{v:'风镐落煤'},{v:'其它'}],editable:false" panelHeight="auto"/>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">主要支护型式</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="collieryHazards.zyzhStyle"
							data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'液压支架'},{v:'单体液压支柱'},{v:'摩擦式金属支柱'}],editable:false" panelHeight="auto"/>
							</td>
						
							<td class="table_nemu_new">顶板处理方法</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="collieryHazards.dbclStyle"
							data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'全部垮落法'},{v:'充填法'},{v:'煤柱支撑法'},{v:'缓慢下沉法'}],editable:false" panelHeight="auto"/>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">矿井瓦斯等级</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="collieryHazards.gasLevel"
							data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'突出矿井'},{v:'高瓦斯矿井'},{v:'低瓦斯矿井'}],editable:false" panelHeight="auto"/>
							</td>
						
							<td class="table_nemu_new">煤层的自燃倾向性</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="collieryHazards.pyrophorisity"
							data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'容易自燃'},{v:'自燃'},{v:'不易自燃'}],editable:false" panelHeight="auto"/>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">煤层的煤尘爆炸性</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="collieryHazards.explosivity"
							data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'基本无爆炸性'},{v:'弱爆炸性'},{v:'爆炸性较强'},{v:'爆炸性很强'}],editable:false" panelHeight="auto"/>
							</td>
						
							<td class="table_nemu_new">煤层顶底板含水层情况</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="collieryHazards.containWater"
							data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'无'},{v:'孔隙含水层'},{v:'裂隙含水层'},{v:'岩溶含水层'}],editable:false" panelHeight="auto"/>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">水文地质条件复杂程度</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="collieryHazards.complexDegree"
							data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'简单'},{v:'一般'},{v:'复杂'}],editable:false" panelHeight="auto"/>
							</td>
						
							<td class="table_nemu_new">矿井开采是否受地表水体或洪水的威胁</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="collieryHazards.waterThreat"
							data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'是'},{v:'否'}],editable:false" panelHeight="auto"/>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">煤层冲击地压危害程度</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="collieryHazards.harmDegree"
							data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'无冲击地压'},{v:'一般（弱）冲击地压'},{v:'严重（强）冲击地压'}],editable:false" panelHeight="auto"/>
							</td>
						
							<td class="table_nemu_new">煤层赋存状况（根据煤层厚度和倾角变化、裂隙发育情况、断层、冲刷带、陷落柱、岩浆岩侵入破坏等判断）</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="collieryHazards.coalOcurrence"
							data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'煤层赋存状况好'},{v:'一般'},{v:'煤层赋存状况差'}],editable:false" panelHeight="auto"/>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">开拓巷道的围岩稳定性</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="collieryHazards.stability"
							data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'围岩为比较稳定的坚硬砂岩或石灰岩等 '},{v:'围岩为中等稳定的砂岩、砂页岩或较坚硬页岩等'},{v:'围岩为不稳定的煤、泥质页岩、炭质页岩等'}],editable:false" panelHeight="auto"/>
							</td>
						
							<td class="table_nemu_new">矿井相对瓦斯涌出量（m3/t）</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="collieryHazards.relativeComingAmount"
							data-options="max:100000000000,	groupSeparator:',', precision:2" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">矿井绝对瓦斯涌出量（m3/min）</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="collieryHazards.absoluteComingAmount"
							data-options="max:100000000000,	groupSeparator:',', precision:2" />
							</td>
						
							<td class="table_nemu_new">煤层自燃发火期</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="collieryHazards.pyrophorisityPeriod"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">全矿近三个月瓦斯超限次数</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="collieryHazards.recentMonthGasOverTime"
							data-options="max:100000000000,	groupSeparator:','" />
							</td>
						
							<td class="table_nemu_new">近三年内瓦斯突出次数</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="collieryHazards.recentYearGasOverTime"
							data-options="max:100000000000,	groupSeparator:','" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">近三年内煤层自燃地点数</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="collieryHazards.recentCoalPyrophorisityTime"
							data-options="max:100000000000,	groupSeparator:','" />
							</td>
						
							<td class="table_nemu_new">近三年内主扇故障检修次数</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="collieryHazards.recentRepairTime"
							data-options="max:100000000000,	groupSeparator:','" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new" colspan="2">近三年内供电系统故障检修次数</td>
							<td class="table_con" colspan="2">
							<input type="text" class="easyui-numberbox" name="collieryHazards.recentElecRepairTime"
							data-options="max:100000000000,	groupSeparator:','" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new" rowspan="2">采面粉尘浓度</td>
							<td class="table_nemu_new">总粉尘（mg/m3）</td>
							<td class="table_con" colspan="2">
							<input type="text" class="easyui-numberbox" name="collieryHazards.totalDust"
							data-options="max:100000000000,	groupSeparator:',', precision:2" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">呼吸性粉尘（mg/m3）</td>
							<td class="table_con" colspan="2">
							<input type="text" class="easyui-numberbox" name="collieryHazards.breathDust"
							data-options="max:100000000000,	groupSeparator:',', precision:2" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">矿井总进风量（m3/min）</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="collieryHazards.totalIntakeAmount"
							data-options="max:100000000000,	groupSeparator:',', precision:2" />
							</td>
							<td class="table_nemu_new">矿井有效风量率（m3/min）</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="collieryHazards.effectIntakeAmount"
							data-options="max:100000000000,	groupSeparator:',', precision:2" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">矿井最大涌水量（m3/h）</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="collieryHazards.WaterInMAX"
							data-options="max:100000000000,	groupSeparator:',', precision:2" />
							</td>
							<td class="table_nemu_new">矿井最大综合排水量（m3/h）</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="collieryHazards.WaterOutMAX"
							data-options="max:100000000000,	groupSeparator:',', precision:2" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">地面消防水池容量（m3）</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="collieryHazards.poolVolumn"
							data-options="max:100000000000,	groupSeparator:',', precision:2" />
							</td>
							<td class="table_nemu_new">井下消防水管长度（m）</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="collieryHazards.pipeLength"
							data-options="max:100000000000,	groupSeparator:',', precision:2" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new" rowspan="3">地面爆破材料储存情况</td>
							<td class="table_nemu_new">库房数</td>
							<td class="table_con" colspan="2">
							<input type="text" class="easyui-numberbox" name="collieryHazards.groundRoom"
							data-options="max:100000000000,	groupSeparator:','" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">炸药（t）</td>
							<td class="table_con" colspan="2">
							<input type="text" class="easyui-numberbox" name="collieryHazards.groundExplosion"
							data-options="max:100000000000,	groupSeparator:',', precision:2" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">雷管（万发）</td>
							<td class="table_con" colspan="2">
							<input type="text" class="easyui-numberbox" name="collieryHazards.groundPrimer"
							data-options="max:100000000000,	groupSeparator:',', precision:2" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new" rowspan="3">井下爆破材料储存情况</td>
							<td class="table_nemu_new">峒室数</td>
							<td class="table_con" colspan="2">
							<input type="text" class="easyui-numberbox" name="collieryHazards.undergroundRoom"
							data-options="max:100000000000,	groupSeparator:','" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">炸药（t）</td>
							<td class="table_con" colspan="2">
							<input type="text" class="easyui-numberbox" name="collieryHazards.undergroundExplosion"
							data-options="max:100000000000,	groupSeparator:',', precision:2" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">雷管（万发）</td>
							<td class="table_con" colspan="2">
							<input type="text" class="easyui-numberbox" name="collieryHazards.undergroundPrimer"
							data-options="max:100000000000,	groupSeparator:',', precision:2" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">有无瓦斯异常涌出区域</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="collieryHazards.hasGasOutArea"
							data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'有'},{v:'无'}],editable:false" panelHeight="auto"/>
							</td>
							<td class="table_nemu_new">有无未熄灭的火区</td>
							<td class="table_con">
							<input type="text" class="easyui-combobox" name="collieryHazards.hasUndeadFire"
							data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'有'},{v:'无'}],editable:false" panelHeight="auto"/>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new" colspan="2">全矿通风系统复杂程度</td>
							<td class="table_con" colspan="2">
							<input type="text" class="easyui-combobox" name="collieryHazards.windComplex"
							data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'简单可靠,易于管理控制,井下风流稳定'},{v:'复杂程度一般'},{v:'通风系统复杂,管理困难,或有些巷道风流不稳'}],editable:false" panelHeight="auto"/>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new" colspan="2">总进风道和总回风道之间的联络巷道数量</td>
							<td class="table_con" colspan="2">
							<input type="text" class="easyui-numberbox" name="collieryHazards.totalStreetAmount"
							data-options="max:100000000000,	groupSeparator:','" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new" colspan="2">总进风道和总回风道之间的联络巷道的挡风墙坚固程度</td>
							<td class="table_con" colspan="2">
							<input type="text" class="easyui-combobox" name="collieryHazards.totalHardDegree"
							data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'非常坚固'},{v:'一般'},{v:'差'}],editable:false" panelHeight="auto"/>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new" colspan="2">有无在水淹区积水面以下的采掘工作</td>
							<td class="table_con" colspan="2">
							<input type="text" class="easyui-combobox" name="collieryHazards.hasUnderWaterWork"
							data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'有'},{v:'无'}],editable:false" panelHeight="auto"/>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new" colspan="2">是否是在建筑物下、水体下或铁路下开采</td>
							<td class="table_con" colspan="2">
							<input type="text" class="easyui-combobox" name="collieryHazards.isUnderBulidingWork"
							data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'是'},{v:'否'}],editable:false" panelHeight="auto"/>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new" colspan="2">矿井安全是否受其它小矿乱采乱掘的影响</td>
							<td class="table_con" colspan="2">
							<input type="text" class="easyui-combobox" name="collieryHazards.isEffected"
							data-options="validType:'maxByteLength[100]',
							valueField:'v', textField:'v', data:
							[{v:'是'},{v:'否'}],editable:false" panelHeight="auto"/>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new" rowspan="4">近5年内伤亡事故</td>
							<td class="table_nemu_new">起数</td>
							<td class="table_con" colspan="2">
							<input type="text" class="easyui-validatebox" name="collieryHazards.deadWoundNum"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">轻伤人数</td>
							<td class="table_con" colspan="2">
							<input type="text" class="easyui-validatebox" name="collieryHazards.slightWoundNum"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">重伤人数</td>
							<td class="table_con" colspan="2">
							<input type="text" class="easyui-validatebox" name="collieryHazards.badWoundNum"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">死亡人数</td>
							<td class="table_con" colspan="2">
							<input type="text" class="easyui-validatebox" name="collieryHazards.deadNum"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new" rowspan="5">建矿以来曾发生重大事故（指造成3人以上死亡或全矿或部分区域停产）</td>
							<td class="table_nemu_new">瓦斯（煤尘）爆炸</td>
							<td class="table_con" colspan="2">
							<input type="text" class="easyui-validatebox" name="collieryHazards.explosionAccident"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">火灾</td>
							<td class="table_con" colspan="2">
							<input type="text" class="easyui-validatebox" name="collieryHazards.fireAccident"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">水灾</td>
							<td class="table_con" colspan="2">
							<input type="text" class="easyui-validatebox" name="collieryHazards.waterAccident"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">瓦斯突出</td>
							<td class="table_con" colspan="2">
							<input type="text" class="easyui-validatebox" name="collieryHazards.gasAccident"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">其他（注明事故类型）</td>
							<td class="table_con" colspan="2">
							<input type="text" class="easyui-validatebox" name="collieryHazards.otherAccident"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">主风机型号,台数</td>
							<td colspan="3" class="table_con">
							<textarea class="easyui-validatebox" name="collieryHazards.zfjEquip"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">局扇型号,台数</td>
							<td colspan="3" class="table_con">
							<textarea class="easyui-validatebox" name="collieryHazards.jsEquip"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">主排水泵型号,台数</td>
							<td colspan="3" class="table_con">
							<textarea class="easyui-validatebox" name="collieryHazards.zpsbEquip"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">探放水设备型号,台数</td>
							<td colspan="3" class="table_con">
							<textarea class="easyui-validatebox" name="collieryHazards.tfsEquip"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">绞车提升设备型号,台数</td>
							<td colspan="3" class="table_con">
							<textarea class="easyui-validatebox" name="collieryHazards.jctsEquip"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">带式输送机型号,部数</td>
							<td colspan="3" class="table_con">
							<textarea class="easyui-validatebox" name="collieryHazards.dsssjEquip"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">瓦斯抽放系统型号,数量</td>
							<td colspan="3" class="table_con">
							<textarea class="easyui-validatebox" name="collieryHazards.wscfEquip"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">安全监测系统型号,数量</td>
							<td colspan="3" class="table_con">
							<textarea class="easyui-validatebox" name="collieryHazards.aqjcEquip"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">传感器使用数量</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="collieryHazards.sensorNum"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_con" colspan="2">
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">闭锁断电装置型号,数量</td>
							<td colspan="3" class="table_con">
							<textarea class="easyui-validatebox" name="collieryHazards.bsdjEquip"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">瓦检仪型号,数量</td>
							<td colspan="3" class="table_con">
							<textarea class="easyui-validatebox" name="collieryHazards.wjyEquip"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">自救器型号,数量</td>
							<td colspan="3" class="table_con">
							<textarea class="easyui-validatebox" name="collieryHazards.zjqEquip"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">井下固定敷设高压电缆型号,数量</td>
							<td colspan="3" class="table_con">
							<textarea class="easyui-validatebox" name="collieryHazards.jxgydlEquip"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">瓦检员人数</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="collieryHazards.inspectorNum"
							data-options="max:100000000000,	groupSeparator:','" />
							</td>
						
							<td class="table_nemu_new">放炮员人数</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="collieryHazards.blasterNum"
							data-options="max:100000000000,	groupSeparator:','" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">绞车司机人数</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="collieryHazards.driverNum"
							data-options="max:100000000000,	groupSeparator:','" />
							</td>
						
							<td class="table_nemu_new">电工人数</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="collieryHazards.electricianNum"
							data-options="max:100000000000,	groupSeparator:','" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">安技管理人员数</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="collieryHazards.safeManageManNum"
							data-options="max:100000000000,	groupSeparator:','" />
							</td>
						
							<td class="table_nemu_new">安全员人数</td>
							<td class="table_con">
							<input type="text" class="easyui-numberbox" name="collieryHazards.safeManNum"
							data-options="max:100000000000,	groupSeparator:','" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new" rowspan="3">全矿技术人员数</td>
							<td class="table_nemu_new">高级</td>
							<td class="table_con" colspan="2">
							<input type="text" class="easyui-validatebox" name="collieryHazards.highLevelNum"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">中级</td>
							<td class="table_con" colspan="2">
							<input type="text" class="easyui-validatebox" name="collieryHazards.middleLevelNum"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">初级</td>
							<td class="table_con" colspan="2">
							<input type="text" class="easyui-validatebox" name="collieryHazards.lowLevelNum"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">下井同时作业人数</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="collieryHazards.undergroundWorkerNum"
							data-options="validType:'maxByteLength[100]'" />
							</td>
							<td class="table_nemu_new">下井人员中农民工、协议工、外包工所占比例</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="collieryHazards.peasantPercent"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">影响矿井安全生产的主要问题说明（不少于三条内容）</td>
							<td colspan="3" class="table_con">
							<textarea class="easyui-validatebox" name="collieryHazards.mainDesc"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new">备注</td>
							<td colspan="3" class="table_con">
							<textarea class="easyui-validatebox" name="collieryHazards.remark"
							 style="width: 80%; height: 80px;" data-options="validType:'maxByteLength[255]'">
							</textarea>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">填表人</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="collieryHazards.saveMan"
							data-options="validType:'maxByteLength[100]'" />
							</td>
						
							<td class="table_nemu_new">联系电话</td>
							<td class="table_con">
							<input type="text" class="easyui-validatebox" name="collieryHazards.contactPhone"
							data-options="validType:'phoneNumber'" />
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">填表日期</td>
							<td class="table_con">
							<input type="text" class="easyui-my97 easyui-validatebox" data-options="required:true,readOnly:true" name="collieryHazards.saveTime"/>
							</td>
							<td class="table_con" colspan="2">
							</td>
						</tr>
				</table>
			</div>
		</form>
		</div>
	</div>
</body>
</html>