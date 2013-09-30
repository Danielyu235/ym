<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ay.framework.shiro.SystemParameter" %>
<%@ include file="/common/taglibs.jsp" %>
<%
	String jquery_path = request.getContextPath();
	String jquery_basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ jquery_path + "/";
	String login_authcode_switch = SystemParameter.getLogin_authcode_switch();
	request.setAttribute("login_authcode_switch", login_authcode_switch);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<link href="css/loginmanage.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=jquery_basePath%>resources/js/jquery/easyui-1.3.1/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="<%=jquery_basePath%>resources/js/jquery/easyui-1.3.1/themes/icon.css" />
<script type="text/javascript" src="<%=jquery_basePath%>resources/js/jquery/jquery-1.7.2.js"></script>
<script type="text/javascript" src="<%=jquery_basePath%>resources/js/jquery/easyui-1.3.1/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=jquery_basePath%>resources/js/jquery/form/jquery.form.js"></script>
<script type="text/javascript" src="<%=jquery_basePath%>resources/js/jquery/easyui-1.3.1/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=jquery_basePath%>js/validator.js"></script>
<style type="text/css">
 	.combobox-item{ 
		cursor:pointer; 
	} 
	.combobox-item:hover{
		background:#E3F1FA;
	}
</style>
<script type="text/javascript">
$(document).ready(function(){
// 	var obj = document.getElementById("imgValidCode");
// 	changeCode(obj);
	$("#companyName").validatebox({
		required:true
	});
	$("#companyCode1").validatebox({
		required:true
	});
	$("#companyCode2").validatebox({
		required:true
	});
	$("#companyCode3").validatebox({
		required:true
	});
	$("#reCompanyCode1").validatebox({
		required:true,
		validType:'equalTo["#companyCode1"]'
	});
	$("#reCompanyCode2").validatebox({
		required:true,
		validType:'equalTo["#companyCode2"]'
	});
	$("#reCompanyCode3").validatebox({
		required:true,
		validType:'equalTo["#companyCode3"]'
	});
	$("#password").validatebox({
		required:true,
		validType:"codechick"
	});
	$("#rePassword").validatebox({
		required:true,
		validType:"equalTo['#password']"
	});
	$("#username").validatebox({
		required:true
	});
	$("#userTel").validatebox({
		required:true,
		validType:"NO"
	});
	$("#detailsAddr").validatebox({
		required:true
	});
	$("#validCode").validatebox({
		required:true
	});
	$("#ordination").combobox({
		url:"${ctx}/sourceData/sourceDataAction!firstLevelData.action?typeId=25cb400da4574456b0322ba6271e4eb0",
		valueField:"id",
		textField:"dataName",
		editable:false,
		required:true
	});
	$("#companyType").combobox({
		url:"${ctx}/sourceData/sourceDataAction!firstLevelData.action?typeId=fbc248096ce342fc9d9a914536a98ca9",
		valueField:"id",
		textField:"dataName",
		editable:false,
		required:true
	});
// 	$("#industryType4").combobox({
// 		valueField:"id",
// 		textField:"dataName",
// 		onSelect:function (row){
// 			$("#industryType").val(row.id);
// 		},
// 		editable:false
// 	});
// 	$("#industryType3").combobox({
// 		valueField:"id",
// 		textField:"dataName",
// 		onSelect:function (row){
// 			$("#industryType4").combobox("clear");
// 			$("#industryType").val(row.id);
// 			$("#industryType4").combobox("reload", "${ctx}/sourceData/sourceDataAction!getDataByParent.action?pid="+row.id);
// 			$("#industryType4").combobox("showPanel");
// 		},
// 		editable:false
// 	});
// 	$("#industryType2").combobox({
// 		valueField:"id",
// 		textField:"dataName",
// 		onSelect:function (row){
// 			$("#industryType3").combobox("clear");
// 			$("#industryType4").combobox("clear");
// 			$("#industryType").val(row.id);
// 			$("#industryType3").combobox("reload", "${ctx}/sourceData/sourceDataAction!getDataByParent.action?pid="+row.id);
// 			$("#industryType3").combobox("showPanel");
// 		},
// 		editable:false,
// 		required:true
// 	});
	/** 级联动态显示行业选择框*/
	$("#industryType1").combobox({
		url:"${ctx}/sourceData/sourceDataAction!firstLevelData.action?typeId=564bb95106d04970ae494b32982360ea",
		valueField:"id",
		textField:"dataName",
		editable:false,
		onSelect:function (row1){
			$("#industryType").val(row1.id);
			$.post("${ctx}/sourceData/sourceDataAction!getDataByParent.action",
					{pid:row1.id},
					function(ret1){
						if($("#industry4Div")){
							if($("#industryType4")){
								$("#industryType4").combobox("destroy");
							}
							$("#industry4Div").remove();
						}
						if($("#industry3Div")){
							if($("#industryType3")){
								$("#industryType3").combobox("destroy");
							}
							$("#industry3Div").remove();
						}
						if(ret1.length){
							if($("#industry2Div")){
								if($("#industryType2")){
									$("#industryType2").combobox("destroy");
								}
								$("#industry2Div").remove();
							}
							var industryTd = $("#industryTd");
							$("<div id = 'industry2Div' style='float:left;margin-right:20px;'><input id='industryType2' style='display:none'/></div>").appendTo(industryTd);
							try{
								$("#industryType2").combobox("loadData",ret1);
								$("#industryType2").combobox("showPanel");
							}catch(e){
								$("#industryType2").combobox({
									data:ret1,
									valueField:"id",
									textField:"dataName",
									editable:false,
									onSelect:function(row2){
										$("#industryType").val(row2.id);
										$.post(
												"${ctx}/sourceData/sourceDataAction!getDataByParent.action",
												{pid:row2.id},
												function(ret2){
													if($("#industry4Div")){
														if($("#industryType4")){
															$("#industryType4").combobox("destroy");
														}
														$("#industry4Div").remove();
													}
													if(ret2.length){
														if($("#industry3Div")){
															if($("#industryType3")){
																$("#industryType3").combobox("destroy");
															}
															$("#industry3Div").remove();
														}
														var industryTd = $("#industryTd");
														$("<div id = 'industry3Div' style='float:left;margin-right:20px;'><input id='industryType3' style='display:none'/></div>").appendTo(industryTd);
														try {
															$("#industryType3").combobox("loadData",ret2);
															$("#industryType3").combobox("showPanel");
														} catch (e) {
															$("#industryType3").combobox({
																data:ret2,
																valueField:"id",
																textField:"dataName",
																editable:false,
																onSelect:function(row3){
																	$("#industryType").val(row3.id);
																	$.post(
																		"${ctx}/sourceData/sourceDataAction!getDataByParent.action",
																		{pid:row3.id},
																		function (ret3){
																			if(ret3.length){
																				if($("#industry4Div")){
																					if($("#industryType4")){
																						$("#industryType4").combobox("destroy");
																					}
																					$("#industry4Div").remove();
																				}
																				var industryTd = $("#industryTd");
																				$("<div id = 'industry4Div' style='float:left;margin-right:20px;'><input id='industryType4' style='display:none'/></div>").appendTo(industryTd);
																				try {
																					$("#industryType4").combobox("loadData",ret3);
																					$("#industryType4").combobox("showPanel");
																				} catch (e) {
																					$("#industryType4").combobox({
																						data:ret3,
																						valueField:"id",
																						textField:"dataName",
																						editable:false,
																						onSelect:function(row4){
																							$("#industryType").val(row4.id);
																						}
																					});
																					$("#industryType4").combobox("showPanel");
																				}
																			}else{
																				try {
																					$("#industryType4").combobox("destroy");
																					$("#industry4Div").remove();
																				} catch (e) {
																				}
																			}	
																		}
																	);
																}
															});	
															$("#industryType3").combobox("showPanel");
														}
													}else{
														try {
															$("#industryType3").combobox("destroy");
															$("#industry3Div").remove();
														} catch (e) {
														}
													}
												}
										);
									}
								});
								$("#industryType2").combobox("showPanel");
							}
						}else{
							try {
								$("#industryType2").combobox("destroy");
								$("#industry2Div").remove();
							} catch (e) {
							}
						}
					}
			);
			$("#industryType2").combobox("showPanel");
		},
		editable:false,
		required:true
	});
	$("#area1").hide();
	$("#area2").hide();
	$("#area3").hide();
	$("#area4").hide();
	
	/** 级联动态显示区域下拉框选项*/
	$("#area2").combobox({
		url:"${ctx}/sourceData/sourceDataAction!getDataByParent.action?pid=371000000000",
		valueField:"id",
		textField:"dataName",
		required:true,
		onSelect:function (row){
			$("#addrCode").val(row.id);
			
			$.post("${ctx}/sourceData/sourceDataAction!getDataByParent.action",
					{pid:row.id},
					function(ret){
						if($("#area4Span")){
							if($("#area4")){
								$("#area4").combobox("destroy");
							}
							$("#area4Span").remove();
						}
						if(ret.length){
							if($("#area3Span")){
								if($("#area3")){
									$("#area3").combobox("destroy");
								}
								$("#area3Span").remove();
							}
							var areaDiv = $("#areaDiv");
							$("<span id = 'area3Span'>街道(镇):<input id='area3' style='display:none'/></span>").appendTo(areaDiv);
							try{
								$("#area3").combobox("loadData",ret);
								$("#area3").combobox("showPanel");
							}catch(e){
								$("#area3").combobox({
									data:ret,
									valueField:"id",
									textField:"dataName",
									onSelect:function(row2){
										$("#addrCode").val(row2.id);
										$.post("${ctx}/sourceData/sourceDataAction!getDataByParent.action",
												{pid:row2.id},
												function(ret2){
													if($("#area4Span")){
														if($("#area4")){
															$("#area4").combobox("destroy");
														}
														$("#area4Span").remove();
													}
													var areaDiv = $("#areaDiv");
													$("<div id = 'area4Span'>社区(村):<input id='area4' style='display:none'/></div>").appendTo(areaDiv);
													try {
														$("#area4").combobox("loadData",ret);
														$("#area4").combobox("showPanel");
													} catch (e) {
														$("#area4").combobox({
															data:ret2,
															valueField:"id",
															textField:"dataName",
															onSelect:function(row3){
																$("#addrCode").val(row3.id);
															}
														});
														$("#area4").combobox("showPanel");
													}
												}
										);
									}
								});							
								$("#area3").combobox("showPanel");
							}
						}else{
							try {
								$("#area3").combobox("destroy");
								$("#area3Span").remove();
							} catch (e) {
								
							}
						}
					}
			);
		}
	});
	$("#area1").combobox({
		url:"${ctx}/sourceData/sourceDataAction!firstLevelData.action?typeId=0b8415e08bf3474686e643318c0a497c",
		valueField:"id",
		textField:"dataName",
		editable:false,
		disabled:true
	});
	$("#area1").combobox("setValue", "371000000000");
	$("#addrCode").val("371000000000");
});

