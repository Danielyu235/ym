<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<style type="text/css">
.main {color: white;}
</style>
    <meta charset="utf-8">
    <title>ECharts</title>
    <!--Step:1 Import a module loader, such as esl.js or require.js-->
    <!--Step:1 引入一个模块加载器，如esl.js或者require.js-->
    <script src="js/esl.js"></script>
</head>

<body>
    <!--Step:2 Prepare a dom for ECharts which (must) has size (width & hight)-->
    <!--Step:2 为ECharts准备一个具备大小（宽高）的Dom-->
    <div style="width:99%;height:50px;margin:0 auto;padding:5px">
		<label for="month">月份：</label>
		<select id="month" onchange="getKindData()">
			<option value="2013-09" selected="selected">2013-09</option>
			<option value="2013-08">2013-08</option>
			<option value="2013-07">2013-07</option>
		</select>
		<label for="">队组：</label>
		<select id="group" onchange="getKindData()">
			<option value="全部队组" selected="selected">全部队组</option>
			<option value="综一队">综一队</option>
			<option value="综二队">综二队</option>
			<option value="综三队">综三队</option>
			<option value="综四队">综四队</option>
			<option value="掘一队">掘一队</option>
			<option value="掘二队">掘二队</option>
			<option value="掘三队">掘三队</option>
			<option value="掘四队">掘四队</option>
			<option value="掘五队">掘五队</option>
			<option value="掘六队">掘六队</option>
		</select>
	</div>
    <div id="main" style="height:500px;border:1px solid #ccc;padding:10px;background-color: black"></div>
    
    <script type="text/javascript">

	function getKindData(){
		var month = $("#month").val();
		var group = $("#group").val();
    	$.ajax( {
			type : 'post',
			url : '${ctx}/coalzt/coalztAction!getKindData',
			data : 'coalzt.month=' + month + '&coalzt.group_type=' + group,
			success : function(data) {
				 require.config({
				        paths:{ 
				            echarts:'./js/echarts',
				            'echarts/chart/bar' : './js/echarts',
				            'echarts/chart/line': './js/echarts',
				            'echarts/chart/pie': './js/echarts'
				        }
				    });
				    
				    // Step:4 require echarts and use it in the callback.
				    // Step:4 动态加载echarts然后在回调函数中开始使用，注意保持按需加载结构定义图表路径
				    require(
				        [
				            'echarts',
				            'echarts/chart/bar',
				            'echarts/chart/line',
				            'echarts/chart/pie'
				        ],
				        function(ec) {
				            var myChart = ec.init(document.getElementById('main'));
				            var option = {
				            	    title : {
				                text: '品种煤统计图',
				                subtext: '2013',
				                x:'center',
				                textStyle:{
					                	fontSize: 22, 
					                	fontWeight: 'bolder', 
					                	color: 'white'
					                	}
				            },
				            tooltip : {
				                trigger: 'item',
				                formatter: "{a} <br/>{b} : {c} ({d}%)"
				            },
				            legend: {
				                orient : 'vertical',
				                x : 'left',
				                data:['精煤①','精煤②','块碳','末碳'],
				                textStyle:{
				            	fontSize: 14, 
			                	fontWeight: 'bolder', 
			                	color: 'white'
				                }
				            },
				            toolbox: {
				                show : true,
				                backgroundColor:'white',
				                feature : {
				                    mark : true,
				                    dataView : {readOnly: false},
				                    restore : true,
				                    saveAsImage : true
				                }
				            },
				            calculable : true,
				            series : [
				                {
				                    name:'所占比例',
				                    type:'pie',
				                    radius : [0,150],
				                    center: [,225],
				                    data:[
				                        {value:data[0], name:'精煤①'},
				                        {value:data[1], name:'精煤②'},
				                        {value:data[2], name:'块碳'},
				                        {value:data[3], name:'末碳'}
				                    ]
				                }
				            ]
				        };
				 
				            myChart.setOption(option);
				        }
				    );
			}
		});	    	
    }
    // Step:3 conifg ECharts's path, link to echarts.js from current page.
    // Step:3 为模块加载器配置echarts的路径，从当前页面链接到echarts.js，定义所需图表路径
   
    $(function () {
		getKindData();
    });
    </script>
</body>
</html>