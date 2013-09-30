<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>金属非金属地下矿山</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<script type="text/javascript">
$(document).ready(
 	function (){
 			// 参数1：访问路径;参数2：实体类名；参数3：title
 		//init('${ctx}/minesHazards/minesHazardsAction','minesHazards', '金属非金属地下矿山');
 		 eSelect = new Select('选择', '${ctx}/jsp/ymxm/enterprise/EnterpriseSelect.jsp'
	    		 , null, function(id, corpName) {
	    	        $('input[name="minesHazards.dwdm"]').val(id);
	    	        $('input[name="minesHazards.corpName"]').val(corpName);
	    	        $('#corpName').val('');
	    });
 		grid = new Grid('${ctx}/minesHazards/minesHazardsAction!list', 'data_list');
		grid.loadGrid();
		crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			searchFormObject:$('#searchForm'),
			entityName:'minesHazards',
			moduleName:'金属非金属地下矿山',
			url:'${ctx}/minesHazards/minesHazardsAction',
			beforeSubmit:function() {
				if($('#addForm input[name="minesHazards.dwdm"]').val() == '') {
					$.messager.alert("错误", "请选择所属单位");
					return false;
			 	 }
				 return true;
			},
			afterUpdateLoadData:function(addFormObject, data){
	        	$(addFormObject).find(':checkbox').each(function(){
        			$(this).removeAttr('checked');
	        		if($(addFormObject).find('#' + $(this).attr('id')+ '_1').val() != ''){
	        			$(this).attr('checked', 'checked');
	        		}
	        	});
		 	},
		 	afterViewLoadData:function(viewFormObject, data){
			 	$.each(data,function(i,item){
	        		$(viewFormObject).find('input[name="minesHazards.' + i + '"]').val(item);
	            });	
			 	$(viewFormObject).find(':checkbox').each(function(){
			 		$(this).attr('disabled', 'disabled');
        			$(this).removeAttr('checked');
			 		if($(viewFormObject).find('#' + $(this).attr('id')+ '_1').val() != ''){
	        			$(this).attr('checked', 'checked');
	        		}
	        	});
		 	}
		});
		$(crud.params.addFormObject).find(':checkbox').click(function(){
			var id = "#"+$(this).attr('id')+"_1";
			if($(this).attr('checked')){
				$(crud.params.addFormObject).find(id).val($(this).val());
			}
			else
			{
				$(crud.params.addFormObject).find(id).val('');
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
	url += "<a title=\"定位\" onclick='window.top.gis.showPoint(\""+rowData.dwdm+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.mineName +"\");' class='btn2' ><img src=\"${ctx}/images/showPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	} else {
	url += "<a title=\"打点\" onclick='window.top.gis.addPoint(\""+rowData.dwdm+"\",\""+ rowData.id +"\",\""+ rowData.mapType +"\",\""+ rowData.mineName +"\");' class='btn2' ><img src=\"${ctx}/images/addPoint.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	}
	return url;
}
</script>
</head>
<body>
 <div class="panel-header" style="width:100%;">
		<div class="panel-title panel-with-icon">金属非金属地下矿山信息列表</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
</div>
	 <div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
	 <div>
	       <form id="searchForm" style="margin: 0;">
           <div style="margin-top:-8px;">
	     	&nbsp;&nbsp; 所属单位:&nbsp;&nbsp;<input type="text" class="easyui-validatebox" name="minesHazards.corpName" id="corpName"/>
	    	&nbsp;&nbsp;矿井名称:&nbsp;&nbsp;<input type="text" name="minesHazards.mineName" id="mineName" />
	     &nbsp;&nbsp;开采矿种:&nbsp;&nbsp;<input type="text" name="minesHazards.kckz" id="kckz" />
	     &nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search()">查询</a>
	     &nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch()">清空</a>
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
            <th align="center" field="corpName" width="15%">所属单位</th>
            <th align="center" field="mineName" width="15%">矿井名称</th>
            <th align="center" field="kckz" width="10%">开采矿种</th>
            <th align="center" field="zyfzr" width="10%">主要负责人</th>
            <th align="center" field="lxdh" width="10%">联系电话</th>
            <th field="id" width="10%" align="center" formatter="gridFormatter">操作</th>         
        </tr>
	        </thead>
	    </table>
	</div>
	<!-- 添加窗口 -->
	<div style="display: none;">
		<div id="addForm" style="width: 900px; height: 450px;" 
			data-options="iconCls:'icon-save',modal:true,
    			minimizable:true,maximizable:true,collapsible:true,draggable:false">
		<form method="post" >
	    <input type="hidden" id="updateId" name="minesHazards.id"/>
	    <input type="hidden" class="easyui-validatebox" name="minesHazards.dwdm"/>
		    <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;"
				 cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">
		    <tr>
		    	<td  class="table_nemu_new" width="25%">所属单位</td>
			<td class="table_con" colspan="3">
			<input type="text" class="easyui-validatebox" name="minesHazards.corpName"
							data-options="validType:'maxByteLength[100]'" disabled="disabled"/>
							<input type="button" value="选择" onclick="eSelect.open()"/></td>
		    </tr>
		    <tr >
			<td class="table_nemu_new" width="25%">上级法人单位</td>
			<td class="table_con" width="25%">
			<input class="easyui-validatebox"  id="addSjfrdw" name="minesHazards.sjfrdw"  missingMessage="请输入上级法人单位"/>
			<td class="table_nemu_new" width="25%">矿井名称</td>
			<td class="table_con" width="25%">
				<input class="easyui-validatebox"  id="addMineName" name="minesHazards.mineName" data-options="required: true" missingMessage="请输入矿井名称"/></td>
			</tr>
			<tr>
				<td  class="table_nemu_new" height="37" width="16%">详细地址</td>
				<td  class="table_con" colspan="3">
				<textarea id="addAddress" name="minesHazards.address" missingMessage="请输入详细地址" rows="3" cols="70"></textarea></td>
		</tr>
		
		<tr>
			<td class="table_nemu_new">邮政编码</td>
			<td class="table_con">
			<input class="easyui-validatebox"  id="addYzbm" name="minesHazards.yzbm"  missingMessage="请输入邮政编码"/>
				</td>
			<td class="table_nemu_new">主要负责人</td>
			<td  class="table_con">
			<input class="easyui-validatebox"  id="addZyfzr" name="minesHazards.zyfzr"  missingMessage="请输入主要负责人"/>
				</td>
		</tr>
		<tr>		
			<td class="table_nemu_new">联系电话</td>
			<td class="table_con">
			<input class="easyui-validatebox"  id="addLxdh" name="minesHazards.lxdh"  missingMessage="请输入联系电话"/>
			</td>
			<td class="table_nemu_new">建矿日期</td>
			<td class="table_con" style="BORDER-RIGHT: medium none;">
				<input onfocus="WdatePicker({readOnly:true})"  class="Wdate"   id="addJkrq" name="minesHazards.ckrq"  missingMessage="请输入建矿日期"/>
			</td>
		</tr>
		<tr>	
			<td class="table_nemu_new">设计能力（万t/年）</td>
			<td  class="table_con" style="BORDER-RIGHT: medium none;">
				<input class="easyui-validatebox"  id="addDesignAblity" name="minesHazards.designAblity"  missingMessage="请输入设计能力"/></td>
			<td class="table_nemu_new">实际能力（万t/年）</td>
			<td class="table_con" style="BORDER-RIGHT: medium none;">
				<input class="easyui-validatebox"  id="addRealAblity" name="minesHazards.realAblity" missingMessage="请输入实际能力"/></td>
		</tr>
		<tr>
			<td class="table_nemu_new">开采矿种</td>
			<td class="table_con">
				<input class="easyui-validatebox"  id="addKckz" name="minesHazards.kckz"  missingMessage="请输入开采矿种"/></td>
			<td class="table_nemu_new">可采储量（万t）</td>
			<td class="table_con" style="BORDER-RIGHT: medium none;" width="91">
				<input class="easyui-validatebox"  id="addKccl" name="minesHazards.kccl"  missingMessage="请输入可采储量"/></td>
		</tr>
		<tr>
			<td class="table_nemu_new">固定资产（万元）</td>
			<td class="table_con" style="BORDER-RIGHT: medium none;">
				<input class="easyui-validatebox"  id="addGdzc" name="minesHazards.gdzc"  missingMessage="请输入固定资产"/></td>
			<td  class="table_nemu_new">年利润（万元）</td>
			<td  class="table_con" style="BORDER-RIGHT: medium none;" width="91">
				<input class="easyui-validatebox"  id="addNlr" name="minesHazards.nlr"  missingMessage="请输入年利润"/></td>
		</tr>
		<tr>
			<td class="table_nemu_new">经济类型</td>
			<td class="table_con">
			<input class="easyui-combobox" id="addJjlx" name="minesHazards.jjlx" 
			data-options="valueField: 'id',textField: 'value',data: [{id: '国有',value: '国有'},{id: '集体',value: '集体'},{id: '私营',value: '私营'},{id: '其它',value: '其它'}],panelHeight:'auto',width:'100',editable:false"/>
				</td>
			<td class="table_nemu_new">从业人数</td>
			<td class="table_con">
				<input class="easyui-validatebox"  id="addCyrs" name="minesHazards.cyrs" missingMessage="请输入从业人数"/></td>
		</tr>
		<tr>
			<td  class="table_nemu_new">开拓方式</td>
			<td class="table_con">
			<input class="easyui-combobox" id="addKtfs" name="minesHazards.ktfs" 
			data-options="valueField: 'id',textField: 'value',data: [{id: '立井',value: '立井'},{id: '斜井',value: '斜井'},{id: '平峒',value: '平峒'},{id: '混合',value: '混合'},{id: '斜坡道',value: '斜坡道'}],panelHeight:'auto',width:'100',editable:false"/>
			</td>
			<td  class="table_nemu_new">通风方式</td>
			<td  class="table_con">
			<input class="easyui-combobox" id="addTffs" name="minesHazards.tffs" 
			data-options="valueField: 'id',textField: 'value',data: [{id: '中央并列',value: '中央并列'},{id: '分区式',value: '分区式'},{id: '对角式',value: '对角式'},{id: '其它',value: '其它'}],panelHeight:'auto',width:'100',editable:false"/>
			</td>
		</tr>
		<tr>
			<td class="table_nemu_new">提升方式</td>
			<td  class="table_con">
			<input class="easyui-combobox" id="addTsfs" name="minesHazards.tsfs" 
			data-options="valueField: 'id',textField: 'value',data: [{id: '罐笼',value: '罐笼'},{id: '箕斗井',value: '箕斗井'},{id: '串车',value: '串车'},{id: '皮带',value: '皮带'},{id: '其它',value: '其它'}],panelHeight:'auto',width:'100',editable:false"/>
			</td>
			<td class="table_nemu_new">供电方式</td>
			<td class="table_con">
			<input class="easyui-combobox" id="addGdfs" name="minesHazards.gdfs" 
			data-options="valueField: 'id',textField: 'value',data: [{id: '两回路',value: '两回路'},{id: '双电源',value: '双电源'},{id: '其它',value: '其它'}],panelHeight:'auto',width:'100',editable:false"/>
			</td>
		</tr>
		<tr>
			<td class="table_nemu_new">同时生产的中段数</td>
			<td class="table_con">
				<input class="easyui-validatebox"  id="addTsscdzds" name="minesHazards.tsscdzds" missingMessage="请输入同时生产的中段数"/></td>
			<td class="table_nemu_new" >准备生产的中段数</td>
			<td class="table_con" >
				<input class="easyui-validatebox"  id="addZbscdzds" name="minesHazards.zbscdzds" missingMessage="准备生产的中段数"/></td>
		</tr>
		<tr>
			<td class="table_nemu_new">同时生产的采场数</td>
			<td class="table_con">
				<input class="easyui-validatebox"  id="addTsscdccs" name="minesHazards.tsscdccs" missingMessage="请输入同时生产的采场数"/>
				</td>
			<td class="table_nemu_new" >井下同时作业人数</td>
			<td class="table_con">
				<input class="easyui-validatebox"  id="addJxtszyrs" name="minesHazards.jxtszyrs" missingMessage="请输入井下同时作业人数"/>
				</td>
		</tr>
		<tr>
			<td class="table_nemu_new">矿井总进风量（m3/min）</td>
			<td class="table_con" style="BORDER-RIGHT: medium none;">
				<input class="easyui-validatebox"  id="addKjzjfl" name="minesHazards.kjzjfl"/></td>
			<td class="table_nemu_new" >矿井有效风量率</td>
			<td class="table_con" >
				<input class="easyui-validatebox"  id="addKjyxfll" name="minesHazards.kjyxfll"/></td>
		</tr>
		<tr>
			<td class="table_nemu_new" >矿井最大涌水量（m3/h）</td>
			<td class="table_con" style="BORDER-RIGHT: medium none;">
				<input class="easyui-validatebox"  id="addKjzdysl" name="minesHazards.kjzdysl"/></td>
			<td class="table_nemu_new">矿井最大综合排水量（m3/h）</td> 
			<td class="table_con" style="BORDER-RIGHT: medium none;" >
				<input class="easyui-validatebox"  id="addZjzdzhpsl" name="minesHazards.zjzdzhpsl"/></td>
		</tr>
		<tr>
			<td class="table_nemu_new" rowspan="3">是否是以下类型的矿井（可多选）</td>
			<input type="hidden" name="minesHazards.yxlxdkjws" id="addYxlxdkjws_1">
			<td class="table_con">
				<input type="checkbox" onchange="checkFunction('addYxlxdkjws');" id="addYxlxdkjws" value="瓦斯矿井"/>瓦斯矿井
				</td>
			<input type="hidden" name="minesHazards.yxlxdkjmxdk" id="addYxlxdkjmxldk_1">
			<td class="table_con">
				<input type="checkbox" onchange="checkFunction('addYxlxdkjmxldk');" id="addYxlxdkjmxldk" value="煤系硫铁矿井"/>煤系硫铁矿井
				</td>
			<input type="hidden" name="minesHazards.yxlxdkjm" id="addYxlxdkjm_1">
			<td class="table_con">
				<input type="checkbox"  onchange="checkFunction('addYxlxdkjm');" id="addYxlxdkjm" value="其他与煤共生的矿井"/>其他与煤共生的矿井
			</td>
		</tr>
		<tr>
			<input type="hidden" name="minesHazards.yxlxdkjfsx" id="addYxlxdkjfsx_1">
			<td class="table_con">
				<input type="checkbox" onchange="checkFunction('addYxlxdkjfsx');" id="addYxlxdkjfsx" value="放射性的矿井"/>放射性的矿井
			</td>
			<input type="hidden" name="minesHazards.yxlxdkjfh" id="addYxlxdkjfh_1">
			<td class="table_con">
				<input type="checkbox" onchange="checkFunction('addYxlxdkjfh');" id="addYxlxdkjfh" value="有自燃发火危险的矿井"/>有自燃发火危险的矿井
			</td>
			<input type="hidden" name="minesHazards.yxlxdkjglk"  id="addYxlxdkjglk_1">
			<td class="table_con">
				<input type="checkbox" onchange="checkFunction('addYxlxdkjglk');" id="addYxlxdkjglk" value="高硫矿"/>高硫矿
			</td>
		</tr>
		<tr>
			<input type="hidden" name="minesHazards.yxlxdkjkc" id="addYxlxdkjkc_1">
			<td class="table_con">
			<input type="checkbox" onchange="checkFunction('addYxlxdkjkc');" id="addYxlxdkjkc" value="矿尘有爆炸性"/>矿尘有爆炸性
			</td>
			<input type="hidden" name="minesHazards.yxlxdkjcjdy" id="addYxlxdkjcjdy_1"></td>
			<td class="table_con">
				<input type="checkbox"  onchange="checkFunction('addYxlxdkjcjdy');" id="addYxlxdkjcjdy" value="有冲击地压危害"/>有冲击地压危害
			<td class="table_con"></td>
		</tr> 
		<tr>
			<td class="table_nemu_new" rowspan="2" colspan="2">井下固定敷设的高压电缆型号</td>
			<td class="table_nemu_new">竖井或倾角在45度及其以上的井巷</td>
			<td class="table_con">
				<input class="easyui-validatebox"  id="addSjhqjdjx" name="minesHazards.sjhqjdjx"/>
				</td>
		</tr>
		<tr>
			<td class="table_nemu_new">水平巷道或倾角在45度以下的井巷内</td>
			<td class="table_con">
				<input class="easyui-validatebox"  id="addSpxdhjqdjx" name="minesHazards.spxdhjqdjx"/>
				</td>
		</tr>
		<tr>
			<td class="table_nemu_new" colspan="2">地面爆破材料储存情况</td>
			<td class="table_nemu_new">库房数</td>
			<td class="table_con">
				<input class="easyui-validatebox"  id="addDmbzclkfs" name="minesHazards.dmbzclkfs"/></td>
		</tr>
		<tr>
		<td class="table_nemu_new">炸药(t)</td>
			<td class="table_con">
				<input class="easyui-validatebox" id="addDmbzclzy" name="minesHazards.dmbzclzy"/></td>
			<td class="table_nemu_new">雷管（万发）</td>
			<td  class="table_con" style="BORDER-RIGHT: medium none;">
				<input class="easyui-validatebox"  id="addDmbzcllg" name="minesHazards.dmbzcllg"/></td>
		</tr>
		<tr>
			<td class="table_nemu_new" colspan="2">井下爆破材料储存情况</td>
			<td class="table_nemu_new">峒室数</td>
			<td class="table_con">
				<input class="easyui-validatebox"  id="addJxbzcltss" name="minesHazards.jxbzcltss"/></td>
		</tr>
		<tr>
			<td class="table_nemu_new">炸药(t)</td>
			<td colspan="1" rowspan="1" class="table_con">
				<input class="easyui-validatebox"  id="addJxbzclzy" name="minesHazards.jxbzclzy"/></td>
			<td class="table_nemu_new">雷管（万发）</td>
			<td class="table_con" style="BORDER-RIGHT: medium none;">
				<input class="easyui-validatebox"  id="addJxbzcllg" name="minesHazards.jxbzcllg"/></td>
		</tr>
		<tr>
			<td class="table_nemu_new" rowspan="6">矿井有无下列水文地质资料</td>
			<td class="table_nemu_new" colspan="2">1矿区及其附近地表水流系统和汇水面积、疏水能力、水利工程等情况；</td>
			<td class="table_con">
				<input class="easyui-combobox" id="addKqfjqk" name="minesHazards.kqfjqk" data-options="valueField: 'id',textField: 'value',data: [{id: '是',value: '是'},{id: '否',value: '否'}],panelHeight:'auto',width:'100',editable:false"/></td>
		</tr>
		<tr>
			<td class="table_nemu_new" colspan="2">2历年最高洪水位，洪水量地面水体、各含水含水层及地井水的动态；</td>
			<td class="table_con">
				<input class="easyui-combobox" id="addLnsw" name="minesHazards.lnsw" data-options="valueField: 'id',textField: 'value',data: [{id: '是',value: '是'},{id: '否',value: '否'}],panelHeight:'auto',width:'100',editable:false"/></td>
		</tr>
		<tr>
			<td class="table_nemu_new" colspan="2">3矿区内小矿井、老井、老采空区；</td>
			<td class="table_con">
				<input class="easyui-combobox" id="addKqqtkq" name="minesHazards.kqqtkq" data-options="valueField: 'id',textField: 'value',data: [{id: '是',value: '是'},{id: '否',value: '否'}],panelHeight:'auto',width:'100',editable:false"/></td>
		</tr>
		<tr>
			<td colspan="2" class="table_nemu_new">4矿区内的钻孔和封孔质量；</td>
			<td  class="table_con">
				<input class="easyui-combobox" id="addKqzkzl" name="minesHazards.kqzkzl" data-options="valueField: 'id',textField: 'value',data: [{id: '是',value: '是'},{id: '否',value: '否'}],panelHeight:'auto',width:'100',editable:false"/></td>
		</tr>
		<tr>
			<td colspan="2" class="table_nemu_new">5现有生产井中的积水区、含水区、岩溶带、地质构造等详细情况；</td>
			<td class="table_con">
				<input class="easyui-combobox" id="addXyscjqk" name="minesHazards.xyscjqk" data-options="valueField: 'id',textField: 'value',data: [{id: '是',value: '是'},{id: '否',value: '否'}],panelHeight:'auto',width:'100',editable:false"/></td>
		</tr>
		<tr>
			<td colspan="2" class="table_nemu_new">6矿井水与地下水、地表水和大气降雨的水力联系。</td>
			<td class="table_con">
				<input class="easyui-combobox" id="addKjsdsllx" name="minesHazards.kjsdsllx" data-options="valueField: 'id',textField: 'value',data: [{id: '是',value: '是'},{id: '否',value: '否'}],panelHeight:'auto',width:'100',editable:false"/></td>
		</tr>
		<tr>
			<td class="table_nemu_new">是否是水文地质条件复杂的矿井</td>
			<td class="table_con">
				<input class="easyui-combobox" id="addSwdzkj" name="minesHazards.swdzkj" data-options="valueField: 'id',textField: 'value',data: [{id: '是',value: '是'},{id: '否',value: '否'}],panelHeight:'auto',width:'100',editable:false"/></td>
			<td class="table_nemu_new">矿井开采是否受地表水体或洪水的威胁</td>
			<td class="table_con">
				<input class="easyui-combobox" id="addKjsfstwx" name="minesHazards.kjsfstwx" data-options="valueField: 'id',textField: 'value',data: [{id: '是',value: '是'},{id: '否',value: '否'}],panelHeight:'auto',width:'100',editable:false"/></td>
		</tr>
		<tr>
			<td class="table_nemu_new">矿体顶底板含水层情况</td>
			<td class="table_con">
			<input class="easyui-combobox" id="addKtddbhscqk" name="minesHazards.ktddbhscqk" data-options="valueField: 'id',textField: 'value',data: [{id: '无',value: '无'},{id: '孔隙含水层',value: '孔隙含水层'},{id: '裂隙含水层',value: '裂隙含水层'},{id: '岩溶含水层',value: '岩溶含水层'}],panelHeight:'auto',width:'100',editable:false"/>
				</td>
			<td class="table_nemu_new">矿体顶底板有无承压含水层</td>
			<td class="table_con">
			<input class="easyui-combobox" id="addKtddbyfhsc" name="minesHazards.ktddbyfhsc" data-options="valueField: 'id',textField: 'value',data: [{id: '有承压含水层',value: '有承压含水层'},{id: '无承压含水层',value: '无承压含水层'}],panelHeight:'auto',width:'100',editable:false"/></td>
				</td>
		</tr>
		<tr>
			<td class="table_nemu_new">冲击地压（岩爆）危害</td>
			<td class="table_con">
			<input class="easyui-combobox" id="addCjdywh" name="minesHazards.cjdywh" data-options="valueField: 'id',textField: 'value',data: [{id: '无冲击地压',value: '无冲击地压'},{id: '弱冲击地压',value: '弱冲击地压'},{id: '强冲击地压',value: '强冲击地压'}],panelHeight:'auto',width:'100',editable:false"/></td>
				</td>
			<td class="table_nemu_new">矿区内影响生产与安全的断层数目</td>
			<td class="table_con">
				<input class="easyui-validatebox"  id="addKqdcsm" name="minesHazards.kqdcsm"/></td>
		<tr>
			<td class="table_nemu_new">巷道围岩的稳定性</td>
			<td class="table_con">
			<input class="easyui-combobox" id="addXdwywdx" name="minesHazards.xdwywdx" data-options="valueField: 'id',textField: 'value',data: [{id: '比较稳定的坚硬砂岩或石灰岩等',value: '比较稳定的坚硬砂岩或石灰岩等'},{id: '中等稳定的砂岩、砂页岩或较坚硬页岩',value: '中等稳定的砂岩、砂页岩或较坚硬页岩'},{id: '中等稳定的砂岩、砂页岩或较坚硬页岩',value: '不稳定的煤、泥质页岩、炭质页岩'}],panelHeight:'auto',width:'100',editable:false"/></td>
				</td>
			<td class="table_nemu_new">带式输送机数量(部)</td>
			<td class="table_con">
				<input class="easyui-validatebox"  id="addDsssjsl" name="minesHazards.dsssjsl"/></td>
		</tr>
		<tr>
			<td class="table_nemu_new">井下柴油设备数量</td>
			<td class="table_con">
				<input class="easyui-validatebox"  id="addJxcysbsl" name="minesHazards.jxcysbsl"/></td>
			<td class="table_nemu_new">井下油压设备数量</td>
			<td class="table_con"> 
				<input class="easyui-validatebox"  id="addJxyysbsl" name="minesHazards.jxyysbsl"/></td>
		</tr>
		<tr>
			<td class="table_nemu_new" rowspan="3">有哪些防火措施</td>
			<input type="hidden" name="minesHazards.ynxfhcsssd"  id="addYnxfhcsssd_1">
			<td  class="table_con">
				<input type="checkbox" onchange="checkFunction('addYnxfhcsssd');" id="addYnxfhcsssd" value="滚筒驱动带式输送机使用阻燃输送带"/>滚筒驱动带式输送机使用阻燃输送带
			</td>
			<input type="hidden" name="minesHazards.ynxfhcsjz"  id="addYnxfhcsjz_1">
			<td class="table_con">
				<input type="checkbox" onchange="checkFunction('addYnxfhcsjz');"  id="addYnxfhcsjz" value="液力偶合器使用不燃性传动介质"/>液力偶合器使用不燃性传动介质
			</td>
			<input type="hidden" name="minesHazards.ynxfhcszh" id="addYnxfhcszh_1">
			<td class="table_con">
				<input type="checkbox"  onchange="checkFunction('addYnxfhcszh');"  id="addYnxfhcszh"  value="输送机的机头前后两端20m范围内使用不燃性材料支护"/>输送机的机头前后两端20m范围内使用不燃性材料支护
			</td>
			
		</tr>
		<tr>
			<input type="hidden" name="minesHazards.ynxfhcsqc" id="addYnxfhcsqc_1">
			<td class="table_con">
				<input type="checkbox"  onchange="checkFunction('addYnxfhcsqc');"  id="addYnxfhcsqc" value="配备灭火器材"/>配备灭火器材
			</td>
			<input type="hidden" name="minesHazards.ynxfhcszz" id="addYnxfhcszz_1">
			<td class="table_con">
				<input type="checkbox" onchange="checkFunction('addYnxfhcszz');"  id="addYnxfhcszz"value="设驱动滚筒防滑保护、防跑偏装置"/>设驱动滚筒防滑保护、防跑偏装置
			</td>
			<input type="hidden" name="minesHazards.ynxfhcswd" id="addYnxfhcsbh_1">
			<td class="table_con">
				<input type="checkbox" onchange="checkFunction('addYnxfhcsbh');"  id="addYnxfhcsbh"  value="设温度保护、烟雾保护"/>设温度保护、烟雾保护
			</td>
		</tr>
		<tr>
			<td class="table_con">
				其他措施(含名称)</td>
				<td class="table_con"><input class="easyui-validatebox"  id="addQtcs" name="minesHazards.qtcs"/></td>
				<td class="table_con"></td>
		</tr>
		<tr>
			<td class="table_nemu_new">地面消防池容量（m3）</td>
			<td class="table_con" style="BORDER-RIGHT: medium none;" >
				<input class="easyui-validatebox"  id="addDmfscrl" name="minesHazards.dmfscrl"/></td>
			<td class="table_nemu_new">井下消防水管长度（m）</td>
			<td class="table_con" style="BORDER-RIGHT: medium none;">
				<input class="easyui-validatebox"  id="addJxxfsgcd" name="minesHazards.jxxfsgcd"/></td>
		</tr>
		<tr>
			<td class="table_nemu_new">井下有何种有害气体大量涌出</td>
			<td class="table_con">
				<input class="easyui-validatebox"  id="addJxyhqt" name="minesHazards.jxyhqt"/></td>
			<td class="table_nemu_new">矿井有无未熄灭的火区</td>
			<td  class="table_con">
				<input class="easyui-combobox" id="addKjywhq" name="minesHazards.kjywhq" data-options="valueField: 'id',textField: 'value',data: [{id: '有',value: '有'},{id: '无',value: '无'}],panelHeight:'auto',width:'100',editable:false"/></td>
		</tr>
		<tr>
			<td class="table_nemu_new">有无威胁矿井安全生产的塌陷区或有塌陷危险的区域</td>
			<td class="table_con">
				<input class="easyui-combobox" id="addKqnywtxwxqy" name="minesHazards.kqnywtxwxqy" data-options="valueField: 'id',textField: 'value',data: [{id: '有',value: '有'},{id: '无',value: '无'}],panelHeight:'auto',width:'100',editable:false"/></td>
			<td class="table_nemu_new">是否是在建筑物下、水体下或铁路下开采</td>
			<td class="table_con">
				<input class="easyui-combobox" id="addSfjzstdlkc" name="minesHazards.sfjzstdlkc" data-options="valueField: 'id',textField: 'value',data: [{id: '是',value: '是'},{id: '否',value: '否'}],panelHeight:'auto',width:'100',editable:false"/></td>
		</tr>
		<tr>
			<td class="table_nemu_new">近5年内伤亡事故起数</td>
			<td class="table_con">
				<input class="easyui-validatebox"  id="addJwnsg" name="minesHazards.jwnsg"/></td>
			<td class="table_nemu_new">轻伤数</td>
			<td class="table_con">
				<input class="easyui-validatebox"  id="addQsrs" name="minesHazards.qsrs"/></td>
			</tr>
		<tr>
			<td class="table_nemu_new">重伤人数</td>
			<td class="table_con">
				<input class="easyui-validatebox"  id="addZsrs" name="minesHazards.zsrs"/></td>
			<td class="table_nemu_new">死亡人数</td>
			<td class="table_con">
				<input class="easyui-validatebox"  id="addSwrs" name="minesHazards.swrs"/></td>
		</tr>
		<tr>
			<td class="table_nemu_new" rowspan="2">建矿以来曾发生重大事故起数（指造成3人以上死亡或全矿或部分区域停产）</td>
			<input type="hidden" name="minesHazards.jkylzdsgsz" id="addJkylzdsgsz_1">
			<td class="table_con">
				<input type="checkbox" onchange="checkFunction('addJkylzdsgsz');" id="addJkylzdsgsz" value="水灾"/>水灾
			</td>
			<input type="hidden" name="minesHazards.jkylzdsghz"  id="addJkylzdsghz_1">
			<td class="table_con">
				<input type="checkbox" onchange="checkFunction('addJkylzdsghz');" id="addJkylzdsghz" value="火灾"/>火灾
			</td>
			<input type="hidden" name="minesHazards.jkylzdsgmd" id="addJkylzdsgmd_1">	
			<td class="table_con">
				<input type="checkbox" onchange="checkFunction('addJkylzdsgmd');" id="addJkylzdsgmd"  value="大面积冒顶"/>大面积冒顶</td>
			</td>
		</tr>
		<tr>
			<input type="hidden" name="minesHazards.jkylzdsgzgmc" id="addJkylzdsgzgmc_1">
			<td class="table_con">
				<input type="checkbox" onchange="checkFunction('addJkylzdsgzgmc');" id="addJkylzdsgzgmc"  value="坠罐或跑"/>坠罐或跑车
			</td>
			<td  class="table_con">其它（注明事故类型）</td>
			<td  class="table_con">
				<input class="easyui-validatebox"  id="addJkylzdsgqt" name="minesHazards.jkylzdsgqt"/></td>
		</tr>
		<tr>
			<td class="table_nemu_new">主扇型号</td>
			<td class="table_con">
				<input class="easyui-validatebox"  id="addZsxh" name="minesHazards.zsxh"/></td>
			<td class="table_nemu_new">数量</td>
			<td  class="table_con">
				<input class="easyui-validatebox"  id="addZsxh" name="minesHazards.zssl"/></td>
		</tr>
		<tr>
			<td class="table_nemu_new">局扇型号</td>
			<td class="table_con">
			<input class="easyui-validatebox"  id="addJsxh" name="minesHazards.jsxh"/></td>
			<td class="table_nemu_new" >数量</td>
			<td class="table_con">
				<input class="easyui-validatebox"  id="addJsxh" name="minesHazards.jssl"/></td>
		</tr>
		<tr> 
			<td class="table_nemu_new">主排水泵型号</td>
			<td class="table_con">
			<input class="easyui-validatebox"  id="addZpsgxh" name="minesHazards.zpsgxh"/></td>
			<td class="table_nemu_new">数量</td>
			<td class="table_con">
				<input class="easyui-validatebox"  id="addZpsgxh" name="minesHazards.zpsgsl"/></td>
		</tr>
		<tr>
			<td class="table_nemu_new">探放水设备型号</td>
			<td class="table_con">
			<input class="easyui-validatebox"  id="addTfssbxh" name="minesHazards.tfssbxh"/></td>
			<td class="table_nemu_new">数量</td>
			<td class="table_con">
				<input class="easyui-validatebox"  id="addTfssbsl" name="minesHazards.tfssbsl"/></td>
		</tr>
		<tr>
			<td class="table_nemu_new">绞车提升设备型号</td>
			<td class="table_con">
			<input class="easyui-validatebox"  id="addJctssbxh" name="minesHazards.jctssbxh"/></td>
			<td class="table_nemu_new">数量</td>
			<td class="table_con">
				<input class="easyui-validatebox"  id="addJctssbsl" name="minesHazards.jctssbsl"/></td>
		</tr>
		<tr>
			<td class="table_nemu_new">技术人员高级</td>
			<td  class="table_con">
				<input class="easyui-validatebox"  id="addJsrysgj" name="minesHazards.jsrysgj"/></td>
			<td class="table_nemu_new">技术人员中级</td>
			<td class="table_con">
				<input class="easyui-validatebox"  id="addJsryszj" name="minesHazards.jsryszj"/></td>
				</tr>
		<tr>
			<td class="table_nemu_new">技术人员初级</td>
			<td class="table_con">
				<input class="easyui-validatebox"  id="addJsryscj" name="minesHazards.jsryscj"/></td>
				<td class="table_nemu_new">电工人数</td>
			<td class="table_con">
				<input class="easyui-validatebox"  id="addDgrs" name="minesHazards.dgrs"/></td>
		</tr>
		<tr>
			<td class="table_nemu_new">绞车司机人数</td>
			<td class="table_con">
				<input class="easyui-validatebox"  id="addJcsjrs" name="minesHazards.jcsjrs"/></td>
			<td class="table_nemu_new">放炮员人数</td>
			<td class="table_con">
				<input class="easyui-validatebox"  id="addFbrs" name="minesHazards.fbrs"/></td>
		</tr>
		<tr>
			<td class="table_nemu_new">采矿方法</td>
			<td colspan="3" class="table_con">
				<textarea id="addCkff" name="minesHazards.ckff" rows="5" cols="70"></textarea>
				</td>
		</tr>
		<tr>
			<td class="table_nemu_new">影响矿井安全生产的主要问题说明(不少于三条内容)</td>
		
			<td colspan="3"class="table_con">
				<textarea id="addXykjwtsm" name="minesHazards.xykjwtsm" rows="5" cols="70"></textarea></td>
		</tr>
		<tr>
			<td class="table_nemu_new">备注</td>
			<td colspan="3" class="table_con">
				<textarea id="addBz" name="minesHazards.bz" rows="5" cols="70"></textarea></td>
		</tr>
		<tr>
			<td class="table_nemu_new">矿井安全是否受其它小矿乱采乱掘的影响</td>
				<td class="table_con">
					<input class="easyui-combobox" id="addKjaqsfsljyx" name="minesHazards.kjaqsfsljyx" data-options="valueField: 'id',textField: 'value',data: [{id: '是',value: '是'},{id: '否',value: '否'}],panelHeight:'auto',width:'100',editable:false"/></td>
				<td class="table_nemu_new">填表人</td>
				<td class="table_con">
					<input class="easyui-validatebox"  id="addTbr" name="minesHazards.tbr"/></td>
		</tr>
		<tr>
			<td class="table_nemu_new">联系电话</td>
			<td class="table_con">
				<input class="easyui-validatebox"  id="addTblxdh" name="minesHazards.tblxdh"/></td>
			<td class="table_nemu_new">填表日期</td>
			<td class="table_con">
				<input type="text" class="easyui-my97 easyui-validatebox" data-options="required:true,readOnly:true" id="addTbrq" name="minesHazards.tbrq"/></td>
		</tr>
		</table>
		</div>
		</form>
		</div>
	</div>
	
</body>
</html>