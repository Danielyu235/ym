<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title></title>

		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
		<script type="text/javascript">
		$(function () {
			var date = new Date();
			var month =null;
			month = date.getFullYear();
			title = month+"年  全矿煤产量统计图";
			init(month);
	    });
	    function init(month){
	    	$.ajax( {
					type : 'post',
					url : '${ctx}/coalOutput/coalOutputAction!getMonthCoalData',
					data : 'coalOutput.monthPlan='+month,
					success : function(data) {
						yearType(data);
					}
			});	 
	    }
	    //年度统计
	    function yearType(data){
		    var splines =  eval('[' + data[0] + ']');
		    var arr = [];
		    for(var i in splines) {
	 			arr.push(splines[i]);
	 		}
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
	                type: 'line',
	                marginRight: 130,
	                marginBottom: 25,
	                backgroundColor: 'rgb(51, 51, 51)'
	            },
	            title: {
	                text: title,
	                x: -20 ,
	                style: {
	                	color: '#FFFFFF',
						fontSize: '16px'
	                }
	            },
	            subtitle: {
	                text: '月度统计',
	                x: -20,
	                style: {
	                	color: '#FFFFFF',
						fontSize: '16px'
	                }
	            },
	            xAxis: {
	                categories: ['一月', '二月', '三月', '四月', '五月', '六月',
	                    '七月', '八月', '九月', '十月', '十一月', '十二月'],
	                    style: {
	                	color: '#FFFFFF',
						fontSize: '16px'
	                },
	                labels: {
	                 style: {
	                     color: '#FFFFFF'
	                 }
             		}
	            },
	            yAxis: {
	                title: {
	                    text: '月产量（吨）',
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
	                style: {
	                	color: '#FFFFFF',
						fontSize: '16px'
	                },
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
	                align: 'right',
	                verticalAlign: 'top',
	                x: -10,
	                y: 100,
	                borderWidth: 0
	            },
	            series: arr
	        });
    }
    
    function change(){
			var type = $("#year").val();
			init(type);
	}
		</script>
	</head>
	<body>
	<script src="${ctx}/Highcharts-3.0.1/js/highcharts.js"></script>
	<script src="${ctx}/Highcharts-3.0.1/js/modules/exporting.js"></script>	
	<div style="width:99%;height:50px;margin:0 auto;padding:5px">
		<span id="span_year">
			<form action="">
				<label for="month" style="font-size: 12px;color: ">按年份统计煤产量</label>
				<input type="text" onfocus="WdatePicker({dateFmt:'yyyy'})" class="Wdate" name="coalzt.month" id="year" />
				<input type="button" value="查询" onclick="change()">
			</form>	
		</span>
	</div>
	<div id="container" style="min-width: 400px; height: 400px; margin: 0 auto;"></div>

	</body>
</html>
