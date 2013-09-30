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
	var accidentType='';
      $(document).ready(
	 	function (){
	 	types=getArgs();
	 		var aid=types.aid;//事故id
	 		var id=types.id;//预案id
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
			getType();//获取预案信息
			getInfo();//得到事故和预案的相关信息
			getHead();//指挥中心信息
			getLevel();//获取响应级别
			loadSupplies(aid);//加载救援物资数据
			loadSupplies2(aid);//加载救援物资
		 	});
	 	function getType(){
		 	 var   text;
		 	 var   planName;
      		 sta = types.type;//获取传来的预案类型
       		 pid = types.pid;//获取预案Id
       		 beginTime = types.beginTime;
       		 $("#beginTime").html(beginTime);
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
						 $("#yjcl").html(data.disposalMeasures);//应急措施
						 $("#whcd").html(data.typeHarmAnalysis);//危害程度
						 $("#jbyz").html(data.basicPrinciples);//基本原则
						 $("#yfyj").html(data.actionWarning);//预防预警
					}
					 $("#planName").html(planName);
					
					 
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
  		       	  accidentType = data.bigAccidentTypes;
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
              //查看指挥人员
          function addPerson(hid){
  			$('#person').window('open');
  			grid2 = new Grid('${ctx}/headquarters/headquartersAction!plist?hperson.hid='+hid, 'data_List2');
  			grid2.loadGrid();
  			$('#hperson_hid').val(hid);
          }
          //事故响应级别
    	 function getLevel(){
    		 var aid=types.aid;//事故id
    		 $.ajax({
    		        url:'${ctx}/logRescue/logRescueAction!getById?id='+aid,
    		        method:'POST',
    		        success:function(data) {
    	                 $("#level").html(data.levelText);
    		            }
    		    });
        	 }
        	 //获取URL参数值
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
	 	//数据字符长度判断
	 	function gridFormatterLength(value, rowData, rowIndex) {
        	if(value==null || value == '' || value == 'undefined')
        		return '';
    		if(value.length > 25)
    			return value.substring(0, 25) + '...';
    		return value;
    	}
    	//数据操作
        function gridFormatter(value, rowData, rowIndex) {
        	var rowId = rowData.id;
        	var url = "";
        	url += "<input type='button' class='btn1' onclick='viewFunction(\"" + rowId + "\");' value='查看'/>&nbsp;&nbsp;";
        	return url;
        }
        //加载应急物资数据
        function loadSupplies(aid){
        	gridSup = new Grid('${ctx}/accidentSupplies/accidentSuppliesAction!list?accidentSupplies.acId='+aid, 'data_list_supp');
	 		gridSup.loadGrid();
        }
        function loadSupplies2(aid){
    		 gridWz = new Grid('${ctx}/logplanResource/logplanResourceAction!list.action?logplanResource.accidentId='+aid,'data_list2');
    	     gridWz.loadGrid();
        }
        //跳转救援结束
        function closeRescue(){
			window.parent.viewChildFunction("/ym/jsp/hazards/rescue/closeMessage.jsp?aid="+types.aid+"&pid="+types.pid+"&cid="+types.cid+"&accidentType="+accidentType,"结束应急救援");
		}
        function gridFormatter(value, rowData, rowIndex) {
        	var rowId = rowData.resId;
        	var type = rowData.type;
        	var url = "";
        	<shiro:hasPermission name="48:view">
        	url += "<a title=\"查看\" onclick='viewResFunction(\""+rowId+"\",\""+type+"\");' class='btn2'><img src=\"../../images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
        	</shiro:hasPermission>
        	return url;
        }
        function  updateFlag(){
        	 var aid=types.aid;//事故id
    		 $.ajax({
    		        url:'${ctx}/platformRescue/platformRescueAction!updateState?platformRescue.id='+aid,
    		        method:'POST',
    		        success:function(data) {
    		        	closeRescue();
    		            }
    		    });
            }
        
        var urlValue ='';
        var loadValue='';
        var entity = '';
        
         //抓取XX.jsp下的div
        function viewResFunction(value,type)
        {
        	var rowsid;
       	if (typeof value == "undefined") {
       		var rows = grid.getSelectNode();
       		rowsid = rows.expId;
       	} else {
       		rowsid = value;
       	}
        	//调用填充URL的方法
        	//$("#viewWin").window("destroy");
        	fillViewUrl(type);
        	dialogs = {};
        	if(dialogs['' + entity]) {
        		var crud =  dialogs['' + entity];
        		crud.params.getByIdUrl = urlValue + '!getById';
      		crud.params.viewFormTitle = '查看' + type + '信息';
      		crud.params.entityName = entity;
      		crud.view(rowsid);
        	} else {
        		var dialogWrap = $('<div style="display:none;"></div>');
      	  	var dialog = $('<div iconCls="icon-save" class="' + entity + '"></div>');
      	  	$(dialog).appendTo($(dialogWrap));
      	  	$(dialogWrap).appendTo('body');
      	  	$(dialog).load(loadValue+" #viewWin",
      	  		function(response,status,xhr){
      		  	$(dialog).height($(dialog).find('#viewWin').height());
      		  	$(dialog).find('#viewWin').height('auto');
      		  	$(dialog).width($(dialog).find('#viewWin').width());
      		  	$(dialog).find('#viewWin').width('auto');
      	  		var crud = new Crud({'viewFormObject':$(dialog)});
      	  		dialogs['' + entity] = crud;
      	  		crud.params.getByIdUrl = urlValue + '!getById';
      			crud.params.viewFormTitle = '查看' + type + '信息';
      			crud.params.entityName = entity;
      			crud.view(rowsid);
      	  	});
        	}
        	
        }
        
        //根据救援类型判断应该抓取那些页面
        function fillViewUrl(type){
        
        	if(type == "救援车辆")
        	{
        		urlValue = '${ctx}/rescueCars/rescueCarsAction';
        		loadValue='${ctx}/jsp/ymxm/rescue/carsView.html';
        		entity ='rescueCars';
        	}
        	
        	if (type == "救援专家")
        	{
        		urlValue = '${ctx}/rescueExpert/rescueExpertAction';
        		loadValue='${ctx}/jsp/ymxm/rescue/expertView.html';
        		entity ='rescueExpert';
        	}
        	
        	if (type == "救援队伍")
        	{
        		urlValue = '${ctx}/rescueTeam/rescueTeamAction';
        		loadValue='${ctx}/jsp/ymxm/rescue/teamView.html';
        		entity ='rescueTeam';
        	}
        	
        	/*if (type == "救援物资")
        	{
        		urlValue = '${ctx}/tbRescueSupplies/tbRescueSuppliesAction';
        		loadValue='${ctx}/jsp/ymxm/rescue/suppliesView.html';
        		entity ='tbRescueSupplies';
        	}*/
        	if(type == "医疗保障"){
        		urlValue = '${ctx}/rescueMedical/rescueMedicalAction';
        		loadValue='${ctx}/jsp/ymxm/rescue/medicalView.html';
        		entity ='rescueMedical';
        	}
        	if(type == "运输保障"){
        		urlValue = '${ctx}/tbRescueTransport/tbRescueTransportAction';
        		loadValue='${ctx}/jsp/ymxm/rescue/transportView.html';
        		entity ='tbRescueTransport';
        	}
        	if(type == "通讯保障"){
        		urlValue = '${ctx}/rescueCommunication/rescueCommunicationAction';
        		loadValue='${ctx}/jsp/ymxm/rescue/communicationView.html';
        		entity ='rescueCommunication';
        	}
        	if(type == "技术支持"){
        		urlValue = '${ctx}/rescueTechnical/rescueTechnicalAction';
        		loadValue='${ctx}/jsp/ymxm/rescue/technicalView.html';
        		entity ='rescueTechnical';
        	}
        	if(type == "避难场所"){
        		urlValue = '${ctx}/tbRescueShelter/tbRescueShelterAction';
        		loadValue='${ctx}/jsp/ymxm/rescue/shelterView.html';
        		entity ='tbRescueShelter';
        	}
        }
	</script>
