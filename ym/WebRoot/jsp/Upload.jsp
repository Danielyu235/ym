<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@taglib prefix="s" uri="/struts-tags"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
        <title>上传文件</title>
    </head>
<body>
    <!-- 上传文件表单定义 -->
    <s:form action="upload" method="post" enctype="multipart/form-data">
	    <tr>	
		    <!-- 上传文件标签定义 -->	
		    <td>
		    	<s:file name="file"></s:file>
		        <s:submit name="submit" value="提交"></s:submit>
		        <br/>
		        <img alt="证件照" src="../img/head.jpg">
		    </td>	
	    </tr>
    </s:form>
</body>
</html>

