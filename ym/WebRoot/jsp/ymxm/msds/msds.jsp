<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="gb2312" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>危化品特征库</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>

<script type="text/javascript">
function listoff(){
	document.getElementById("list_on").style.display="block";
	document.getElementById("list_off").style.display="none";
}
function liston(){
	document.getElementById("list_on").style.display="none";
	document.getElementById("list_off").style.display="block";
}
$(document).ready(
 	function (){
 				grid = new Grid('${ctx}/tbMsds/tbMsdsAction!list', 'data_list');
				grid.loadGrid();
				crud = new Crud({
				grid:grid, 
				addFormObject:$('#addForm'), 
				searchFormObject:$('#searchForm'),
				entityName:'tbMsds',
				moduleName:'危化品特征库',
				url:'${ctx}/tbMsds/tbMsdsAction',
				afterViewLoadData: function(viewFormObject, data){
			 		var ele = $('<div style="position:absolute;right:40px;top:40px;z-index:3;width:200px;" id="menu">'
	                            + '<div style="display:block;"><img src="popWin_top.gif" width="200" height="6" border="0"/></div>'
								+ '<div style="background:url(popWin_center.gif) repeat-y;width:200px;"><div class="popWinList" id="list_on" style="display:none">'
								+ '<span style="cursor:hand" onclick="liston()">点击此处展开导航</span></div><div class="popWinList" id="list_off">'
								+ '<a href="#part1">第一部分&nbsp;化学品及企业标识</a><br/><a href="#part2">第二部分&nbsp;成分/组成信息</a><br/>'
								+ '<a href="#part3">第三部分&nbsp;危险性概述</a><br/><a href="#part4">第四部分&nbsp;急救措施</a><br/>'
								+ '<a href="#part5">第五部分&nbsp;消防措施</a><br/><a href="#part6">第六部分&nbsp;泄漏应急处理</a><br/>'
								+ '<a href="#part7">第七部分&nbsp;操作处置与储存</a><br/><a href="#part8">第八部分&nbsp;接触控制/个体防护</a><br/>'
								+ '<a href="#part9">第九部分&nbsp;理化特性</a><br/><a href="#part10">第十部分&nbsp;稳定性和反应活性</a><br/>'
								+ '<a href="#part11">第十一部分&nbsp;毒理学资料</a><br/><a href="#part12">第十二部分&nbsp;生态学资料</a><br/>'
								+ '<a href="#part13">第十三部分&nbsp;废弃处置</a><br/><a href="#part14">第十四部分&nbsp;运输信息</a><br/>'
								+ '<a href="#part15">第十五部分&nbsp;法规信息</a><br/><a href="#part16">第十六部分&nbsp;其它信息</a></div>'
								+ '<div style="float:right;padding-right:3px;"><img src="popWin_arrowUp.gif" style="cursor:hand" onclick="listoff()"/></div></div>'
								+ '<div style="background:url(popWin_bottom.gif) no-repeat;width:200px;height:6px;"></div></div>');
			 		$(ele).appendTo($(viewFormObject).find('div').first());
			 		$(viewFormObject).find('td b').each(function(){
			 			$(this).wrap('<a name="part' + numberConvert(middleStr($(this).text())) + '"></a>');
			 		});
		 		}
		 	});
 	}
  ); 
  function middleStr(str) {
  		if(str == null ) return null;
  		if(str.indexOf('部分') > -1) {
  			return str.substring(1, str.indexOf('部分'));
  		}
  		return null;
  }
  function numberConvert(str) {
  		var cn = new Array("一","二","三","四","五","六","七","八","九","十");
  		var num = new Array(1,2,3,4,5,6,7,8,9,10);
  		if(str == null ) return 0;
  		var temp = 0;
  		for(var j = 0; j<str.length; j++) {
  			for(var i = 0; i < cn.length; i++) {
  				if(str[j] == cn[i]) {
  					temp += num[i];
  					break;
  				}
  			}
  		}
  		return temp;
  }
         //加载表单操作列
