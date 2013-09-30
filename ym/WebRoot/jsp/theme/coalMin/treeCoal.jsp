<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/jqueryhead.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>    
  	<title></title>
	<link rel="StyleSheet" href="dtree.css" type="text/css" />
	<script type="text/javascript" src="dtree.js"></script>
</head>	
	<body style="height:100%; margin:0px; overflow:hidden;" scroll=auto>
	<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
  		<tr>
			<td  id="frmtitle"  valign="top" width="10%" style="background-color: #EAF4FC">
				<div id="treediv" class="treediv bgtree" style="overflow-y:scroll;width:200px; height:100%;">
					<div>	
						<script type="text/javascript">
				            d = new dTree('d');
							d.add(0,-1,'采煤');
							d.add(1,0,'队组',"${ctx}/jsp/reputation/reputation.jsp?departmentf=8c070fa733c34d789f58ddf2ef2b81f8",'','mainframe2','sj.png');	
							d.add(10,1,'综采一队',"${ctx}/jsp/reputation/reputation.jsp?departments=a88cd548809e4bf1b2ca36a05cede3f2",'','mainframe2','qg.png');
							d.add(11,1,'综采二队',"${ctx}/jsp/reputation/reputation.jsp?departments=736bedc9975f4cdda08c22f8831063e4",'','mainframe2','qg.png');	
							d.add(12,1,'综采三队',"${ctx}/jsp/reputation/reputation.jsp?departments=321b5a2de1ce4710ab5006964706ef93",'','mainframe2','qg.png');
							d.add(13,1,'综采四队',"${ctx}/jsp/reputation/reputation.jsp?departments=0bf19929e76f4044afef299857adfbfd",'','mainframe2','qg.png');
							d.add(14,1,'掘进一队',"${ctx}/jsp/reputation/reputation.jsp?departments=ffda59d6c3e84d3c9a3968a53454055a",'','mainframe2','qg.png');
							d.add(15,1,'掘进二队',"${ctx}/jsp/reputation/reputation.jsp?departments=bf7dc8ad9bcb47b382a3312dc9c60ccc",'','mainframe2','qg.png');
							d.add(16,1,'掘进三队',"${ctx}/jsp/reputation/reputation.jsp?departments=0d5529c7ec134466986c9eff3a9956a6",'','mainframe2','qg.png');
							d.add(17,1,'掘进四队',"${ctx}/jsp/reputation/reputation.jsp?departments=4ae85b6b995443c7b97fb0c7aa66cb27",'','mainframe2','qg.png');
							d.add(18,1,'掘进五队',"${ctx}/jsp/reputation/reputation.jsp?departments=10ffc991a85d4f6586b2145148223cb4",'','mainframe2','qg.png');
							d.add(19,1,'掘进六队',"${ctx}/jsp/reputation/reputation.jsp?departments=a88cd548809e4bf1b2ca36a05cede3f2",'','mainframe2','qg.png');
															
							d.config.closeSameLevel = true;//打开本文件夹关闭同级的其他文件夹    	
							d.config.useSelection = true;//选中的节点背景色设置
						
							document.write(d);
							d.openAll(); 	
						</script>
					</div>
				</div>
			</td>
			<td valign="top">
				<iframe id="mainframe2" name="mainframe2" src="${ctx}/jsp/theme/coalMin/calendar.jsp" style="height:600px;width:98%" frameborder="0" ></iframe>
		    </td>
    	</tr>
	</table>
</body>
</html>
