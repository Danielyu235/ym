<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>安全管理隐患类型统计</title>
<script src="${ctx}/Highcharts-3.0.1/js/highcharts.js"></script>
<script src="${ctx}/Highcharts-3.0.1/js/modules/exporting.js"></script>	
<script type="text/javascript">
var searchData = null;
Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function(color) {
    return {
        radialGradient: { cx: 0.5, cy: 0.3, r: 0.7 },
        stops: [
            [0, color],
            [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
        ]
    };
});

var title = "${param.title}";
if(title==""){
	var date = new Date();
	var month =null;
	month = date.getFullYear();
	title = month+"年  安全管理隐患类型统计";
}
$(document).ready(function () {
	$.post('${ctx}/hiddenPerils/hiddenPerilsAction!getPie?discoveryTime=${param.discoveryTime}', function (data) {
		searchData = eval('(' + data + ')');
		pieLoadData();
	});
});

function getPieObject(name, num, isMax) {
	var pie = {};
	pie.name = name;
	pie.type = name;
	pie.y = num;
	if(isMax) {
		pie.sliced = true;
		pie.selected = true;
	}
	return pie;
}

var chart = null;
function pieLoadData() {
	var maxNum = [];
	var chartData = [];
	$.each(searchData,function (index,element) {
		maxNum.push(element.ts*1);
	});
	var max = Math.max.apply(null,maxNum);
	$.each(searchData,function (index,element) {
		chartData.push(getPieObject(element.hiddenType, element.ts*1, element.ts*1 == max));
	});
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
        	 height:500,
        	 backgroundColor: 'rgba(255, 255, 255, 0)',
             plotBackgroundColor: null,
             plotBorderWidth: null,
             plotShadow: false,
             style:{
		 		 color: '#FFFFFF',
            	 fontWeight: 'bold'
             }
         },
        title: {
            text: title,
            style:{
        		color: '#FFFFFF',
            	fontSize: '20px'
            }
        },
        subtitle: {
            text: null,
            style: {
            	color: '#FFFFFF',
				fontSize: '16px'
            }
        },
        tooltip: {
            formatter: function() {
                return '<b>'+ this.point.name +'</b>: '+ this.point.y +'条'+'<b>隐患:</b>'+ Highcharts.numberFormat(this.percentage,2) +' %';
            }
        },
        exporting:{ 
            enabled: true //用来设置是否显示‘打印’,'导出'等功能按钮，不设置时默认为显示 
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                events: {
                },
                dataLabels: {
                    enabled: true,
                    color: '#FFFFFF',
                    connectorColor: '#FFFFFF',
                    style:{
                    	fontSize: '16px'
                    },
                    formatter: function() {
                        return '<b>'+ this.point.name +'</b>: '+ Highcharts.numberFormat(this.percentage,2) +' %';
                    }
                },
                showInLegend: true
            }
        },
        legend: {
        	itemStyle: {
	        	cursor: 'pointer',
	        	color: '#FFFFFF'
        	}
        },
        series: [{
        	type: 'pie',
            data: chartData
        }]
		
    });
}
</script>
</head>
<body>
<div>
<form id="myForm" method="post">
	<label style="font-size: 12px;">根据隐患类型按年份统计</label><input type="text" onfocus="WdatePicker({dateFmt:'yyyy'})" class="Wdate" name="discoveryTime" id="month" />
	<input type="button" value="查询" onclick="change();">
</form>
</div>
<br/>
<div id="container" style="min-width: 400px; height: 500px; margin: 0 auto;background-color: #333333;"></div>
<script type="text/javascript">
	function init(month){
		$.ajax( {
				type : 'post',
				url : '${ctx}/hiddenPerils/hiddenPerilsAction!getPie',
				data : 'discoveryTime='+month,
				success : function(data) {
					yearType(data);
				}
		});	 
	}

	function showInfo(month,title){
		window.location.href="${ctx}/jsp/ymxm/hiddenPerils/hiddenPie.jsp?discoveryTime="+month+"&title="+title;
	}
	function change(){
		var date = new Date();
		var month =null;
		month = date.getFullYear();
		var year = $("#month").val();
		if(year!="")
			title = year+"年  安全管理隐患类型统计";
		if(year=="")
			title = month+"年  安全管理隐患类型统计";
		showInfo(year,title);
	}
</script>
</body>
</html>