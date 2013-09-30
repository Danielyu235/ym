<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>矿车运行周期柱状统计</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript">
	var title = "";
	$(function () {
		var date = new Date();
		var month =null;
		month = date.getFullYear();
		title = month+"年 矿车运行周期统计";
		init(month);
    });
    function init(month){
    	$.ajax( {
				type : 'post',
				url : '${ctx}/tran/tranAction!getCol',
				data : 'tran.statisticalTime='+month,
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
                type: 'column',
	            backgroundColor: 'rgb(51, 51, 51)'
            },
            title: {
                text: title,
                style: {
                	color: '#FFFFFF',
					fontSize: '16px'
                }
            },
            subtitle: {
                text: '年度统计',
                style: {
                	color: '#FFFFFF'
                }
            },
            xAxis: {
                categories: ['一月', '二月', '三月', '四月', '五月', '六月','七月', '八月', '九月', '十月', '十一月', '十二月'],
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
                min: 0,
                title: {
                    text: '天',
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
                headerFormat: '<span style="font-size:15px">{point.key}</span><table style="width:200px;">',
                pointFormat: '<tr><td style="color:{series.color};font-size:2px;">{series.name}: </td>' +
                    '<td style="font-size:2px;text-align:right;"><b>{point.y} 天</b></td></tr>',
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
            series: arr
        });
    }
</script>
</head>
<body>
<script src="${ctx}/Highcharts-3.0.1/js/highcharts.js"></script>
<script src="${ctx}/Highcharts-3.0.1/js/modules/exporting.js"></script>	
<div>
	<form action="">
		<label style="font-size: 12px;">年份：</label><input type="text" onfocus="WdatePicker({dateFmt:'yyyy'})" class="Wdate" name="tran.statisticalTime" id="month" />
		<input type="button" value="查询" onclick="change();">
	</form>
</div>
<div id="container" style="min-width: 400px; height: 400px; margin: 0 auto;"></div>
<script type="text/javascript">
	function change(){
		var date = new Date();
		var month =null;
		month = date.getFullYear();
		var year = $("#month").val();
		init(year);
		if(year!="")
			title = year+"年  矿车运行周期统计";
		if(year=="")
			title = month+"年  矿车运行周期统计";
	}
</script>
</body>
</html>

