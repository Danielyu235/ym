<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>    
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="/ym/css/font-awesome.min.css"/>
<link rel="stylesheet" href="/ym/css/buttons.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>煤矿瓦斯调查问卷</title>
<style type="text/css">
body{ background:#dce8ec}
table{ margin:20px 0 0 0; border:1px #63bbe9 solid; background:#63bbe9}
table tr td{ background:#f1f4f5;}
table tr th{ height:32px; line-height:32px; background:#018dc1; color:#fff;}

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
$(function(){
	   <c:forEach var="x" begin="0" end="51" step="1">
		var temp = '<c:out value="${x}"/>';
		$("#select"+temp+" option[value='${value[x]}']").attr("selected",true);
       </c:forEach>
})
//控制div收缩
	function _(element){
		return element = document.getElementById(element);
	}
	function _D(){
		var d=_('tb1');
		var h=d.offsetHeight;
		var maxh=300;
		function dmove(){
			h+=50; //设置层展开的速度
			if(h>=maxh){
				d.style.height='580px';
				clearInterval(iIntervalId);
			}else{
				d.style.display='block';
				d.style.height=h+'px';
			}
		}
		iIntervalId=setInterval(dmove,2);
	}
	function _D2(){
		var d=_('tb1');
		var h=d.offsetHeight;
		var maxh=300;
		function dmove(){
			h-=50;//设置层收缩的速度
			if(h<=0){
				d.style.display='none';
				clearInterval(iIntervalId);
			}else{
				d.style.height=h+'px';
			}
		}
		iIntervalId=setInterval(dmove,2);
	}
	function _use(targetid,objN){
		 var d=_(targetid);
		 var sb=_(objN);
		 if (d.style.display=="block"){
		    _D2();
		    //d.style.display="none";
		    //sb.innerHTML="事故树";
		 } else {
		    _D();
		    //d.style.display="block";
		    //sb.innerHTML="事故树";
		 }
	}
</script>
</head>

<body>
<center>
<div id="Layer1">
<span style="font-family:Arial;font-size:28px;font-weight:normal;font-style:normal;text-decoration:none;color:#333333;">煤矿瓦斯爆炸发生的概率</span>
<span style="font-family:Arial;font-size:28px;font-weight:normal;font-style:normal;text-decoration:none;color:#FF0000;"><s:property value="gl" /></span>
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
  <table  cellspacing="1" cellpadding="1">
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
      <td width="58"><p align="center">T</p></td>
      <td width="187"><p align="center">瓦斯爆炸 </p></td>
      <td width="157"><p align="center">&nbsp;</p></td>
      <td width="255"><p align="center">&nbsp;</p></td>
    </tr>
    <tr>
      <td width="58"><p align="center">M1</p></td>
      <td width="187"><p align="center">爆炸性瓦斯 </p></td>
      <td width="157"><p align="center">&nbsp;</p></td>
      <td width="255"><p align="center">&nbsp;</p></td>
    </tr>
    <tr>
      <td width="58"><p align="center">M2</p></td>
      <td width="187"><p align="center">火源 </p></td>
      <td width="157"><p align="center">&nbsp;</p></td>
      <td width="255"><p align="center">&nbsp;</p></td>
    </tr>
    <tr>
      <td width="58"><p align="center">M3</p></td>
      <td width="187"><p align="center">瓦斯积聚 </p></td>
      <td width="157"><p align="center">&nbsp;</p></td>
      <td width="255"><p align="center">&nbsp;</p></td>
    </tr>
    <tr>
      <td width="58"><p align="center">M4</p></td>
      <td width="187"><p align="center">采煤工作面积聚 </p></td>
      <td width="157"><p align="center">&nbsp;</p></td>
      <td width="255"><p align="center">&nbsp;</p></td>
    </tr>
    <tr>
      <td width="58"><p align="center">M5</p></td>
      <td width="187"><p align="center">掘进工作面积聚 </p></td>
      <td width="157"><p align="center">&nbsp;</p></td>
      <td width="255"><p align="center">&nbsp;</p></td>
    </tr>
    <tr>
      <td width="58"><p align="center">M6</p></td>
      <td width="187"><p align="center">巷道积聚 </p></td>
      <td width="157"><p align="center">&nbsp;</p></td>
      <td width="255"><p align="center">&nbsp;</p></td>
    </tr>
    <tr>
      <td width="58"><p align="center">M7</p></td>
      <td width="187"><p align="center">放炮火源 </p></td>
      <td width="157"><p align="center">&nbsp;</p></td>
      <td width="255"><p align="center">&nbsp;</p></td>
    </tr>
    <tr>
      <td width="58"><p align="center">M8</p></td>
      <td width="187"><p align="center">电火花 </p></td>
      <td width="157"><p align="center">&nbsp;</p></td>
      <td width="255"><p align="center">&nbsp;</p></td>
    </tr>
    <tr>
      <td width="58"><p align="center">C1</p></td>
      <td width="187"><p align="center">相遇 </p></td>
      <td width="157"><p align="center">&nbsp;</p></td>
      <td width="255"><p align="center">
        <select name="select51" class="u628" id="select51" >
          <option  value="0.0259">很小</option>
          <option  value="0.0446">小</option>
          <option  value="0.0633">中</option>
          <option  value="0.082">大</option>
          <option  value="0.1007">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="58"><p align="center">X1</p></td>
      <td width="187"><p align="center">未处理 </p></td>
      <td width="157"><p align="center">&nbsp;</p></td>
      <td width="255"><p align="center">
        <select name="select50" class="u628" id="select50"   >
          <option  value="0.0259">很小</option>
          <option  value="0.0446">小</option>
          <option  value="0.0633">中</option>
          <option  value="0.082">大</option>
          <option  value="0.1007">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="58" rowspan="3"><p align="center">X2</p></td>
      <td width="187" rowspan="3"><p align="center">地质变化瓦斯涌出 </p></td>
      <td width="157"><p align="center">板块运动所致 </p></td>
      <td width="255"><p align="center">
        <select name="select49" class="u628" id="select49"   >
          <option  value="0">很小</option>
          <option  value="0.04085">小</option>
          <option  value="0.0817">中</option>
          <option  value="0.12255">大</option>
          <option  value="0.1634">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="157"><p align="center">岩浆活动导致 </p></td>
      <td width="255"><p align="center">
        <select name="select48" class="u628" id="select48"   >
          <option  value="0">很小</option>
          <option  value="0.04085">小</option>
          <option  value="0.0817">中</option>
          <option  value="0.12255">大</option>
          <option  value="0.1634">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="157"><p align="center">轻微地震引起 </p></td>
      <td width="255"><p align="center">
        <select name="select47" class="u628" id="select47"   >
          <option  value="0">很小</option>
          <option  value="0.04085">小</option>
          <option  value="0.0817">中</option>
          <option  value="0.12255">大</option>
          <option  value="0.1634">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="58" rowspan="2"><p align="center">X3</p></td>
      <td width="187" rowspan="2"><p align="center">串联通风 </p></td>
      <td width="157"><p align="center">设计不合理 </p></td>
      <td width="255"><p align="center">
        <select name="select46" class="u628" id="select46"   >
          <option  value="0.015">很小</option>
          <option  value="0.02915">小</option>
          <option  value="0.0433">中</option>
          <option  value="0.05745">大</option>
          <option  value="0.0716">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="157"><p align="center">风阻搭配不均 </p></td>
      <td width="255"><p align="center">
        <select name="select45" class="u628" id="select45"   >
          <option  value="0.015">很小</option>
          <option  value="0.02915">小</option>
          <option  value="0.0433">中</option>
          <option  value="0.05745">大</option>
          <option  value="0.0716">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="58" rowspan="2"><p align="center">X4</p></td>
      <td width="187" rowspan="2"><p align="center">风量不足 </p></td>
      <td width="157"><p align="center">通风机停运 </p></td>
      <td width="255"><p align="center">
        <select name="select44" class="u628" id="select44"   >
          <option  value="0.0655">很小</option>
          <option  value="0.07685">小</option>
          <option  value="0.0894">中</option>
          <option  value="0.10195">大</option>
          <option  value="0.1145">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="157"><p align="center">通风机故障 </p></td>
      <td width="255"><p align="center">
        <select name="select43" class="u628" id="select43"   >
          <option  value="0.0655">很小</option>
          <option  value="0.07685">小</option>
          <option  value="0.0894">中</option>
          <option  value="0.10195">大</option>
          <option  value="0.1145">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="58"><p align="center">X5</p></td>
      <td width="187"><p align="center">放炮后瓦斯积聚 </p></td>
      <td width="157"><p align="center">&nbsp;</p></td>
      <td width="255"><p align="center">
        <select name="select42" class="u628" id="select42"   >	
          <option  value="0.0919">很小</option>
          <option  value="0.0926">小</option>
          <option  value="0.0933">中</option>
          <option  value="0.094">大</option>
          <option  value="0.0947">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="58" rowspan="3"><p align="center">X6</p></td>
      <td width="187" rowspan="3"><p align="center">局扇循环风 </p></td>
      <td width="157"><p align="center">进风量不够 </p></td>
      <td width="255"><p align="center">
        <select name="select41" class="u628" id="select41"   >
          <option  value="0.0662">很小</option>
          <option  value="0.07895">小</option>
          <option  value="0.0917">中</option>
          <option  value="0.10445">大</option>
          <option  value="0.1172">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="157"><p align="center">局扇安装位置不当 </p></td>
      <td width="255"><p align="center">
        <select name="select40" class="u628" id="select40"   >
          <option  value="0.0662">很小</option>
          <option  value="0.07895">小</option>
          <option  value="0.0917">中</option>
          <option  value="0.10445">大</option>
          <option  value="0.1172">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="157"><p align="center">局扇选型不当 </p></td>
      <td width="255"><p align="center">
        <select name="select39" class="u628" id="select39"   >
          <option  value="0.0662">很小</option>
          <option  value="0.07895">小</option>
          <option  value="0.0917">中</option>
          <option  value="0.10445">大</option>
          <option  value="0.1172">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="58" rowspan="2"><p align="center">X7</p></td>
      <td width="187" rowspan="2"><p align="center">盲巷积存瓦斯 </p></td>
      <td width="157"><p align="center">未封闭 </p></td>
      <td width="255"><p align="center">
        <select name="select38" class="u628" id="select38"   >
          <option  value="0.0953">很小</option>
          <option  value="0.096">小</option>
          <option  value="0.0967">中</option>
          <option  value="0.0974">大</option>
          <option  value="0.0981">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="157"><p align="center">未排放 </p></td>				
      <td width="255"><p align="center">
        <select name="select37" class="u628" id="select37"   >
          <option  value="0.0953">很小</option>
          <option  value="0.096">小</option>
          <option  value="0.0967">中</option>
          <option  value="0.0974">大</option>
          <option  value="0.0981">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="58" rowspan="2"><p align="center">X8</p></td>
      <td width="187" rowspan="2"><p align="center">老塘积存瓦斯 </p></td>
      <td width="157"><p align="center">未填充 </p></td>
      <td width="255"><p align="center">
        <select name="select36" class="u628" id="select36"   >				
          <option  value="0.0617">很小</option>
          <option  value="0.0925">小</option>
          <option  value="0.1233">中</option>
          <option  value="0.1541">大</option>
          <option  value="0.1849">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="157"><p align="center">未排放 </p></td>
      <td width="255"><p align="center">
        <select name="select35" class="u628" id="select35"   >
          <option  value="0.0617">很小</option>
          <option  value="0.0925">小</option>
          <option  value="0.1233">中</option>
          <option  value="0.1541">大</option>
          <option  value="0.1849">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="58"><p align="center">X9</p></td>
      <td width="187"><p align="center">未排放瓦斯 </p></td>
      <td width="157"><p align="center">&nbsp;</p></td>
      <td width="255"><p align="center">
        <select name="select34" class="u628" id="select34"   >				
          <option  value="0.0078">很小</option>
          <option  value="0.00855">小</option>
          <option  value="0.0093">中</option>
          <option  value="0.01005">大</option>
          <option  value="0.0108">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="58" rowspan="2"><p align="center">X10</p></td>
      <td width="187" rowspan="2"><p align="center">巷道贯通 </p></td>
      <td width="157"><p align="center">贯通位置不合适 </p></td>
      <td width="255"><p align="center">
        <select name="select33" class="u628" id="select33"   >
          <option  value="0.0078">很小</option>
          <option  value="0.00855">小</option>
          <option  value="0.0093">中</option>
          <option  value="0.01005">大</option>
          <option  value="0.0108">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="157"><p align="center">通风、控风不及时 </p></td>
      <td width="255"><p align="center">
        <select name="select32" class="u628" id="select32"   >
          <option  value="0.0078">很小</option>
          <option  value="0.00855">小</option>
          <option  value="0.0093">中</option>
          <option  value="0.01005">大</option>
          <option  value="0.0108">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="58" rowspan="3"><p align="center">X11</p></td>
      <td width="187" rowspan="3"><p align="center">巷道顶部无风 </p></td>
      <td width="157"><p align="center">风量不足 </p></td>
      <td width="255"><p align="center">
        <select name="select31" class="u628" id="select31"   >
          <option  value="0.0066">很小</option>
          <option  value="0.1178">小</option>
          <option  value="0.009">中</option>
          <option  value="0.0102">大</option>
          <option  value="0.0114">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="157"><p align="center">风筒破损漏风 </p></td>
      <td width="255"><p align="center">
        <select name="select30" class="u628" id="select30"   >
          <option  value="0.0066">很小</option>
          <option  value="0.1178">小</option>
          <option  value="0.0090">中</option>
          <option  value="0.0102">大</option>
          <option  value="0.0114">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="157"><p align="center">井下风流状态不稳定 </p></td>
      <td width="255"><p align="center">
        <select name="select29" class="u628" id="select29"   >
          <option  value="0.0066">很小</option>
          <option  value="0.1178">小</option>
          <option  value="0.0090">中</option>
          <option  value="0.0102">大</option>
          <option  value="0.0114">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="58" rowspan="5"><p align="center">X12</p></td>
      <td width="187" rowspan="5"><p align="center">摩擦撞击火花 </p></td>
      <td width="157"><p align="center">钢绳与轨道摩擦 </p></td>
      <td width="255"><p align="center">
        <select name="select28" class="u628" id="select28"   >				
          <option  value="0.0012">很小</option>
          <option  value="0.0027">小</option>
          <option  value="0.0042">中</option>
          <option  value="0.0057">大</option>
          <option  value="0.0072">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="157"><p align="center">车辆与轨道摩擦 </p></td>
      <td width="255"><p align="center">
        <select name="select27" class="u628" id="select27"   >
          <option  value="0.0012">很小</option>
          <option  value="0.0027">小</option>
          <option  value="0.0042">中</option>
          <option  value="0.0057">大</option>
          <option  value="0.0072">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="157"><p align="center">车辆撞击火花 </p></td>
      <td width="255"><p align="center">
        <select name="select26" class="u628" id="select26"   >
          <option  value="0.0012">很小</option>
          <option  value="0.0027">小</option>
          <option  value="0.0042">中</option>
          <option  value="0.0057">大</option>
          <option  value="0.0072">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="157"><p align="center">岩石撞击火花 </p></td>
      <td width="255"><p align="center">
        <select name="select25" class="u628" id="select25"   >
          <option  value="0.0012">很小</option>
          <option  value="0.0027">小</option>
          <option  value="0.0042">中</option>
          <option  value="0.0057">大</option>
          <option  value="0.0072">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="157"><p align="center">断绳、跑车产生火花 </p></td>
      <td width="255"><p align="center">
        <select name="select24" class="u628" id="select24"   >
          <option  value="0.0012">很小</option>
          <option  value="0.0027">小</option>
          <option  value="0.0042">中</option>
          <option  value="0.0057">大</option>
          <option  value="0.0072">很大</option>
        </select>
      </p></td>
    </tr>
	 <tr>
      <td width="58"><p align="center">X13</p></td>
      <td width="187"><p align="center">煤自燃发火 </p></td>
      <td width="157"><p align="center">水分+<br />
        粒度-<br />
       种类（烟煤&gt;褐煤&gt;无烟煤） </p></td>
      <td width="255"><p align="center">
        <select name="select23" class="u628" id="select23"   >
           <option  value="0.0384">很小</option>
          <option  value="0.05255">小</option>
          <option  value="0.667">中</option>
          <option  value="0.08085">大</option>
          <option  value="0.0950">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="58"><p align="center">X14</p></td>
      <td width="187"><p align="center">吸烟明火 </p></td>
      <td width="157"><p align="center">&nbsp;</p></td>
      <td width="255"><p align="center">
        <select name="select22" class="u628" id="select22"   >				
          <option  value="0.0004">很小</option>
          <option  value="0.00055">小</option>
          <option  value="0.0007">中</option>
          <option  value="0.00085">大</option>
          <option  value="0.0010">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="58" rowspan="2"><p align="center">X15</p></td>
      <td width="187" rowspan="2"><p align="center">违章放炮 </p></td>
      <td width="157"><p align="center">用明火或者动力线放炮 </p></td>
      <td width="255"><p align="center">				
        <select name="select21" class="u628" id="select21"   >
          <option  value="0.0002">很小</option>
          <option  value="0.00085">小</option>
          <option  value="0.0015">中</option>
          <option  value="0.00215">大</option>
          <option  value="0.0028">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="157"><p align="center">不同类型雷管混用 </p></td>
      <td width="255"><p align="center">
        <select name="select20" class="u628" id="select20"   >
          <option  value="0.0002">很小</option>
          <option  value="0.00085">小</option>
          <option  value="0.0015">中</option>
          <option  value="0.00215">大</option>
          <option  value="0.0028">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="58" rowspan="2"><p align="center">X16</p></td>
      <td width="187" rowspan="2"><p align="center">抵抗线不足 </p></td>
      <td width="157"><p align="center">长度不合规定 </p></td>
      <td width="255"><p align="center">
        <select name="select19" class="u628" id="select19"   >				
          <option  value="0.0428">很小</option>
          <option  value="0.05555">小</option>
          <option  value="0.0683">中</option>
          <option  value="0.08105">大</option>
          <option  value="0.0938">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="157"><p align="center">个数与自由面不匹配 </p></td>
      <td width="255"><p align="center">
        <select name="select18" class="u628" id="select18"   >
          <option  value="0.0428">很小</option>
          <option  value="0.05555">小</option>
          <option  value="0.0683">中</option>
          <option  value="0.08105">大</option>
          <option  value="0.0938">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="58" rowspan="2"><p align="center">X17</p></td>
      <td width="187" rowspan="2"><p align="center">封泥不足或用替代品 </p></td>
      <td width="157"><p align="center">未用封泥 </p></td>
      <td width="255"><p align="center">
        <select name="select17" class="u628" id="select17"   >				
          <option  value="0.0115">很小</option>
          <option  value="0.0146">小</option>
          <option  value="0.0177">中</option>
          <option  value="0.0208">大</option>
          <option  value="0.0239">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="157"><p align="center">用煤或装药纸代替封泥 </p></td>
      <td width="255"><p align="center">
        <select name="select16" class="u628" id="select16"   >
          <option  value="0.0115">很小</option>
          <option  value="0.0146">小</option>
          <option  value="0.0177">中</option>
          <option  value="0.0208">大</option>
          <option  value="0.0239">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="58" rowspan="2"><p align="center">X18</p></td>
      <td width="187" rowspan="2"><p align="center">炸药燃烧 </p></td>
      <td width="157"><p align="center">受热燃烧 </p></td>
      <td width="255"><p align="center">
        <select name="select15" class="u628" id="select15"   >				
          <option  value="0.0002">很小</option>
          <option  value="0.00095">小</option>
          <option  value="0.0017">中</option>
          <option  value="0.00245">大</option>
          <option  value="0.0032">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="157"><p align="center">变质燃烧 </p></td>
      <td width="255"><p align="center">
        <select name="select14" class="u628" id="select14"   >
          <option  value="0.0002">很小</option>
          <option  value="0.00095">小</option>
          <option  value="0.0017">中</option>
          <option  value="0.00245">大</option>
          <option  value="0.0032">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="58" rowspan="2"><p align="center">X19</p></td>
      <td width="187" rowspan="2"><p align="center">电机车火花 </p></td>
      <td width="157"><p align="center">未采用防爆型电机车 </p></td>
      <td width="255"><p align="center">
        <select name="select13" class="u628" id="select13"   >				
          <option  value="0.0008">很小</option>
          <option  value="0.00745">小</option>
          <option  value="0.0141">中</option>
          <option  value="0.02075">大</option>
          <option  value="0.0274">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="157"><p align="center">电机车使用不合规定 </p></td>
      <td width="255"><p align="center">
        <select name="select12" class="u628" id="select12"   >
          <option  value="0.0008">很小</option>
          <option  value="0.00745">小</option>
          <option  value="0.0141">中</option>
          <option  value="0.02075">大</option>
          <option  value="0.0274">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="58" rowspan="2"><p align="center">X20</p></td>
      <td width="187" rowspan="2"><p align="center">开关冒火 </p></td>
      <td width="157"><p align="center">短路冒火 </p></td>
      <td width="255"><p align="center">
        <select name="select11" class="u628" id="select11"   >				
          <option  value="0.0002">很小</option>
          <option  value="0.00035">小</option>
          <option  value="0.0005">中</option>
          <option  value="0.00065">大</option>
          <option  value="0.0008">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="157"><p align="center">电压过高击穿电路 </p></td>
      <td width="255"><p align="center">
        <select name="select10" class="u628" id="select10"   >
          <option  value="0.0002">很小</option>
          <option  value="0.00035">小</option>
          <option  value="0.0005">中</option>
          <option  value="0.00065">大</option>
          <option  value="0.0008">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="58" rowspan="2"><p align="center">X21</p></td>
      <td width="187" rowspan="2"><p align="center">母线短路 </p></td>
      <td width="157"><p align="center">未用短路保护 </p></td>
      <td width="255"><p align="center">
        <select name="select9" class="u628" id="select9"   >				
          <option  value="0.0066">很小</option>
          <option  value="0.0078">小</option>
          <option  value="0.0090">中</option>
          <option  value="0.0102">大</option>
          <option  value="0.0114">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="157"><p align="center">短路保护失效 </p></td>
      <td width="255"><p align="center">
        <select name="select8" class="u628" id="select8"   >
          <option  value="0.0066">很小</option>
          <option  value="0.0078">小</option>
          <option  value="0.0090">中</option>
          <option  value="0.0102">大</option>
          <option  value="0.0114">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="58" rowspan="2"><p align="center">X22</p></td>
      <td width="187" rowspan="2"><p align="center">电缆线破损 </p></td>
      <td width="157"><p align="center">鸡爪子或羊尾巴破口 </p></td>
      <td width="255"><p align="center">
        <select name="select7" class="u628" id="select7"   >				
          <option  value="0.0923">很小</option>
          <option  value="0.1178">小</option>
          <option  value="0.1433">中</option>
          <option  value="0.1688">大</option>
          <option  value="0.1943">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="157"><p align="center">电路露芯线 </p></td>
      <td width="255"><p align="center">
        <select name="select6" class="u628" id="select6"   >
          <option  value="0.0923">很小</option>
          <option  value="0.1178">小</option>
          <option  value="0.1433">中</option>
          <option  value="0.1688">大</option>
          <option  value="0.1943">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="58"><p align="center">X23</p></td>
      <td width="187"><p align="center">带电检修 </p></td>
      <td width="157"><p align="center">&nbsp;</p></td>
      <td width="255"><p align="center">
        <select name="select5" class="u628" id="select5"   >
          <option  value="0.0008">很小</option>
          <option  value="0.0018">小</option>
          <option  value="0.0028">中</option>
          <option  value="0.0038">大</option>
          <option  value="0.0048">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="58" rowspan="2"><p align="center">X24</p></td>
      <td width="187" rowspan="2"><p align="center">矿灯引火 </p></td>
      <td width="157"><p align="center">拆卸矿灯引起火花 </p></td>
      <td width="255"><p align="center">
        <select name="select4" class="u628" id="select4"   >
          <option  value="0.0003">很小</option>				
          <option  value="0.00045">小</option>
          <option  value="0.0006">中</option>
          <option  value="0.00075">大</option>
          <option  value="0.0009">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="157"><p align="center">矿灯从高处掉落产生火花 </p></td>
      <td width="255"><p align="center">
        <select name="select3" class="u628" id="select3"   >
          <option  value="0.0003">很小</option>				
          <option  value="0.00045">小</option>
          <option  value="0.0006">中</option>
          <option  value="0.00075">大</option>
          <option  value="0.0009">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="58" rowspan="3"><p align="center">X25</p></td>
      <td width="187" rowspan="3"><p align="center">接线盒失爆 </p></td>
      <td width="157"><p align="center">电缆接线被抽出 </p></td>
      <td width="255"><p align="center">
        <select name="select2" class="u628" id="select2"   >
          <option  value="0.0066">很小</option>
          <option  value="0.0078">小</option>
          <option  value="0.0090">中</option>
          <option  value="0.0102">大</option>
          <option  value="0.0114">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="157"><p align="center">外壳开裂变形 </p></td>
      <td width="255"><p align="center">
        <select name="select1" class="u628" id="select1"   >
          <option  value="0.0066">很小</option>
          <option  value="0.0078">小</option>
          <option  value="0.0090">中</option>
          <option  value="0.0102">大</option>
          <option  value="0.0114">很大</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td width="157"><p align="center">接线不合格 </p></td>
      <td width="255"><p align="center">
      <select name="select0" class="u628" id="select0"   >
          <option  value="0.0066">很小</option>
          <option  value="0.0078">小</option>
          <option  value="0.0090">中</option>
          <option  value="0.0102">大</option>
          <option  value="0.0114">很大</option>
      </select>
       </p></td>
    </tr>
  </table>
  <br/>
</div>

</center>
</body>
</html>
