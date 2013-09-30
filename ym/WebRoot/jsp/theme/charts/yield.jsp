<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>煤产量统计图</title>
</head>
<body>
	<div style="width:99%;height:50px;margin:0 auto;padding:5px">
		<form action="">
			<label style="font-size: 12px;"  for="month">月份：</label>
				<input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM'})" class="Wdate" name="coalzt.month" id="month" />
				<input type="button" value="查询" onclick="getData()">
			</form>	
	</div>
	<div id="container" style="min-width: 400px; height: 400px; margin: 0 auto;"></div>

	<script src="${ctx}/Highcharts-3.0.1/js/highcharts.js"></script>
	<script src="${ctx}/Highcharts-3.0.1/js/modules/exporting.js"></script>	
	<script type="text/javascript">
	$(function () {
			var date = new Date();
			var month =null;
			if(date.getMonth()<10){
				month = date.getFullYear()+"-0"+(date.getMonth()+1);
			}else{
				month = date.getFullYear()+"-"+(date.getMonth()+1);
			}
			$("#month").val(month);
	    });
		function getData(){
			var month = $("#month").val();
	    	$.ajax( {
				type : 'post',
				url : '${ctx}/coalzt/coalztAction!getYieldData',
				data : 'coalzt.month=' + month,
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
                type: 'column',
	            backgroundColor: 'rgb(51, 51, 51)'
	            },
	            title: {
	                text: '煤产量统计图',
	                style: {
	                	color: '#FFFFFF',
						fontSize: '16px'
	                }
	            },
	            subtitle: {
	                text: '月度统计',
	                style: {
	                	color: '#FFFFFF',
	                	fontSize: '14px'
	                }
	            },
	            yAxis: {
	                min: 0,
	                title: {
	                    text: '产量（吨）',
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
	                pointFormat: '<tr><td style="color:#666666;padding:0">{series.name}: </td>' +
	                    '<td style="padding:0"><b>{point.y:.1f} 吨</b></td></tr>',
	                footerFormat: '</table>',
	                shared: true,
	                useHTML: true,
	                backgroundColor:'#1b7bd1'
	            },
	            plotOptions: {
	                column: {
	                    pointPadding: 0.2,
	                    borderWidth: 0
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
                series: [{
	                name: '<b style="color:white;">产量</b>',
	                data: data[1],
	                color: '#FFFF66'
	            }]
           });
		}	
		
		$(function () {
	    	getData();
	    });
	</script>
</body>
</html>