<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>启动应急预案</title>
	<script type="text/javascript" src="${ctx}/js/DataGridUtilCheckbox.js"></script>
	<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
	<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
	<script type="text/javascript">
	var types;
	var sta;//预案类型
	var pid;//预案ID
	var beginTime;//预案启动时间
	types=getArgs();
      $(document).ready(
	 	function (){
	 		var aid=types.aid;//事故id
	 		grid = new Grid('${ctx}/agencies/agenciesAction!list?agencies.accidentId='+aid, 'data_list');
	 		grid.loadGrid();

			crud = new Crud({
				grid:grid, 
				addFormObject:$('#addForm'), 
				searchFormObject:$('#searchForm'),
				entityName:'agencies',
				moduleName:'救援信息反馈',
				url:'${ctx}/agencies/agenciesAction'
			});
			
			// alert("sta"+types.type+"________pid"+types.pid);
			getType();
			getInfo();//获取信息
			getHead();//得到事故和预案的相关信息
			getLevel();//获取响应级别
		 	});
	 	function getType(){
		 	 var   text;
		 	 var   planName;
      		 sta = types.type;//获取传来的预案类型
       		 pid = types.pid;//获取预案Id
       		 beginTime = types.beginTime;
       		 $("#beginTime").html(beginTime);
       		 //alert(pid);
		        if(sta == "1"){
		        	//判断预案类型综合
					src = '${ctx}/energencyPlan/energencyPlanAction!getById?id=' + pid;
		        }
				if(sta == "2"){//专项
					src = '${ctx}/specialPlan/specialPlanAction!getById?id=' + pid;
				}
		        $.ajax({
			        url: src,
			        method:'POST',
			        success:function (data) {
			        //alert(sta);
			        if(sta == "1"){
			        	planName=data.planName;
			        	text = data.planContentZhjgzz;
			        }
					if(sta == "2"){
						planName=data.planName;
						text = data.structureResponsibilities;
					}
					 $("#planName").html(planName);
					$("#bmzz").html(text);
				 	}
				});
				  
		 	}
	 	//得到事故和预案的相关信息
          function getInfo(){
        	  var aid=types.aid;//事故id
    	 	  $.ajax({
  		        url: '${ctx}/platformRescue/platformRescueAction!getById?id='+aid,
  		        method:'POST',
  		        success:function (data) {
  	  		      $("#sgType").html(data.bigText);//事故类型
  		          $("#alarmPeople").html(data.alarmPeople);//报警人
  		          $("#alarm").html(data.alarm);
  		          $("#accidentOfTime").html(data.accidentOfTime);
                  $("#accidentOfPlace").html(data.accidentOfPlace);
                  $("#smqk").html("死亡:"+data.deathToll+"人   受伤:"+data.injuredToll+"人   失踪:"+data.disappearToll+"人");
              
  			 	}
  			      });
              }
          //得到指挥中心的信息
          function getHead(){
        	  var cid=types.cid;//事故id
    	 	  $.ajax({
  		        url: '${ctx}/headquarters/headquartersAction!getById?id='+cid,
  		        method:'POST',
  		        success:function (data) {
  		        url = "  <a title=\"查看人员\" onclick='addPerson(\""+cid+"\");' class='btn2'><img src=\"${ctx}/images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
  	  		     $("#headName").html(data.name+url);
  			 	}
  			      });
              }
          function addPerson(hid){
  			$('#person').window('open');
  			grid2 = new Grid('${ctx}/headquarters/headquartersAction!plist?hperson.hid='+hid, 'data_List2');
  			grid2.loadGrid();
  			$('#hperson_hid').val(hid);
          }
          //查看预案相关联应急资源
          function resourceFunction(rowId) {
            var accidentId=types.aid;//事故id
        	pid = types.pid;//获取预案Id
  			$('#resourceFrame').attr('src', '${ctx}/jsp/plan/activeplan_resource.jsp?id=' + pid+"&accidentId="+accidentId+"&init="+0);
  			$('#viewResourceForm').dialog({
  				title:'查看救援资源',
  				modal:true,
  				draggable:false,
  				minimizable:true,
  				maximizable:true,
  				maximized:true,
  				onClose:function(){
  					$('#data_list').datagrid('reload');
  				},
  				buttons:[{
  					text:'取消',
  					iconCls:'icon-cancel',
  					handler:function() {
  						$('#viewResourceForm').dialog('close');
  					}
  				}]
  			});
  		}
    	 function assignment(){
    		var aid=types.aid;//事故id
	 		$("#accidentId").val(aid);
        	 }
    	 function getLevel(){
    		 var aid=types.aid;//事故id
    		// alert(aid);
    		 $.ajax({
    		        url:'${ctx}/logRescue/logRescueAction!getById?id='+aid,
    		        method:'POST',
    		        success:function(data) {
    	                 $("#level").html(data.levelText);
    		            }
    		    });
        	 }
	 	 function getArgs() {
		     var url = location.search; //获取url中"?"符后的字串
		   var theRequest = new Object();
		   if (url.indexOf("?") != -1) {
		      var str = url.substr(1);
		      strs = str.split("&");
		      for(var i = 0; i < strs.length; i ++) {
		         theRequest[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);//添加到对象中
		      }
		   }
		   return theRequest;                              
		} 
		//格式化时间
		function delimiterConvert(val){ 
			return val.replace('-','/').replace('-','/');
		}  
		//计算时间
	 	function thenceThen(timespan){
	 		 var date1=new Date(delimiterConvert(timespan));
	 		 var totalSecs=(new Date()-date1)/1000;
	 		 var days=Math.floor(totalSecs/3600/24);
	 		 var hours=Math.floor((totalSecs-days*24*3600)/3600);
	 		 var mins=Math.floor((totalSecs-days*24*3600-hours*3600)/60);
	 		 var secs=Math.floor((totalSecs-days*24*3600-hours*3600-mins*60));
	 		 document.getElementById("thenceThen").innerText=days+"天"+hours+"小时"+mins+"分钟"+secs+"秒";
	 		}
	 	var clock;
	 	window.onload=function(){
	 	var	beginTime = types.beginTime;
	 	 clock=self.setInterval("thenceThen('"+beginTime+"')", 500);
	 	}
	 	//查看救援物资
	 	function suppliesFunction(){
	 		var scrWidth=screen.availWidth;
    		var scrHeight=screen.availHeight;
	 		var hr ="/ym/jsp/ymxm/rescue/planSupplies.jsp?id="+types.aid;
	 		window.open(hr,"newwindow","resizable=yes,toolbar=yes, menubar=yes,scrollbars=yes,location=no, status=yes,top=0,left=0,width="+scrWidth+",height="+scrHeight)
	 	}
	 	//生成救援方案
	 	function rescue(){
			window.parent.viewChildFunction('/ym/jsp/emergencyRescue/rescuePlan.jsp?cid='+types.cid+'&aid='+types.aid+'&type='+types.type+'&pid='+types.pid+'&beginTime='+types.beginTime,'救援方案');
		}
	</script>
