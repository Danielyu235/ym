<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>回采率</title>
</head>
<body>
	<script src="${ctx}/Highcharts-3.0.1/js/highcharts.js"></script>
	<script src="${ctx}/Highcharts-3.0.1/js/modules/exporting.js"></script>	
	<div style="width:99%;height:50px;margin:0 auto;padding:5px">
		<label style="font-size: 12px;" for="type">统计方式：</label>
		<select onchange="change()" id="type">
			<option value="001">年度统计</option>
			<option value="002">月度统计</option>
		</select>
		<span id="span_year">
			<form action="">
				<label style="font-size: 12px;" for="month">年份：</label>
				<input type="text" onfocus="WdatePicker({dateFmt:'yyyy'})" class="Wdate" name="coalzt.month" id="year" />
				<input type="button" value="查询" onclick="change()">
			</form>	
		</span>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<span id="span_month">
			<form action="">
			<label style="font-size: 12px;" for="month">月份：</label>
				<input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM'})" class="Wdate" name="coalzt.month" id="month" />
				<input type="button" value="查询" onclick="change()">
			</form>			
		</span>
	</div>
	<div id="container" style="min-width: 400px; height: 400px; margin: 0 auto; "></div>
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
		function change(){
			var type = $("#type").val();
			if(type == "001"){
				yearType();
				$("#span_month").hide();
				$("#span_year").show();
			}else if(type == "002"){
				monthType();
				$("#span_month").show();
				$("#span_year").hide();
			}
		}

		//获取月度统计数据
	    function yearType(){
	    	$.ajax( {
				type : 'post',
				url : '${ctx}/coalzt/coalztAction!getYearData',
				data : 'coalzt.month=2013',
				success : function(data) {
					chartsWithYear(data);
				}
			});	    	
	    }

	    //年度统计
	    function chartsWithYear(data){
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
	                text: '回采率统计图',
	                style: {
	                	color: '#FFFFFF',
						fontSize: '16px'
	                }
	            },
	            subtitle: {
	                text: '年度统计',
	                style: {
	                	color: '#FFFFFF',
	                	fontSize: '14px'
	                }
	            },
	            xAxis: {
	                categories: data[4],
	                labels: {
	                 style: {
	                     color: '#FFFFFF'
	                 }
             		}
	            },
	            yAxis: {
	                min: 0,
	                title: {
	                    text: '回采率 %',
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
	                headerFormat: '<span style="font-size:16px">{point.key}</span><table style="width:200px">',
	                pointFormat: '<tr><td style="padding:0">{series.name}: </td>' +
	                    '<td style="padding:0"><b>{point.y:.1f} %</b></td></tr>',
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
	                name: '<b style="color:white;">综采一队</b>',
	                data: data[0],
	                color: '#FF6666'
	            }, {
	                name: '<b style="color:white;">综采二队</b>',
	                data: data[1],
	    			color: '#FFFF66'
	            }, {
	                name: '<b style="color:white;">综采三队</b>',
	                data: data[2],
	    			color: '#6699FF'
	            }, {
	                name: '<b style="color:white;">综采四队</b>',
	                data: data[3],
	                color: '#66CC66'	    
	            }]
	        });
	    }

	  	//获取月度统计数据
	    function monthType(){
	    	var month = $("#month").val();
	    	$.ajax( {
				type : 'post',
				url : '${ctx}/coalzt/coalztAction!getMonthlyData',
				data : 'coalzt.month=' + month,
				success : function(data) {
					chartsWithMonth(data);
				}
			});	    	
	    }
		//创建月度统计图
		function chartsWithMonth(data){
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
	                text: '回采率统计图',
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
	                    text: '回采率 %',
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
	                    '<td style="padding:0"><b>{point.y:.1f} %</b></td></tr>',
	                footerFormat: '</table>',
	                shared: true,
	                useHTML: true,
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
                	type:'column',
	                name: '<b style="color:white;">'+data[2]+'</b>',
	                data: [parseInt(data[1][0]),parseInt(data[1][1]),parseInt(data[1][2]),parseInt(data[1][3])],
	                color: '#FFFF66'
	            }]
           });
		}	    

	    $(function () {
	    	$("#span_month").hide();
	    	yearType();
	    });
	</script>
</body>
</html>