<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/jqueryhead.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>采煤系统主题</title>
		<!-- script src="../../js/jquery-1.7.2.min.js"></script> -->
		<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
		<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
		<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
		<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
		<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
		<script src="../../js/highcharts.js"></script>
		<script src="../../js/modules/exporting.js"></script>
		<script type="text/javascript">
$(function () {	
	onloadCombobox('${ctx}','nf',$('#year'),null,null);//加载list页面查询combobox菜单数据
    var myDate = new Date();
    var year = myDate.getFullYear();
		//默认时间为当前时间，初始化统计图
		init(year);
    });
    //首先加载统计图，默认时间为当前时间
 function init(year){
		$.ajax( {url : '${ctx}/coalMiningSysTheme/coalMiningSysThemeAction!getMine.action?date='+year,
 				success : function(dataWork) {
 				//柱形json对象
 				var bars = eval('[' + dataWork[0] + ']');
 				//折线json对象
 				var splines =  eval('[' + dataWork[1] + ']');
 				//饼图json对象
 				/*var pies =  eval('[' + dataWork[2] + ']');
 				var arrPie = [];
 				for(var i in pies) {
 					arrPie.push(pies[i]);
 				}
 				var pie = {
	                type: 'pie',
	                name: 'Total consumption',
	                data:arrPie,
	                center: [100, 80],
	                size: 100,
	                showInLegend: false,
	                dataLabels: {
	                    enabled: false
	                }
	            };*/
 				var arr = [];
 				for(var i in bars) {
 					arr.push(bars[i]);
 				}
 				/*for(var i in splines) {
 					arr.push(splines[i]);
 				}*/
 				 
 				
 				/*arr.push(pie);*/
 				$('#container').highcharts({
	            chart: {
		            backgroundColor: 'rgba(255, 255, 255, 0)',
	                plotBorderColor : null,
	                plotBackgroundColor: null,
	                plotBackgroundImage:null,
	                plotBorderWidth: null,
	                plotShadow: false
	            },
	            title: {
	                text: '产量分析趋势图'
	            },
	            xAxis: {
	                categories: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
	                 labels: {
		                 style: {
		                     color: 'white',
		                 }
             		}
	            },
	            tooltip: {
	                formatter: function() {
	                    var s;
	                    if (this.point.name) { // the pie chart
	                        s = ''+
	                            this.point.name +': '+ this.y +' ';
	                    } else {
	                        s = ''+
	                            this.x  +': '+ this.y;
	                    }
	                    return s;
	                }
	            },
	            labels: {
	                items: [{
	                    html: '',
	                    style: {
	                        left: '40px',
	                        top: '8px',
	                        color: 'black'
	                    }
	                }]
	            },
	            series: arr
	        });
	 	}
	 	});
    }
    function sumDate(){
    	var year=$("#year").combobox('getText');
    	if(year==null||year==''){
    		alert("请选择年份");
    		return;
    	}
    	init(year);
    }
    </script>
	</head>
	<body>
		<div style="padding: 0, auto; margin: 0 auto;">
			请选择查询年份:
			<input class="easyui-combobox"
				data-options="panelHeight:'auto',width:'100',editable:false"
				id="year" />
			<input type="button" value="查询" onclick="sumDate()"
				style="background-image:${ctx}/images/select.png;">
		</div>
		<div id="container"
			style="min-width: 400px; margin: 0 auto; background-color: black; width: 900px; height: 400px;"></div>
	</body>
</html>
