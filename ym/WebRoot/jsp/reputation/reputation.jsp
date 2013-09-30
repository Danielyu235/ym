<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>职工信誉评价</title>
	<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
	<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
	<script src="../../Highcharts-3.0.1/js/highcharts.js"></script>
	<script src="../../Highcharts-3.0.1/js/modules/exporting.js"></script>
	<%
		String departmentf =request.getParameter("departmentf");
		String departments =request.getParameter("departments");
		String eid = request.getParameter("eid");
		if(departmentf == null){
			departmentf ="";
		}
		if(departments == null){
			departments ="";
		}
		if(eid == null){
			eid ="";
		}
	 %>
	 <style type="text/css">
	 a{ 
text-decoration:none; 
} 
	 </style>
	<script type="text/javascript">
		//加载表单操作列
		function gridFormatter(value, rowData, rowIndex) {
			var rowId = rowData.id;
			var url = "";
			url += "<a title=\"统计图\" href='${ctx}/Highcharts-3.0.1/examples/line-basic/index.htm' class='btn2' onclick='openHistoryWindow(\""+rowData.employeeId+"\",\""+rowData.ename+"\")'><img src=\"${ctx}/images/tree.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
			return url;
		}
		function gridFormatterForAch(value, rowData, rowIndex){			
			var str = "<a href=\"#\" onclick='openCharts(\""+rowData.employeeId+"\",\""+rowData.date+"\")'>" + value + "</a>";
			return str;
		}
		function formatterDepartment(value, rowData, rowIndex){
			var str = rowData.departmentf + " - " + rowData.departments;
			return str;
		}
		function openCharts(id,date){
			$.ajax({
        		type:'post',
        		url:'${ctx}/reputation/reputationAction!getScopeList.action',
        		data:'reputation.employeeId='+id+'&reputation.date='+date,
        		success:function(data){
        			 var chart;
        			 var dataX=eval("(['人员安全教育考核','人员职业健康','日常三违处罚','人员日常状况','人员日常考勤与奖罚'])");
        			 var datas=eval(data);
        			 //var datas=eval("([818,14,6,1,1011])");
        			 chart = new Highcharts.Chart({
        					chart: {
        		                renderTo: 'container',
        		                type: 'column'
        		            },
        					plotOptions: {
        						column: {
        							pointPadding: 0.2,
        		                    borderWidth: 0,
        							allowPointSelect: true,
        							cursor: 'pointer',
        							point: {
        								events: {
        									click: function(e) {
												var viewName = this.category;
												var index;
												if(viewName == '人员安全教育考核'){
													index = 1;  		    
												}else if(viewName == '人员职业健康'){
													index = 2;  
												}else if(viewName == '日常三违处罚'){
													index = 3; 
												}else if(viewName == '人员日常状况'){
													index = 4;
												}else if(viewName == '人员日常考勤与奖罚'){
													index = 5;
												}
												$('#cm').tabs('select', index);  
        		            					//alert (this.series.name+'Category: '+ this.category +', value: '+ this.y);
        										//window.location="queryqyList.jsp?hylb_text="+this.category;
        										//window.open('queryqyList.jsp?hylb_text='+this.category, 'newwindow', 'height=564, width=1108, top=140, left=81, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
        									}
        								}
        							}
        						}
        					},
        		            title: {
        		                text: ''
        		            },
        		            subtitle: {
        		                text: ''
        		            },
        		            xAxis: {
        		                categories: dataX
        		            },
        		            yAxis: {
        		                min: 0,
        		                title: {
        		                    text: '分数'
        		                }
        		            },
        		            legend: {
        		                layout: 'vertical',
        		                backgroundColor: '#FFFFFF',
        		                align: 'left',
        		                verticalAlign: 'top',
        		                x: 100,
        		                y: 70,
        		                floating: true,
        		                shadow: true
        		            },
        		            tooltip: {
        		                formatter: function() {
        		                    return ''+
        		                        this.x +': '+ this.y +' 分';
        		                }
        		            },		            
        	                series: [{
        	                name: '分数',
        	                data: datas
        	                }]
        		        });
        			$('#cm').tabs('select', 0);
        		    $('#view').window('open');
        		    $('#cm001').attr('src','safety.jsp?employeeId='+id+'&date='+date); 	    
        		    $('#cm002').attr('src','healthsalf.jsp?employeeId='+id+'&date='+date);        		   
        		    $('#cm003').attr('src','punish.jsp?employeeId='+id+'&date='+date);
        		    $('#cm004').attr('src','situation.jsp?employeeId='+id+'&date='+date);
        		    $('#cm005').attr('src','attendreward.jsp?employeeId='+id+'&date='+date);
        		}
        	});
			
		}

		function openHistoryWindow(id,ename){
			$.ajax({
        		type:'post',
        		url:'${ctx}/reputation/reputationAction!getHistoryScopeList.action',
        		data:'reputation.employeeId='+id,
        		success:function(data){     

				var scopeArr = '([';
        		var monthArr = '([';
        		if(data != null && data.length > 0){
					for(var i = 0; i < data.length; i++){
						scopeArr += data[i].scope + ',';
						monthArr += '"'+data[i].month + '",';
					}
					scopeArr = scopeArr.substring(0,scopeArr.length-1);
					monthArr = monthArr.substring(0,monthArr.length-1);
					scopeArr += '])';
					monthArr += '])';
					scopeArr = eval(scopeArr);
					monthArr = eval(monthArr);
        			onloadHistory(scopeArr,monthArr,ename);
        			$('#history').window('open');
					
        		}
            		    		
        		}
			});
		}

		function onloadHistory(scopeArr,monthArr,ename){
			$('#container_h').highcharts({
	            chart: {
	                type: 'line',
	                marginRight: 130,
	                marginBottom: 25
	            },
	            title: {
	                text: '职工信誉评价历史记录统计分析图',
	                x: -20 //center
	            },
	            xAxis: {
	                categories: monthArr
	            },
	            yAxis: {
	                title: {
	                    text: '成绩（分）'
	                },
	                plotLines: [{
	                    value: 0,
	                    width: 1,
	                    color: '#808080'
	                }]
	            },
	            tooltip: {
	                valueSuffix: '（分）'
	            },
	            legend: {
	                layout: 'vertical',
	                align: 'left',
	                x: 120,
	                verticalAlign: 'top',
	                y: 80,
	                floating: true,
	                backgroundColor: '#FFFFFF'
	            },
	            series: [{
	                name: ename,
	                data: scopeArr
	            }]
	        });				
		}

		function advancedsearch(){
			var advancedsearch = $('#advancedsearch');
			advancedsearch.window('open');
		}
		
		$(document).ready(function (){	
			onloadCombobox('${ctx}','zy',$('#major'),$('#post'),null);
			var gridSrc = '${ctx}/reputation/reputationAction!list?reputation.departmentf=<%=departmentf%>&reputation.departments=<%=departments%>';
			var id = $('#eid').val();
			if(id != ''){
				gridSrc += '&reputation.eid='+id;	
			}
	 		grid = new Grid(gridSrc, 'data_list');
			grid.loadGrid();
			crud = new Crud({
				grid:grid, 
				addFormObject:$('#addForm'), 
				searchFormObject:$('#searchForm'),
				entityName:'reputation',
				moduleName:'职工信誉评价',
				url:'${ctx}/reputation/reputationAction',
				afterViewLoadData:function(viewFormObject, data) {
					//$(viewFormObject).find('span[name="aThreeAntiSysTheme.areaId"]').text(data.areaName);
				}
			});
			$('#advancedsearch').window({
		       onBeforeClose:function(){ 
		           crud.params.searchFormObject = $('#searchForm');
		       }
		    });
		});
		//打开高级查询窗口
		function advancedsearch(){
			$('#advancedsearch').window('open');
			crud.params.searchFormObject = $('#advanced');
		}
		//执行高级查询
		function submitSearchForm(){
			crud.search();
			crud.clearSearch();
			$('#advancedsearch').window('close');
			crud.params.searchFormObject = $('#searchForm');
		} 
	</script>
