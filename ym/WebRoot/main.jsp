<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html
PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html style=" overflow:hidden; height:100%; text-algin:center;">
<head>
<title>阳煤集团“两化融合”项目系统</title>
<link rel="stylesheet" type="text/css" href="resources/js/jquery/easyui-1.3/themes/cupertino/easyui.css"/>
<link rel="stylesheet" type="text/css" href="resources/js/jquery/easyui-1.3/themes/icon.css"/>
<script src="resources/js/jquery/jquery-1.7.2.js" type="text/javascript"></script>
<script type="text/javascript" src="resources/js/jquery/easyui-1.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="resources/js/jquery/easyui-1.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${ctx}/js/GisUtil.js"></script>

<!-- <link href="templets/template_2/css/JS_QQMenuGroup2.css" rel="stylesheet" type="text/css" /> -->
<link href="templets/template_2/css/template2.css" rel="stylesheet" type="text/css" />
<link href="css/newMenu.css" rel="stylesheet" type="text/css" />
<style>
#menuPosition {font-size:12px;}
#menuPosition .firstPosition{color:#000; font-weight: normal; font-size:13px;}
#menuPosition .position3{color:#222;}
#menuPosition .position2{color:#000; font-weight: normal; font-size:13px;}
#menuPosition .position1{color:#0945a5; font-size:13px; font-weight:normal}
#menuPosition .menuSplitStr{color:#5F6062; font-weight: normal;}
#user_clor{ color:#fff; font-family:"微软雅黑"; height:16px;font-weight:bold; float:left; font-size:13px;}
.top_bottom{ background:url(images/website.jpg) repeat-x; }
.panel-header{ background:url(images/li_tit.jpg) repeat-x; }
.back, .forward, .forward{ color:#000}
</style>
<script src="js/publicfun.js"></script>
<style>#menuPosition{font-size:13px; color:#666;float: left;  width: 70%; margin:0;}</style>

<script type="text/javascript">
//向上取整
	function DivUp(number1, number2) {
	    var n1 = Math.round(number1);
	    var n2 = Math.round(number2);
	    var result = n1 / n2;
	    if (result >= 0) {
	    	result = Math.ceil(result);
	    } else {
	    	result = Math.floor(result);
	    }
	    return result;
	}
	//向下取整
	function DivDown(number1, number2) {
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
	var groupCount = DivDown($(document).width(),180);
	//当前显示的菜单组number:group0
	var groupShowNumber = 1;
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
           		var groupNumber = DivUp(levelOneCount,groupCount);
                var li = $("<li class=\"level"+level+" group"+groupNumber+"\"></li>");
           	}else{
                var li = $("<li class=\"level"+level+"\"></li>");
           	}
            var url = menu_list[menu].menuUrl == ''? 'javascript:void(0)' : menu_list[menu].menuUrl;
            if(menu_list[menu].menuUrl == ''){
            	$(li).append('<a href="'+url+'" target="main" >'+ menu_list[menu].menuName+'</a>')
            		.append("<ul></ul>").appendTo(parent);
            } else {
            	$(li).append('<a href="'+url+'" target="main" onclick="addMenuInfo(this)">'+ menu_list[menu].menuName+'</a>')
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
		gis.showMain();
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
	//菜单下一页
	function goAfter(){
		if(groupShowNumber<groupTotalCount)
			groupShowNumber++;
		toggleMenu();
	}
	//菜单上一页
	function goBefore(){
		if(groupShowNumber>1)
			groupShowNumber--;
		toggleMenu();
	}
	$(function(){
		$.post('menu/menuAction!initMenu2.action',function(data){
			var data = eval('(' + data + ')');
			var showlist = $('#nav');
            showall(data, showlist);
            groupTotalCount = DivUp(levelOneCount,groupCount);
            if(groupTotalCount<=1){
            	$('#nav div.lee').hide();
            	return;
            }
            toggleMenu();
		});
	});
	function gisInit() {
		gis = new GisUtil(window.frames['GisMain'].linkFromBusinessPage, $('#main'), $('#GisMain'));
	}
</script>
</head>

<body style="overflow:hidden;">
		<div class="toptitle">
        <div style=" background:url(images/top_bg.jpg) center 0 no-repeat; height:87px;">
		<div class="topright" style="width: 800px;"></div>
		<div class="topshe">
        <div class=""></div>
        <table style="margin:15px 0 6px;" border="0" cellpadding="0" cellspacing="0">
        <tr><td><img src="images/user.png" style="vertical-align:middle; margin-right:2px;" /></td><td align="left"><div id="user_clor">当前用户：${user_name}</div>&nbsp;|
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
		    </script></td></tr>
        </table>
        <div id="link_clor">
              <div style="background:url(images/refresh.png) 0 center no-repeat; float:left; width:59px">
                <a class="dock-item" href="#" onClick="location.reload(true)"><span>刷新</span></a></div>
                <!--<a class="dock-item" href="#" onClick="location.reload(true)"><span>主页</span></a>&nbsp;&nbsp;-->
                <!--  <a class="dock-item" href="/safety-reportwizard/oldolap/olap/"
					target="main"><img
					src="templets/topright/icon_Statistic.png" alt="统计" /><span>统计</span></a>&nbsp;-->
                <div style="background:url(images/lout.png) 0 center no-repeat; width:69px; float:right; margin-left:15px">
                <a class="dock-item" href="${ctx}/logout!logout.action" style=" margin-right:10px;">退出	</a>
              </div>
        	  </div>
        
		   
            
		  </div>
          </div>
		</div>
		<div class="datewordspos" id='ces'>
			<%-- <div class="userinfo">当前用户：${user_name}</div> --%>
		</div>
	<div>
			<!-- 这里是菜单位置 -->
			<ul id="nav">
        
			<div class="lee" style="position: absolute;float: right; margin: 10px 10px 0 0; right:0; color:#FFF; height:30px;">
            <a href="#" onclick="goBefore();return false;" style="background:none; border:none"><img src="templets/template_2/top/roll_1.gif"/></a><a href="#" onclick="goAfter();return false;" style="background:none; border:none"><img src="templets/template_2/top/roll_2.gif" /></a>
			</div>
			</ul>
            <div class="top_bottom"><img src="templets/template_2/top/house.png" style=" float:left;" /><h2 id="menuPosition"><span class="firstPosition">您当前的位置</span></h2>
            <div style="float:right;margin:5px 35px 0 0;line-height:20px;">
            <a href="javascript:goBack();" class="back"><img src="images/weihai_index/back2.png" id="Image1" style="vertical-align:middle;margin:0px 5px 0 5px;" />后退</a>&nbsp;|&nbsp;
            <a href="javascript:goForward();" class="forward">前进<span class="forward"><img src="images/weihai_index/forward2.png" id="Image2" style="vertical-align:middle;margin:0px 0px 0 5px;" /></span></a>
            <!-- <a href="javascript:gis.toggle();" class="forward">切换</a> -->
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
			<iframe id="main" name="main" width="100%" src="welcome.jsp?type=1" style="display:none;" frameborder="0" onload="resize(this);" ></iframe>				
			<!-- <iframe id="GisMain" name="GisMain" width="100%" src="map/AYKJ.GISDevelopTestPage.aspx" frameborder="0" onload="resize(this);gisInit();" ></iframe>	 -->	
			<iframe id="GisMain" name="GisMain" width="100%" src="${ctx}/slideshow/demo.jsp?type=1" frameborder="0" onload="resize(this);gisInit();" ></iframe>		
		</div>
	</div>
	<div id="topWindow" style="display: none;">213124</div>
</body>
</html>