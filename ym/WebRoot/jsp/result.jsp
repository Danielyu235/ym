<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
%>
<html>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

        <title>上传结果</title>

    </head>
    <body >
        <!-- 显示上传成功文件名 -->
        <input type="hidden" name="employee.passport1" id="employee_passport1" value="<s:property value="fileFileName" />">
         <div>
        <img  class="imgshow" src="${ctx }/upload/<s:property value="fileFileName" />" id="imgResult" width="60%" height="80%">
         </div>
         
         
         
    <s:form action="upload" method="post" enctype="multipart/form-data">

    <!-- 上传文件标签定义 -->

    <s:file name="file"></s:file>
        <s:submit name="submit" value="提交"></s:submit>
    </s:form>
    </body>

</html>
