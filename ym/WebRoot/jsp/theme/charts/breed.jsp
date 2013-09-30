<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>品种煤统计图</title>
</head>
<body>	
	<div style="width:99%;height:50px;margin:0 auto;padding:5px">
		<label style="font-size: 12px;" for="type">统计方式：</label>
		<select id="type" onchange="changeType()">
			<option value="001" selected="selected">月度统计</option>
			<option value="002" >年度统计</option>
		</select>
		<span id="span_year">
			<form action="">
				<label style="font-size: 12px;" for="month">年份：</label>
				<input type="text" onfocus="WdatePicker({dateFmt:'yyyy'})" class="Wdate" name="coalzt.month" id="year" />
				<input type="button" value="查询" onclick="getLineData()">
			</form>	
		</span>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<span id="monthType">
			<form action="">
				<label style="font-size: 12px;" for="month">月份：</label>
				<input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM'})" class="Wdate" name="coalzt.month" id="month" />
				<input type="button" value="查询" onclick="getKindData()">
			
			<label style="font-size: 12px;" for="group">队组：</label>
			<select id="group" onchange="getKindData()">
				<option value="全部队组" selected="selected">全部队组</option>
				<option value="综一队">综一队</option>
				<option value="综二队">综二队</option>
				<option value="综三队">综三队</option>
				<option value="综四队">综四队</option>
				<option value="掘一队">掘一队</option>
				<option value="掘二队">掘二队</option>
				<option value="掘三队">掘三队</option>
				<option value="掘四队">掘四队</option>
				<option value="掘五队">掘五队</option>
				<option value="掘六队">掘六队</option>
			</select>
			</form>	
		</span>
	</div>
	<div id="container" style="min-width: 400px; height: 400px; margin: 0 auto;"></div>	

	<script type="text/javascript" src="${ctx}/Highcharts-3.0.1/js/highcharts.js"></script>
	<script type="text/javascript" src="${ctx}/Highcharts-3.0.1/js/modules/exporting.js"></script>
	<script type="text/javascript">
		function changeType(){
			var type = $('#type').val();
			if(type == '001'){
				getKindData();
				$("#monthType").show();
				$("#span_year").hide();
			}else if(type == '002'){
				$("#month").val("");
				getLineData();
				$("#monthType").hide();
				$("#span_year").show();
			}
		}
	
		function getKindData(){
			var month = $("#month").val();
				
			var group = $("#group").val();
	    	$.ajax( {
				type : 'post',
				url : '${ctx}/coalzt/coalztAction!getKindData',
				data : 'coalzt.month=' + month + '&coalzt.group_type=' + group,
				success : function(data) {
					chartsBuilder(data);
				}
			});	    	
	    }

	    function chartsBuilder(data){
	     Highcharts.setOptions({
					lang: {
						contextButtonTitle: '功能菜单',
						downloadJPEG: '下载JPEG图像',
						downloadPDF: '下载PDF图像',
						downloadPNG: '下载PNG图像',
						downloadSVG: '下载SVG矢量图像',
						loading: 'Loading...',
						printChart:'平面图'
					}
				});
	    	$('#container').highcharts({
	            chart: {
	                plotBackgroundColor: null,
	                plotBorderWidth: null,
	                plotShadow: false,
	                backgroundColor: 'rgb(51, 51, 51)'
	            },
	            title: {
	                text: '品种煤统计图, 2013',
	                style: {
	                	color: '#FFFFFF',
						fontSize: '16px'
	                }
	            },
	            tooltip: {
	        	  formatter:function(){
						return  this.point.name +': ' + Highcharts.numberFormat(this.point.percentage,2)+' %';
		        	  }
	            	
	            },
	            plotOptions: {
	                pie: {
	                    allowPointSelect: true,
	                    cursor: 'pointer',
	                    dataLabels: {
	                        enabled: true,
	                        color: '#FFFFFF',
	                        connectorColor: '#FFFFFF',
	                        formatter: function() {
	                            return '<b>'+ this.point.name +'</b>: '+ Highcharts.numberFormat(this.percentage) +' %';
	                        }
	                    }
	                }
	            },
	            series: [{
	                type: 'pie',
	                name: '所占比例',
	                data: [
	                    ['精煤①',   data[0]],
	                    ['精煤②',   data[1]],
	                    {
	                        name: '块碳',
	                        y: data[2],
	                        sliced: true,
	                        selected: true
	                    },
	                    ['末碳',    data[3]]	                    
	                ]
	            }]
	        });
	    }

	    function getLineData(){
	    	var month = $("#year").val();
	    	$.ajax( {
				type : 'post',
				url : '${ctx}/coalzt/coalztAction!yearChartsData',
				data : 'coalzt.month='+month,
				success : function(data) {
					lineBuilder(data);
				}
			});
	    }

	    function lineBuilder(data){
	    	$('#container').highcharts({
	            chart: {
	                type: 'line',
	                marginRight: 130,
	                marginBottom: 25,
	                backgroundColor: 'rgb(51, 51, 51)'
	            },
	            title: {
	                text: '品种煤统计图',
	                x: -20, //center
	                style: {
	                	color: '#FFFFFF',
						fontSize: '16px'
	                }
	            },
	            xAxis: {
	                categories: data[0],
	                labels: {
	                 style: {
	                     color: '#FFFFFF'
	                 }
             		}
	            },
	            yAxis: {
	                title: {
	                    text: '产量',
	                    style: {
		                	color: '#FFFFFF',
		                	fontSize: '16px'							
		                }
	                },
	                plotLines: [{
	                    value: 0,
	                    width: 1,
	                    color: '#808080'
	                }],
	                labels: {
	                 style: {
	                     color: '#FFFFFF'
	                 }
             		}
	            },
	            tooltip: {
	                valueSuffix: '（吨）'
	            },
	            legend: {
	                layout: 'vertical',
	                align: 'left',
	                x: 120,
	                verticalAlign: 'top',
	                y: 80,
	                floating: true,
	                backgroundColor: '#FFFFFF'
	            },
	            series: [{ 	
		            	name: '精煤①',
                  	  	data: data[1]
					},{ 
						name: '精煤②',
	                  	data: data[2]
					},{ 
						name: '块碳',
	                  	data: data[3]
					},{ 
						name: '末煤',
	                  	data: data[4]
					}
				]
	        });				
	    }
	
		$(function () {
			$("#monthType").show();
			$("#span_year").hide();
			getKindData();
	    });
	</script>
</body>
</html>