</head>
<body>	
	<div id="main" class="easyui-panel" title="" align="center"  style="height:600px;width:1150px;margin: 0 auto;padding: 0 auto;border: 0px">
		<div style="width:1119px;">
		<table id="detailTable" cellpadding="5px" style="font-size:12px;width: 100%" cellspacing="1"  border="0" bgcolor="#aed0ea" width="1100px">
			<tr>
				<td class="table_nemu_new">已经启动应急预案</td>
				<td class="table_con" colspan="5" id="planName"></td>
			</tr>
			<tr>
				<td class="table_nemu_new" width="12%">响应级别</td>
				<td class="table_con" width="21%" id="level"></td>
				<td class="table_nemu_new" width="12%" >事故类型</td>
				<td class="table_con" width="21%" id="sgType"></td>
				<td class="table_nemu_new" width="12%">汇报人</td>
				<td class="table_con" id="alarmPeople"  width="21%"></td>
			</tr>
			<tr>
				<td class="table_nemu_new">事故时间</td>
				<td class="table_con" id="accidentOfTime"></td>
				<td class="table_nemu_new">事故地点</td>
				<td class="table_con" id="accidentOfPlace"></td>
				<td class="table_nemu_new">记录人</td>
				<td class="table_con" id="alarm"></td>
			</tr>
			<tr>
				<td class="table_nemu_new">伤亡情况</td>
				<td class="table_con" colspan="3" id="smqk"></td>
				<td class="table_nemu_new">应急救援启动时间</td>
				<td class="table_con" id="beginTime">
				</td>
			</tr>
			<tr>
				<td class="table_nemu_new">指挥部</td>
				<td class="table_con" colspan="3" id="headName">
				</td>
				<td class="table_nemu_new">救援时长</td>
				<td class="table_con">
					<div id="thenceThen"></div>
				</td>
			</tr>
		</table><br>
		</div>
		<div class="easyui-tabs" style="width:1119px;height: 300px">
			<div title="部门职责" style="padding:10px;" >
			     <textarea id="bmzz" class="easyui-validatebox" style="width: 98%;height:200px"></textarea>
			</div>
			<div title="应急资源" style="padding:10px;height:200px">
				<div style="width: 98%;height:200px">
               <a title="新增救援资源" class="easyui-linkbutton" href="#" data-options="iconCls:'icon-add'" onclick='resourceFunction(pid);'>新增应急资源</a>
                <a title="新增救援物资" class="easyui-linkbutton" href="#" data-options="iconCls:'icon-add'" onclick='suppliesFunction();'>新增救援物资</a>
                 <div id="viewResourceForm" style="width: 960px; height: 400px;" data-options="iconCls:'icon-save'">
					<iframe frameborder="0" id="resourceFrame" width="100%" height="98%" scrolling-x="no"></iframe>
				</div>
               </div>
	   		</div>
	   		<div title="救援信息反馈" style="padding:10px;" style="overflow-x:hidden">
	   			<div style="width: 98%;height:200px">
		   			<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="crud.add();assignment();">添加救援信息反馈</a><br/><br/>
				     <table id="data_list" style="display:none;height: 200px">
				        <thead>
				        <th align="center" field="aidAgencies" width="200" >救援机构</th>
			            <th align="center" field="measures" width="500" >救援措施</th>
			            <th align="center" field="head" width="128"  >负责人</th>
			            <th align="center" field="executeTime" width="150" >执行时间</th>  
				        </thead>
				    </table>
			    </div>
	   		</div>
	   		</div>
	   		<br/>
		<a href="javascript:void(0);" class="easyui-linkbutton" onclick="rescue();">生成救援方案</a>
	</div>
