<%@ page language="java" import="java.util.*,com.ay.calendar.pojo.Zbpb" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/jqueryhead.jsp"%>
<%
	String month = request.getParameter("month");
	String year = request.getParameter("year");
	String group = request.getParameter("group");
		Zbpb zbpb=new Zbpb();
%>
<html>
	<head>
<meta http-equiv="content-type" content="text/html; charset=gb2312">
<title>值班排班统计图</title>
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
	<body onLoad="f(<%=year%>),mon(<%=Integer.parseInt(month)+1%>)">
		<div align='center'>
		<form name="sm" method="post" action="calendar.jsp?group=<%=group %>">
			<table border="0" width="300" height="20">
				<tr>
					<td>
						<select id="year" name='year'  size="1"></select>
						<select id="month" name='month'  size="1"></select>
						
						<a href="javascript:sm.submit();">查询</a>
					</td>
				</tr>
			</table>
			<table style="border: 1px solid #adc5cf;" border="1" width="1200" height="500" >
				<div align=center>
					<tr>
						<th width="150">
							<font color="red">
								<font color="gray" size="1px">（计）</font>星期日<font color="gray" size="1px">（实）</font>
							</font>
						</th>
						<th width="150">
							<font color="gray" size="1px">（计）</font>星期一<font color="gray" size="1px">（实）</font>
						</th>
						<th width="150">
							<font color="gray" size="1px">（计）</font>星期二<font color="gray" size="1px">（实）</font>
						</th>
						<th width="150">
							<font color="gray" size="1px">（计）</font>星期三<font color="gray" size="1px">（实）</font>
						</th>
						<th width="150">
							<font color="gray" size="1px">（计）</font>星期四<font color="gray" size="1px">（实）</font>
						</th>
						<th width="150">
							<font color="gray" size="1px">（计）</font>星期五<font color="gray" size="1px">（实）</font>
						</th>
						<th width="150">
							<font color="red">
								<font color="gray" size="1px">（计）</font>星期六<font color="gray" size="1px">（实）</font>
							</font>
						</th>
					</tr>
					<%
						for (int j = 0; j < 6; j++) {
							if(j==5&&(days[j*7]==null||"".equals(days[j*7]))){
										break;	
							}
					%>
					<tr>
						<%
							for (int i = j * 7; i < (j + 1) * 7; i++) {
							String [] ldAndzby=zbpb.getResult(group,year,(Integer.parseInt(month)+1)+"",days[i]);
								if(i==6||i%7==0||(i+1)%7==0){
						%>
							<td width="13%" height="16" bgcolor="#f8f8f8" valign="middle" align="center">
								<table>
									<tr>
									<%
										if( ldAndzby[0].length()>0  && ldAndzby[1].length()>0){
									%>
										<td><font class="name">计划采煤：<%=ldAndzby[0]%></font></td>
										<td rowspan="2"><font class="day" style='color:black;'><%=days[i]%></font></td>
										<td><font class="name">实际采煤：<%=ldAndzby[1]%></font></td>
										<%
										}else{
										 %>
										 <td><font class="name"></font></td>
										<td rowspan="2"><font class="day" style='color:black;'><%=days[i]%></font></td>
										<td><font class="name"></font></td>
										 <%
											}
										 %>
									</tr>
								</table>
							</td>
						<%
								}else{
						%>
								<td width="13%" height="16" bgcolor="#f8f8f8" valign="middle" align="center">
									<table>
										<tr>
											<%
										if( ldAndzby[0].length()>0  && ldAndzby[1].length()>0){
									%>
										<td><font class="name">计划采煤：<%=ldAndzby[0]%></font></td>
										<td rowspan="2"><font class="day" style='color:black;'><%=days[i]%></font></td>
										<td><font class="name">实际采煤：<%=ldAndzby[1]%></font></td>
										<%
										}else{
										 %>
										 <td><font class="name"></font></td>
										<td rowspan="2"><font class="day" style='color:black;'><%=days[i]%></font></td>
										
										 <%
											}
										 %>
										</tr>
									</table>
								</td>
						<%	
								}
							}
							
						%>
					</tr>
					<%
						}
						zbpb.close();
					%>
				</div>
			</table>
		</form>
		</div>
<script language="javascript">	
	
</script>
	</body>
</html>
