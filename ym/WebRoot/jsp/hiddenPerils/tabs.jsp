<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>职工信誉评价</title>
<link rel="stylesheet" href="${ctx}/css/tabs.css" type="text/css"></link>
<script type="text/javascript">
	 $(document).ready(
	 function(){
		 $('#cm').tabs('enableTab', 0);
		 for(var i=1;i<5;i++){
		 	$('#cm').tabs('disableTab', i);
		 }
	 });
</script>
</head>
<body>
<div class="easyui-tabs" style="width:900px;height:530px;margin: 0 auto;" id="cm">  
   <div id="1" title="隐患等级" style="padding:10px;" data-options="selected:true">  
   <font style="font-size: 25pt">第一步：选择隐患等级</font>
    <div style="float: left;" id="tabs1">
		<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="800px">
						 <tr>
							<td class="table_nemu_new" width="4%">ID</td>
							<td class="table_nemu_new"  width="4%">名称</td>
							<td class="table_nemu_new"  width="4%">代号</td>
							<td class="table_nemu_new"  width="30%">描述</td>
							<td class="table_nemu_new"  width="10%">操作</td>
						</tr>
						 <tr>
							<td class="table_con">1</td>
							<td class="table_con">C类</td>
							<td class="table_con">C</td>
							<td class="table_con">一般隐患，井区（车间），队组解决的隐患。</td>
							<td class="table_con"><input type="radio" name="tabsLevel" value="C类"/></td>
						</tr>
						 <tr>
							<td class="table_con">2</td>
							<td class="table_con">B类</td>
							<td class="table_con">B</td>
							<td class="table_con">需各矿，煤业公司研究解决的隐患。</td>
							<td class="table_con"><input type="radio" name="tabsLevel"value="B类"/></td>
						</tr>
						 <tr>
							<td class="table_con">3</td>
							<td class="table_con">A类</td>
							<td class="table_con">A</td>
							<td class="table_con">需煤炭管理公司，集团公司研究解决的隐患。</td>
							<td class="table_con"><input type="radio" name="tabsLevel" value="A类"/></td>
						</tr>
		</table>
		</div>
		<div style="float: right;">
		<a href="javascript:void(0)" title="下一步" onclick="fun('1');"><img src="${ctx}/images/xyb.png"/></a>
		</div>
    </div>  
   <div id="2" title="隐患专业" style="padding:10px;">  
   <font style="font-size: 25pt">第二步：选择隐患专业</font>
   <div style="float: left;" id="tabs2">
		<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="750px">
						 <tr>
							<td class="table_nemu_new"  width="5%">ID</td>
							<td class="table_nemu_new"  width="5%">名称</td>
							<td class="table_nemu_new"  width="5%">代号</td>
							<td class="table_nemu_new"  width="30%">描述</td>
							<td class="table_nemu_new"  width="10%">操作</td>
						</tr>
						 <tr>
							<td class="table_con">1</td>
							<td class="table_con">采掘</td>
							<td class="table_con"></td>
							<td class="table_con"></td>
							<td class="table_con"><input type="radio" name="tabsMajor" value="采掘"/></td>
						</tr>
						 <tr>
							<td class="table_con">2</td>
							<td class="table_con">地测防</td>
							<td class="table_con"></td>
							<td class="table_con"></td>
							<td class="table_con"><input type="radio" name="tabsMajor" value="地测防"/></td>
						</tr>
						 <tr>
							<td class="table_con">3</td>
							<td class="table_con">机电</td>
							<td class="table_con"></td>
							<td class="table_con"></td>
							<td class="table_con"><input type="radio" name="tabsMajor" value="机电"/></td>
						</tr>
						
						 <tr>
							<td class="table_con">4</td>
							<td class="table_con">通风</td>
							<td class="table_con"></td>
							<td class="table_con"></td>
							<td class="table_con"><input type="radio" name="tabsMajor" value="通风"/></td>
						</tr>
						 <tr>
							<td class="table_con">5</td>
							<td class="table_con">运输</td>
							<td class="table_con"></td>
							<td class="table_con"></td>
							<td class="table_con"><input type="radio" name="tabsMajor" value="运输"/></td>
						</tr>
						 <tr>
							<td class="table_con">6</td>
							<td class="table_con">其它</td>
							<td class="table_con"></td>
							<td class="table_con"></td>
							<td class="table_con"><input type="radio" name="tabsMajor" value="其它"/></td>
						</tr>
		</table>
			
		</div>
		<div style="float: right;">
			 <a href="javascript:void(0)" title="上一步" onclick="funs('0');"><img src="${ctx}/images/syb.png"/></a>
	        <a href="javascript:void(0)"  title="下一步" onclick="fun('2');"><img src="${ctx}/images/xyb.png"/></a>
	       </div>
    </div>  
    <div id="3" title="隐患内容及专业" id="" style="padding:10px;" >  
       <font style="font-size: 25pt">第三步：选择或填写隐患内容及建议</font>
       <div style="float: left;width: 550px;padding: 10px" id="tabs3">
		<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="100%">
						 <tr>
							<td class="table_nemu_new"  width="5%">ID</td>
							<td class="table_nemu_new"  width="5%">名称</td>
							<td class="table_nemu_new"  width="10%">操作</td>
						</tr>
						 <tr>
							<td class="table_con" >1</td>
							<td class="table_con">未持证上岗</td>
							<td class="table_con"><input type="radio" name="tabsContent" value="未持证上岗" onclick="funQu();"/></td>
						</tr>
						 <tr>
							<td class="table_con">2</td>
							<td class="table_con">无措施施工</td>
							<td class="table_con"><input type="radio" name="tabsContent" value="无措施施工" onclick="funQu();"/></td>
						</tr>
						 <tr>
							<td class="table_con">3</td>
							<td class="table_con">规程措施与工程不符</td>
							<td class="table_con"><input type="radio" name="tabsContent" value="规程措施与工程不符" onclick="funQu();"/></td>
						</tr>
						 <tr>
							<td class="table_con">4</td>
							<td class="table_con"></td>
							<td class="table_con"></td>
						</tr>
						 <tr>
							<td class="table_con">5</td>
							<td class="table_con"></td>
							<td class="table_con"></td>
						</tr>
						 <tr>
							<td class="table_con">6</td>
							<td class="table_con"></td>
							<td class="table_con"></td>
						</tr>
						 <tr>
							<td class="table_con">7</td>
							<td class="table_con"></td>
							<td class="table_con"></td>
						</tr>
						
		</table>
		
	</div>
	<div style="float: left;width: 200px;">
		<font style="font-size: 20px;">问题隐患</font>
		<textarea  style="height: 114px;width: 200px;" id="question"></textarea>
	</div>
	<br/>
	<div style="float: left;width: 200px;">
		<font style="font-size: 20px;">整改意见</font>
		<textarea style="height: 114px;width: 200px;" id="suggestion"></textarea>
	</div>
       <div style="float: right;">
			<a href="javascript:void(0)" title="上一步" onclick="funs('1');"><img src="${ctx}/images/syb.png"/></a>
	       <a href="javascript:void(0)" title="下一步" onclick="fun('3');"><img src="${ctx}/images/xyb.png"/></a>
       </div>
    </div> 
     <div id="4" title="隐患色别" id="" style="padding:10px;">  
     <font style="font-size: 25pt">第四步：选择隐患色别</font>
     <div style="float: left;" id="tabs4">
		<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="750px">
						 <tr>
							<td class="table_nemu_new"  width="5%">ID</td>
							<td class="table_nemu_new"  width="5%">色别名称</td>
							<td class="table_nemu_new"  width="5%" style="text-align: center;">颜色</td>
							<td class="table_nemu_new"  width="30%">描述</td>
							<td class="table_nemu_new"  width="10%">操作</td>
						</tr>
						 <tr>
							<td class="table_con" >1</td>
							<td class="table_con">红色</td>
							<td class="table_con"><div style=" background-color: red;height: 40px;border: 1px;border-style:outset"></div></td>
							<td class="table_con">一般隐患，井区（车间），队组解决的隐患。</td>
							<td class="table_con"><input type="radio" name="tabsColor" value="红色"/></td>
						</tr>
						 <tr>
							<td class="table_con">2</td>
							<td class="table_con">黄色</td>
							<td class="table_con"><div style="background-color: yellow;height: 40px;border: 1px;border-style:outset"></div></td>
							<td class="table_con">需各矿，煤业公司研究解决的隐患。</td>
							<td class="table_con"><input type="radio" name="tabsColor" value="黄色"/></td>
						</tr>
						 <tr>
							<td class="table_con">3</td>
							<td class="table_con">白色</td>
							<td class="table_con"><div style="background-color: white;height: 40px;border: 1px;border-style:outset"></div></td>
							<td class="table_con">需煤炭管理公司，集团公司研究解决的隐患。</td>
							<td class="table_con"><input type="radio" name="tabsColor"value="白色"/></td>
						</tr>
		</table>
		
		</div>
		<div style="float: right;">
		 <a href="javascript:void(0)" title="上一步" onclick="funs('2');"><img src="${ctx}/images/syb.png"/></a>
         <a href="javascript:void(0)" title="下一步" onclick="fun('4');"><img src="${ctx}/images/xyb.png"/></a>
         </div>
    </div>  
     <div id="5" title="处理方式" id="" style="padding:10px;">  
      <font style="font-size: 25pt">第五步：选择处理方式</font>
       <div style="float: left;" id="tabs5">
       <div style="width: 250px;height: 150px;padding: 20px;float: left;">
         <font style="font-size: 20px;">部门</font>
       <div style="overflow:scroll;height: 150px;" id="dep">
		<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="250px">
						 <tr>
							<td class="table_nemu_new"  width="5%">部门</td>
							<td class="table_nemu_new"  width="5%">序号</td>
							<td class="table_nemu_new"  width="10%">操作</td>
						</tr>
						 <tr>
							<td class="table_con" >采煤工区</td>
							<td class="table_con">1000</td>
							<td class="table_con"><input type="radio" name="tabsDep" value="采煤工区"/></td>
						</tr>
						 <tr>
							<td class="table_con">综采一队</td>
							<td class="table_con">1001</td>
							<td class="table_con"><input type="radio" name="tabsDep"/></td>
						</tr>
						 <tr>
							<td class="table_con">综采二队</td>
							<td class="table_con">1002</td>
							<td class="table_con"><input type="radio" name="tabsDep"/></td>
						</tr>
						 <tr>
							<td class="table_con">综采三队</td>
							<td class="table_con">1003</td>
							<td class="table_con"><input type="radio" name="tabsDep"/></td>
						</tr>
						 <tr>
							<td class="table_con">综采四队</td>
							<td class="table_con">1004</td>
							<td class="table_con"><input type="radio" name="tabsDep"/></td>
						</tr>
						 <tr>
							<td class="table_con">综采五队</td>
							<td class="table_con">1005</td>
							<td class="table_con"><input type="radio" name="tabsDep"/></td>
						</tr>
		</table>
		</div>
	</div>
	<div style="float: left;width: 180px;padding: 20px;height:150px" id="hxr">
		<font style="font-size: 20px;">候选人</font>
		<textarea  style="height: 150px;width: 200px;" id="hxrArea"></textarea>
	</div>
	<div style="float: left;width: 180px;padding: 20px;height: 150px;"id="lsr">
		<font style="font-size: 20px;">落实人</font>
		<input type="text" value="选择或填写落实部门" id="inpDep" onfocus="if(value=='选择或填写落实部门') {value='';this.style.color='#000';}" onblur="if (value=='') {value='选择或填写落实部门';this.style.color='#999';}"style="height:40px;color: #999;"/>
		<br/>
		<br/>
		<input type="text" value="选择或填写落实人" id="inpName" onfocus="if(value=='选择或填写落实人') {value='';this.style.color='#000';}" onblur="if (value=='') {value='选择或填写落实人';this.style.color='#999';}"style="height:40px;color: #999;"/>
		<br/>
		<br/>
		<input type="text" value="填写手机号码" id="inpTel" onfocus="if(value=='填写手机号码') {value='';this.style.color='#000';}" onblur="if (value=='') {value='填写手机号码';this.style.color='#999';}" style="height:40px;color: #999;"/>
	</div>
	<div style="float: left;">
	<br/><br/><br/>
	<input type="radio" checked="checked" name="tabsManage" onclick="funDis('2');"/>三定处理
	<br/>
	<input type="radio" name="tabsManage" onclick="funDis('3');"/>现场处理
		<br/>
	</div>
	</div>
	<br/><br/>
	 <div style="float: left;padding: 20px;">
	 <font style="font-size: 20px;">处理期限</font>	
	 <input class="easyui-my97 easyui-validatebox" data-options="required:true,readOnly:true" id="time"/>
	 <font style="font-size: 20px;">之前</font>
	 <textarea style="height: 100px;width: 700px;" id="ok"></textarea>
	 <div style="float: right;">
	  <a href="javascript:void(0)" title="上一步" onclick="funs('3');"><img src="${ctx}/images/syb.png"/></a>
       <a href="javascript:void(0)" title="完成" onclick="funOk();"><img src="${ctx}/images/wc.png"/></a>
       </div>
	 </div>