</head>
<body>	
<div id="main" class="easyui-panel" title="" align="center" style="height:600px;width:1150px;margin: 0 auto;padding: 0 auto;border: 0px">
	<div style="width:1119px;">
		<table id="detailTable" cellpadding="5px" style="font-size:12px;width: 100%" cellspacing="1"  border="0" bgcolor="#aed0ea" width="1100px">
			<tr>
				<td class="table_nemu_new" colspan="2">已经启动应急预案</td>
				<td class="table_con" colspan="4" id="planName"></td>
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
		
		<div class="easyui-tabs" style="width:1119px;height:300px">
			<div title="救援信息反馈" style="padding:10px;height:200px">
		    	<table id="data_list" style="display:none;width: 100%">
			        <thead>
				        <th align="center" field="aidAgencies" width="200" >救援机构</th>
			            <th align="center" field="measures" width="500" >救援措施</th>
			            <th align="center" field="head" width="128"  >负责人</th>
			            <th align="center" field="executeTime" width="150" >执行时间</th>  
			        </thead>
				</table>
    		</div>
    		<div title="应急资源" style="padding:10px">
	    		<div class="easyui-tabs" id="tt" style="width:1100px;height:200px">
    				<div title="救援物资" style="padding:10px;width: 98%" align="left">
	    				<table id="data_list_supp" style="display:none">
					        <thead>
						            <th align="center" field="materialName" width="150" formatter="gridFormatterLength" >物质名称</th>
						            <th align="center" field="model" width="150" formatter="gridFormatterLength" >型号</th>
						            <th align="center" field="unit" width="150" formatter="gridFormatterLength" >单位</th>
						            <th align="center" field="num" width="150" formatter="gridFormatterLength" >数量</th>
						            <th align="center" field="warehouse" width="150" formatter="gridFormatterLength" >库号</th>
						            <th align="center" field="remark" width="150" formatter="gridFormatterLength" >备注</th>
					        </thead>
						</table>
    				</div>
    				<div title="救援物资" style="padding:10px;width: 100%" align="left">
	    				<table id="data_list2" style="display:none">
							           <thead>
								        <tr>
								          	<th field="type" width="100" align="center" title="name">救援资源类型</th>
								            <th field="name" width="100" align="center" title="role">救援资源名称</th>
								            <th align="center" field="resId" width="160" align="center" formatter="gridFormatter">操作</th>     
								        </tr>
								        </thead>
						</table>
    				</div>
    				
	    		</div>
    		</div>
    		<div title="处理原则" style="padding:10px">
    			<div class="easyui-tabs" id="tt" style="width:1100px;height:200px">
    				<div title="应急处理措施" style="padding:10px;">
    					<textarea id="yjcl" style="width: 98%;height:98% " disabled="disabled"></textarea>
    				</div>
    				<div title="事故类型和危害程度分析">
    				<textarea id="whcd" style="width: 98%;height:98% " disabled="disabled"></textarea>
    				</div>
    				<div title="应急处置基本原则">
    				<textarea id="jbyz" style="width: 98%;height:98% " disabled="disabled"></textarea>
    				</div>
    				<div title="预防与预警">
    				<textarea id="yfyj" style="width: 98%;height:98% " disabled="disabled"></textarea>
    				</div>
    			</div>
    		</div>
		</div>
		<br />
	<a href="javascript:void(0);" class="easyui-linkbutton" onclick="updateFlag();">结束应急救援</a>
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