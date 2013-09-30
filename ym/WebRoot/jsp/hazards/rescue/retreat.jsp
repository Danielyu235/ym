<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>停产撤退</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<script type="text/javascript">
</script>
</head>
<body style="text-align: center;">
<div style="width: 900px; height: 450px;margin: 0 auto;padding: 0 auto;border: 0px solid #02507e;" >
			<form method="post" >
			    <div style="background-color: #1c7a9c;width: 100%; height: 400px;margin: 0 auto;padding: 0 auto;" align="center" name="addDiv" >
			    <font style="font-size: 25px;color: white;float: left;">停产撤人原则如下：</font>
					<table id="detailTable" cellpadding="5px" style="font-size:12px;line-height: 20px" cellspacing="1" 
					 border="0" bgcolor="#aed0ea" width="95%">
						<tr>
							<td width="1%"><input type="radio" name="retreat"/></td>
							<td width="35%">
							汛期本地区连续降雨达到大雨以上或气象预报为降雨橙色预警天气或受上游水库、河流等泄洪威胁时；或汛期本地24小时以内连续降雨达到50mm以上；或发现地面向井下溃水的。
							</td>
						</tr>
						<tr>
							<td width="1%"><input type="radio" name="retreat"/></td>
							<td width="35%">
							井下发生突水，危及矿井安全；或井下涌水量出现突增、有异常情况的。
							</td>
						</tr>
						<tr>
							<td width="1%"><input type="radio" name="retreat"/></td>
							<td width="35%">
							井下发生瓦斯、煤尘、火灾、冲击地压等事故的。
							</td>
						</tr>
						<tr>
							<td width="1%"><input type="radio" name="retreat"/></td>
							<td width="35%">
							供电线路发生故障，不能保证安全供电的。
							</td>
						</tr>
						<tr>
							<td width="1%"><input type="radio" name="retreat"/></td>
							<td width="35%">
							主要通风机发生故障，不能保证正常供风；或通风系 统遭到破坏；系统紊乱的，应立即下达停产撤人命令。
							</td>
						</tr>
						<tr>
							<td width="1%"><input type="radio" name="retreat"/></td>
							<td width="35%">
							发现安全检测监控系统出现障碍或出现报警的。
							</td>
						</tr>
						<tr>
							<td width="1%"><input type="radio" name="retreat"/></td>
							<td width="35%">
							煤层自燃发火指标气体超限或发现明火的应立即下达停产撤人命令。
							</td>
						</tr>
						<tr>
							<td width="1%"><input type="radio" name="retreat"/></td>
							<td width="35%">
							井下工作地点瓦斯等有害气体浓度超过规定的。
							</td>
						</tr>
						<tr>
							<td width="1%"><input type="radio" name="retreat"/></td>
							<td width="35%">
							采掘工作面冒顶，压力明显，不能及时采取有效措施防治冒顶。
							</td>
						</tr>
						<tr>
							<td width="1%"><input type="radio" name="retreat"/></td>
							<td width="35%">
							有其他危及井下人员安全险情的。
							</td>
						</tr>
				</table>
				<div style="float: right;">
					<a href="javascript:void(0)" title="事故录入" onclick="accident();"><img src="${ctx}/images/xyb.png"/></a>
				</div>
				</div>
			</form>
</div>
<script type="text/javascript">
	function accident(){
			parent.viewChildFunction('${ctx}/jsp/hazards/rescue/platformRescue.jsp?state=1','事故录入')
	}
</script>
</body>
</html>