</div> 
</div>
<div id="save">
	<form action="" id="form">
		<input type="hidden" name="perilsData.level" id="save1" />
		<input type="hidden" name="perilsData.major" id="save2"/>
		<input type="hidden" name="perilsData.content" id="save3"/>
		<input type="hidden" name="perilsData.suggestion" id="save30"/>
		<input type="hidden" name="perilsData.color" id="save4"/>
		<input type="hidden" name="perilsData.dep" id="save5"/>
		<input type="hidden" name="perilsData.lsr" id="save50"/>
		<input type="hidden" name="perilsData.tel" id="save51"/>
		<input type="hidden" name="perilsData.time" id="save52"/>
		<input type="hidden" name="perilsData.way" id="save53" value="2"/>
		<input type="hidden" name="perilsData.hiddenId" value="${param.id}" />
	</form>
</div>
<script type="text/javascript">
var va = '';
	function fun(id){//下一步;
		var index = parseInt(id);
		va =' ';
		va =$('#tabs'+index+' :radio:checked').val();
		if(index == "3"){
			var qu = $('#question').val();
			if(qu == '' || qu == null){
				$.messager.show({
		                     title:'成功',
		                     msg:"请选择一项问题隐患或是填写问题隐患！！",
		                     timeout:2000,
		                     showType:'slide'
		                 });
				return;
			}
			$("#save3").val(qu);
			$("#save30").val($('#suggestion').val());
		}
		if((va == '' || va == null)&& (index != '3')){
			$.messager.show({
		                     title:'成功',
		                     msg:"请选择一项！",
		                     timeout:2000,
		                     showType:'slide'
		                 });
			return;
		}else if((index != '3')){
			$("#save"+index).val(va);
		}
		$("#cm").tabs("select",parseInt(id))//（索引从0开始）	
		$('#cm').tabs('enableTab', parseInt(id));
	}
	
	function funs(id){//上一步
		var index = parseInt(id)+1;
		va =' ';
		va =$('#tabs'+index+' :radio:checked').val();
		$("#cm").tabs("select",parseInt(id))//（索引从0开始）
	}
	
	function funQu(){//选择隐患问题
		va =$('#tabs3 :radio:checked').val();
		$('#question').val(va);
	}
	
	function funDis(ind){//判断处理方式
		if(ind == "3"){
			$("#inpDep").attr("disabled","disabled").css({ "color":"#ccc"});
			$("#inpName").attr("disabled","disabled").css({ "color":"#ccc"});
			$("#inpTel").attr("disabled","disabled").css({ "color":"#ccc"});
			$("#time").attr("disabled","disabled").css({ "color":"#ccc"});
			$("#ok").attr("disabled","disabled").css({ "color":"#ccc"});
			$("#hxrArea").attr("disabled","disabled").css({ "color":"#ccc"});
		}else{
			$("#inpDep").removeAttr("disabled");
			$("#inpName").removeAttr("disabled");
			$("#inpTel").removeAttr("disabled");
			$("#time").removeAttr("disabled");
			$("#ok").removeAttr("disabled");
			$("#hxrArea").removeAttr("disabled");
		}
		$("#save53").val(ind);
	}
	
	function funOk(){//点击完成按钮
		var dep = $("#inpDep").val();
		var tel = $("#inpTel").val();
	 	var name = $("#inpName").val();
	 	var time = $("#time").val();
	 	if(dep==null|| dep=="选择或填写落实部门"){
	 		$.messager.show({
		                     title:'成功',
		                     msg:"请选择或填写落实人部门！",
		                     timeout:2000,
		                     showType:'slide'
		                 });
	 		return;
	 	}
	 	if(name==null || name=="选择或填写落实人"){
	 		$.messager.show({
		                     title:'成功',
		                     msg:"请选择或填写落实人名称！",
		                     timeout:2000,
		                     showType:'slide'
		                 });
	 		return;
	 	}
	 	if(tel==null || tel=="填写手机号码"){
	 		$.messager.show({
		                     title:'成功',
		                     msg:"请填写落实人手机号码！",
		                     timeout:2000,
		                     showType:'slide'
		                 });
	 		return;
	 	}
	 	if(time==null||time==""){
	 		$.messager.show({
		                     title:'成功',
		                     msg:"请选择处理期限！",
		                     timeout:2000,
		                     showType:'slide'
		                 });
	 		return;
	 	}
	 	var sta = $("#save53").val();
	 	if(sta == null|| sta == ""){
	 		$.messager.show({
		                     title:'成功',
		                     msg:"请选择处理方式！",
		                     timeout:2000,
		                     showType:'slide'
		                 });
	 		return;
	 	}
	 	//赋值
	 	$("#save5").val(dep);
	 	$("#save50").val(name);
	 	$("#save51").val(tel);
	 	$("#save52").val(time);
	 	//提交form 表单
		$("#save").find('form').form('submit',{
	                url: "${ctx}/perilsData/perilsDataAction!add",
	                success:function (data) {
	                	var data = eval('(' + data + ')');
	                    if (data.operateSuccess) {
	                        $.messager.show({
	                            title:'成功',
	                            msg:data.operateMessage,
	                            timeout:2000,
	                            showType:'slide'
	                        });
	                    } else {
	                        $.messager.show({
	                            title:'失败',
	                            msg:data.operateMessage,
	                            timeout:2000,
	                            showType:'slide'
	                        });
	                    }
	                }
	          });
	          setTimeout("window.parent.$('#viewChildForm').dialog('close')",3000);
	}
</script>
</body>

</html>