</head>
<body>
	<div class="panel-header" style="width:100%;">
		<div class="panel-title panel-with-icon">职工信誉评价</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
	 	<div>
        	<form id="searchForm" method="post" style="display: inline;">
	            <div style="margin-top:-8px;">	
	            	<input type="text" name="reputation.eid" id="eid" value="<%=eid %>" style="display:none">            	
					&nbsp;&nbsp;员工工号:&nbsp;&nbsp;<input type="text" name="reputation.jobnum" id="employee.jobnum"/>
					&nbsp;&nbsp;员工姓名:&nbsp;&nbsp;<input type="text" name="reputation.ename" id="employee.ename"/>&nbsp;&nbsp;
					<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search()">查询</a>&nbsp;&nbsp;
					<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="advancedsearch()">高级查询</a>&nbsp;&nbsp;
					<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch();">清空</a>
	            </div>
        	</form>
    	</div>
    </div>
	<!-- 表单表头 -->
	<div style="height:74%;">
	    <table id="data_list" style="display:none">
	        <thead>
		        <tr>
		            <th field="jobnum" width="100" align="center" title="jobnum">员工工号</th>
		            <th field="ename" width="100" align="center" title="ename">员工姓名</th>
		            <th field="major" width="120" align="center" title="major">专业</th>
		            <th field="post" width="120" align="center" title="post">所在岗位</th>
		            <th field="department" width="150" align="center" title="department" formatter="formatterDepartment">所属部门</th>
		            <th field="date" width="100" align="center" title="date">考核月份(月)</th>
		            <th field="achievement" width="100" align="center" title="achievement" formatter="gridFormatterForAch">员工信誉成绩</th>
		            <th field="id" width="100" formatter="gridFormatter" align="center">历史记录</th>  
		        </tr>
	        </thead>
	    </table>
	</div>
	
	<!-- 弹出层（统计图） -->
	<div id="view" class="easyui-window" style="width: auto; height: auto;" title="详细信息"
		data-options="modal:true,closed:true,minimizable:false,maximizable:false,resizable:false" >
		<div id="cm" class="easyui-tabs" style="width:900px;height:520px">
			<div title="统计图" style="padding:10px">
				<div id="container" style="width: 800px; height: 400px; margin: 30 auto"></div>
			</div>		
			<div title="人员安全教育考核" style="padding:10px">
				<iframe id="cm001" frameborder="0" style="width:100%;height:100%;"></iframe>
			</div>
			<div title="人员职业健康" style="padding:10px">
				<iframe id="cm002" frameborder="0" style="width:100%;height:100%;"></iframe>
			</div>
			<div title="日常三违处罚" style="padding:10px">
				<iframe id="cm003" frameborder="0" style="width:100%;height:100%;"></iframe>
			</div>
			<div title="人员日常状况" style="padding:10px">
				<iframe id="cm004" frameborder="0" style="width:100%;height:100%;"></iframe>
			</div>
			<div title="人员日常考勤与奖罚" style="padding:10px">
				<iframe id="cm005" frameborder="0" style="width:100%;height:100%;"></iframe>
			</div>
		</div>
	</div>
	
	<div id="history" class="easyui-window" style="width: auto; height: auto;" title="历史记录统计图"
		data-options="modal:true,closed:true,minimizable:false,maximizable:false,resizable:false" >
		<div id="container_h" style="min-width: 800px; height: 400px; margin: 0 auto"></div>	
	</div>	
	
	<!-- 弹出层（高级查询） -->
	<div id="advancedsearch" class="easyui-window" style="width: 360px; height: 280px" title="高级查询"
		data-options="modal:true,closed:true,minimizable:false,maximizable:false,resizable:false" align="center">
		<form id="advanced">
			<table style="border:0;padding:5px;width:auto">
				<tr>
					<td style="width:100px">
						<label>员工工号：</label>
					</td>
					<td>
						<input type="text" name="reputation.employeeId" style="width:150px">
					</td>
				</tr>
				<tr>
					<td>
						<label>员工姓名：</label>
					</td>
					<td >
						<input type="text" name="reputation.ename" style="width:150px">
					</td>
				</tr>
				<tr>
					<td>
						<label>身份证号：</label>
					</td>
					<td >
						<input type="text" name="reputation.idNumber" style="width:150px">
					</td>
				</tr>
				<tr>
					<td>
						<label>专业：</label>
					</td>
					<td>
						<input class="easyui-combobox" name="reputation.major" id="major" data-options="panelHeight:'auto',editable:false,valueField: 'label',textField: 'value'" style="width:150px"/>
					</td>
				</tr>
				<tr>
					<td>
						<label>岗位：</label>
					</td>
					<td>
						<input class="easyui-combobox" name="reputation.post" id="post" data-options="panelHeight:'auto',editable:false,valueField: 'label',textField: 'value'" style="width:150px"/>
					</td>
				</tr>
				<tr>
					<td>
						<label>考核月份：</label>
					</td>
					<td >
						<input type="text" name="reputation.date"  class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM',maxDate:'%y-%M-%d'})" style="width:150px">
					</td>
				</tr>				
				
			</table>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="submitSearchForm()">确 定</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-back" onclick="crud.clearSearch()">清 空</a>
		</form>
	</div>	
</body>
</html>