<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="gb2312" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    
    
    <title>My JSP 'Bloo.jsp' starting page</title>
    <% 
	String id = request.getParameter("id");

	
 %>
	
	<script type="text/javascript" src="${ctx}/js/Highcharts-2.2.5/highcharts.js"></script>
		
		<!-- 1a) Optional: the exporting module -->
	<script type="text/javascript" src="${ctx}/js/Highcharts-2.2.5/modules/exporting.js"></script>
	<script type="text/javascript">
	
	 var low =new Array();
	 var high =new Array();
	 var date=new Array();
	  var high1 =new Array();
	 var low1=new Array();
	  var high2 =new Array();
	 var low2=new Array();
	 $.ajax({
		url:'${ctx}/checkUp/checkUpAction!getByPid',
		async:false,
		data:'checkUp.pid=<%=id%>',
		success:function(data){
	
		var ob=eval(data);
		for(var i=0;i<ob.length;i++){
			low[i]=	parseInt(ob[i].low);
			high[i]=parseInt(ob[i].high);
			date[i]=ob[i].date;
			low1[i]=60;
			low2[i]=90;
			high1[i]=90;
			high2[i]=140;
			
			}
		}
	 });
	 
	 	var chart;
			$(document).ready(function() {
				chart = new Highcharts.Chart({
					chart: {
						renderTo: 'container',
						defaultSeriesType: 'line',
						marginRight: 130,
						marginBottom: 25
					},
					title: {
						text: '血压趋势图',
						x: -20 //center
					},
					
					xAxis: {
						categories: date,
						
					},
					yAxis: {
						title: {
							text: '血压值(mmHg)'
						},
						plotLines: [{
							value: 0,
							width: 1,
							color: '#808080'
						}],
						min:30,
						
						
					},
					tooltip: {
						formatter: function() {
				                return '<b>'+ this.series.name +'</b><br/>'+
								this.x +': '+ this.y +'mmHg';
						}
					},
					legend: {
						layout: 'vertical',
						align: 'right',
						verticalAlign: 'top',
						x: -10,
						y: 100,
						borderWidth: 0
					},
					series: [{
						name: '高压上限',
						data: high2
					}, {
						name: '高压',
						data: high
					}, {
						name: '高压下限',
						data: high1
					}, {
						name: '低压上限',
						data: low2
					},{
						name: '低压',
						data: low
					},{
						name: '低压下线',
						data: low1
					}]
				});
				
				
			});
	  
</script>
  </head>
  
  <body>
 
    <div id="container" style="width: 800px; height: 400px; margin: 0 auto"></div>
		
  </body>
</html>
