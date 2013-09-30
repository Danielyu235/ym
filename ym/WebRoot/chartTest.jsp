<%@ page contentType="text/html;charset=GBK"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.shiro.session.Session"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ay.jfreeChart.service.ChartGenerater"%>
<%@page import="java.io.PrintWriter"%>
<HTML>
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=GBK">
<TITLE>chartTest</TITLE>
</HEAD>
<BODY>
<% 
	List list=(ArrayList)session.getAttribute("datalist"); 
	String filename = ChartGenerater.generatePieChart(list,"信息发布结果统计",session, new PrintWriter(out),"","","piechart"); 
	System.out.println("filename:"+filename);
	String graphURL = request.getContextPath() + "/DisplayChart?filename=" + filename; 
	System.out.println("11111111111111111111:"+graphURL);
%> 
<table ALIGN="CENTER"> 
  <tr> 
  <td>   
<img src="<%= graphURL %>" width=500 height=300 border=0 usemap="#<%=filename %>">   
</td> 
</tr> 
</table> 
</BODY>
</HTML>