/** 提交表单*/
function sub_mit(o){
	var submitForm = $(o).parents("form");
	submitForm.submit();	
}

/** 提交表单*/
function submitForm(o){
	setFormAttribute();
	var submitForm = $(o).parents("form");
	submitForm.form({
        url:'register/registerAction!add.action',
        success:function (data) {
        	var data = eval('(' + data + ')');
            if (data.operateSuccess) {
            	$.messager.alert('成功',data.operateMessage); 
                setTimeout(function(){
                	window.location.href="${ctx}/front.jsp";
                },2000);
            } else {
            	$.messager.alert('失败',data.operateMessage); 
            }
            var obj = document.getElementById("imgValidCode");
        	changeCode(obj);
        }
    });
	if(submitForm.form("validate")){
		validGrid(o);
	}
}

/** 验证上级部门*/
function validManageDept(o){
	var industryType = $("#industryType").val();
	var ordination = $("#ordination").combobox("getValue");
	var addrCode = $("#addrCode").val();
	$.ajax({
		url:"${ctx}/busCorpInfo/busCorpInfoAction!validateManageDept.action",
		data:"busCorpInfo.ordination="+ordination+"&busCorpInfo.addrCode="+addrCode+"&busCorpInfo.industryType="+industryType,
		type:"post",
		success:function(ret){
			if(ret){
				sub_mit(o);
			}else{
				$.messager.alert("提示","您的行业无监管部门，无法注册");
			}
		}
	});
}

