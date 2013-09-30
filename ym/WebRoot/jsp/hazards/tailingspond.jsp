<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>尾矿库</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link> 
<script type="text/javascript">
$(document).ready(
 	function (){
 			// 参数1：访问路径;参数2：实体类名；参数3：title
	     eSelect = new Select('选择', '${ctx}/jsp/ymxm/enterprise/EnterpriseSelect.jsp'
	    		 , null, function(id, corpName) {
	    	        $('input[name="hazhardsTailingspond.qymc"]').val(id);
	    	        $('input[name="hazhardsTailingspond.corpName"]').val(corpName);
	    });
	    grid = new Grid('${ctx}/hazhardsTailingspond/hazhardsTailingspondAction!list', 'data_list');
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'hazhardsTailingspond',
			moduleName:'尾矿库',
			url:'${ctx}/hazhardsTailingspond/hazhardsTailingspondAction',
			beforeSubmit:function() {
				 if($('#addForm input[name="hazhardsTailingspond.dwdm"]').val() == '') {
					$.messager.alert("错误", "请选择所属单位");
					return false;
			 	 }
				 return true;
			}
		});
 	}
  ); 
  
function gridFormatter(value, rowData, rowIndex) {
	var rowId = rowData.id;
	var url = "";
	<shiro:hasPermission name="48:view">
	url += "<a title=\"查看\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"../../images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	<shiro:hasPermission name="48:update">
	url += "<a title=\"修改\" onclick='crud.update(\""+rowId+"\");' class='btn2'><img src=\"../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	</shiro:hasPermission>
	if(rowData.hasMap == '1') { //已定位
	url += "<a title=\"定位\" onclick='window.top.gis.showPoint(\""+rowData.qymc+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.wkkmc +"\");' class='btn2' ><img src=\"${ctx}/images/showPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	} else {
	url += "<a title=\"打点\" onclick='window.top.gis.addPoint(\""+rowData.qymc+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.wkkmc +"\");' class='btn2' ><img src=\"${ctx}/images/addPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	}
	return url;
}
</script>
</head>
<body>
	 <div class="panel-header" style="width:100%;">
		<div class="panel-title panel-with-icon">尾矿库信息列表</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
	 <div>
	        <form id="searchForm" method="post" style="display: inline;">
            <div style="margin-top:-8px;">
	       &nbsp;&nbsp; 所属单位:
	       &nbsp;&nbsp; <input type="text" class="easyui-validatebox" name="hazhardsTailingspond.corpName" id="corpName"/>
	   		&nbsp;&nbsp;尾矿库名称：&nbsp;&nbsp;
	        <input class="easyui-validatebox" id="wkkmc" name="hazhardsTailingspond.wkkmc" data-options="validType:'length[1,25]'">
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
	<div style="height:74%;">
	    <table id="data_list" style="display:none">
	        <thead>
	        <tr>
	          <th field="corpName" width="21%" align="center" title="corpName">所属单位</th>
	           <th field="wkkmc" width="20%" align="center" title="wkkmc">尾矿库名称</th>
	            <th field="kz" width="10%" align="center" title="kz">矿种</th>
	            <th field="zyfzr" width="10%" align="center" title="zyfzr">主要负责人</th>
	            <th align="center" field="id" width="10%" formatter="gridFormatter">操作</th>  
	        </tr>
	        </thead>
	    </table>
	</div>
	
<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" 
			data-options="iconCls:'icon-save',modal:true,
    			minimizable:true,maximizable:true,collapsible:true,draggable:false">
		<form method="post" >
	     <input type="hidden" id="updateId" name="hazhardsTailingspond.id"/>
	      <input type="hidden" class="easyui-validatebox" name="hazhardsTailingspond.qymc"/>
		    <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
		   		<tr>
					<td class="table_nemu_new" width="25%">所属单位</td>
					<td class="table_con" colspan="3"><input type="text" class="easyui-validatebox" name="hazhardsTailingspond.corpName"
							data-options="validType:'maxByteLength[100]'" disabled="disabled"/>
							<input type="button" value="选择" onclick="eSelect.open()"/></td>
					</tr>
					<tr>
					<td class="table_nemu_new" width="25%">主要负责人</td>
					<td class="table_con" width="25%"><input class="easyui-validatebox" name="hazhardsTailingspond.zyfzr" id="updateZyfzr" data-options="required: true" missingMessage="请输入尾矿库名称"/></td>
					<td class="table_nemu_new" width="25%">联系电话</td>
					<td class="table_con" width="25%"><input class="easyui-validatebox" name="hazhardsTailingspond.lxdh" id="updateLxdh" /></td>
					</tr>
					<tr>
					<td class="table_nemu_new">详细地址</td>
					<td class="table_con" colspan="3"><textarea id="updateXxdz" name="hazhardsTailingspond.xxdz" cols="70" rows="3"></textarea></td>
					</tr>
				
				<tr>
					<td class="table_nemu_new">上级主管</td>
					<td class="table_con"><input class="easyui-validatebox"  id="updateSjzg" name="hazhardsTailingspond.sjzg" /></td>
					<td class="table_nemu_new">邮政编码</td>
					<td class="table_con"><input class="easyui-validatebox" name="hazhardsTailingspond.yzbm" id="updateYzbm"/></td>
				</tr>
					<tr>
					<td class="table_nemu_new">建厂日期</td>
					<td class="table_con"><input onfocus="WdatePicker({readOnly:true})"  class="Wdate"   id="updateJcrq" name="hazhardsTailingspond.jcrq"/></td>
					<td class="table_nemu_new">从业人数</td>
					<td class="table_con"><input class="easyui-validatebox" name="hazhardsTailingspond.cyrs" id="updateCyrs"/></td>
				</tr>
				<tr>
					<td class="table_nemu_new">经济类型</td>
					<td class="table_con"><input class="easyui-validatebox"  id="updateJjlx" name="hazhardsTailingspond.jjlx"/></td>
					<td class="table_nemu_new">矿种</td>
					<td class="table_con"><input class="easyui-validatebox" name="hazhardsTailingspond.kz" id="updateKz"/></td>
				</tr>
					<tr>
					<td class="table_nemu_new">固定资产（万元）</td>
					<td class="table_con"><input class="easyui-validatebox"  id="updateGdzc" name="hazhardsTailingspond.gdzc"/></td>
					<td class="table_nemu_new">年利润（万元）</td>
					<td class="table_con"><input class="easyui-validatebox" name="hazhardsTailingspond.nlr" id="updateNlr"/></td>
				</tr>
				<tr>
					<td class="table_nemu_new">尾矿库名称</td>
					<td class="table_con"><input class="easyui-validatebox"  id="updateWkkmc" name="hazhardsTailingspond.wkkmc" data-options="required: true" missingMessage="请输入尾矿库名称"/></td>
					<td class="table_nemu_new">地理位置</td>
					<td class="table_con"><input class="easyui-validatebox" name="hazhardsTailingspond.dlwz" id="updateDlwz"/></td>
				</tr>
				<tr>
					<td class="table_nemu_new">尾矿库形式</td>
					<td class="table_con"><input class="easyui-combobox"  id="updateWkkxs" name="hazhardsTailingspond.wkkxs" data-options="valueField: 'id',textField: 'value',data: [{id: '山谷型',value: '山谷型'},{id: '傍山型',value: '傍山型'}
					,{id: '河谷型',value: '河谷型'},{id: '平底型',value: '平底型'},{id: '其它',value: '其它'}],panelHeight:'auto',width:'100',editable:false"/></td>
					<td class="table_nemu_new">其它</td>
					<td class="table_con"><input class="easyui-validatebox" name="hazhardsTailingspond.wkkxsqt" id="updateWkkxsqt"/></td>
					</tr>
				<tr>
					<td class="table_nemu_new">尾矿库等别</td>
					<td class="table_con"><input class="easyui-combobox" name="hazhardsTailingspond.wkkdb" id="updateWkkdb"data-options="valueField: 'id',textField: 'value',data: [{id: '一等',value: '一等'},{id: '二等',value: '二等'}
					,{id: '三等',value: '三等'},{id: '四等',value: '四等'},{id: '五等',value: '五等'}],panelHeight:'auto',width:'100',editable:false"/></td>
					<td class="table_nemu_new">全库容（万m³）</td>
					<td class="table_con"><input class="easyui-validatebox"  id="updateQkr" name="hazhardsTailingspond.qkr" /></td>
					</tr>
				<tr>
					<td class="table_nemu_new">坝高（m）</td>
					<td class="table_con"><input class="easyui-validatebox" name="hazhardsTailingspond.bg" id="updateBg"/></td>
				
					<td class="table_nemu_new">设计总库容（万m³）</td>
					<td class="table_con"><input class="easyui-validatebox"  id="updateSjzkr" name="hazhardsTailingspond.sjzkr"/></td>
					</tr>
				<tr>
					<td class="table_nemu_new">设计总坝高（m）</td>
					<td class="table_con"><input class="easyui-validatebox" name="hazhardsTailingspond.sjzbg" id="updateSjzbg"/></td>
				
					<td class="table_nemu_new">坝长（m）</td>
					<td class="table_con"><input class="easyui-validatebox"  id="updateBc" name="hazhardsTailingspond.bc"/></td>
				</tr>
				<tr>
					<td class="table_nemu_new">最小干滩长度（m）</td>
					<td class="table_con"><input class="easyui-validatebox" name="hazhardsTailingspond.zxgtcd" id="updateZxgtcd"/></td>
				
					<td class="table_nemu_new">沉积干滩平均坡度</td>
					<td class="table_con"><input class="easyui-validatebox"  id="updateCjgtpjpd" name="hazhardsTailingspond.cjgtpjpd"/></td>
					</tr>
				<tr>
					<td class="table_nemu_new">尾矿库危害程度分类</td>
					<td class="table_con"><input class="easyui-combobox"  id="updateWkkwhcdfl"  name ="hazhardsTailingspond.wkkwhcdfl" data-options="valueField:'id',textField:'value',
					data:[{id:'一类尾矿库设施',value:'一类尾矿库设施'},{id:'二类尾矿库设施',value:'二类尾矿库设施'},{id:'三类尾矿库设施',value:'三类尾矿库设施'}],panelHeight:'auto',width:'100',editable:false"/></td>
					<td class="table_nemu_new" colspan="2">
					分类解释
					<br/>
					1、　一类尾矿设施：一旦发生最大程度的溃坝事故，殃及居民区或重要建（构）筑物等，可能造成死亡50人以上或经济损失1000万元以上的；<br/>
					2、　二类尾矿设施：一旦发生最大程度的溃坝事故，殃及居民区或重要建（构）筑物等，可能造成死亡10人以上至50人以下或经济损失100万元以上至1000万元以下的；<br/>
					3、　三类尾矿设施：一旦发生最大程度的溃坝事故，殃及居民区或重要建（构）筑物等，可能造成死亡10人以下或经济损失100万元以下的。<br/>
					</td>
				</tr>
				<tr>
				<td class="table_nemu_new">尾矿库安全度分类</td>
					<td class="table_con"><input class="easyui-combobox" name="hazhardsTailingspond.wkkaqdfl" id="updateWkkaqdfl" data-options="valueField:'id',textField:'value',data:[{id:'危库',value:'危库'},{id:'险库',value:'险库'},{id:'病库',value:'病库'},{id:'正常库',value:'正常库'}],panelHeight:'auto',width:'100',editable:false"/></td>
					<td class="table_nemu_new">如果尾矿库失事是否会使下游重要城镇、工矿企业、重要铁路干线遭受严重灾害</td>
					<td class="table_con"><input class="easyui-combobox"  id="updateSfyzwh" name="hazhardsTailingspond.sfyzwh"data-options="valueField:'id',textField:'value',data:[{id:'是',value:'是'},{id:'否',value:'否'}],panelHeight:'auto',width:'100',editable:false" /></td>
					</tr>
				<tr>
					<td class="table_nemu_new">坝址区地震基本烈度</td>
					<td class="table_con"><input class="easyui-validatebox" name="hazhardsTailingspond.jbld" id="updateJbld"/></td>
				
					<td class="table_nemu_new">库区有无滑坡体</td>
					<td class="table_con"><input class="easyui-combobox"  id="updateYwhpt" name="hazhardsTailingspond.ywhpt" data-options="valueField:'id',textField:'value',data:[{id:'有',value:'有'},{id:'无',value:'无'}],panelHeight:'auto',width:'100',editable:false" /></td>
				</tr>
				<tr>
					<td class="table_nemu_new">库区有无产生泥石流的条件</td>
					<td class="table_con"><input class="easyui-combobox" name="hazhardsTailingspond.ywnsl" id="updateYwnsl" data-options="valueField:'id',textField:'value',data:[{id:'有',value:'有'},{id:'无',value:'无'}],panelHeight:'auto',width:'100',editable:false" /></td>
				
					<td class="table_nemu_new">库区是否处于岩溶或裂隙发育地区</td>
					<td class="table_con"><input class="easyui-combobox"  id="updateFydq" name="hazhardsTailingspond.fydq"data-options="valueField:'id',textField:'value',data:[{id:'是',value:'是'},{id:'否',value:'否'}],panelHeight:'auto',width:'100',editable:false" /></td>
				</tr>
				<tr>
					<td class="table_nemu_new">库区有无滥伐、滥垦、滥牧现象</td>
					<td class="table_con"><input class="easyui-combobox" name="hazhardsTailingspond.ywlf" id="updateYwlf" data-options="valueField:'id',textField:'value',data:[{id:'有',value:'有'},{id:'无',value:'无'}],panelHeight:'auto',width:'100',editable:false" /></td>
				
					<td class="table_nemu_new">初期坝型</td>
					<td class="table_con"><input class="easyui-combobox"  id="updateBx" name="hazhardsTailingspond.bx" data-options="valueField:'id',textField:'value',data:[{id:'透水坝',value:'透水坝'},{id:'不透水坝',value:'不透水坝'},{id:'土坝',value:'土坝'},{id:'堆石坝',value:'堆石坝'},
					{id:'卵石坝',value:'卵石坝'},{id:'混合料坝',value:'混合料坝'},{id:'砌石坝',value:'砌石坝'},{id:'混凝土坝',value:'混凝土坝'}],panelHeight:'auto',width:'100',editable:false"  /></td>
				</tr>
				<tr>
					<td class="table_nemu_new">初期坝高（m）</td>
					<td class="table_con"><input class="easyui-validatebox" name="hazhardsTailingspond.cqbg" id="updateCqbg"/></td>
				
					<td class="table_nemu_new">初期坝长（m）</td>
					<td class="table_con"><input class="easyui-validatebox"  id="updateCqbc" name="hazhardsTailingspond.cqbc"/></td>
					</tr>
				<tr>
					<td class="table_nemu_new">堆坝方法</td>
					<td class="table_con"><input class="easyui-combobox" name="hazhardsTailingspond.dbff" id="updateDbff" data-options="valueField:'id',textField:'value',data:[{id:'上游式',value:'上游式'},{id:'下游式',value:'下游式'},{id:'中线式',value:'中线式'},{id:'其它',value:'其它'}],panelHeight:'auto',width:'100',editable:false"/></td>
					<td class="table_nemu_new">堆高</td>
					<td class="table_con"><input class="easyui-validatebox"  id="updateDg" name="hazhardsTailingspond.dg"/></td>
					</tr>
				<tr>
					<td class="table_nemu_new">尾矿分级设备型号</td>
					<td class="table_con"><input class="easyui-validatebox" name="hazhardsTailingspond.wkfjsbxh" id="updateWkfjsbxh"/></td>
				
					<td class="table_nemu_new">数量</td>
					<td class="table_con"><input class="easyui-validatebox"  id="updateSl" name="hazhardsTailingspond.sl"/></td>
					</tr>
				<tr>
					<td class="table_nemu_new" rowspan="2" colspan="2">尾矿库防洪标准（洪水重现期）</td>
					<td class="table_nemu_new">初期（年）</td>
					<td class="table_con"><input class="easyui-validatebox" name="hazhardsTailingspond.cq" id="updateCq" /></td>
				</tr>
				<tr>
					<td class="table_nemu_new">中、后期年）</td>
					<td class="table_con"><input class="easyui-validatebox" name="hazhardsTailingspond.zhq" id="updateZhq" /></td>
				</tr>
				<tr>
				<td class="table_nemu_new">汇水面积（km²）</td>
					<td class="table_con"><input class="easyui-validatebox" name="hazhardsTailingspond.hsmj" id="updateHsmj"/></td>
					<td class="table_nemu_new">尾矿坝安全超高（m）</td>
					<td class="table_con"><input class="easyui-validatebox"  id="updateWkbaqcg" name="hazhardsTailingspond.wkbaqcg"/></td>
					</tr>
				<tr>
					<td class="table_nemu_new">尾矿库调洪库容（万m³）</td>
					<td class="table_con"><input class="easyui-validatebox" name="hazhardsTailingspond.wkkdhkr" id="updateWkkdhkr"/></td>
				
					<td class="table_nemu_new">排洪系统的型式</td>
					<td class="table_con"><input class="easyui-combobox"  id="updatePhxtdxs" name="hazhardsTailingspond.phxtdxs" data-options="valueField:'id',textField:'value',data:[{id:'井－管式',value:'井－管式'},{id:'井－洞式',value:'井－洞式'},{id:'槽－管式',value:'槽－管式'},{id:'槽－洞式',value:'槽－洞式'},{id:'溢洪道',value:'溢洪道'}],panelHeight:'auto',width:'100',editable:false"/></td>
				</tr>
				<tr>
					<td class="table_nemu_new">尾矿粒度d（mm）</td>
					<td class="table_con"><input class="easyui-validatebox" name="hazhardsTailingspond.wkld" id="updateWkld"/></td>
					<td class="table_nemu_new">尾矿比重（t/m3）</td>
					<td class="table_con"><input class="easyui-validatebox"  id="updateWkbz" name="hazhardsTailingspond.wkbz"/></td>
				</tr>
				<tr>
					<td class="table_nemu_new">尾矿坝的观测项目</td>
					<td class="table_con"><input class="easyui-combobox" name="hazhardsTailingspond.wkkdgcxm" id="updateWkkdgcxm" data-options="valueField:'id',textField:'value',data:[{id:'坝体水平位移',value:'坝体水平位移'},{id:'坝体沉降',value:'坝体沉降'},{id:'坝体固结',value:'坝体固结'},
					{id:'坝体孔隙水压力',value:'坝体孔隙水压力'},{id:'坝体浸润线',value:'坝体浸润线'},{id:'坝基扬压力',value:'坝基扬压力'},{id:'绕坝渗流',value:'绕坝渗流'},
					{id:'渗流量',value:'渗流量'},{id:'渗流水水质',value:'渗流水水质'},{id:'其它',value:'其它'}],panelHeight:'auto',width:'100',editable:false"/></td>
					<td class="table_nemu_new">填表人</td>
					<td class="table_con"><input class="easyui-validatebox" name="hazhardsTailingspond.tbr" id="updateTbr" data-options="required: true" missingMessage="请输入填表人名称"/></td>
				</tr>
				<tr>
					<td class="table_nemu_new">尾矿库的尾矿浓缩分级、放矿筑坝、回水排水、防汛渡汛、抗震等工作概述</td>
					<td class="table_con" colspan="3"><textarea  name="hazhardsTailingspond.wkkgs" id="updateWkkgs" rows="3"cols="50"></textarea></td>
				</tr>
				<tr>
					<td class="table_nemu_new">如果是危库、险库或病库,对危险情况作出概述</td>
					<td class="table_con" colspan="3"><textarea  name="hazhardsTailingspond.wkxkbkgs" id="updateWkxkbkgs" rows="3"cols="50"></textarea></td>
				</tr>
				<tr>
					<td class="table_nemu_new">尾矿库曾出现的问题及采取的解决办法</td>
					<td class="table_con" colspan="3"><textarea  name="hazhardsTailingspond.jjff" id="updateJjff" rows="3"cols="50"></textarea></td>
				</tr>
				<tr>
					<td class="table_nemu_new">备注</td>
					<td class="table_con" colspan="3"><textarea  name="hazhardsTailingspond.bz" id="updateBz" rows="3"cols="50"></textarea></td>
				</tr>
				<tr>
				<td class="table_nemu_new">联系电话</td>
					<td class="table_con"><input class="easyui-validatebox" name="hazhardsTailingspond.tbrlxdh" id="updateTbrlxdh" data-options="required: true" missingMessage="请输入填表人联系方式"/></td>
					<td class="table_nemu_new">填表日期</td>
					<td class="table_con"><input id="updateTbrq" class="easyui-my97 easyui-validatebox" data-options="required:true,readOnly:true"  name="hazhardsTailingspond.tbrq" /></td>
					</tr>
				<tr>
			</table>
		  </div> 
	   	</form>
	</div>
	</div>
</body>
</html>