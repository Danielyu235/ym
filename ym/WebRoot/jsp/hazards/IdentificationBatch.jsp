<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>批量辨识危险源</title>

<link rel="stylesheet" type="text/css" href="${ctx}/css/bus.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/newCrud.css">
<script type="text/javascript" src="${ctx}/js/GridUtilNoToolBar.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/Highcharts-2.2.5/highcharts.js"></script>
<script type="text/javascript" src="${ctx}/js/Highcharts-2.2.5/modules/exporting.js"></script>
<script type="text/javascript">
	$(function(){
		gridLoadData(null);
	});
		function gridLoadData(gridData)	{
			$('#dg').datagrid({
		 		title : '',//去除title
				iconCls : this.iconCls,
				nowrap : false,
				striped : true,
				border : true,
				collapsible : false,
				url : this.url,
				remoteSort : false,
				idField : 'id',
				singleSelect : false,
				pagination : false,
				rownumbers : true,
				loadMsg:"正在努力拉取数据中...",
			    fitColumns:true,
			    columns:[[  
			              {field:'corpName',title:'所属单位',width:100,align:'center'},  
			              {field:'name',title:'危险源名称',width:100,align:'center'},  
			              {field:'type',title:'类型',width:100,align:'center'},  
			              {field:'reason',title:'辨识失败原因',width:100,align:'center'}
			    ]]
			 });
			 $('#dg').datagrid('loadData', gridData);
		}
		function msgLoadData(time, successNum, failNum, errorNum) {
			$('#msg').html('辨识总时间：' + time + '&nbsp;&nbsp;&nbsp;辨识总数量：' + (successNum + failNum + errorNum) 
					+ '&nbsp;&nbsp;&nbsp;辨识成功数量：' + (successNum + failNum) + '&nbsp;&nbsp;&nbsp;辨识失败数量：' + errorNum);
		}
		function getSeriesObject(name, num, isMax) {
			var series = {};
			series.name = name;
			series.y = num;
			if(isMax) {
				series.sliced = true;
				series.selected = true;
			}
			return series;
		}
		function chartLoadData(successNum, failNum, errorNum) {
			var max = Math.max(successNum, failNum, errorNum);
			var chartData = [];
			
			chartData.push(getSeriesObject('重大危险源', successNum, successNum==max));
			chartData.push(getSeriesObject('非重大危险源', failNum, failNum==max));
			chartData.push(getSeriesObject('辨识失败', errorNum, errorNum==max));
	        chart = new Highcharts.Chart({
	            chart: {
	                renderTo: 'container',
	                plotBackgroundColor: null,
	                plotBorderWidth: null,
	                plotShadow: false
	            },
	            title: {
	                text: '辨识结果统计分析'
	            },
	            tooltip: {
	                formatter: function() {
	                    return '<b>'+ this.point.name +'</b>: '+ Highcharts.numberFormat(this.percentage,2) +' %';
	                }
	            },
	            plotOptions: {
	                pie: {
	                    allowPointSelect: true,
	                    cursor: 'pointer',
	                    dataLabels: {
	                        enabled: true,
	                        color: '#000000',
	                        connectorColor: '#000000',
	                        formatter: function() {
	                            return '<b>'+ this.point.name +'</b>: '+ Highcharts.numberFormat(this.percentage,2) +' %';
	                        }
	                    }
	                }
	            },
	            series: [{
	                type: 'pie',
	                name: 'Hazards share',
	                data: chartData
	            }]
				
	        });
		}
		function batch() {
			$.loding();
			var form = $.form2Json($('#searchForm'));
			$.post('${ctx}/hazards/hazardsAction!identificationBatch', form, function(data){
				$('#chart').show();
				var data = eval('(' + data + ')');
				msgLoadData(data[0], data[1], data[2], data[3]);
				chartLoadData(data[1], data[2], data[3]);
				gridLoadData(data[4]);
				$.loded();
			});
		}
		function clear() {
			$('#searchForm').form('clear');
		}
</script>
</head>
<body style="overflow-y: auto;">
<div class="panel-header" style="width:100%;">
<div class="panel-title panel-with-icon">危险源辨识条件</div>
<div class="panel-icon icon-edit"></div>
<div class="panel-tool"></div>
</div>
<div class="datagrid-toolbar" id ="tb" style="padding-left:0px;height:10px;">
<div>
	<form id="searchForm" style="display: inline;">
	<div style="margin-top:-8px;">
	&nbsp;&nbsp;所属单位:&nbsp;&nbsp;<input type="text" name="hazards.corpName" />
	&nbsp;&nbsp;危险源名称:&nbsp;&nbsp;<input type="text" name="hazards.name" />
	&nbsp;&nbsp;危险源类型:&nbsp;&nbsp;<input type="text" name="hazards.type"  class="easyui-combobox"
		data-options="valueField:'v', textField:'v', data:[{v:'锅炉'},{v:'贮罐区'},{v:'压力容器'},
			{v:'压力管道'},{v:'生产场所'},{v:'库区'},{v:'煤矿'},{v:'尾矿库'},{v:'金属非金属地下矿山'}],editable:false" panelHeight="auto"/>
	&nbsp;&nbsp;辨识状态:&nbsp;&nbsp;<input type="text" name="hazards.info"  class="easyui-combobox" 
		data-options="valueField:'v', textField:'v', data:[{v:'未辨识'},{v:'重大危险源'},{v:'非重大危险源'},
			{v:'辨识失败'}],editable:false" panelHeight="auto"/>
	&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="batch()">批量辨识</a>
	&nbsp;&nbsp;
	<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="clear()">清空</a>
	</div>
	</form>
</div>
</div>
<div class="search_add">
</div>
<div style="width: 100%;display: none;" id="chart">
<div id="container" style="width: 600px; height: 400px; margin: 0 auto"></div>
</div>
<div id="msg" style="line-height: 20px;font-size: 12px;font-weight: bold;color: #2779aa;"></div>
<div id="dg"></div>
</body>
</html>