/** 验证网格合法性*/
function validGrid(o){
	var ordination = $("#ordination").combobox("getValue");
	var addrCode = $("#addrCode").val();
	$.ajax({
		url:"${ctx}/busCorpInfo/busCorpInfoAction!checkGrid.action",
		data:"busCorpInfo.ordination="+ordination+"&busCorpInfo.addrCode="+addrCode,
		type:"post",
		success:function(ret){
			if(ret){
				validManageDept(o);
			}else{
				$.messager.alert("提示","您选中的隶属关系不能小于行政区划");
			}
		}
	});
}

/** 验证网格等级*/
function checkGrid(){
	var ordination = $("#ordination").combobox("getValue");
	var addrCode = $("#addrCode").val();
	if(ordination&&addrCode){
		$.ajax({
			url:"${ctx}/busCorpInfo/busCorpInfoAction!checkGrid.action",
			data:"busCorpInfo.ordination="+ordination+"&busCorpInfo.addrCode="+addrCode,
			type:"post",
			success:function(ret){
				if(ret){
					$("#checkGridMsg").css("color", "green").text("网格验证成功").show();
				}else{
					$("#checkGridMsg").css("color", "red").text("网格验证失败，请重新选择").show();
				}
			}
		});
	}else{
		$.messager.alert("提示", "请填写完整隶属关系和地区");
		$("#checkGridMsg").hide();
		$("#checkDeptMsg").hide();
	}
}

