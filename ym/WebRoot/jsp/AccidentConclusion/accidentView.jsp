<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>事故总结</title>
	<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
	<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/CrudUtilAccident.js"></script>
	<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
	<script type="text/javascript" src="${ctx}/js/jquery.PrintArea.js"></script>
</head>
<body>
	<div>
		<div class="easyui-tabs" style="height:530px">
			<div title="事故总结报告" data-options="href:'${ctx}/jsp/AccidentConclusion/AccidentConclusion.jsp?aid=<%=request.getParameter("aid") %>'">
				<!--<iframe src="${ctx}/jsp/AccidentConclusion/AccidentConclusion.jsp?aid=<%=request.getParameter("aid") %>" style="width:98%;height:95%" rameborder="0" marginheight="0" marginwidth="0"></iframe>
				-->
			</div>
			<div title="事故调查报告" data-options="href:'${ctx}/jsp/accidentsurvey/AccidentSurvery.jsp?aid=<%=request.getParameter("aid")%>'">
				<!--<iframe src="${ctx}/jsp/accidentsurvey/AccidentSurvery.jsp?aid=<%=request.getParameter("aid") %>" style="width:98%;height:95%" rameborder="0" marginheight="0" marginwidth="0"></iframe>-->
			</div>
		</div>
	</div>
</body>
</html>