function gridFormatter(value, rowData, rowIndex) {
	var rowId = rowData.id;
	var url = "";
	url += "<a title=\"查看\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"../../../images/select.png\"></img></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	url += "<a title=\"修改\" onclick='crud.update(\""+rowId+"\");' class='btn2'><img src=\"../../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	return url;
}
</script>
</head>
<body>

  <div class="panel-header" style="width:100%;">
	<div class="panel-title panel-with-icon">危化品特征库</div>
	<div class="panel-icon icon-edit"></div>
	<div class="panel-tool"></div>
</div>

 <div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
 <div id="search">
        <form id="searchForm" method="post" style="display: inline;">
        <div style="margin-top:-8px;">
        &nbsp;&nbsp;中文名称:&nbsp;&nbsp;<input class="easyui-validatebox"  name="tbMsds.zwm" >
        &nbsp;&nbsp;英文名称:&nbsp;&nbsp;<input class="easyui-validatebox"  name="tbMsds.ywm" >
        &nbsp;&nbsp;分子式:&nbsp;&nbsp;<input class="easyui-validatebox"  name="tbMsds.fzs" >
        &nbsp;&nbsp;分子量:&nbsp;&nbsp;<input class="easyui-validatebox"  name="tbMsds.fzl" >
        &nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search();">查询</a>
		&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch();">清空</a>
        </div>
        </form>
    </div>
    </div>
     <div class="search_add">
	<shiro:hasPermission name="48:add">
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add', plain:true" onclick="crud.add();">添加</a>
	</shiro:hasPermission>
	<shiro:hasPermission name="48:delete">		
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove', plain:true" onclick="crud.remove();">删除</a>
	</shiro:hasPermission>
    </div>
<!-- 表单表头 -->
<div style="height:78%;">
    <table id="data_list" style="display:none">
        <thead>
        <tr>
            <th field="zwm" width="150" align="center" title="zwm">中文名</th>
            <th field="ywm" width="150" align="center" title="ywm">英文名</th>
            <th field="fzs" width="150" align="center" title="fzs">分子式</th>
            <th field="fzl" width="150" align="center" title="fzl">分子量</th>
            <th align="center" field="id" width="160" formatter="gridFormatter">操作</th>    
        </tr>
        </thead>
    </table>
</div>

<!-- 修改窗口 -->
<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" 
			data-options="iconCls:'icon-save',modal:true,
    			minimizable:true,maximizable:true,collapsible:true,draggable:false">
		<form method="post" >
		<div class="catalogue"></div>
    	<input type="hidden" id="updateId" name="tbMsds.id"/>
    	<div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
			<table id="detailTable" cellpadding="5px" style="font-size:12px;"
			 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
	  <tr>
	<td class="table_nemu_new" colspan="4" align="center">危化品安全技术说明书</td>
