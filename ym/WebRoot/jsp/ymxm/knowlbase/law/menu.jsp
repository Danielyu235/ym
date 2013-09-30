<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/jqueryhead.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title></title>
    <script language="JavaScript">
</script>
	<link rel="StyleSheet" href="dtree.css" type="text/css" />
	<script type="text/javascript" src="dtree.js"></script>
  </head>
  
  <body>

<body style="height:100%; margin:0px; overflow:hidden;" scroll=auto>
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
	<td  id="frmtitle"  valign="top" width="10%" style="background-color: #EAF4FC">
		<div id="treediv" class="treediv bgtree">
			<div >	
		<script type="text/javascript">

		            d = new dTree('d');
					d.add(0,-1,'颁布地区');
					d.add(5,0,'全国',"${ctx}/jsp/ymxm/knowlbase/law/law.jsp?prom_area=0ad48f4eca204eb38f67cab8ffe64565",'','mainframe2','qg.png');		
					d.add(2,0,'省份',"${ctx}/jsp/ymxm/knowlbase/law/law.jsp?prom_area=b06605ed525342a091a30ae98f5dce53",'','mainframe2','sj.png');
					d.add(3,0,'集团',"${ctx}/jsp/ymxm/knowlbase/law/law.jsp?prom_area=f1a9ef1ad6f84361985a558cc456f1fb",'','mainframe2','qj.png');
					
					d.config.closeSameLevel = true;//打开本文件夹关闭同级的其他文件夹   
					d.config.useSelection = true;//选中的节点背景色设置
				
					document.write(d);
					d.openAll(); 	

		//-->
	</script>

			</div>
		</div>
	</td>
	<td valign="top">
		<iframe id="mainframe2" name="mainframe2" width="95%" src="${ctx}/jsp/ymxm/knowlbase/law/law.jsp" style="height: 572px; " frameborder="0" ></iframe>
    </td>
    </tr>
</table>
  </body>
</html>
