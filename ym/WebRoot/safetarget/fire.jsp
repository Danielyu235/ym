<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="/ym/css/font-awesome.min.css"/>
<link rel="stylesheet" href="/ym/css/buttons.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/table.css" rel="stylesheet" type="text/css" />
<title>煤矿火灾调查问卷</title>
<style type="text/css">
#Layer1 {
	margin: 0 auto;
	width:743px;
	height:1654px;
	z-index:1;
	left: 271px;
	top: 27px;
}
.primary {
  background: -webkit-gradient(linear, 50% 0%, 50% 100%, color-stop(0%, #00b5e5), color-stop(100%, #008db2));
  background: -webkit-linear-gradient(top, #00b5e5, #008db2);
  background: -moz-linear-gradient(top, #00b5e5, #008db2);
  background: -o-linear-gradient(top, #00b5e5, #008db2);
  background: linear-gradient(top, #00b5e5, #008db2);
  background-color: #00a1cb;
  border-color: #007998;
  color: white;
  font-size:18px;
  text-shadow: 0 -1px 1px rgba(0, 40, 50, 0.35);
}
</style>
<script type="text/javascript">
function goSubmit(){
	//alert('d');
   MyForm.submit();
}

</script>
</head>

<body>
<center>
<form id="MyForm" action="${ctx }/safeTarget/safeTargetAction!fireTest" method="post">
<div id="Layer1">
  <a href="javascript:void(0);" onclick="_use('tb1','stateBut');" class="button button-primary">查看事故树</a>
  <div id="tb1" style="display: none;">
	<div style="width:890px;">
    	<div class="primary">事故树</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
		<div id="search" style="width: 890px;height: 537px;">
			<img src="${ctx}/images/shigushu.jpg" alt="事故树" />
		</div>
	</div>
</div>
  <table border="1" cellspacing="0" cellpadding="0">
     <tr>
      <th width="58"><div align="center">
         <p align="center"> <strong>符号</strong></p></div></th>
      <th width="187"><p align="center"><strong>事件名称</strong><strong> </strong></p></th>
      <th width="157"><p align="center"><strong>基本事件影响因素</strong><strong> </strong></p></th>
      <th width="255" valign="center"><p align="center"><strong> </strong></p>
        <p align="center"><strong>发生可能性（或影响程度）等级</strong></p>
        <p align="center"><strong> </strong></p></th>
    </tr>
    <tr>
      <td width="7%"><p align="center">T</p></td>
      <td width="23%"><p align="center">煤矿火灾 </p></td>
      <td width="23%"><p align="center">&nbsp;</p></td>
      <td width="45%" valign="top"><p align="center">&nbsp;</p></td>
      </tr>
    <tr>
      <td width="7%"><p align="center">M1</p></td>
      <td width="23%"><p align="center">可燃物 </p></td>
      <td width="23%"><p align="center">&nbsp;</p></td>
      <td width="45%" valign="top"><p align="center">&nbsp;</p></td>
      </tr>
    <tr>
      <td width="7%"><p align="center">M2</p></td>
      <td width="23%"><p align="center">引燃火源 </p></td>
      <td width="23%"><p align="center">&nbsp;</p></td>
      <td width="45%" valign="top"><p align="center">&nbsp;</p></td>
      </tr>
    <tr>
      <td width="7%"><p align="center">M3</p></td>
      <td width="23%"><p align="center">瓦斯积聚 </p></td>
      <td width="23%"><p align="center">&nbsp;</p></td>
      <td width="45%" valign="top"><p align="center">&nbsp;</p></td>
      </tr>
    <tr>
      <td width="7%"><p align="center">M4</p></td>
      <td width="23%"><p align="center">电气火源 </p></td>
      <td width="23%"><p align="center">&nbsp;</p></td>
      <td width="45%" valign="top"><p align="center">&nbsp;</p></td>
      </tr>
    <tr>
      <td width="7%"><p align="center">M5</p></td>
      <td width="23%"><p align="center">放炮火源 </p></td>
      <td width="23%"><p align="center">&nbsp;</p></td>
      <td width="45%" valign="top"><p align="center">&nbsp;</p></td>
      </tr>
    <tr>
      <td width="7%"><p align="center">M6</p></td>
      <td width="23%"><p align="center">摩擦撞击火花 </p></td>
      <td width="23%"><p align="center">&nbsp;</p></td>
      <td width="45%" valign="top"><p align="center">&nbsp;</p></td>
      </tr>
    <tr>
      <td width="7%"><p align="center">M7</p></td>
      <td width="23%"><p align="center">综合性因素 </p></td>
      <td width="23%"><p align="center">&nbsp;</p></td>
      <td width="45%" valign="top"><p align="center">&nbsp;</p></td>
      </tr>
    <tr>
      <td width="7%"><p align="center">M8</p></td>
      <td width="23%"><p align="center">通风系统原因 </p></td>
      <td width="23%"><p align="center">&nbsp;</p></td>
      <td width="45%" valign="top"><p align="center">&nbsp;</p></td>
      </tr>
    <tr>
      <td width="7%"><p align="center">M9</p></td>
      <td width="23%"><p align="center">通风设备原因 </p></td>
      <td width="23%"><p align="center">&nbsp;</p></td>
      <td width="45%" valign="top"><p align="center">&nbsp;</p></td>
      </tr>
    <tr>
      <td width="7%"><p align="center">M10</p></td>
      <td width="23%"><p align="center">瓦斯检测原因 </p></td>
      <td width="23%"><p align="center">&nbsp;</p></td>
      <td width="45%" valign="top"><p align="center">&nbsp;</p></td>
      </tr>
    <tr>
      <td width="7%"><p align="center">M11</p></td>
      <td width="23%"><p align="center">线路破损或设备短路 </p></td>
      <td width="23%"><p align="center">&nbsp;</p></td>
      <td width="45%" valign="top"><p align="center">&nbsp;</p></td>
      </tr>
    <tr>
      <td width="7%" rowspan="2"><p align="center">C1</p></td>
      <td width="23%" rowspan="2"><p align="center">未及时处理 </p></td>
      <td width="23%"><p align="center">未处理 </p></td>
      <td width="45%"><p align="center">
	  <select name="select0" class="u628" id="select0"   >
          <option  value="0.030">很小</option>
          <option  value="0.045">小</option>
          <option  value="0.06">中</option>
          <option  value="0.075">大</option>
          <option  value="0.090">很大</option>
        </select>
</p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">未按规程处理 </p></td>
      <td width="45%"><p align="center">
        <select name="select1" class="u628" id="select1"   >
          <option  value="0.030">很小</option>
          <option  value="0.045">小</option>
          <option  value="0.06">中</option>
          <option  value="0.075">大</option>
          <option  value="0.090">很大</option>
        </select>				
      </p></td>
      </tr>
    <tr>
      <td width="7%"><p align="center">X1</p></td>
      <td width="23%"><p align="center">遗煤 </p></td>
      <td width="23%"><p align="center">管理状况-<br />
        开采技术装备条件-</p></td>
      <td width="45%"><p align="center">
        <select name="select2" class="u628" id="select2"   >
          <option  value="0">很小</option>
          <option  value="0.0005">小</option>
          <option  value="0.001">中</option>
          <option  value="0.0015">大</option>
          <option  value="0.002">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="7%"><p align="center">X2</p></td>
      <td width="23%"><p align="center">皮带 </p></td>
      <td width="23%"><p align="center">&nbsp;</p></td>
      <td width="45%"><p align="center">
        <select name="select3" class="u628" id="select3"   >
          <option  value="0">很小</option>
          <option  value="0.0005">小</option>
          <option  value="0.001">中</option>
          <option  value="0.0015">大</option>
          <option  value="0.002">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="7%"><p align="center">X3</p></td>
      <td width="23%"><p align="center">木支架 </p></td>
      <td width="23%"><p align="center">&nbsp;</p></td>
      <td width="45%"><p align="center">
        <select name="select4" class="u628" id="select4"   >
          <option  value="0">很小</option>
          <option  value="0.0005">小</option>
          <option  value="0.001">中</option>
          <option  value="0.0015">大</option>
          <option  value="0.002">很大</option>
        </select>				
      </p></td>
      </tr>
    <tr>
      <td width="7%"><p align="center">X4</p></td>
      <td width="23%"><p align="center">煤炭自燃 </p></td>
      <td width="23%"><p align="center">水分+<br />
        粒度-<br />
        种类（烟煤&gt;褐煤&gt;无烟煤） </p></td>
      <td width="45%"><p align="center">
        <select name="select5" class="u628" id="select5"   >
          <option  value="0.0007">很小</option>
          <option  value="0.00085">小</option>
          <option  value="0.001">中</option>
          <option  value="0.00115">大</option>
          <option  value="0.0013">很大</option>
        </select>
      </p></td>				
      </tr>
    <tr>
      <td width="7%" rowspan="2"><p align="center">X5</p></td>
      <td width="23%" rowspan="2"><p align="center">吸烟明火 </p></td>
      <td width="23%" height="27"><p align="center">未规定严禁烟火 </p></td>
      <td width="45%"><p align="center">
        <select name="select6" class="u628" id="select6"   >
          <option  value="0.0007">很小</option>
          <option  value="0.00085">小</option>
          <option  value="0.001">中</option>
          <option  value="0.00115">大</option>
          <option  value="0.0013">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">执行严禁烟火规定不严 </p></td>
      <td width="45%"><p align="center">
        <select name="select7" class="u628" id="select7"   >
          <option  value="0.0007">很小</option>
          <option  value="0.00085">小</option>
          <option  value="0.001">中</option>
          <option  value="0.00115">大</option>
          <option  value="0.0013">很大</option>
        </select>				
      </p></td>
      </tr>
    <tr>
      <td width="7%" rowspan="4"><p align="center">X6</p></td>
      <td width="23%" rowspan="4"><p align="center">电气设备失爆 </p></td>
      <td width="23%"><p align="center">隔爆外壳裂纹、变形、开焊 </p></td>
      <td width="45%"><p align="center">
        <select name="select8" class="u628" id="select8"   >
          <option  value="0.001">很小</option>
          <option  value="0.002">小</option>
          <option  value="0.003">中</option>
          <option  value="0.004">大</option>
          <option  value="0.005">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">隔爆接合面严重锈蚀、机械损伤 </p></td>
      <td width="45%"><p align="center">
        <select name="select9" class="u628" id="select9"   >
          <option  value="0.001">很小</option>
          <option  value="0.002">小</option>
          <option  value="0.003">中</option>
          <option  value="0.004">大</option>
          <option  value="0.005">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">闭锁装置不全 </p></td>
      <td width="45%"><p align="center">
        <select name="select10" class="u628" id="select10"   >
          <option  value="0.001">很小</option>
          <option  value="0.002">小</option>
          <option  value="0.003">中</option>
          <option  value="0.004">大</option>
          <option  value="0.005">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">隔爆腔贯通 </p></td>
      <td width="45%"><p align="center">
        <select name="select11" class="u628" id="select11"   >
          <option  value="0.001">很小</option>
          <option  value="0.002">小</option>
          <option  value="0.003">中</option>
          <option  value="0.004">大</option>
          <option  value="0.005">很大</option>
        </select>				
      </p></td>
      </tr>
    <tr>
      <td width="7%" rowspan="2"><p align="center">X7</p></td>
      <td width="23%" rowspan="2"><p align="center">设备火花 </p></td>
      <td width="23%"><p align="center">架线式电机车火花 </p></td>
      <td width="45%"><p align="center">
        <select name="select12" class="u628" id="select12"   >
          <option  value="0">很小</option>
          <option  value="0.001">小</option>
          <option  value="0.002">中</option>
          <option  value="0.003">大</option>
          <option  value="0.004">很大</option>
        </select>				
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">照明设备火花 </p></td>
      <td width="45%"><p align="center">
        <select name="select13" class="u628" id="select13"   >
          <option  value="0">很小</option>
          <option  value="0.001">小</option>
          <option  value="0.002">中</option>
          <option  value="0.003">大</option>
          <option  value="0.004">很大</option>
        </select>
      </p></td>				
      </tr>
    <tr>
      <td width="7%" rowspan="2"><p align="center">X8</p></td>
      <td width="23%" rowspan="2"><p align="center">电弧放电 </p></td>
      <td width="23%"><p align="center">进湿受潮 </p></td>
      <td width="45%"><p align="center">
        <select name="select14" class="u628" id="select14"   >
          <option  value="0">很小</option>
          <option  value="0.0005">小</option>
          <option  value="0.001">中</option>
          <option  value="0.0015">大</option>
          <option  value="0.002">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">电压过高 </p></td>
      <td width="45%"><p align="center">
        <select name="select15" class="u628" id="select15"   >
          <option  value="0">很小</option>
          <option  value="0.0005">小</option>
          <option  value="0.001">中</option>
          <option  value="0.0015">大</option>
          <option  value="0.002">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="7%"><p align="center">X9</p></td>
      <td width="23%"><p align="center">带电维修 </p></td>
      <td width="23%"><p align="center">&nbsp;</p></td>
      <td width="45%"><p align="center">
        <select name="select16" class="u628" id="select16"   >
          <option  value="0">很小</option>
          <option  value="0.0005">小</option>
          <option  value="0.001">中</option>
          <option  value="0.0015">大</option>
          <option  value="0.002">很大</option>
        </select>
      </p></td>				
      </tr>
    <tr>
      <td width="7%" rowspan="2"><p align="center">X10</p></td>
      <td width="23%" rowspan="2"><p align="center">拆卸灯具出火 </p></td>
      <td width="23%"><p align="center">未用防爆型灯具 </p></td>
      <td width="45%"><p align="center">
        <select name="select17" class="u628" id="select17"   >
          <option  value="0">很小</option>
          <option  value="0.0005">小</option>
          <option  value="0.001">中</option>
          <option  value="0.0015">大</option>
          <option  value="0.002">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">灯具防爆性能不符合要求 </p></td>
      <td width="45%"><p align="center">
        <select name="select18" class="u628" id="select18"   >
          <option  value="0">很小</option>
          <option  value="0.0005">小</option>
          <option  value="0.001">中</option>
          <option  value="0.0015">大</option>
          <option  value="0.002">很大</option>
        </select>				
      </p></td>
      </tr>
	 <tr>
      <td width="7%" rowspan="4"><p align="center">X11</p></td>
      <td width="23%" rowspan="4"><p align="center">电缆被击穿 </p></td>
      <td width="23%"><p align="center">高压窜入(很小)</p></td>
      <td width="45%"><p align="center">
        <select name="select19" class="u628" id="select19"   >
          <option  value="0">很小</option>
          <option  value="0.0005">小</option>
          <option  value="0.001">中</option>
          <option  value="0.0015">大</option>
          <option  value="0.002">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">保护层腐蚀或失效（中） </p></td>
      <td width="45%"><p align="center">
        <select name="select20" class="u628" id="select20"   >
          <option  value="0">很小</option>
          <option  value="0.0005">小</option>
          <option  value="0.001">中</option>
          <option  value="0.0015">大</option>
          <option  value="0.002">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">外部机械损伤（很大） </p></td>
      <td width="45%"><p align="center">
        <select name="select21" class="u628" id="select21"   >
          <option  value="0">很小</option>
          <option  value="0.0005">小</option>
          <option  value="0.001">中</option>
          <option  value="0.0015">大</option>
          <option  value="0.002">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">产品质量不合格（大） </p></td>
      <td width="45%"><p align="center">
        <select name="select22" class="u628" id="select22"   >
          <option  value="0">很小</option>
          <option  value="0.0005">小</option>
          <option  value="0.001">中</option>
          <option  value="0.0015">大</option>
          <option  value="0.002">很大</option>
        </select>				
      </p></td>
      </tr>
    <tr>
      <td width="7%" rowspan="2"><p align="center">X12</p></td>
      <td width="23%" rowspan="2"><p align="center">电焊或气焊 </p></td>
      <td width="23%"><p align="center">焊接火花 </p></td>
      <td width="45%"><p align="center">
        <select name="select23" class="u628" id="select23"   >
          <option  value="0">很小</option>
          <option  value="0.0015">小</option>
          <option  value="0.003">中</option>
          <option  value="0.0045">大</option>
          <option  value="0.006">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">焊接高温 </p></td>
      <td width="45%"><p align="center">
        <select name="select24" class="u628" id="select24"   >
          <option  value="0">很小</option>
          <option  value="0.0015">小</option>
          <option  value="0.003">中</option>
          <option  value="0.0045">大</option>
          <option  value="0.006">很大</option>
        </select>
      </p></td>
      </tr>				
    <tr>
      <td width="7%"><p align="center">X13</p></td>
      <td width="23%"><p align="center">电气设备露明线头 </p></td>
      <td width="23%"><p align="center">&nbsp;</p></td>
      <td width="45%"><p align="center">
        <select name="select25" class="u628" id="select25"   >
          <option  value="0">很小</option>
          <option  value="0.0035">小</option>
          <option  value="0.007">中</option>
          <option  value="0.0105">大</option>
          <option  value="0.014">很大</option>
        </select>				
      </p></td>
      </tr>
    <tr>
      <td width="7%" rowspan="2"><p align="center">X14</p></td>
      <td width="23%" rowspan="2"><p align="center">线路破损 </p></td>
      <td width="23%"><p align="center">鸡爪子或羊尾巴破口 </p></td>
      <td width="45%"><p align="center">
        <select name="select26" class="u628" id="select26"   >
          <option  value="0">很小</option>
          <option  value="0.015">小</option>
          <option  value="0.03">中</option>
          <option  value="0.045">大</option>
          <option  value="0.060">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">电缆露芯线 </p></td>
      <td width="45%"><p align="center">
        <select name="select27" class="u628" id="select27"   >
          <option  value="0">很小</option>
          <option  value="0.015">小</option>
          <option  value="0.03">中</option>
          <option  value="0.045">大</option>
          <option  value="0.060">很大</option>
        </select>			
      </p></td>
      </tr>
    <tr>
      <td width="7%" rowspan="2"><p align="center">X15</p></td>
      <td width="23%" rowspan="2"><p align="center">设备接线盒短路 </p></td>
      <td width="23%"><p align="center">未设短路保护 </p></td>
      <td width="45%"><p align="center">
        <select name="select28" class="u628" id="select28"   >
          <option  value="0">很小</option>
          <option  value="0.0035">小</option>
          <option  value="0.007">中</option>
          <option  value="0.0105">大</option>
          <option  value="0.014">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">保护失效 </p></td>
      <td width="45%"><p align="center">
        <select name="select29" class="u628" id="select29"   >
          <option  value="0">很小</option>
          <option  value="0.0035">小</option>
          <option  value="0.007">中</option>
          <option  value="0.0105">大</option>
          <option  value="0.014">很大</option>
        </select>				
      </p></td>
      </tr>
    <tr>
      <td width="7%" rowspan="2"><p align="center">X16</p></td>
      <td width="23%" rowspan="2"><p align="center">装药不当 </p></td>
      <td width="23%"><p align="center">装药过多 </p></td>
      <td width="45%"><p align="center">
        <select name="select30" class="u628" id="select30"   >
          <option  value="0">很小</option>
          <option  value="0.0015">小</option>
          <option  value="0.003">中</option>
          <option  value="0.0045">大</option>
          <option  value="0.006">很大</option>
        </select>				
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">使用非煤矿炸药 </p></td>
      <td width="45%"><p align="center">
        <select name="select31" class="u628" id="select31"   >
          <option  value="0">很小</option>
          <option  value="0.0015">小</option>
          <option  value="0.003">中</option>
          <option  value="0.0045">大</option>
          <option  value="0.006">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="7%" rowspan="2"><p align="center">X17</p></td>
      <td width="23%" rowspan="2"><p align="center">抵抗线不足 </p></td>
      <td width="23%"><p align="center">长度不合规定 </p></td>
      <td width="45%"><p align="center">
        <select name="select32" class="u628" id="select32"   >
          <option  value="0">很小</option>
          <option  value="0.002">小</option>
          <option  value="0.004">中</option>
          <option  value="0.006">大</option>
          <option  value="0.008">很大</option>
        </select>				
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">个数与自由面不匹配 </p></td>
      <td width="45%"><p align="center">
        <select name="select33" class="u628" id="select33"   >
          <option  value="0">很小</option>
          <option  value="0.002">小</option>
          <option  value="0.004">中</option>
          <option  value="0.006">大</option>
          <option  value="0.008">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="7%" rowspan="2"><p align="center">X18</p></td>
      <td width="23%" rowspan="2"><p align="center">炸药质量不合格 </p></td>
      <td width="23%"><p align="center">吸湿结块 </p></td>
      <td width="45%"><p align="center">
        <select name="select34" class="u628" id="select34"   >
          <option  value="0.039">很小</option>
          <option  value="0.040">小</option>
          <option  value="0.041">中</option>
          <option  value="0.042">大</option>
          <option  value="0.043">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">过期变质 </p></td>
      <td width="45%"><p align="center">
        <select name="select35" class="u628" id="select35"   >
          <option  value="0.039">很小</option>
          <option  value="0.040">小</option>
          <option  value="0.041">中</option>
          <option  value="0.042">大</option>
          <option  value="0.043">很大</option>
        </select>				
      </p></td>
      </tr>
    <tr>
      <td width="7%" rowspan="2"><p align="center">X19</p></td>
      <td width="23%" rowspan="2"><p align="center">放炮器出火 </p></td>
      <td width="23%"><p align="center">非防爆型 </p></td>
      <td width="45%"><p align="center">
        <select name="select36" class="u628" id="select36"   >
          <option  value="0">很小</option>
          <option  value="0.0005">小</option>
          <option  value="0.001">中</option>
          <option  value="0.0015">大</option>
          <option  value="0.002">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">放炮器故障 </p></td>
      <td width="45%"><p align="center">
        <select name="select37" class="u628" id="select37"   >
          <option  value="0">很小</option>
          <option  value="0.0005">小</option>
          <option  value="0.001">中</option>
          <option  value="0.0015">大</option>
          <option  value="0.002">很大</option>
        </select>			
      </p></td>
      </tr>      
      	<tr>
      <td width="7%" rowspan="2"><p align="center">X20</p></td>
      <td width="23%" rowspan="2"><p align="center">违章放炮  </p></td>
      <td width="23%"><p align="center">用明火或者动力线放炮 </p></td>
      <td width="45%"><p align="center">
        <select name="select38" class="u628" id="select38"   >
          <option  value="0.005">很小</option>
          <option  value="0.006">小</option>
          <option  value="0.007">中</option>
          <option  value="0.008">大</option>
          <option  value="0.009">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">不同类型雷管混用 </p></td>
      <td width="45%"><p align="center">
        <select name="select39" class="u628" id="select39"   >
          <option  value="0.005">很小</option>
          <option  value="0.006">小</option>
          <option  value="0.007">中</option>
          <option  value="0.008">大</option>
          <option  value="0.009">很大</option>
        </select>				
      </p></td>
      </tr>

	<tr>
      <td width="7%" rowspan="2"><p align="center">X21</p></td>
      <td width="23%" rowspan="2"><p align="center">封泥不足 </p></td>
      <td width="23%"><p align="center">未封满填实 </p></td>
      <td width="45%"><p align="center">
        <select name="select40" class="u628" id="select40"   >
          <option  value="0">很小</option>
          <option  value="0.002">小</option>
          <option  value="0.004">中</option>
          <option  value="0.006">大</option>
          <option  value="0.008">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">未装座底炮泥 </p></td>
      <td width="45%"><p align="center">
        <select name="select41" class="u628" id="select41"   >
          <option  value="0">很小</option>
          <option  value="0.002">小</option>
          <option  value="0.004">中</option>
          <option  value="0.006">大</option>
          <option  value="0.008">很大</option>
        </select>				
      </p></td>
      </tr>
    <tr>
      <td width="7%" rowspan="2"><p align="center">X22</p></td>
      <td width="23%" rowspan="2"><p align="center">凿岩机、煤电钻火花 </p></td>
      <td width="23%"><p align="center">未用隔爆型 </p></td>
      <td width="45%"><p align="center">
        <select name="select42" class="u628" id="select42"   >
          <option  value="0">很小</option>
          <option  value="0.0015">小</option>
          <option  value="0.003">中</option>
          <option  value="0.0045">大</option>
          <option  value="0.006">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">隔爆性能不合要求 </p></td>
      <td width="45%"><p align="center">
        <select name="select43" class="u628" id="select43"   >
          <option  value="0">很小</option>
          <option  value="0.0015">小</option>
          <option  value="0.003">中</option>
          <option  value="0.0045">大</option>
          <option  value="0.006">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="7%" rowspan="4"><p align="center">X23</p></td>
      <td width="23%" rowspan="4"><p align="center">运输设备摩擦火花 </p></td>
      <td width="23%"><p align="center">皮带打滑产生火花 </p></td>
      <td width="45%"><p align="center">
        <select name="select44" class="u628" id="select44"   >
          <option  value="0">很小</option>
          <option  value="0.0015">小</option>
          <option  value="0.003">中</option>
          <option  value="0.0045">大</option>
          <option  value="0.006">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">钢绳与轨道摩擦 </p></td>
      <td width="45%"><p align="center">
        <select name="select45" class="u628" id="select45"   >
          <option  value="0">很小</option>
          <option  value="0.0015">小</option>
          <option  value="0.003">中</option>
          <option  value="0.0045">大</option>
          <option  value="0.006">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">车辆与轨道摩擦 </p></td>
      <td width="45%"><p align="center">
        <select name="select46" class="u628" id="select46"   >
          <option  value="0">很小</option>
          <option  value="0.0015">小</option>
          <option  value="0.003">中</option>
          <option  value="0.0045">大</option>
          <option  value="0.006">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">车辆撞击火花 </p></td>
      <td width="45%"><p align="center">
        <select name="select47" class="u628" id="select47"   >
          <option  value="0">很小</option>
          <option  value="0.0015">小</option>
          <option  value="0.003">中</option>
          <option  value="0.0045">大</option>
          <option  value="0.006">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="7%" rowspan="2"><p align="center">X24</p></td>
      <td width="23%" rowspan="2"><p align="center">其他摩擦撞击火花 </p></td>
      <td width="23%"><p align="center">断绳跑车火花 </p></td>
      <td width="45%"><p align="center">
        <select name="select48" class="u628" id="select48"   >
          <option  value="0">很小</option>
          <option  value="0.0015">小</option>
          <option  value="0.003">中</option>
          <option  value="0.0045">大</option>
          <option  value="0.006">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">岩石与机械设备撞击火花 </p></td>
      <td width="45%"><p align="center">
        <select name="select49" class="u628" id="select49"   >
          <option  value="0">很小</option>
          <option  value="0.0015">小</option>
          <option  value="0.003">中</option>
          <option  value="0.0045">大</option>
          <option  value="0.006">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="7%" rowspan="2"><p align="center">X25</p></td>
      <td width="23%" rowspan="2"><p align="center">串联通风 </p></td>
      <td width="23%"><p align="center">设计不合理 </p></td>
      <td width="45%"><p align="center">
        <select name="select50" class="u628" id="select50"   >
          <option  value="0">很小</option>
          <option  value="0.0015">小</option>
          <option  value="0.003">中</option>
          <option  value="0.0045">大</option>
          <option  value="0.006">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">风阻搭配不均 </p></td>
      <td width="45%"><p align="center">
        <select name="select51" class="u628" id="select51"   >
          <option  value="0">很小</option>
          <option  value="0.0015">小</option>
          <option  value="0.003">中</option>
          <option  value="0.0045">大</option>
          <option  value="0.006">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="7%" rowspan="3"><p align="center">X26</p></td>
      <td width="23%" rowspan="3"><p align="center">风流短路 </p></td>
      <td width="23%"><p align="center">风门道数不足或间距不够 </p></td>
      <td width="45%"><p align="center">
        <select name="select52" class="u628" id="select52"   >
          <option  value="0">很小</option>
          <option  value="0.0055">小</option>
          <option  value="0.011">中</option>
          <option  value="0.0165">大</option>
          <option  value="0.022">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">风门损坏 </p></td>
      <td width="45%"><p align="center">
        <select name="select53" class="u628" id="select53"   >
          <option  value="0">很小</option>
          <option  value="0.0055">小</option>
          <option  value="0.011">中</option>
          <option  value="0.0165">大</option>
          <option  value="0.022">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">未及时关闭风门 </p></td>
      <td width="45%"><p align="center">
        <select name="select54" class="u628" id="select54"   >
          <option  value="0">很小</option>
          <option  value="0.0055">小</option>
          <option  value="0.011">中</option>
          <option  value="0.0165">大</option>
          <option  value="0.022">很大</option>
        </select>				
      </p></td>
      </tr>
    <tr>
      <td width="7%" rowspan="2"><p align="center">X27</p></td>
      <td width="23%" rowspan="2"><p align="center">供风能力不足 </p></td>
      <td width="23%"><p align="center">漏风 </p></td>
      <td width="45%"><p align="center">
        <select name="select55" class="u628" id="select55"   >
          <option  value="0.006">很小</option>
          <option  value="0.0065">小</option>
          <option  value="0.007">中</option>
          <option  value="0.0075">大</option>
          <option  value="0.008">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">风阻大 </p></td>
      <td width="45%"><p align="center">
        <select name="select56" class="u628" id="select56"   >
          <option  value="0.006">很小</option>
          <option  value="0.0065">小</option>
          <option  value="0.007">中</option>
          <option  value="0.0075">大</option>
          <option  value="0.008">很大</option>
        </select>				
      </p></td>
      </tr>
    <tr>
      <td width="7%" rowspan="3"><p align="center">X28</p></td>
      <td width="23%" rowspan="3"><p align="center">通风系统不完善 </p></td>
      <td width="23%"><p align="center">未形成通风系统 </p></td>
      <td width="45%"><p align="center">
        <select name="select57" class="u628" id="select57"   >
          <option  value="0.066">很小</option>
          <option  value="0.067">小</option>
          <option  value="0.068">中</option>
          <option  value="0.069">大</option>
          <option  value="0.070">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">主风机能力不匹配 </p></td>
      <td width="45%"><p align="center">
        <select name="select58" class="u628" id="select58"   >
          <option  value="0.066">很小</option>
          <option  value="0.067">小</option>
          <option  value="0.068">中</option>
          <option  value="0.069">大</option>
          <option  value="0.070">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">没有备用风机 </p></td>
      <td width="45%"><p align="center">
        <select name="select59" class="u628" id="select59"   >
          <option  value="0.066">很小</option>
          <option  value="0.067">小</option>
          <option  value="0.068">中</option>
          <option  value="0.069">大</option>
          <option  value="0.070">很大</option>
        </select>
      </p></td>				
      </tr>
    <tr>
      <td width="7%" rowspan="2"><p align="center">X29</p></td>
      <td width="23%" rowspan="2"><p align="center">局扇选型不当 </p></td>
      <td width="23%"><p align="center">选型计算不合规定 </p></td>
      <td width="45%"><p align="center">
        <select name="select60" class="u628" id="select60"   >
          <option  value="0.059">很小</option>
          <option  value="0.0635">小</option>
          <option  value="0.068">中</option>
          <option  value="0.0725">大</option>
          <option  value="0.077">很大</option>	
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">局扇风机与主扇风机不匹配 </p></td>
      <td width="45%"><p align="center">
        <select name="select61" class="u628" id="select61"   >
          <option  value="0.059">很小</option>
          <option  value="0.0635">小</option>
          <option  value="0.068">中</option>
          <option  value="0.0725">大</option>
          <option  value="0.077">很大</option>				
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="7%" rowspan="2"><p align="center">X30</p></td>
      <td width="23%" rowspan="2"><p align="center">风机故障 </p></td>
      <td width="23%"><p align="center">温度过高 </p></td>
      <td width="45%"><p align="center">
        <select name="select62" class="u628" id="select62"   >
          <option  value="0">很小</option>
          <option  value="0.0005">小</option>
          <option  value="0.001">中</option>
          <option  value="0.0015">大</option>
          <option  value="0.002">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">流量不足 </p></td>
      <td width="45%"><p align="center">
        <select name="select63" class="u628" id="select63"   >
          <option  value="0">很小</option>
          <option  value="0.0005">小</option>
          <option  value="0.001">中</option>
          <option  value="0.0015">大</option>
          <option  value="0.002">很大</option>
        </select>
      </p></td>
      </tr>
	 <tr>
      <td width="7%" rowspan="2"><p align="center">X31</p></td>
      <td width="23%" rowspan="2"><p align="center">通风设施漏风 </p></td>
      <td width="23%"><p align="center">未密闭 </p></td>
      <td width="45%"><p align="center">
        <select name="select64" class="u628" id="select64"   >
          <option  value="0">很小</option>
          <option  value="0.1175">小</option>
          <option  value="0.235">中</option>
          <option  value="0.3525">大</option>
          <option  value="0.470">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">密闭不严 </p></td>
      <td width="45%"><p align="center">
        <select name="select65" class="u628" id="select65"   >
          <option  value="0">很小</option>
          <option  value="0.1175">小</option>
          <option  value="0.235">中</option>
          <option  value="0.3525">大</option>
          <option  value="0.470">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="7%" rowspan="2"><p align="center">X32</p></td>
      <td width="23%" rowspan="2"><p align="center">通风设施使用不当 </p></td>
      <td width="23%"><p align="center">选型不当 </p></td>
      <td width="45%"><p align="center">
        <select name="select66" class="u628" id="select66"   >
          <option  value="0.035">很小</option>
          <option  value="0.0395">小</option>
          <option  value="0.044">中</option>
          <option  value="0.0485">大</option>
          <option  value="0.053">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">安装位置不当 </p></td>
      <td width="45%"><p align="center">
        <select name="select67" class="u628" id="select67"   >
          <option  value="0.035">很小</option>
          <option  value="0.0395">小</option>
          <option  value="0.044">中</option>
          <option  value="0.0485">大</option>
          <option  value="0.053">很大</option>
        </select>				
      </p></td>
      </tr>
    <tr>
      <td width="7%" rowspan="3"><p align="center">X33</p></td>
      <td width="23%" rowspan="3"><p align="center">瓦检人员原因 </p></td>
      <td width="23%"><p align="center">瓦检人员脱岗 </p></td>
      <td width="45%"><p align="center">
        <select name="select68" class="u628" id="select68"   >
          <option  value="0">很小</option>
          <option  value="0.005">小</option>
          <option  value="0.01">中</option>
          <option  value="0.015">大</option>
          <option  value="0.020">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">误报瓦斯情况 </p></td>
      <td width="45%"><p align="center">
        <select name="select69" class="u628" id="select69"   >
          <option  value="0">很小</option>
          <option  value="0.005">小</option>
          <option  value="0.01">中</option>
          <option  value="0.015">大</option>
          <option  value="0.020">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">虚报瓦斯情况 </p></td>
      <td width="45%"><p align="center">
        <select name="select70" class="u628" id="select70"   >
          <option  value="0">很小</option>
          <option  value="0.005">小</option>
          <option  value="0.01">中</option>
          <option  value="0.015">大</option>
          <option  value="0.020">很大</option>
        </select>				
      </p></td>
      </tr>
    <tr>
      <td width="7%" rowspan="2"><p align="center">X34</p></td>
      <td width="23%" rowspan="2"><p align="center">瓦检技术不过关 </p></td>
      <td width="23%"><p align="center">设备陈旧 </p></td>
      <td width="45%"><p align="center">
        <select name="select71" class="u628" id="select71"   >
          <option  value="0">很小</option>
          <option  value="0.011">小</option>
          <option  value="0.022">中</option>
          <option  value="0.033">大</option>
          <option  value="0.044">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">技术落后 </p></td>
      <td width="45%"><p align="center">
        <select name="select72" class="u628" id="select72"   >
          <option  value="0">很小</option>
          <option  value="0.011">小</option>
          <option  value="0.022">中</option>
          <option  value="0.033">大</option>
          <option  value="0.044">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="7%" rowspan="3"><p align="center">X35</p></td>
      <td width="23%" rowspan="3"><p align="center">地质变化瓦斯涌出 </p></td>
      <td width="23%"><p align="center">板块运动导致 </p></td>
      <td width="45%"><p align="center">
        <select name="select73" class="u628" id="select73"   >
          <option  value="0.006">很小</option>
          <option  value="0.0065">小</option>
          <option  value="0.007">中</option>
          <option  value="0.0075">大</option>
          <option  value="0.008">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">岩浆活动导致 </p></td>
      <td width="45%"><p align="center">
        <select name="select74" class="u628" id="select74"   >
          <option  value="0.006">很小</option>
          <option  value="0.0065">小</option>
          <option  value="0.007">中</option>
          <option  value="0.0075">大</option>
          <option  value="0.008">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">轻微地震导致 </p></td>
      <td width="45%"><p align="center">
        <select name="select75" class="u628" id="select75"   >
          <option  value="0.006">很小</option>
          <option  value="0.0065">小</option>
          <option  value="0.007">中</option>
          <option  value="0.0075">大</option>
          <option  value="0.008">很大</option>
        </select>				
      </p></td>
      </tr>
    <tr>
      <td width="7%" rowspan="2"><p align="center">X36</p></td>
      <td width="23%" rowspan="2"><p align="center">微（无）风作业 </p></td>
      <td width="23%"><p align="center">工人安全意识薄弱 </p></td>
      <td width="45%"><p align="center">
        <select name="select76" class="u628" id="select77"   >
          <option  value="0">很小</option>
          <option  value="0.002">小</option>
          <option  value="0.004">中</option>
          <option  value="0.006">大</option>
          <option  value="0.008">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">管理混乱 </p></td>
      <td width="45%"><p align="center">
        <select name="select77" class="u628" id="select77"   >
          <option  value="0">很小</option>
          <option  value="0.002">小</option>
          <option  value="0.004">中</option>
          <option  value="0.006">大</option>
          <option  value="0.008">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="7%" rowspan="2"><p align="center">X37</p></td>
      <td width="23%" rowspan="2"><p align="center">采空区瓦斯涌出 </p></td>
      <td width="23%"><p align="center">采空区瓦斯未排放 </p></td>
      <td width="45%"><p align="center">
        <select name="select78" class="u628" id="select78"   >
          <option  value="0">很小</option>
          <option  value="0.002">小</option>
          <option  value="0.004">中</option>
          <option  value="0.006">大</option>
          <option  value="0.008">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">遗煤解吸 </p></td>
      <td width="45%"><p align="center">
        <select name="select79" class="u628" id="select79"   >
          <option  value="0">很小</option>
          <option  value="0.002">小</option>
          <option  value="0.004">中</option>
          <option  value="0.006">大</option>
          <option  value="0.008">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="7%" rowspan="2"><p align="center">X38</p></td>
      <td width="23%" rowspan="2"><p align="center">巷道贯通 </p></td>
      <td width="23%"><p align="center">贯通位置不合适 </p></td>
      <td width="45%"><p align="center">
        <select name="select80" class="u628" id="select80"   >
          <option  value="0">很小</option>
          <option  value="0.0025">小</option>
          <option  value="0.005">中</option>
          <option  value="0.0075">大</option>
          <option  value="0.010">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">通风、控风不及时 </p></td>
      <td width="45%"><p align="center">
        <select name="select81" class="u628" id="select81"   >
          <option  value="0">很小</option>
          <option  value="0.0025">小</option>
          <option  value="0.005">中</option>
          <option  value="0.0075">大</option>
          <option  value="0.010">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="7%" rowspan="2"><p align="center">X39</p></td>
      <td width="23%" rowspan="2"><p align="center">报警断电仪失灵或故障 </p></td>
      <td width="23%"><p align="center">传感器失灵或故障 </p></td>
      <td width="45%"><p align="center">
        <select name="select82" class="u628" id="select82"   >
          <option  value="0">很小</option>
          <option  value="0.004">小</option>
          <option  value="0.008">中</option>
          <option  value="0.012">大</option>
          <option  value="0.016">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">载体催化元件失效 </p></td>
      <td width="45%"><p align="center">
        <select name="select83" class="u628" id="select83"   >
          <option  value="0">很小</option>
          <option  value="0.004">小</option>
          <option  value="0.008">中</option>
          <option  value="0.012">大</option>
          <option  value="0.016">很大</option>
        </select>
      </p></td>				
      </tr>
    <tr>
      <td width="7%" rowspan="2"><p align="center">X40</p></td>
      <td width="23%" rowspan="2"><p align="center">瓦斯积聚处理不当 </p></td>
      <td width="23%"><p align="center">未处理 </p></td>
      <td width="45%"><p align="center">
        <select name="select84" class="u628" id="select84"   >
          <option  value="0">很小</option>
          <option  value="0.008">小</option>
          <option  value="0.016">中</option>
          <option  value="0.024">大</option>
          <option  value="0.032">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">未按规定处理 </p></td>
      <td width="45%"><p align="center">
        <select name="select85" class="u628" id="select85"   >
          <option  value="0">很小</option>
          <option  value="0.008">小</option>
          <option  value="0.016">中</option>
          <option  value="0.024">大</option>
          <option  value="0.032">很大</option>
        </select>
      </p></td>				
      </tr>
    <tr>
      <td width="7%" rowspan="2"><p align="center">X41</p></td>
      <td width="23%" rowspan="2"><p align="center">排放瓦斯过程不当 </p></td>
      <td width="23%"><p align="center">未排放 </p></td>
      <td width="45%"><p align="center">
        <select name="select86" class="u628" id="select86"   >
          <option  value="0">很小</option>
          <option  value="0.0005">小</option>
          <option  value="0.001">中</option>
          <option  value="0.0015">大</option>
          <option  value="0.002">很大</option>	
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">未排放到规定浓度以下 </p></td>
      <td width="45%"><p align="center">
        <select name="select87" class="u628" id="select87"   >
          <option  value="0">很小</option>
          <option  value="0.0005">小</option>
          <option  value="0.001">中</option>
          <option  value="0.0015">大</option>
          <option  value="0.002">很大</option>	
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="7%"><p align="center">X42</p></td>
      <td width="23%"><p align="center">放炮造成瓦斯积聚 </p></td>
      <td width="23%"><p align="center">&nbsp;</p></td>
      <td width="45%"><p align="center">
        <select name="select88" class="u628" id="select88"   >
          <option  value="0">很小</option>
          <option  value="0.0005">小</option>
          <option  value="0.001">中</option>
          <option  value="0.0015">大</option>
          <option  value="0.002">很大</option>	
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="7%"><p align="center">X43</p></td>
      <td width="23%"><p align="center">冒顶造成瓦斯积聚 </p></td>
      <td width="23%"><p align="center">&nbsp;</p></td>
      <td width="45%"><p align="center">
        <select name="select89" class="u628" id="select89"   >
          <option  value="0">很小</option>
          <option  value="0.0015">小</option>
          <option  value="0.003">中</option>
          <option  value="0.0045">大</option>
          <option  value="0.006">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="7%" rowspan="2"><p align="center">X44</p></td>
      <td width="23%" rowspan="2"><p align="center">通风面积不够 </p></td>
      <td width="23%"><p align="center">风窗设计不合理 </p></td>
      <td width="45%"><p align="center">
        <select name="select90" class="u628" id="select90"   >
          <option  value="0">很小</option>
          <option  value="0.00325">小</option>
          <option  value="0.0065">中</option>
          <option  value="0.00975">大</option>
          <option  value="0.013">很大</option>	
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">风窗安装位置不当 </p></td>
      <td width="45%"><p align="center">
        <select name="select91" class="u628" id="select91"   >
          <option  value="0">很小</option>
          <option  value="0.00325">小</option>
          <option  value="0.0065">中</option>
          <option  value="0.00975">大</option>
          <option  value="0.013">很大</option>	
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="7%" rowspan="3"><p align="center">X45</p></td>
      <td width="23%" rowspan="3"><p align="center">掘进风量不足 </p></td>
      <td width="23%"><p align="center">风筒漏风 </p></td>
      <td width="45%"><p align="center">
        <select name="select92" class="u628" id="select92"   >
          <option  value="0">很小</option>
          <option  value="0.0125">小</option>
          <option  value="0.025">中</option>
          <option  value="0.0375">大</option>
          <option  value="0.050">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">拐弯过多 </p></td>
      <td width="45%"><p align="center">
        <select name="select93" class="u628" id="select93"   >
          <option  value="0">很小</option>
          <option  value="0.0125">小</option>
          <option  value="0.025">中</option>
          <option  value="0.0375">大</option>
          <option  value="0.050">很大</option>
        </select>
      </p></td>
      </tr>
    <tr>
      <td width="23%"><p align="center">风筒末端距工作面过远 </p></td>
      <td width="45%"><p align="center">
        <select name="select94" class="u628" id="select94"   >
          <option  value="0">很小</option>
          <option  value="0.0125">小</option>
          <option  value="0.025">中</option>
          <option  value="0.0375">大</option>
          <option  value="0.050">很大</option>
        </select>
      </p></td>
      </tr>
  </table>
  <br/>
  <a href="javascript:goSubmit();" class="button button-circle button-primary">开始模拟</a>
</div>
</form>
</center>
</body>
</html>