</tr>
<tr>
<br>
 <tr height=26>
  <td colspan=4 class="table_nemu_new"><b>第一部分&nbsp;化学品及单位标识</b></td>
 </tr>
 <tr>
  <td class="table_nemu_new" width="25%">危化品中文名称</td>
  <td colspan=3  class="table_con"><input type="text" name="tbMsds.zwm"  style="width:90%"></td>
 </tr>
 <tr>
  <td class="table_nemu_new">危化品英文名称</td>
  <td colspan=3  class="table_con">
	<input type="text" name="tbMsds.ywm" style="width:90%">
  </td>
 </tr>
 <tr>
  <td class="table_nemu_new">分子式</td>
  <td class="table_con"><input type="text" name="tbMsds.fzs" style="width:90%">
  </td>
  <td class="table_nemu_new">分子量</td>
  <td class="table_con"><input type="text" name="tbMsds.fzl" style="width:90%" >
  </td>
 </tr>
 <tr>
  <td colspan=4 class="table_nemu_new"><b>第二部分&nbsp;
  成分/组成信息</b></td>
 </tr>
 <tr>
  <td colspan=4 class="table_nemu_new"><b>第三部分&nbsp;
  危险性概述</b></td>
 </tr>
 <tr>
  <td class="table_nemu_new">危险性类别</td>
  <td colspan=3 class="table_con"><input type="text" name="tbMsds.wxxlb" style="width:90%"></td>
 </tr>
 <tr>
  <td class="table_nemu_new">侵入途径</td>
  <td colspan=3 class="table_con"><input type="text" name="tbMsds.qrtj" style="width:90%"></td>
 </tr>
 <tr>
  <td class="table_nemu_new" height="50">健康危害</td>
  <td colspan=3 class="table_con"><textarea name="tbMsds.jkwh" cols="61" rows="5" style="width:90%;overflow-y:auto"></textarea></td>
 </tr>
 <tr>
  <td colspan=4 class="table_nemu_new"><b>第四部分&nbsp;
  急救措施</b></td>  
 </tr>
 <tr>
  <td class="table_nemu_new">皮肤接触</td>
  <td colspan=3 class="table_con"><input type="text" name="tbMsds.pfjc" style="width:90%"></td>
 </tr>
 <tr>
  <td class="table_nemu_new">眼睛接触</td>
  <td colspan=3 class="table_con"><textarea name="tbMsds.yjjc" cols="61" rows="5" style="width:90%;overflow-y:auto"></textarea></td>
 </tr>
 <tr>
  <td height=53 class="table_nemu_new">吸&nbsp;&nbsp;&nbsp;入</td>
  <td colspan=3 class="table_con"><textarea name="tbMsds.xr" cols="61" rows="5" style="width:90%;overflow-y:auto"></textarea></td>
 </tr>
 <tr>
  <td height=26 class="table_nemu_new">食&nbsp;&nbsp;&nbsp;入</td>
  <td colspan=3 class="table_con"><textarea name="tbMsds.sr" cols="61" rows="5" style="width:90%;overflow-y:auto"></textarea></td>
 </tr>
 <tr>
  <td colspan=4 height=26 class="table_nemu_new"><b>第五部分&nbsp;
  消防措施</b></td>
 </tr>
 <tr>
  <td class="table_nemu_new">危险特性</td>
  <td colspan=3 class="table_con"><textarea name="tbMsds.wxtx" cols="61" rows="5" style="width:90%;overflow-y:auto"></textarea></td>
 </tr>
  <tr>
  <td class="table_nemu_new">燃烧性</td>
  <td colspan=3 class="table_con"><input type="text" name="tbMsds.rsx" style="width:90%"></td>
 </tr>
  <tr>
  <td class="table_nemu_new">自燃温度</td>
  <td colspan=3 class="table_con"><input type="text" name="tbMsds.zrwd" style="width:90%"></td>
 </tr>
   <tr>
  <td class="table_nemu_new">建规火险分级</td>
  <td colspan=3 class="table_con"><input type="text" name="tbMsds.jghxfj" style="width:90%"></td>
 </tr>
 <tr>
  <td class="table_nemu_new">灭火方法及灭火剂</td>
  <td colspan=3 class="table_con"><textarea name="tbMsds.mhff" cols="61" rows="5" style="width:90%;overflow-y:auto"></textarea></td>
 </tr>
 <tr>
  <td colspan=4 class="table_nemu_new"><b>第六部分&nbsp;
  泄漏应急处理</b></td>
 </tr>
 <tr>
  <td class="table_nemu_new" height="50">应急处理</td>
  <td colspan=3 class="table_con"><textarea name="tbMsds.xlcz" cols="61" rows="5" style="width:90%;overflow-y:auto"></textarea></td>
 </tr>
 <tr>
  <td colspan=4 class="table_con"><b>第七部分&nbsp;
  操作处置与储存</b></td>
 </tr>
 <tr>
  <td colspan=4 class="table_con"><b>第八部分&nbsp;
  接触控制/个体防护</b></td>
 </tr>
 <tr>
  <td class="table_nemu_new" height="50">最高容许浓度</td>
  <td colspan=3 class="table_con"><input type="text" name="tbMsds.jcxz" style="width:90%"></td>  
 </tr>
 <tr>
  <td class="table_nemu_new">工程控制</td>
  <td colspan=3 class="table_nemu_new"><textarea name="tbMsds.gckz" cols="61" rows="5" style="width:90%;overflow-y:auto"></textarea></td>
 </tr>
 <tr>
  <td class="table_nemu_new">呼吸系统防护</td>
  <td colspan=3 class="table_nemu_new"><textarea name="tbMsds.hxxtbh" cols="61" rows="5" style="width:90%;overflow-y:auto"></textarea></td>
 </tr>
 <tr>
  <td class="table_nemu_new">眼睛防护</td>
  <td colspan=3 class="table_con"><input type="text" name="tbMsds.yjbh" style="width:90%"></td>
 </tr>
 <tr>
  <td class="table_nemu_new">身体防护</td>
  <td colspan=3 class="table_con"><input type="text" name="tbMsds.fhf" style="width:90%"></td>
 </tr>
 <tr>
  <td class="table_nemu_new">手防护</td>
  <td colspan=3 class="table_con"><input type="text" name="tbMsds.sfh" style="width:90%"></td>
 </tr>
 <tr>
  <td colspan=4 class="table_nemu_new"><b>第九部分&nbsp;
  理化特性</b></td>
 </tr>
 <tr>
  <td class="table_nemu_new">外观与性状</td>
  <td colspan=3 class="table_con"><input type="text" name="tbMsds.wgyxz" style="width:90%"></td>
 </tr>
 <tr>
  <td width="153" class="table_nemu_new">熔点(℃)</td>
  <td colspan=3 class="table_con"><input type="text" name="tbMsds.rd" style="width:90%"></td>
 
 </tr>
 <tr>
  <td class="table_nemu_new"  width="25%">相对密度(水=1)</td>
  <td width="258" class="table_con"  width="25%"><input type="text" name="tbMsds.xdmds" style="width:90%"></td>
  <td width="175" class="table_nemu_new"  width="25%">沸点(℃)</td>
  <td width="288" class="table_con"  width="25%"><input type="text" name="tbMsds.fd" style="width:90%"></td>
 </tr>
 <tr>
  <td class="table_nemu_new">相对密度(空气=1)</td>
  <td class="table_con"><input type="text" name="tbMsds.xdmdkq" style="width:90%"></td>
  <td class="table_nemu_new">饱和蒸气压(kPa) </td>
  <td class="table_con"><input type="text" name="tbMsds.bhzqs" style="width:90%"></td>
 </tr>
 <tr>
  <td class="table_nemu_new">燃烧热(Kj/mol)</td>
  <td class="table_con"><input type="text" name="tbMsds.rsr" style="width:90%"></td>
  <td class="table_nemu_new">临界温度(℃)</td>
  <td class="table_con"><input type="text" name="tbMsds.ljwd" style="width:90%"></td>
 </tr>
 <tr>
  <td class="table_nemu_new">临界压力(MPa)</td>
  <td class="table_con"><input type="text" name="tbMsds.ljyl" style="width:90%"></td>
  <td class="table_nemu_new">闪点(℃)</td>
  <td class="table_con"><input type="text" name="tbMsds.sd" style="width:90%"></td>
 </tr>
 <tr>
  <td class="table_nemu_new">贮存临界量(kg)</td>
  <td class="table_con"><input type="text" name="tbMsds.zcljl" style="width:90%"></td>
  <td class="table_nemu_new">生产临界量(kg)</td>
  <td class="table_con"><input type="text" name="tbMsds.scljl" style="width:90%"></td>
 </tr>
 <tr>
  <td class="table_nemu_new">爆炸下限[%(V/V)]</td>
  <td class="table_con"><input type="text" name="tbMsds.bzxx" style="width:90%"></td>
  <td class="table_nemu_new">爆炸上限[%(V/V)]</td>
  <td class="table_con"><input type="text" name="tbMsds.bzsx" style="width:90%"></td>
 </tr>
 <tr>
  <td class="table_nemu_new">溶解性</td>
  <td  colspan=3 class="table_con"><input type="text" name="tbMsds.rjx" style="width:90%"></td>
 </tr>
 <tr>
  <td class="table_nemu_new">主要用途</td>
  <td colspan=3 class="table_con"><textarea name="tbMsds.zyyt" cols="61" rows="5"  style="width:90%;overflow-y:auto"></textarea></td>
 </tr>
 <tr>
  <td colspan=4 height=26 class="table_nemu_new"><b>第十部分&nbsp;
  稳定性和反应活性</b></td>
 </tr>
 <tr>
  <td class="table_nemu_new">稳定性</td>
  <td colspan=3 class="table_con"><input type="text" name="tbMsds.wdx" style="width:90%"></td>
 </tr>
 <tr>
  <td class="table_nemu_new">聚合危害</td>
  <td colspan=3 class="table_con"><input type="text" name="tbMsds.jhwh" style="width:90%"></td>
 </tr>
 <tr>
  <td class="table_nemu_new">避免接触的条件</td>
  <td colspan=3 class="table_con"><input type="text" name="tbMsds.bmjctj" style="width:90%"></td>
 </tr>
 <tr>
  <td class="table_nemu_new">禁配物</td>
  <td colspan=3  class="table_con"><input type="text" name="tbMsds.jjw" style="width:90%"></td>
 </tr>
 <tr>
  <td class="table_nemu_new">分解产物</td>
  <td colspan=3  class="table_con"><input type="text" name="tbMsds.wxfjch" style="width:90%"></td>
 </tr>
 <tr>
  <td colspan=4 class="table_nemu_new"><b>第十一部分&nbsp;
  毒理学资料</b></td>
 </tr>
 <tr>
  <td height=83 class="table_nemu_new">急性毒性</td>
  <td colspan=3 class="table_con"><input type="text" name="tbMsds.dx" style="width:90%"></td>
 </tr>
 <tr>
  <td colspan=4 class="table_nemu_new"><b>第十二部分&nbsp; 生态学资料</b></td>  
 </tr>
 <tr>
  <td colspan=4 class="table_nemu_new"><b>第十三部分&nbsp; 废 弃 处 置</b></td>  
 </tr>
 <tr>
  <td colspan=4 class="table_nemu_new"><b>第十四部分&nbsp; 运 输 信 息</b></td>  
 </tr>
 <tr>
  <td class="table_nemu_new">危险物质编号</td>
  <td  class="table_con"><input type="text" name="tbMsds.wxhwbh" style="width:90%"></td>
  <td class="table_nemu_new">UN编号</td>
  <td class="table_con"><input type="text" name="tbMsds.un" style="width:90%"></td>
 </tr>
 <tr>
  <td class="table_nemu_new">包装标志</td>
  <td  class="table_con"><input type="text" name="tbMsds.wxhwbzbz" style="width:90%"></td>
  <td class="table_nemu_new">包装类别</td>
  <td class="table_con"><input type="text" name="tbMsds.bzlb" style="width:90%"></td>
 </tr>
 <tr>
  <td height=139 class="table_nemu_new">运输注意事项</td>
  <td colspan=3 class="table_con"><textarea name="tbMsds.cyzysx" cols="61" rows="5" style="width:90%;overflow-y:auto"></textarea></td>
 </tr>
 <tr>
  <td colspan=4 class="table_nemu_new"><b>第十五部分&nbsp; 法 规 信 息</b></td>  
 </tr>
 <tr>
  <td colspan=4 class="table_nemu_new"><b>第十六部分&nbsp; 其 它 信 息</b></td>  
 </tr>
 <tr>
  <td class="table_nemu_new" height="50">其他信息</td>
  <td colspan=3 class="table_con"><textarea name="tbMsds.qt" cols="61" rows="5" style="width:90%;overflow-y:auto"></textarea></td>
 </tr>
	  
		</table>
	        </div> 
   	</form>
</div>
</div>
</body>
</html>