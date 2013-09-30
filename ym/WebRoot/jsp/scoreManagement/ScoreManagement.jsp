<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>评分管理</title>
	<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>	
</head>
<body style="margin:0 auto">
	<div class="easyui-tabs" style="height:500px;padding:10px">
        <div title="评分比例" style="padding:10px">
        	<div style="width:500px; height:450px;float:left;">
        		<form action="${ctx}/scoreManagement/scoreManagementAction!update.action" method="post" id="myform1">
	            	<table style="padding:5px">
		                <tr>
		                    <td align="right" style="padding:10px">安全教育考核所占比例:</td>
		                    <td>	                    
		                    	<input class="easyui-numberspinner" id="sProportion" name="scoreManagement.sp" 
		                    		style="width:80px;" data-options="min:0,max:100,editable:false" value="0"></input>&nbsp;%
		                    </td>
		                </tr>
		                <tr>
		                    <td align="right" style="padding:10px">人员职业健康所占比例:</td>
		                    <td>
		                    	<input class="easyui-numberspinner" id="hProportion" name="scoreManagement.hp" 
		                    		style="width:80px;" data-options="min:0,max:100,editable:false" value="0"></input>&nbsp;%	
		                    </td>
		                </tr>
		                 <tr>
		                    <td align="right" style="padding:10px">日常三违处罚所占比例:</td>
		                    <td>
		                    	<input class="easyui-numberspinner" id="pProportion" name="scoreManagement.pp" 
		                    		style="width:80px;" data-options="min:0,max:100,editable:false" value="0"></input>&nbsp;%
		                    </td>
		                </tr>
		                <tr>
		                    <td align="right" style="padding:10px">人员日常状态所占比例:</td>
		                    <td>
		                    	<input class="easyui-numberspinner" id="dProportion" name="scoreManagement.dp" 
		                    		style="width:80px;" data-options="min:0,max:100,editable:false" value="0"></input>&nbsp;%	
		                    </td>
		                </tr>
		                <tr>
		                    <td align="right" style="padding:10px">人员日常考勤与奖罚占分数比例:</td>
		                    <td>
		                    	<input class="easyui-numberspinner" id="rProportion" name="scoreManagement.rp" 
		                    		style="width:80px;" data-options="min:0,max:100,editable:false" value="0"></input>&nbsp;%	
		                    </td>
		                </tr>
		                <tr>
		                	<td align="right" style="padding:10px">&nbsp;</td>
		                    <td>
		                    	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="submitForm1()">保存</a>
		                    	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-back'" onclick="cleanForm()">清空</a>
		                    </td>
		                </tr>
		            </table>	            
	            </form>        	
			</div> 
			<div style="width:500px; height:450px;float:left;">
		        <script src="../../Highcharts-3.0.1/js/highcharts.js"></script>
				<script src="../../Highcharts-3.0.1/js/modules/exporting.js"></script>
				<div id="container" style="min-width: 400px; height: 400px; margin: 0 auto"></div>		
			</div>       	
        </div>
        <div title="分数管理" style="padding:10px">
            <form action="${ctx}/scoreManagement/scoreManagementAction!update.action" method="post" id="myform2">
            	<table style="padding:5px">
            		<tr>
            			<td align="right" style="padding:10px">
            				<label>人员职业健康扣分数:</label>            				
            			</td>
            			<td>
            				<input class="easyui-numberbox" required name="scoreManagement.hs" id="hs"/>
            			</td>
            		</tr>
            		<tr>
            			<td align="right" style="padding:10px">
            				<label>日常三违处罚扣分数:</label>            				
            			</td>
            			<td>
            				<input class="easyui-numberbox" required name="scoreManagement.ps" id="ps"/>
            			</td>
            		</tr>
            		<tr>
            			<td align="right" style="padding:10px">
            				<label>人员日常状态扣分数:</label>            				
            			</td>
            			<td>
            				<input class="easyui-numberbox" required name="scoreManagement.ds" id="ds"/>
            			</td>
            		</tr>
            		<tr>
            			<td align="right" style="padding:10px">
            				<label>人员日常考勤与奖罚-迟到扣分数:</label>            				
            			</td>
            			<td>
            				<input class="easyui-numberbox" required name="scoreManagement.rls" id="rls"/>
            			</td>
            		</tr>
            		<tr>
            			<td align="right" style="padding:10px">
            				<label>人员日常考勤与奖罚-旷工扣分数:</label>            				
            			</td>
            			<td>
            				<input class="easyui-numberbox" required name="scoreManagement.ras" id="ras"/>
            			</td>
            		</tr>
            		<tr>
            			<td align="right" style="padding:10px">
            				<label>人员日常考勤与奖罚-惩罚扣分数:</label>            				
            			</td>
            			<td>
            				<input class="easyui-numberbox" required name="scoreManagement.rps" id="rps"/>
            			</td>
            		</tr>
            		<tr>
            			<td align="right" style="padding:10px">
            				<label>人员日常考勤与奖罚-奖励分数:</label>            				
            			</td>
            			<td>
            				<input class="easyui-numberbox" required name="scoreManagement.rrs" id="rrs"/>
            			</td>
            		</tr>
            		<tr>
            			<td align="right" style="padding:10px">&nbsp;</td>
            			<td><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="submitForm2()">保存</a></td>
            		</tr>
            	</table>
	        </form>  	
        </div>
    </div>
	<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>	
	<script type="text/javascript">
		//清空百分比框
		function cleanForm(){
			$('.easyui-numberspinner').numberspinner('setValue', 0); 
		}
		//验证百分比是否正确
		function validate(){
            var sp = $('#sProportion').numberspinner('getValue'); 
			var hp = $('#hProportion').numberspinner('getValue'); 
			var pp = $('#pProportion').numberspinner('getValue'); 
			var dp = $('#dProportion').numberspinner('getValue'); 
			var rp = $('#rProportion').numberspinner('getValue');
			var scope = parseInt(sp) +  parseInt(hp) + parseInt(pp) + parseInt(dp) + parseInt(rp);
			if(scope != 100){
				return false;			
			}else{
				return true;
			}
        }
        //提交表单
        function submitForm1(){
        	if(!validate()){
        		$.messager.alert('警告','分数的百分比不正确!');
        	}else{
        		$('#myform1').submit();	
        	}        	
        }	
        //提交表单
        function submitForm2(){ 
        	$('#myform2').submit();        	       	
        }
        //获取百分比
        function getDate(){
        	$.ajax({
        		type:'post',
        		url:'${ctx}/scoreManagement/scoreManagementAction!getDate.action',
        		success:function(date){
        			if(date != null){
     					setDate(date);   
     					onloadImg(date);     					
        			}
        		}
        	});
        }
        function getDateAgain(){
        	$.ajax({
        		type:'post',
        		url:'${ctx}/scoreManagement/scoreManagementAction!getDate.action',
        		success:function(date){
        			if(date != null){
     					var d = [
	                    ['安全教育考核',   parseInt(date.sp)],
	                    ['人员职业健康',   parseInt(date.hp)],
	                    ['日常三违处罚', parseInt(date.pp)],
	                    ['人员日常状态', parseInt(date.dp)],
	                    ['人员日常考勤与奖罚', parseInt(date.rp)]
	                ];
     					chart1.series[0].setData(d); 
        			}
        		}
        	});
        }
        
        
        //设置百分比
        function setDate(date){
			$('#sProportion').numberspinner('setValue', date.sp); 
			$('#hProportion').numberspinner('setValue', date.hp); 
			$('#pProportion').numberspinner('setValue', date.pp); 
			$('#dProportion').numberspinner('setValue', date.dp); 
			$('#rProportion').numberspinner('setValue', date.rp);
			
			$('#hs').numberbox('setValue', date.hs);
			$('#ps').numberbox('setValue', date.ps);
			$('#ds').numberbox('setValue', date.ds);
			$('#rls').numberbox('setValue', date.rls);
			$('#ras').numberbox('setValue', date.ras);
			$('#rps').numberbox('setValue', date.rps);
			$('#rrs').numberbox('setValue', date.rrs);
		}	
		//加载统计图	
		function onloadImg(date){
			chart1 = new Highcharts.Chart({
	            chart: {
	            	renderTo:'container',
	                plotBackgroundColor: null,
	                plotBorderWidth: null,
	                plotShadow: false
	            },
	            title: {
	                text: '评分比例'
	            },
	            tooltip: {
	        	    //pointFormat: '{series.name}: <b>{point.percentage}%</b>',
	            	percentageDecimals: 1,
	            	formatter:function(){
                    return'<b>'+this.point.name+'</b>: '+Math.round(this.percentage)+' %';
                	}
	            },
	            plotOptions: {
	                pie: {
	                    allowPointSelect: true,
	                    cursor: 'pointer',
	                    dataLabels: {
	                        enabled: true,
	                        color: '#000000',
	                        connectorColor: '#000000',
	                        formatter: function() {
	                            return '<b>'+ this.point.name +'</b>: '+ Math.round(this.percentage) +' %';
	                        }
	                    }
	                }
	            }, 
	            series: [{
	                type: 'pie',
	                name: '所占比例',
	                data: [
	                    ['安全教育考核',   parseInt(date.sp)],
	                    ['人员职业健康',   parseInt(date.hp)],
	                    ['日常三违处罚', parseInt(date.pp)],
	                    ['人员日常状态', parseInt(date.dp)],
	                    ['人员日常考勤与奖罚', parseInt(date.rp)]
	                ]
	            }]
	        });
		}	
        window.onload=function(){
        	getDate(); 
        	$(function(){
	            $('#myform1').form({
	                success:function(data1){
	                	$.messager.alert('成功','修改评分比例成功!');
	                	getDateAgain();
	                }
	          	});
	          	$('#myform2').form({
	                success:function(data2){
	                	$.messager.alert('成功','修改分数成功!');
	                }
	          	});
        	});
        }      
  	</script>	
</body>
</html>