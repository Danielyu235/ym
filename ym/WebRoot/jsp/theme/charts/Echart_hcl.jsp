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
		<label for="type">统计方式：</label>
		<select onchange="change()" id="type">
			<option value="001">年度统计</option>
			<option value="002">月度统计</option>
		</select>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<span id="span_month">
			<label for="month">月份：</label>
			<select id="month" onchange="change()">
				<option value="2013-09" selected="selected">2013-09</option>
				<option value="2013-08">2013-08</option>
				<option value="2013-07">2013-07</option>
			</select>			
		</span>
	</div>
    <div id="main" style="height:500px;border:1px solid #ccc;padding:10px;background-color: black"></div>
    
    <script type="text/javascript">
	function change(){
		var type = $("#type").val();
		if(type == "001"){
			yearType();
			$("#span_month").hide();
		}else if(type == "002"){
			monthType();
			$("#span_month").show();
		}
	}
    function yearType(){
    	$.ajax( {
			type : 'post',
			url : '${ctx}/coalzt/coalztAction!getYearData',
			data : 'coalzt.month=2013',
			success : function(data) {
				showYear(data);
			}
		});	    	
    }
    function showYear(data){
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
		                text: '回采率统计图',
		                subtext: '年统计图',
		                textStyle:{
		                	fontSize: 22, 
		                	fontWeight: 'bolder', 
		                	color: 'white'
		                	}
		            },
		            tooltip : {
		                trigger: 'axis'
		            },
		            legend: {
		                data:['综采一队','综采二队','综采三队','综采四队'],
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
		                    magicType:['line', 'bar'],
		                    restore : true,
		                    saveAsImage : true
		                }
		            },
		            calculable : true,
		            xAxis : [
		                {
		                    type : 'category',
		                    data : data[4]
		                }
		            ],
		            yAxis : [
		                {
		                    type : 'value',
		                    splitArea : {show : true}
		                }
		            ],
		            series : [
							{
							    name: '综采一队',
							    data: data[0],
							    type:'bar'
							}, {
							    name: '综采二队',
							    data: data[1],
							    type:'bar'
							}, {
							    name: '综采三队',
							    data: data[2],
							    type:'bar'
							}, {
							    name: '综采四队',
							    data: data[3],
							    type:'bar'
							}
		            ]
		        };
		 
		            myChart.setOption(option);
		        }
		    );
        }

   
  	    $(function () {
	    	$("#span_month").hide();
	    	yearType();
	    });
    </script>
</body>
</html>