function checkDept(){
	var industryType = $("#industryType").val();
	var ordination = $("#ordination").combobox("getValue");
	var addrCode = $("#addrCode").val();
	if(industryType&&ordination&&addrCode){
		$.ajax({
			url:"${ctx}/busCorpInfo/busCorpInfoAction!validateManageDept.action",
			data:"busCorpInfo.ordination="+ordination+"&busCorpInfo.addrCode="+addrCode+"&busCorpInfo.industryType="+industryType,
			type:"post",
			success:function(ret){
				if(ret!="0"&&ret){
					$("#deptErrorMsg").hide();
					$("#checkDeptMsgInput").val(ret);
				}else if(ret=="0"){
					$("#checkDeptMsgInput").val("");
					$("#deptErrorMsg").css("color", "red").text("部门验证失败，隶属关系不能小于行政区划").show();
				}else{
					$("#checkDeptMsgInput").val("");
					$("#deptErrorMsg").css("color", "red").text("部门验证失败，请重新选择").show();
				}
			}
		});
	}else{
		$.messager.alert("提示", "请填写完整隶属关系、地区和行业");
		$("#deptErrotMsg").hide();
	}
}

function setFormAttribute(){
	var corpCode = $("#companyCode1").val() + "-" + $("#companyCode2").val() + "-" + $("#companyCode3").val();
	$("#corpCode").val(corpCode);
// 	var corpProductAddr = new String();
// 	for(var i=1;i<=4;i++){
// 		var area = $("#area"+i);
// 		if(area.attr("id")){
// 			alert(area.combobox("getText"));
// 			corpProductAddr += area.combobox("getText");
// 		}
// 	}
// 	$("#corpProductAddr").val(corpProductAddr);
	$("#corpProductAddr").val($("#detailsAddr").val());
}

