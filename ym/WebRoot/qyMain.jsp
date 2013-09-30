<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html
PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html style=" overflow:hidden; height:100%; text-algin:center;">
<head>
<title>威海市安全生产网格化监管平台</title>

<script src="resources/js/jquery/jquery-1.7.2.js" type="text/javascript"></script>
<!-- <link href="templets/template_2/css/JS_QQMenuGroup2.css" rel="stylesheet" type="text/css" /> -->
<script src="js/publicfun.js"></script>

<script type="text/javascript">
function Div(number1, number2) {
	    var n1 = Math.round(number1);
	    var n2 = Math.round(number2);
	    var result = n1 / n2;
	    if (result >= 0) {
	    	result = Math.floor(result);
	    } else {
	    	result = Math.ceil(result);
	    }
	    return result;
	}
	//菜单等级
	var level = 0;
	//1级菜单数量
	var levelOneCount = 0;
	//1级菜单1组10个
	var groupCount = 10;   
	
	
	
	
	//当前显示的菜单组number:group0
	var groupShowNumber = 0;
	//一共多少组
	var groupTotalCount = 0;
	function showall(menu_list, parent) {
        for (var menu in menu_list) {
        	level++;
        	if(level==1){
        		levelOneCount++;
        	}
        	if(typeof(menu_list[menu].children) == "undefined" )
        		continue;
           	if(level==1){
           		var groupNumber = Div(levelOneCount,groupCount);
                var li = $("<li class=\"level"+level+" group"+groupNumber+ " menuNumber" +levelOneCount + "\"></li>");
           	}else{
                var li = $("<li class=\"level"+level+"\"></li>");
           	}
            var url = menu_list[menu].menuUrl == ''? '#' : menu_list[menu].menuUrl;
            if(menu_list[menu].menuUrl == ''){
            	$(li).append('<a href="'+url+'" target="main" onclick="return false;" ><span class="span">'+ menu_list[menu].menuName+'</span></a>')
            		.append("<ul></ul>").appendTo(parent);
            } else {
            	$(li).append('<a href="'+url+'" target="main" onclick="addMenuInfo(this)"><span class="span">'+ menu_list[menu].menuName+'</span></a>')
        		.append("<ul></ul>").appendTo(parent);
            }
            if (menu_list[menu].children.length > 0) {
                showall(menu_list[menu].children, $(li).children().eq(1));
            }
            level--;
        }
    }
	
	//菜单位置中的菜单分隔符
	var menuSplitStr = '&nbsp;>&nbsp;';
	//菜单位置级别
	var menuPositionLevel = 0;
	//菜单点击操作记录
	var operationRecord = [];
	//菜单当前显示index
	var operationIndex = 0;
	//是否是前进后退的模拟点击操作
	var operationSimulator = false;
	//后退操作
	function goBack() {
		if(operationIndex<=1)
			return;
		operationIndex--;
		operationSimulator = true;
		var obj = operationRecord[operationIndex-1];
		obj.click();
	}
	//前进操作
	function goForward() {
		if(operationIndex>=operationRecord.length)
			return;
		operationIndex++;
		operationSimulator = true;
		var obj = operationRecord[operationIndex-1];
		obj.click();
	}
	//添加 当前位置信息
	function addMenuInfo(obj){
		//判断是否为前进或后退操作
		if(!operationSimulator){
			if(operationIndex<operationRecord.length) {
				operationRecord.splice(operationIndex,operationRecord.length-operationIndex);
				operationIndex = operationRecord.length;
			}
			operationRecord.push(obj);
			operationIndex++;
		} else {
			operationSimulator = false;
		}
		$('#menuPosition').html('<span class="firstPosition">您当前的位置：</span>');
		addAllMenuInfo($(obj),$('#menuPosition'));		
	}
	function addAllMenuInfo(obj,menuPosition){
		menuPositionLevel++;
		var parent = $(obj).parents('li').parents('li').children().eq(0);
		if($(parent).html() != null){
			addAllMenuInfo(parent,menuPosition);
			$(menuPosition).append('<span class="menuSplitStr">'+menuSplitStr+'</span>');
		}
		$(menuPosition).append('<span class="position' + menuPositionLevel + '">' + $(obj).html() +'</span>');
		menuPositionLevel--;
	}
	function toggleMenu(){
		for(var i =0 ; i<=groupTotalCount ;i++){
			if(i!=groupShowNumber)
				$(".group"+i).hide();
		}
		$(".group"+groupShowNumber).show();
	}
	function goAfter(){
		if(groupShowNumber<groupTotalCount)
			groupShowNumber++;
		toggleMenu();
	}
	function goBefore(){
		if(groupShowNumber>0)
			groupShowNumber--;
		toggleMenu();
	}
	$(function(){
		$.post('menu/menuAction!initMenu2.action',function(data){
			var data = eval('(' + data + ')');
			var showlist = $('#nav');
            showall(data, showlist);
            groupTotalCount = Div(levelOneCount,groupCount);
            toggleMenu();
		});
	});
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
</script>
<link href="css/newMenu _qyd.css" rel="stylesheet" type="text/css" />
<link href="templets/template_2/css/template2 _qyd.css" rel="stylesheet" type="text/css" />
<style>
#menuPosition {font-size:12px;}
#menuPosition .firstPosition{color:#005BB8; font-weight:bold;}
#menuPosition .position3{color:#222;}
#menuPosition .position2{color:#555;}
#menuPosition .position1{color:#888;}
#menuPosition .menuSplitStr{color:#888;}
</style>
</head>