<div style="display:none">
		<div id="addForm" style="width:900px;height:350px" data-options="modal:true,minimizable:true,maximizable:true,collapsible:true,draggable:false">
			<form method="post" >
			<input type="hidden" name="agencies.id"/>
			<input type="hidden" name="agencies.accidentId" id="accidentId"/>
	                 <div style="padding:10px 20px 10px 20px;" align="center" name="addDiv">
					<table id="detailTable" cellpadding="5px" style="font-size:12px;" cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">						
			<tr>
				<td class="table_nemu_new">救援机构</td>
				<td class="table_con" colspan="3">
							<input type="text" class="easyui-validatebox" name="agencies.aidAgencies"
							data-options="validType:'maxByteLength[100]'" />
				</td>
			</tr>
			<tr>
				<td class="table_nemu_new">救援措施</td>
				<td class="table_con" colspan="3">
					<textarea rows="4" cols="50" name="agencies.measures"></textarea>
				</td>
			</tr>
			<tr>
				<td class="table_nemu_new">负责人</td>
				<td class="table_con">
					<input type="text" class="easyui-validatebox" name="agencies.head"
							data-options="validType:'maxByteLength[100]'" />
				</td>
				<td class="table_nemu_new">执行时间</td>
				<td class="table_con">
					<input type="text" class="easyui-datebox" name="agencies.executeTime"
							data-options="validType:'maxByteLength[100]'" />
				</td>
			</tr>
		</table>
		</div>
		</form>
		</div>
    </div>
    
    
	 <div id="person" class="easyui-window" title="查看人员"
		data-options="modal:true,closed:true,minimizable:false,maximizable:true,resizable:true" style="width:1000px;height:500px;top:20px;padding:10px" >  
		<br><br>
		<div style="width:90%;height:75%">    		
	 	<table id="data_List2" class="easyui-datagrid" style="height:300px">
	 		<thead>  
	    <tr>
	    	<th data-options="field:'category',width:40">组别</th>
			<th data-options="field:'name',width:30,align:'center'">姓名</th>
		    <th data-options="field:'phoneNumber',width:30,align:'center'">手机</th></tr>  
	   </thead>
	 	</table>
		</div>
	</div>	
</body>
</html>