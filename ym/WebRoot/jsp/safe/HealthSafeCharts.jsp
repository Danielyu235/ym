<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>人员职业健康统计图</title>
</head>
<body>
	<div id="container" style="min-width: 400px; height: 400px; margin: 0 auto;background-color: #333333"></div>
	
	<script type="text/javascript" src="${ctx}/Highcharts-3.0.1/js/highcharts.js"></script>
	<script type="text/javascript" src="${ctx}/Highcharts-3.0.1/js/modules/exporting.js"></script>
	<script type="text/javascript">
		function getChartsData(){
	    	$.ajax( {
				type : 'post',
				url : '${ctx}/checkUp/checkUpAction!charsData',
				data : 'checkUp.data=2013',
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
	                backgroundColor: 'rgba(255, 255, 255, 0)'
	            },
	            title: {
	                text: '职业病病例统计图',
	                style: {
	                	color: '#FFFFFF',
						fontSize: '16px'
	                }
	            },
	            subtitle: {
	                text: '病例人数',
	                style: {
	                	color: '#FFFFFF',
	                	fontSize: '14px'
	                }
	            },
	            yAxis: {
	                min: 0,
	                title: {
	                    text: '病例（人次）',
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
	                    '<td style="padding:0"><b>{point.y} （人次）</b></td></tr>',
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
                	categories: ['血压','脉率','心电图','B超','尘肺病','血液检查','肝肾功能','神经系统','甲状腺','浅表淋巴结','皮肤黏膜'],
                	labels: {
		                 style: {
		                     color: '#FFFFFF'
		                 }
             		}
                },
                series: [{
	                name: '<b style="color:white;">病例（人次）</b>',
	                data: data,
	                color: '#FFFF66'
	            }]
           });
	    }
	    
	    $(function () {
			getChartsData();
	    });
	</script>
</body>
</html>