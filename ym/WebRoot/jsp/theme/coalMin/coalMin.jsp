<%@ page language="java" import="java.util.*,com.ay.calendar.pojo.Zbpb" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/jqueryhead.jsp"%>
<%
	String month = request.getParameter("month");
	String year = request.getParameter("year");

		Zbpb zbpb=new Zbpb();
%>
<html>
	<head>
<meta http-equiv="content-type" content="text/html; charset=gb2312">
<title>煤产量报表</title>
<style type="text/css">
.day{background:#f8f8f8; font-size:24px; font-family:Arial, Helvetica, sans-serif; color:#000000;}
.name{ color:#E63F00; font-size:12px; font-family:"宋体";}
th{background:#e3e3e3; width:120px; height:24px; font-size:14px;}
.name1{ color:#009FCC; font-size:12px; font-family:"宋体";}
th{background:#e3e3e3; width:120px; height:24px; font-size:14px;}
</style>
<script language="javascript"> 
function f(value){
   var sel=document.getElementById("year");
   if(sel!=null){
	   sel.innerHTML='';
	   var cyear;
	   if(value==null){
		  var now=new Date();
		  cyear=now.getYear();
	   }else{
		  cyear=value;
	   }
	   for(var i=0;i<=20;i++){
		  var op=new Option();
		  op.value=parseInt(cyear)-(10-i);
		  op.text=parseInt(cyear)-(10-i)+"年";
		  sel.options.add(op);  
	   }
	   sel.selectedIndex=10;
   }
}
 function  mon(value){
     var month=document.getElementById("month");
	   if(month!=null){
	   month.innerHTML='';
	   var cmonth;
	   if(value==null){
		var now=new Date();
		cmonth=now.getMonth();
		cmonth=cmonth+1;
	 }else{
		cmonth=value;
	 }
   
	 for(var i=0;i<=11;i++){
		var op=new Option();
		op.value=i+1;
		op.text=i+1+"月";
	 month.options.add(op);  
	 if(parseInt(cmonth)-1 ==  i){  //实现当前月份的选中效果
	   op.selected="selected";
	 } 
   }
  }
 }
</script>
	</head>
	<%!String days[];%>
	<%
		days = new String[42];
		for (int i = 0; i < 42; i++)
		{
			days[i] = "";
		}
	%>
<%
		Calendar thismonth = Calendar.getInstance();
		if (month != null && (!month.equals("null")))
			thismonth.set(Calendar.MONTH, Integer.parseInt(month)-1);
		if (year != null && (!year.equals("null")))
			thismonth.set(Calendar.YEAR, Integer.parseInt(year));
			year = String.valueOf(thismonth.get(Calendar.YEAR));
			month = String.valueOf(thismonth.get(Calendar.MONTH));
			thismonth.setFirstDayOfWeek(Calendar.SUNDAY);
			thismonth.set(Calendar.DAY_OF_MONTH, 1);
			int firstindex = thismonth.get(Calendar.DAY_OF_WEEK) - 1;
			int maxindex = thismonth.getActualMaximum(Calendar.DAY_OF_MONTH);
		for (int i = 0; i < maxindex; i++)
		{
			days[firstindex + i] = String.valueOf(i + 1);
		}
	%>
	<body onLoad="f(<%=year%>)">
		<div align='center'>
		<form name="sm" method="post" action="coalMin.jsp">
			<table border="0" width="300" height="20">
				<tr>
					<td>
						<select id="year" name='year'  size="1"></select>
						<!-- select id="month" name='month'  size="1"></select> -->
						<a href="javascript:sm.submit();">查询</a>
					</td>
				</tr>
			</table>
			<table width="98%" style="border: 1px solid #adc5cf;" border="1" height="500" >
				<div align=center>
					<tr>
					<th width="140">
								<font color="gray" size="1px">队组\月份</font>
						</th>
						<th width="140">
								<font color="gray" size="1px">（计）</font>一月<font color="gray" size="1px">（实）</font>
						</th>
						<th width="140">
							<font color="gray" size="1px">（计）</font>二月<font color="gray" size="1px">（实）</font>
						</th>
						<th width="140">
							<font color="gray" size="1px">（计）</font>三月<font color="gray" size="1px">（实）</font>
						</th>
						<th width="140">
							<font color="gray" size="1px">（计）</font>四月<font color="gray" size="1px">（实）</font>
						</th>
						<th width="140">
							<font color="gray" size="1px">（计）</font>五月<font color="gray" size="1px">（实）</font>
						</th>
						<th width="140">
							<font color="gray" size="1px">（计）</font>六月<font color="gray" size="1px">（实）</font>
						</th>
						<th width="140">
								<font color="gray" size="1px">（计）</font>七月<font color="gray" size="1px">（实）</font>
						</th>
						<th width="140">
								<font color="gray" size="1px">（计）</font>八月<font color="gray" size="1px">（实）</font>
						</th>
						<th width="140">
								<font color="gray" size="1px">（计）</font>九月<font color="gray" size="1px">（实）</font>
						</th>
						<th width="140">
								<font color="gray" size="1px">（计）</font>十月<font color="gray" size="1px">（实）</font>
						</th>
						<th width="140">
								<font color="gray" size="1px">（计）</font>十一月<font color="gray" size="1px">（实）</font>
						</th>
						<th width="140">
								<font color="gray" size="1px">（计）</font>十二月<font color="gray" size="1px">（实）</font>
						</th>
					</tr>
					<%
							List<String[]> group = zbpb.getGroup();
							for (int f = 0; f <group.size(); f++){
							%>
							<tr>
								<td height="16" bgcolor="#f8f8f8" valign="middle" align="center" style="font-size: 12px;"><font color="gray" size="1px"><%=group.get(f)[0]%></font></td>
							<%
							
								for (int i = 1; i <= 12; i++) {
									List<String[]> ldAndzby=zbpb.getCoalOutPut(year,i+"",group.get(f)[0]);
									if(ldAndzby.size()==0){
									%>
									<td  height="16" bgcolor="#f8f8f8" valign="middle" align="center" style="font-size: 12px">0</td>
									<%
									}else{
									for(int j = 0; j <ldAndzby.size(); j++){
							%>
						
							<%
								if(i == 1 && ldAndzby.size()>0 ){
								%>
								<td  height="16" bgcolor="#f8f8f8" valign="middle" align="center" style="font-size: 12px"><a href="#" title="查看日产量" onclick="locationCalendar('<%=year %>','<%=i %>','<%=ldAndzby.get(j)[0] %>')"><%=ldAndzby.get(j)[3] %>&nbsp;&nbsp;<%=ldAndzby.get(j)[4] %></a></td>
								<%
								}
								if(i == 2 && ldAndzby.size()>0 ){
								%>
								<td  height="16" bgcolor="#f8f8f8" valign="middle" align="center" style="font-size: 12px"><a href="#" title="查看日产量" onclick="locationCalendar('<%=year %>','<%=i %>','<%=ldAndzby.get(j)[0] %>')"><%=ldAndzby.get(j)[3] %>&nbsp;&nbsp;<%=ldAndzby.get(j)[4] %></a></td>
								<%
								}
								if(i == 3 && ldAndzby.size()>0 ){
								%>
								<td  height="16" bgcolor="#f8f8f8" valign="middle" align="center" style="font-size: 12px"><a href="#" title="查看日产量" onclick="locationCalendar('<%=year %>','<%=i %>','<%=ldAndzby.get(j)[0] %>')"><%=ldAndzby.get(j)[3] %>&nbsp;&nbsp;<%=ldAndzby.get(j)[4] %></a></td>
							<%
								}
								if(i == 4 && ldAndzby.size()>0 ){
								%>
								<td  height="16" bgcolor="#f8f8f8" valign="middle" align="center" style="font-size: 12px"><a href="#" title="查看日产量" onclick="locationCalendar('<%=year %>','<%=i %>','<%=ldAndzby.get(j)[0] %>' )"><%=ldAndzby.get(j)[3] %>&nbsp;&nbsp;<%=ldAndzby.get(j)[4] %></a></td>
								<%
								}
							 %>
							 <%
								if(i == 5 && ldAndzby.size()>0 ){
								%>
								<td  height="16" bgcolor="#f8f8f8" valign="middle" align="center" style="font-size: 12px"><a href="#" title="查看日产量" onclick="locationCalendar('<%=year %>','<%=i %>','<%=ldAndzby.get(j)[0] %>' )"><%=ldAndzby.get(j)[3] %>&nbsp;&nbsp;<%=ldAndzby.get(j)[4] %></a></td>
							<%
								}
								if(i == 6 && ldAndzby.size()>0 ){
								%>
								<td  height="16" bgcolor="#f8f8f8" valign="middle" align="center" style="font-size: 12px"><a href="#" title="查看日产量" onclick="locationCalendar('<%=year %>','<%=i %>','<%=ldAndzby.get(j)[0] %>' )"><%=ldAndzby.get(j)[3] %>&nbsp;&nbsp;<%=ldAndzby.get(j)[4] %></a></td>
							<%
								}
							 %>
							 <%
								if(i == 7 && ldAndzby.size()>0 ){
								%>
								<td  height="16" bgcolor="#f8f8f8" valign="middle" align="center" style="font-size: 12px"><a href="#" title="查看日产量" onclick="locationCalendar('<%=year %>','<%=i %>','<%=ldAndzby.get(j)[0] %>')"><%=ldAndzby.get(j)[3] %>&nbsp;&nbsp;<%=ldAndzby.get(j)[4] %></a></td>
							<%
								}
								if(i == 8 && ldAndzby.size()>0 ){
								%>
								<td  height="16" bgcolor="#f8f8f8" valign="middle" align="center" style="font-size: 12px"><a href="#" title="查看日产量" onclick="locationCalendar('<%=year %>','<%=i %>','<%=ldAndzby.get(j)[0] %>')"><%=ldAndzby.get(j)[3] %>&nbsp;&nbsp;<%=ldAndzby.get(j)[4] %></a></td>
							<%
								}
								if(i == 9 && ldAndzby.size()>0 ){
								%>
								<td  height="16" bgcolor="#f8f8f8" valign="middle" align="center" style="font-size: 12px"><a href="#" title="查看日产量" onclick="locationCalendar('<%=year %>','<%=i %>','<%=ldAndzby.get(j)[0] %>')"><%=ldAndzby.get(j)[3] %>&nbsp;&nbsp;<%=ldAndzby.get(j)[4] %></a></td>
							<%
								}
								if(i == 10 && ldAndzby.size()>0 ){
								%>
								<td  height="16" bgcolor="#f8f8f8" valign="middle" align="center" style="font-size: 12px"><a href="#" title="查看日产量" onclick="locationCalendar('<%=year %>','<%=i %>','<%=ldAndzby.get(j)[0] %>')"><%=ldAndzby.get(j)[3] %>&nbsp;&nbsp;<%=ldAndzby.get(j)[4] %></a></td>
							<%
								}
								if(i == 11 && ldAndzby.size()>0 ){
								%>
								<td  height="16" bgcolor="#f8f8f8" valign="middle" align="center" style="font-size: 12px"><a href="#" title="查看日产量" onclick="locationCalendar('<%=year %>','<%=i %>','<%=ldAndzby.get(j)[0] %>')"><%=ldAndzby.get(j)[3] %>&nbsp;&nbsp;<%=ldAndzby.get(j)[4] %></a></td>
							<%
								}
								if(i == 12 && ldAndzby.size()>0 ){
								%>
								<td  height="16" bgcolor="#f8f8f8" valign="middle" align="center" style="font-size: 12px"><a href="#" title="查看日产量" onclick="locationCalendar('<%=year %>','<%=i %>','<%=ldAndzby.get(j)[0] %>')"><%=ldAndzby.get(j)[3] %>&nbsp;&nbsp;<%=ldAndzby.get(j)[4] %></a></td>
							<%
								}
								}
							}
						}
						%>
							</tr>
							<%
							}
						%>
				</div>
			</table>
		</form>
		</div>
<script language="javascript">	
	function locationCalendar(year,month,group){
		window.location.href='${ctx}/jsp/theme/coalMin/calendar.jsp?year='+year+'&month='+month+'&group='+group;
	}
</script>
	</body>
</html>
