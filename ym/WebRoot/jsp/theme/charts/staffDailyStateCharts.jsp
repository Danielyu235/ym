<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>人员日常状态统计图</title>
</head>
<body>

	<div style="width:99%;height:50px;margin:0 auto;padding:5px">
		<label style="font-size: 12px; " for="type">统计方式：</label>
		<select onchange="changeType()" id="type">
			<option value="001">月度统计</option>
			<option value="002">年度统计</option>
		</select>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<span id="span_month">
			<label style="font-size: 12px; " for="time">月份：</label>
			<select id="time" onchange="getColumnData()">
				<option value="2013-09" selected="selected">2013-09</option>
				<option value="2013-08">2013-08</option>
				<option value="2013-07">2013-07</option>
			</select>			
		</span>
		<span id="span_department">
			<label style="font-size: 12px; " for="department">部门：</label>
			<select id="department" onchange="getLineData()">				
				<option value="3311b3fc24504b568a364aeca57db189" selected="selected">掘开工区</option>
				<option value="8c070fa733c34d789f58ddf2ef2b81f8">采煤工区</option>
				<option value="c59528bcfe7b4a9f89cd8faae5a875d7">抽采工区</option>
				<option value="d601be750b7b41a0bc92fb4f273f8f56">运输工区</option>
				<option value="2c6c3460f99b477cadfdaefba8a8fa1b">机电工区</option>
				<option value="a69d4659653049b4aeace9bc9eda6812">维运工区</option>
				<option value="6d36603331004cf2a45644357f6dc684">洗煤厂</option>
				<option value="28aa351ace4b40da87af60410fc34f80">物资供应部</option>
				<option value="3b0af89beb3548868debe1ea950c43c5">生产服务中心</option>
			</select>
		</span>
	</div>
	<div id="container" style="min-width: 400px; height: 400px; margin: 0 auto;background-color: #333333"></div>
	<script type="text/javascript" src="${ctx}/Highcharts-3.0.1/js/highcharts.js"></script>
	<script type="text/javascript" src="${ctx}/Highcharts-3.0.1/js/modules/exporting.js"></script>
	<script type="text/javascript">
		$(function () {
			getColumnData();
			$("#span_department").hide();
	    });
	    
	    function changeType(){
	    	var type = $("#type").val();
	    	if(type == "001"){
	    		getColumnData();
	    		$("#span_month").show();
	    		$("#span_department").hide();
	    	}else if(type == "002"){
	    		getLineData();
	    		$("#span_month").hide();
	    		$("#span_department").show();
	    	}
	    }
	    
	    function getColumnData(){
	    	var time = $("#time").val();
	    	$.ajax( {
				type : 'post',
				url : '${ctx}/dailyStatus/dailyStatusAction!getColumnData',
				data : 'dailyStatus.time=' + time,
				success : function(data) {
					createColumn(data);
				}
			});
	    }
	    
	    function createColumn(data){
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
	                text: '各工区谈话次数',
	                style: {
	                	color: '#FFFFFF',
						fontSize: '16px'
	                }
	            },
	            subtitle: {
	                text: $("#time").val(),
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
	                    text: '谈话次数',
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
	                    '<td style="padding:0"><b>{point.y} 次</b></td></tr>',
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
	            series: [{
	                name: '谈话次数',
	                data: data[1],
	                color: '#FFFF66'	    
	            }]
	        });
	    }
	    
	    function getLineData(){
	    	var done = $("#department").val();
	    	$.ajax( {
				type : 'post',
				url : '${ctx}/dailyStatus/dailyStatusAction!getLineData',
				data : 'dailyStatus.done=' + done,
				success : function(data,doneName) {
					createLine(data);
				}
			});
	    }
	    
	    function createLine(data){
	    	$('#container').highcharts({
	            chart: {
	                type: 'line',
	                marginRight: 130,
	                marginBottom: 25,
	                backgroundColor: 'rgb(51, 51, 51)'
	            },
	            title: {
	                text: $("#department").find("option:selected").text() + '谈话次数',
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
	                    text: '次数',
	                    style: {
		                	color: '#FFFFFF',
		                	fontSize: '16px'							
	                	}
	                },
	                plotLines: [{
	                    value: 0,
	                    width: 1,
	                    color: '#FFFF66'
	                }],
	                labels: {
	                 style: {
	                     color: '#FFFFFF'
	                 }
             		}
	            },
	            tooltip: {
	                valueSuffix: '（次数）'
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
	                name: '谈话次数',
	                data: data[1]
	            }]
	        });
	    }
	</script>
</body>
</html>