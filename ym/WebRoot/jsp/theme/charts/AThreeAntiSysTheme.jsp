<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/jqueryhead.jsp"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>一通三防瓦斯浓度统计图</title>
	<script type="text/javascript" src="${ctx}/Highcharts-3.0.1/js/highcharts.js"></script>
	<script type="text/javascript" src="${ctx}/Highcharts-3.0.1/js/modules/exporting.js"></script>
<script type="text/javascript">
$(function () {
    $(document).ready(function() {
		init();
	});
 });
 function getData(){
 	$.ajax( {
				type : 'post',
				url : '${ctx}/aThreeAntiSysTheme/aThreeAntiSysThemeAction!getById',
				success : function(data) {
				}
	});	   
 }
function init(){
	 Highcharts.setOptions({
            global: {
                useUTC: false
            }
        });
        var chart;
        $('#container').highcharts({
            chart: {
                type: 'spline',
                animation: Highcharts.svg, // 不可使用老版本IE
                marginRight: 10,
                events: {
                    load: function() {
    
                        // 建立了图表的每一秒更新
                        var series = this.series[0];
                        setInterval(function() {
                            var x = (new Date()).getTime(), // 当前时间
                                y = Math.random();
                            series.addPoint([x, y], true, true);
                           // getData();//实时数据
                        }, 1000);
                    }
                },
	            backgroundColor: 'rgb(51, 51, 51)'
            },
            title: {
                text: '瓦斯浓度统计图',
                style: {
	                	color: '#FFFFFF',
						fontSize: '16px'
	                }
            },
            xAxis: {
                type: 'datetime',
                tickPixelInterval: 150,
                 labels: {
	                 style: {
	                     color: '#FFFFFF'
	                 }
             		}
            },
            yAxis: {
                title: {
                    text: '单位（○C）',
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
                formatter: function() {
                        return '<b>'+ this.series.name +'</b><br/>'+
                        Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) +'<br/>'+
                        Highcharts.numberFormat(this.y, 2);
                }
            },
            legend: {
                enabled: false
            },
            exporting: {
                enabled: false
            },
            series: [{
                name: '监测点',
                data: (function() {
                    // 产生随机数据数组
                    var data = [],
                        time = (new Date()).getTime(),
                        i;
    
                    for (i = -19; i <= 0; i++) {
                        data.push({
                            x: time + i * 1000,
                            y: Math.random()
                        });
                    }
                    return data;
                })()
            }]
        });
   
}
		</script>
	</head>

<div id="container" style="min-width: 400px; height: 400px; margin: 0 auto"></div>

	</body>
</html>
