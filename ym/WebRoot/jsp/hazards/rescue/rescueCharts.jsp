<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>应急救援统计图</title>
</head>
<body>
	<div style="width:99%;height:50px;margin:0 auto;padding:5px">
		<select onchange="getData()" id="type">
			<option value="001">月度统计</option>
			<option value="002">年度统计</option>
		</select>
		<span id="month_span">
			<label for="month">月份：</label>
			<input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM'})" class="Wdate" id="month" />			
		</span>
		<span id="year_span">
			<label for="year">年份：</label>
			<input type="text" onfocus="WdatePicker({dateFmt:'yyyy'})" class="Wdate" id="year" />			
		</span>
		<button onclick="getData()">查询</button>		
	</div>
	<div id="container" style="min-width: 400px; height: 400px; margin: 0 auto;"></div>

	
	<script type="text/javascript" src="${ctx}/Highcharts-3.0.1/js/highcharts.js"></script>
	<script type="text/javascript" src="${ctx}/Highcharts-3.0.1/js/modules/exporting.js"></script>
	<script type="text/javascript">
		$(function () {
			$("#year_span").hide();
			$("#month").val(new Date().format("yyyy-MM"));
			$("#year").val(new Date().format("yyyy"));
			getData();	        
	    });

		Date.prototype.format = function(format){ 
			var o = { 
				"M+" : this.getMonth()+1, //month 
				"d+" : this.getDate(), //day 
				"h+" : this.getHours(), //hour 
				"m+" : this.getMinutes(), //minute 
				"s+" : this.getSeconds(), //second 
				"q+" : Math.floor((this.getMonth()+3)/3), //quarter 
				"S" : this.getMilliseconds() //millisecond 
			} 

			if(/(y+)/.test(format)) { 
				format = format.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
			} 

			for(var k in o) { 
				if(new RegExp("("+ k +")").test(format)) { 
					format = format.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length)); 
				} 
			} 
			return format; 
		}   

	    function getData(){
		    var type = $("#type").val();
		    if(type == "001"){
		    	var month = $("#month").val();	
		    	$("#year_span").hide();
		    	$("#month_span").show();
		    }else if(type == "002"){
		    	var month = $("#year").val();
		    	$("#month_span").hide();
		    	$("#year_span").show();
		    }
			$.ajax( {
				type : 'post',
				url : '${ctx}/platformRescue/platformRescueAction!getChartsData?platformRescue.accidentOfTime='+month,
				success : function(data) {
					createCharts(data);
				}
			});	
	    }

	    function createCharts(data){
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
	                type: 'column',
	            	backgroundColor: 'rgb(51, 51, 51)'
	            },
	            title: {
	                text: '事故类型',
	                style: {
	                	color: '#FFFFFF',
						fontSize: '16px'
	                }
	            },
	            subtitle: {
	                text: '数量统计',
	                style: {
	                	color: '#FFFFFF',
	                	fontSize: '14px'
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
	                min: 0,
	                title: {
	                    text: '单位（次数）',
	                    style: {
	                	color: '#FFFFFF',
						fontSize: '16px'
	               		}
	                },
	                labels: {
	                 style: {
	                     color: '#FFFFFF'
	                 }
             		}
	            },
	            tooltip: {
	                headerFormat: '<span style="font-size:10px">{point.key}</span><table style="width:200px">',
	                pointFormat: '<tr><td style="padding:0">{series.name}: </td>' +
	                    '<td style="padding:0"><b>{point.y} 次</b></td></tr>',
	                footerFormat: '</table>',
	                shared: true,
	                useHTML: true,
	                 backgroundColor:'#1b7bd1',
	                borderColor: '#000000'
	            },
	            plotOptions: {
	                column: {
	                    pointPadding: 0.2,
	                    borderWidth: 0
	                }
	            },
	            series: [{
	                name: '<b style="color:white;">事故数量</b>',
	                data: data[1],
	                color: '#FFFF66'
	            }]
	        });
	    }
	</script>
</body>
</html>