<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>掘进进尺统计图</title>
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
			init(month);
	    });
	    function init(month){
	    	$.ajax( {
					type : 'post',
					url : '${ctx}/coalzt/coalztAction!getTunnlleDepth',
					data : 'coalzt.month='+month,
					success : function(data) {
						yearType(data);
					}
			});	 
	    }
	    //年度统计
	    function yearType(data){
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
	                text: '掘进进尺统计图',
	                style: {
	                	color: '#FFFFFF',
						fontSize: '16px'
	                }
	            },
	            subtitle: {
	                text: '月统计',
	                style: {
	                	color: '#FFFFFF'
	                }
	            },
	            xAxis: {
	                categories: 
	                    data[0],
	                    labels: {
	                 style: {
	                     color: '#FFFFFF'
	                 }
             		}
	                
	            },
	            yAxis: {
	                min: 0,
	                title: {
	                    text: '进尺（米）',
	                    style: {
		                	color: '#FFFFFF'							
		                }
	                },
	                labels: {
	                 style: {
	                     color: '#FFFFFF'
	                 }
             		}
	            },
	            tooltip: {
	                headerFormat: '<span style="font-size:16px">{point.key}</span><table style="width:200px">',
	                pointFormat: '<tr><td style="padding:0">{series.name}: </td>' +
	                    '<td style="padding:0"><b>{point.y}（米）</b></td></tr>',
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
	                name: '<b style="color:white;">进尺日进</b>',
	                data: data[2],
	                color: '#FF6666'
	            }, {
	                name: '<b style="color:white;">进尺计划</b>',
	                data: data[1],
	    			color: '#FFFF66'
	            }, {
	                name: '<b style="color:white;">奋斗计划</b>',
	                data: data[3],
	    			color: '#6699FF'
	            }]
	        });
	    }
    </script>
</head>
<body>
	<script src="${ctx}/Highcharts-3.0.1/js/highcharts.js"></script>
	<script src="${ctx}/Highcharts-3.0.1/js/modules/exporting.js"></script>	
	<div>
		<form action="">
			<label style="font-size: 12px; ">按月统计进尺</label><input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM'})" class="Wdate" name="coalzt.month" id="month" />
			<input type="button" value="查询" onclick="change()">
		</form>
	</div>
	<div id="container" style="min-width: 400px; height: 420px; margin: 0 auto;"></div>
	<script type="text/javascript">
		function change(){
			var month = $("#month").val();
			init(month);

		}
	</script>
</body>
</html>