<body style="overflow:hidden;" onload="MM_preloadImages('images/weihai_index/back.png','images/weihai_index/forward.png')">

    <div id="top">
   <div class="toptitle">
   <div class="topright">
<div class="topshe">
	<div style="float:right;width:90px;text-align:center;"><a class="dock-item" href="${ctx}/logout!logout.action" style=" margin-right:10px;">&nbsp;&nbsp;<img src="images/tuichu.png" style="vertical-align:middle;" />&nbsp;&nbsp;退出</a></div>
	<div style="float:right;width:90px;text-align:center;"><a class="dock-item" href="#" onClick="location.reload(true)"><img src="images/shuanxing.png" style="vertical-align:middle;" />&nbsp;&nbsp;刷新</a></div>
	<div style="float:right;width:110px;text-align:center;"><img src="images/icon_key.png" style="vertical-align:middle;margin-right:5px;" /><a href="javascript:void(0);" onclick="updatePassword();" class="dock-item">修改密码</a></div>
	<div style="float:right;width:200px;text-align:center;">
		<img src="images/icon_clock.png" style="vertical-align:middle;" />
		   <script type="text/javascript" language="javascript">
			    today = new Date();
			    function initArray()
			    {
				    this.length=initArray.arguments.length                
				    for(var i=0;i<this.length;i++)
				    this[i+1]=initArray.arguments[i]
			    }       
			    var d = new initArray
			    (
				    "星期日",                    
				    "星期一",                 
				    "星期二",
				    "星期三",
				    "星期四",    
				    "星期五",                       
				    "星期六"
			    );                                                             
	
			    document.write
			    (
				    "<span class='datewords'> ",
				    today.getFullYear()," 年 ",
				    today.getMonth()+1," 月 ",
				    today.getDate()," 日 ",
				    d[today.getDay()+1],
				    "</span>" 
			    );
			    
			    function updatePassword(){
			    	$("#main").attr("src","${ctx}/jsp/sys/sysSetting/updateUserPwd.jsp");
			    }
		    </script>
	</div>
	<div style="float:right;"><img src="images/icon_role.png" style="vertical-align:middle;margin-right:5px;" />当前用户：${user_name}</div>
			</div>
            <div class="datewordspos" id='ces'>
			<%-- <div class="userinfo">当前用户：${user_name}</div> --%>
		</div>
     </div>
     <div>
     <ul  id="nav">
	  </ul>
   </div>
   <div class="top_bottom"><img src="templets/template_2/top/house.png" style=" float:left;" /><h2 id="menuPosition"><span class="firstPosition">您当前的位置</span></h2>
   		<div style="float:right;margin:10px;">
        <a href="javascript:goBack();"><img src="images/weihai_index/back2.png" id="Image1" style="vertical-align:middle;margin:0px 5px 0 5px;" onmouseover="MM_swapImage('Image1','','images/weihai_index/back.png',1)" onmouseout="MM_swapImgRestore()" />后退</a>&nbsp;&nbsp;<a href="javascript:goForward();">前进<img src="images/weihai_index/forward2.png" id="Image2" style="vertical-align:middle;margin:0px 5px 0 5px;" onmouseover="MM_swapImage('Image2','','images/weihai_index/forward.png',1)" onmouseout="MM_swapImgRestore()" /></a>
        </div>
   </div>
  </div>
</div>
	<div style="height:80%;margin: 0;padding: 0;overflow: hidden; width:100%;">
		<div id="iframeTd" style="height:100%;margin: 0;padding: 0;overflow: hidden;">
			<script>
            function resize(){
                 document.getElementById("main").style.height=(document.getElementById('iframeTd').offsetHeight - 3)+'px';            
            }
            </script>
			<iframe id="main" name="main" width="100%" src="welcome.jsp?type=1" 
				style=""
				frameborder="0" onload="resize(this);" ></iframe>				
		</div>
	</div>
</body>
</html>