/** 换验证码*/
function changeCode(obj){
	if(obj){		
	   //获取当前的时间作为参数，无具体意义  
	   var timenow = new Date().getTime();  
      	//每次请求需要一个不同的参数，否则可能会返回同样的验证码  
	   //这和浏览器的缓存机制有关系，也可以把页面设置为不缓存，这样就不用这个参数了。  
	   obj.src="validCode.action?d="+timenow;  
	}
}
var timeOut = null;
/** 验证组织机构代码判断企业是否重复*/
function validCorpCode(){
	if($("#companyCode1").val()&&$("#companyCode2").val()&&$("#companyCode3").val()){
		var code = $("#companyCode1").val()+"-"+$("#companyCode2").val()+"-"
				+$("#companyCode3").val();
		if(timeOut){
			window.clearTimeout(timeOut);
		}
		timeOut = setTimeout(
			function(){
				$.post("${ctx}/busCorpInfo/busCorpInfoAction!isCorpCodeExist.action",
						{corpCode:code},
						function(ret){
							if(ret){
								$("#companyCode1").validatebox("validate");
								$("#validCorpCodeDiv").css("color","red").text("该公司已存在").show();
							}else{
								$("#validCorpCodeDiv").css("color","green").text("该公司可以注册").show();
							}
						}
				);		
			},
			200
		);
		
	}
}
</script>
<title>威海市安全生产网格化监管平台-用户注册</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<style>
		html,body{margin:0;padding:0;width:100%;height:100%;background-color:#fff;font-size:12px;overflow:auto;text-align:center;}
		#main{width:825px;margin-top:10px;margin-left:auto;margin-right:auto;}
		img{border:0;vertical-align:middle;}
		.input_text{background:#fff;border:solid 1px #a4bed4;width:220px;height:18px;}
		.input_text2{background:#fff;border:solid 1px #a4bed4;width:78px;height:18px;}
		.input_text3{background:#fff;border:solid 1px #a4bed4;width:20px;height:18px;}
		
		.top{background:url(images/register/images/bg_reg_r.gif) repeat-x;width:100%;height:90px;}
		#head{background:url(images/register/images/bg_reg.jpg) no-repeat;width:100%;height:90px;text-align:center;}
		#header{
		height:90px;background:url(images/register/images/sign_title.png)  no-repeat;width:754px;margin:0 auto;
		}
		.fill_title{background:#9dd3fa;height:30px;line-height:32px;padding-left:10px;font-size:13px;text-align:left;color:#004572;font-weight:bold;}
		.fill_t{border-collapse:collapse;border:1px solid #b1d4ee;width:100%;margin-top:0px;margin-bottom:10px;background:#f3f7fc;}
		.fill_t td{height:30px;line-height:30px;vertical-align:middle;text-align:left;}
		.m20{height:5px;}
		#zc{margin-top:10px;border:none;border-top:3px solid #5aade9;width:100%;padding-top:20px;}
		.img_b{padding: 10px; vertical-align: middle;width:80px;text-align:center;padding-left:20px;}
		.tdItemTitle{width:90px;}
	</style>
</head>
<body class="zc_bg">
    <form name="insert_userinfo" method="post" target="_self">
    <div class="top">
    <div id="head">
				<div id="header"></div>
		</div>
		</div>
	<div id="main">
      <table width="100%" cellpadding="0" cellspacing="0">
        <tr>
          <td class="fill_title"><img src="images/register/images/icon_b.gif" />&nbsp;填报单位信息</td>
        </tr>
        <tr>
          <td>
              <table class="fill_t">
                <tr>
                  <td rowspan="3" class="img_b">
                    <img src="images/register/images/sign_dw.png" />
                  </td>
                  <td class="tdItemTitle" valign="top" style="vertical-align:top;">填报单位名称</td>
                  <td><input  id="companyName"  name="busCorpInfo.corpName" desc="填报单位名称"  
	                  size="21"  type="text" space_able="false" class="input_text" />&nbsp;
	                  <font color="#FF0000">*</font><br/>
	                  <img src="images/register/images/bg_regIcon.gif" />按照工商营业执照上全称填写</td>
	                  <td valign="top">
                  </td>
                </tr>
                <tr>
                  <td class="tdItemTitle" valign="top" style="vertical-align:top;">单位代码</td>
                  <td>
                    <input id="companyCode1" onblur="validCorpCode()"   displayname="单位代码" desc="单位代码1"  space_able="false" length="8" datatype="varchar"  type="text" size="8" maxlength='8' valuelength="8" class="input_text2"  /> - 
                    <input id="companyCode2" onblur="validCorpCode()" displayname="单位代码" desc="单位代码2"  space_able="false" length="2" datatype="varchar" name="corpkey_b" type="text" size="1" maxlength="1" valuelength="1" class="input_text3" /> - 
                    <input id="companyCode3" onblur="validCorpCode()"  displayname="单位代码" desc="单位代码3"  space_able="false" length="5" datatype="varchar"  name="corpkey_c" type="text" size="4" maxlength="4" value="0000" valuelength="4" class="input_text2" />&nbsp;<font color="#FF0000">*</font>
<!--                     		<a href="javascript:void(0);" onclick="validCorpCode()">检测</a> -->
           					<span id="validCorpCodeDiv" style="display:none">该公司已存在,请重新填写</span>
                    <br/><img src="images/register/images/bg_regIcon.gif" />单位代码即用户名
                  	<input id="corpCode" name="busCorpInfo.corpCode" type="hidden"/>
              				
                  </td>
<!--                   <td > -->
<!--               			<div> -->
<!--               				<a href="javascript:void(0);" onclick="validCorpCode()">验证</a> -->
<!--               				<div id="validCorpCodeDiv" style="display:none"> -->
<!--               					<span style="color:red">该公司已存在,请重新填写</span> -->
<!--               				</div> -->
<!--               			</div> -->
<!--                   </td> -->
                </tr>
                <tr>
                  <td class="tdItemTitle">确认单位代码</td>
                  <td><input id="reCompanyCode1"   displayname="单位代码" desc="单位代码1"  space_able="false" length="8" datatype="varchar"  type="text" size="8" maxlength='8' valuelength="8" class="input_text2"  /> - <input id="reCompanyCode2"  displayname="单位代码" desc="单位代码2"  space_able="false" length="2" datatype="varchar" name="corpkey_b2" type="text" size="1" maxlength="1" valuelength="1" class="input_text3" /> - <input id="reCompanyCode3"  displayname="单位代码" desc="单位代码3"  space_able="false" length="5" datatype="varchar"  name="corpkey_c2" type="text" size="4" maxlength="4" value="0000" valuelength="4" class="input_text2" />&nbsp;<font color="#FF0000">*</font></td>
                </tr>
              </table>
          </td>
        </tr>
        <tr>
          <td class="m20"></td>
        </tr>
        <tr>
          <td class="fill_title"><img src="images/register/images/icon_b.gif" />&nbsp;填报用户信息</td>
        </tr>
        <tr>
          <td>
            <table class="fill_t">
              <tr>
                <td rowspan="4" class="img_b">
                  <img src="images/register/images/sign_yh.png" />
                </td>
                <td class="tdItemTitle2" valign="top">用户密码</td>
                <td valign="top"><input id="password" name="user.password" desc="用户密码" size="21" type="password" space_able="false"  class="input_text" />&nbsp;<font color="#FF0000">*</font></td>
                <td class="tdItemTitle2" valign="top">确认用户密码</td>
                <td valign="top"><input id="rePassword"  desc="用户密码" size="21" type="password" space_able="false" class="input_text" />&nbsp;<font color="#FF0000">*</font></td>
              </tr>
              <tr>
                <td class="tdItemTitle2" valign="top">法人姓名</td>
                <td valign="top"><input id="username" name="busCorpInfo.legalPerson" desc="联系人姓名" size="20"  type="text" space_able="false" class="input_text" />&nbsp;<font color="#FF0000">*</font></td>
                <td class="tdItemTitle2" valign="top">法人联系电话</td>
                <td valign="top"><input id="userTel" name="busCorpInfo.lpersonPhone" size="20" type="text" space_able="false" datatype="telNumber" value=""  desc="联系电话" class="input_text" />&nbsp;<font color="#FF0000">*</font></td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td class="m20"></td>
        </tr>
        <tr>
          <td class="fill_title"><img src="images/register/images/icon_b.gif" />&nbsp;填报网格信息</td>
        </tr>
        <tr>
          <td>
            <table class="fill_t">
              <tr>
                <td width="108" rowspan="5" class="img_b">
                        <img src="images/register/images/sign_dq.png" />
                </td>
                <td width="90" valign="top" class="tdItemTitle2">隶属关系</td>
                <td width="262" valign="top">
                	<input id="ordination" name="busCorpInfo.ordination" type="text"/>
                </td>
                <td width="78" valign="top" class="tdItemTitle2">经济类型</td>
                <td width="269" valign="top">
					<input id="companyType" name="busCorpInfo.ecoType" type="text"/>
				</td>
              </tr>
              <tr name="reg_xm" style="display:none;">
                <td class="tdItemTitle2" valign="top">项目名称</td>
                <td valign="top" >
                    <input class="input_text" id="pn" name="pn"/>&nbsp;<font color="#FF0000">*</font><button  onclick="window.open('add_project.jsp');return false;">新增</button>
                </td>
              </tr>            
              <tr name="reg_jd">
                <td class="tdItemTitle" valign="top">地址信息</td>
                <td id="areaTd" valign="top" colspan="3">
	                <div id="areaDiv">
	   					<div style="float:left;margin-right:20px">
		                	市 :<input id="area1" type="text"/>
	   					</div >
	   					<div style="float:left;margin-right:20px">
		                	区(县):<input id="area2" type="text" />
	   					</div>
	                </div>
	                <div style="clear:left">
	                	地址:<input style="width:60%" id="detailsAddr" type="text"/>
	                </div>
                	<input id="corpProductAddr" name="busCorpInfo.corpProductAddr" type="hidden"/>
                	<input id="addrCode" type="hidden" name="busCorpInfo.addrCode"/>
                </td>             
              </tr>
<!--               <tr> -->
<!--               	<td>网格等级</td> -->
<!--               	<td id="manageDept"> -->
<!--               		<a href="javascript:void(0)" onclick="checkGrid();">验证网格等级</a> -->
<!--               		<span id="checkGridMsg" style="display:none"></span> -->
<!--               	</td> -->
<!--               </tr> -->
              <tr>
              	 <td>行业类别</td>
              	 <td colspan="3" id="industryTd">
              	 	<div style="float:left;margin-right:20px">
	   	 				<input id="industryType1" type="text"/>
              	 	</div >
              	 	<input type="hidden" name="busCorpInfo.industryType" id="industryType"/>
              	 </td>
              </tr>
              <tr>
              	<td>上级监管部门</td>
              	<td id="manageDept" colspan="3">
              		<span id="checkDeptMsg" style="display:block;float:left;"><input id="checkDeptMsgInput" type="text" disabled="disabled"/>
              		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="checkDept();">检测</a></span>
              		<span id="deptErrorMsg" style="display:none;display:block;float:left;margin-left:20px"></span>
              	</td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td class="m20"></td>
        </tr>
        <tr>
          <td class="fill_title"><img src="images/register/images/icon_b.gif" />&nbsp;请输入验证码&nbsp;<input type="text" id="validCode" name="validCode" class="input_text" style="width:100px;"/> &nbsp;&nbsp;<img id="imgValidCode" src="validCode.action" title="看不清，点击换一张" style="cursor:hand" onclick="changeCode(this)"/></td>
        </tr>
      </table>
	</div>
	<div id="zc"><img src="images/register/images/botton_1.png" onclick="submitForm(this);" style="CURSOR:hand;" /><img src="images/register/images/botton_2.png" onclick="history.back();" style="CURSOR:hand;margin-left:150px;"/>
  </div>
    </form>
	<div id="search" style="border:1px #7F9DB9 solid;display:none;"></div> 
</body>
</html>