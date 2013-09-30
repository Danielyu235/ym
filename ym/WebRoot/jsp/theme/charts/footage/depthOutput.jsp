<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta content="mshtnl 6.00.2800.1589" name="generator">
<style type=text/css>
body { font-size: 14px; font-family: "宋体" }
ol li { margin: 8px }
#con { font-size: 12px; margin: 0px auto; width: 100% }
#tags { padding-right: 0px; padding-left: 0px; padding-bottom: 0px; margin: 0; width: 400px; padding-top: 0px; height: 23px }
#tags li { background: url(../images/tagleft.gif) no-repeat left bottom; float: left; margin-right: 1px; list-style-type: none; height: 23px }
#tags li a { padding-right: 10px; padding-left: 10px; background: url(../images/tagright.gif) no-repeat right bottom; float: left; padding-bottom: 0px; color: #999; line-height: 23px; padding-top: 0px; height: 23px; text-decoration: none }
#tags li.emptyTag { background: none transparent scroll repeat 0% 0%; width: 4px }
#tags li.selectTag { background-position: left top; margin-bottom: -2px; position: relative; height: 25px }
#tags li.selectTag a { background-position: right top; color: #000; line-height: 25px; height: 25px }
#tagContent { border-right: #aecbd4 1px solid; padding-right: 1px; border-top: #aecbd4 1px solid; padding-left: 1px; padding-bottom: 1px; border-left: #aecbd4 1px solid; padding-top: 1px; border-bottom: #aecbd4 1px solid; background-color: #fff }
.tagContent { padding:10px; display: none; background: url(../images/bg.gif) repeat-x; color: #474747; height: 80%; }
#tagContent div.selectTag { display: block }
</style>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript">
    function selectTag(showContent,selfObj){
    	// 操作标签
    	var tag = document.getElementById("tags").getElementsByTagName("li");
    	var taglength = tag.length;
    	for(i=0; i<taglength; i++){
    		tag[i].className = "";
    	}
    	selfObj.parentNode.className = "selectTag";
    	// 操作内容
    	for(i=0; j=document.getElementById("tagContent"+i); i++){
    		j.style.display = "none";
    	}
    	document.getElementById(showContent).style.display = "block";
    }
</script>
</head>
<body>
<div id="con">
  <ul id="tags">
    <li class=selectTag><a href="javascript:void(0)" onClick="selectTag('tagContent0',this)">掘进进尺折线图</a> </li>
    <li><a href="javascript:void(0)" onClick="selectTag('tagContent1',this)">掘进进尺柱状图</a> </li>
  </ul>
  <div id="tagContent">
    <!-- 第一标签位 -->
    <div class="tagContent  selectTag" id="tagContent0">
    	<iframe src="depthLine.jsp" width="100%;" height="100%;" style="overflow: hidden;" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowTransparency="true"></iframe>
    </div>
    <!-- 第二标签位 -->
    <div class="tagContent" id="tagContent1">
   		<iframe src="depthColumn.jsp" width="100%;" height="100%;" style="overflow: hidden;" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowTransparency="true"></iframe>
    </div>
  </div>
</div>
<p>
</body>
</html>
