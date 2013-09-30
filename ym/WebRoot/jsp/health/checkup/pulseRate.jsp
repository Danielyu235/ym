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
	
	 var pulse_rate =new Array();
	 var pulse_rate2 =new Array();
	 var date=new Array();
	  var pulse_rate1 =new Array();
	
	 $.ajax({
		url:'${ctx}/checkUp/checkUpAction!getByPid',
		async:false,
		data:'checkUp.pid=<%=id%>',
		success:function(data){
	
		var ob=eval(data);
		for(var i=0;i<ob.length;i++){
			pulse_rate[i]=	parseInt(ob[i].pulseRate);
			
			date[i]=ob[i].date;
			pulse_rate1[i]=60;
			pulse_rate2[i]=110;
			
			
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
						text: '脉率趋势图',
						x: -20 //center
					},
					
					xAxis: {
						categories: date,
						
					},
					yAxis: {
						title: {
							text: '脉率(bpm)'
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
						name: '脉率上限',
						data: pulse_rate2
					}, {
						name: '脉率',
						data: pulse_rate
					}, {
						name: '脉率下限',
						data: pulse_rate1
					}]
				});
				
				
			});
	  
</script>
  </head>
  
  <body>
 
    <div id="container" style="width: 800px; height: 400px; margin: 0 auto"></div>
		
  </body>
</html>
