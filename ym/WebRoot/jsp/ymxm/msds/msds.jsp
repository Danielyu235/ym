<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="gb2312" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>Σ��Ʒ������</title>
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
				moduleName:'Σ��Ʒ������',
				url:'${ctx}/tbMsds/tbMsdsAction',
				afterViewLoadData: function(viewFormObject, data){
			 		var ele = $('<div style="position:absolute;right:40px;top:40px;z-index:3;width:200px;" id="menu">'
	                            + '<div style="display:block;"><img src="popWin_top.gif" width="200" height="6" border="0"/></div>'
								+ '<div style="background:url(popWin_center.gif) repeat-y;width:200px;"><div class="popWinList" id="list_on" style="display:none">'
								+ '<span style="cursor:hand" onclick="liston()">����˴�չ������</span></div><div class="popWinList" id="list_off">'
								+ '<a href="#part1">��һ����&nbsp;��ѧƷ����ҵ��ʶ</a><br/><a href="#part2">�ڶ�����&nbsp;�ɷ�/�����Ϣ</a><br/>'
								+ '<a href="#part3">��������&nbsp;Σ���Ը���</a><br/><a href="#part4">���Ĳ���&nbsp;���ȴ�ʩ</a><br/>'
								+ '<a href="#part5">���岿��&nbsp;������ʩ</a><br/><a href="#part6">��������&nbsp;й©Ӧ������</a><br/>'
								+ '<a href="#part7">���߲���&nbsp;���������봢��</a><br/><a href="#part8">�ڰ˲���&nbsp;�Ӵ�����/�������</a><br/>'
								+ '<a href="#part9">�ھŲ���&nbsp;������</a><br/><a href="#part10">��ʮ����&nbsp;�ȶ��Ժͷ�Ӧ����</a><br/>'
								+ '<a href="#part11">��ʮһ����&nbsp;����ѧ����</a><br/><a href="#part12">��ʮ������&nbsp;��̬ѧ����</a><br/>'
								+ '<a href="#part13">��ʮ������&nbsp;��������</a><br/><a href="#part14">��ʮ�Ĳ���&nbsp;������Ϣ</a><br/>'
								+ '<a href="#part15">��ʮ�岿��&nbsp;������Ϣ</a><br/><a href="#part16">��ʮ������&nbsp;������Ϣ</a></div>'
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
  		if(str.indexOf('����') > -1) {
  			return str.substring(1, str.indexOf('����'));
  		}
  		return null;
  }
  function numberConvert(str) {
  		var cn = new Array("һ","��","��","��","��","��","��","��","��","ʮ");
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
         //���ر�������
function gridFormatter(value, rowData, rowIndex) {
	var rowId = rowData.id;
	var url = "";
	url += "<a title=\"�鿴\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"../../../images/select.png\"></img></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	url += "<a title=\"�޸�\" onclick='crud.update(\""+rowId+"\");' class='btn2'><img src=\"../../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	return url;
}
</script>
</head>
<body>

  <div class="panel-header" style="width:100%;">
	<div class="panel-title panel-with-icon">Σ��Ʒ������</div>
	<div class="panel-icon icon-edit"></div>
	<div class="panel-tool"></div>
</div>

 <div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
 <div id="search">
        <form id="searchForm" method="post" style="display: inline;">
        <div style="margin-top:-8px;">
        &nbsp;&nbsp;��������:&nbsp;&nbsp;<input class="easyui-validatebox"  name="tbMsds.zwm" >
        &nbsp;&nbsp;Ӣ������:&nbsp;&nbsp;<input class="easyui-validatebox"  name="tbMsds.ywm" >
        &nbsp;&nbsp;����ʽ:&nbsp;&nbsp;<input class="easyui-validatebox"  name="tbMsds.fzs" >
        &nbsp;&nbsp;������:&nbsp;&nbsp;<input class="easyui-validatebox"  name="tbMsds.fzl" >
        &nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search();">��ѯ</a>
		&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch();">���</a>
        </div>
        </form>
    </div>
    </div>
     <div class="search_add">
	<shiro:hasPermission name="48:add">
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add', plain:true" onclick="crud.add();">���</a>
	</shiro:hasPermission>
	<shiro:hasPermission name="48:delete">		
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove', plain:true" onclick="crud.remove();">ɾ��</a>
	</shiro:hasPermission>
    </div>
<!-- ����ͷ -->
<div style="height:78%;">
    <table id="data_list" style="display:none">
        <thead>
        <tr>
            <th field="zwm" width="150" align="center" title="zwm">������</th>
            <th field="ywm" width="150" align="center" title="ywm">Ӣ����</th>
            <th field="fzs" width="150" align="center" title="fzs">����ʽ</th>
            <th field="fzl" width="150" align="center" title="fzl">������</th>
            <th align="center" field="id" width="160" formatter="gridFormatter">����</th>    
        </tr>
        </thead>
    </table>
</div>

<!-- �޸Ĵ��� -->
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
	<td class="table_nemu_new" colspan="4" align="center">Σ��Ʒ��ȫ����˵����</td>
</tr>
<tr>
<br>
 <tr height=26>
  <td colspan=4 class="table_nemu_new"><b>��һ����&nbsp;��ѧƷ����λ��ʶ</b></td>
 </tr>
 <tr>
  <td class="table_nemu_new" width="25%">Σ��Ʒ��������</td>
  <td colspan=3  class="table_con"><input type="text" name="tbMsds.zwm"  style="width:90%"></td>
 </tr>
 <tr>
  <td class="table_nemu_new">Σ��ƷӢ������</td>
  <td colspan=3  class="table_con">
	<input type="text" name="tbMsds.ywm" style="width:90%">
  </td>
 </tr>
 <tr>
  <td class="table_nemu_new">����ʽ</td>
  <td class="table_con"><input type="text" name="tbMsds.fzs" style="width:90%">
  </td>
  <td class="table_nemu_new">������</td>
  <td class="table_con"><input type="text" name="tbMsds.fzl" style="width:90%" >
  </td>
 </tr>
 <tr>
  <td colspan=4 class="table_nemu_new"><b>�ڶ�����&nbsp;
  �ɷ�/�����Ϣ</b></td>
 </tr>
 <tr>
  <td colspan=4 class="table_nemu_new"><b>��������&nbsp;
  Σ���Ը���</b></td>
 </tr>
 <tr>
  <td class="table_nemu_new">Σ�������</td>
  <td colspan=3 class="table_con"><input type="text" name="tbMsds.wxxlb" style="width:90%"></td>
 </tr>
 <tr>
  <td class="table_nemu_new">����;��</td>
  <td colspan=3 class="table_con"><input type="text" name="tbMsds.qrtj" style="width:90%"></td>
 </tr>
 <tr>
  <td class="table_nemu_new" height="50">����Σ��</td>
  <td colspan=3 class="table_con"><textarea name="tbMsds.jkwh" cols="61" rows="5" style="width:90%;overflow-y:auto"></textarea></td>
 </tr>
 <tr>
  <td colspan=4 class="table_nemu_new"><b>���Ĳ���&nbsp;
  ���ȴ�ʩ</b></td>  
 </tr>
 <tr>
  <td class="table_nemu_new">Ƥ���Ӵ�</td>
  <td colspan=3 class="table_con"><input type="text" name="tbMsds.pfjc" style="width:90%"></td>
 </tr>
 <tr>
  <td class="table_nemu_new">�۾��Ӵ�</td>
  <td colspan=3 class="table_con"><textarea name="tbMsds.yjjc" cols="61" rows="5" style="width:90%;overflow-y:auto"></textarea></td>
 </tr>
 <tr>
  <td height=53 class="table_nemu_new">��&nbsp;&nbsp;&nbsp;��</td>
  <td colspan=3 class="table_con"><textarea name="tbMsds.xr" cols="61" rows="5" style="width:90%;overflow-y:auto"></textarea></td>
 </tr>
 <tr>
  <td height=26 class="table_nemu_new">ʳ&nbsp;&nbsp;&nbsp;��</td>
  <td colspan=3 class="table_con"><textarea name="tbMsds.sr" cols="61" rows="5" style="width:90%;overflow-y:auto"></textarea></td>
 </tr>
 <tr>
  <td colspan=4 height=26 class="table_nemu_new"><b>���岿��&nbsp;
  ������ʩ</b></td>
 </tr>
 <tr>
  <td class="table_nemu_new">Σ������</td>
  <td colspan=3 class="table_con"><textarea name="tbMsds.wxtx" cols="61" rows="5" style="width:90%;overflow-y:auto"></textarea></td>
 </tr>
  <tr>
  <td class="table_nemu_new">ȼ����</td>
  <td colspan=3 class="table_con"><input type="text" name="tbMsds.rsx" style="width:90%"></td>
 </tr>
  <tr>
  <td class="table_nemu_new">��ȼ�¶�</td>
  <td colspan=3 class="table_con"><input type="text" name="tbMsds.zrwd" style="width:90%"></td>
 </tr>
   <tr>
  <td class="table_nemu_new">������շּ�</td>
  <td colspan=3 class="table_con"><input type="text" name="tbMsds.jghxfj" style="width:90%"></td>
 </tr>
 <tr>
  <td class="table_nemu_new">��𷽷�������</td>
  <td colspan=3 class="table_con"><textarea name="tbMsds.mhff" cols="61" rows="5" style="width:90%;overflow-y:auto"></textarea></td>
 </tr>
 <tr>
  <td colspan=4 class="table_nemu_new"><b>��������&nbsp;
  й©Ӧ������</b></td>
 </tr>
 <tr>
  <td class="table_nemu_new" height="50">Ӧ������</td>
  <td colspan=3 class="table_con"><textarea name="tbMsds.xlcz" cols="61" rows="5" style="width:90%;overflow-y:auto"></textarea></td>
 </tr>
 <tr>
  <td colspan=4 class="table_con"><b>���߲���&nbsp;
  ���������봢��</b></td>
 </tr>
 <tr>
  <td colspan=4 class="table_con"><b>�ڰ˲���&nbsp;
  �Ӵ�����/�������</b></td>
 </tr>
 <tr>
  <td class="table_nemu_new" height="50">�������Ũ��</td>
  <td colspan=3 class="table_con"><input type="text" name="tbMsds.jcxz" style="width:90%"></td>  
 </tr>
 <tr>
  <td class="table_nemu_new">���̿���</td>
  <td colspan=3 class="table_nemu_new"><textarea name="tbMsds.gckz" cols="61" rows="5" style="width:90%;overflow-y:auto"></textarea></td>
 </tr>
 <tr>
  <td class="table_nemu_new">����ϵͳ����</td>
  <td colspan=3 class="table_nemu_new"><textarea name="tbMsds.hxxtbh" cols="61" rows="5" style="width:90%;overflow-y:auto"></textarea></td>
 </tr>
 <tr>
  <td class="table_nemu_new">�۾�����</td>
  <td colspan=3 class="table_con"><input type="text" name="tbMsds.yjbh" style="width:90%"></td>
 </tr>
 <tr>
  <td class="table_nemu_new">�������</td>
  <td colspan=3 class="table_con"><input type="text" name="tbMsds.fhf" style="width:90%"></td>
 </tr>
 <tr>
  <td class="table_nemu_new">�ַ���</td>
  <td colspan=3 class="table_con"><input type="text" name="tbMsds.sfh" style="width:90%"></td>
 </tr>
 <tr>
  <td colspan=4 class="table_nemu_new"><b>�ھŲ���&nbsp;
  ������</b></td>
 </tr>
 <tr>
  <td class="table_nemu_new">�������״</td>
  <td colspan=3 class="table_con"><input type="text" name="tbMsds.wgyxz" style="width:90%"></td>
 </tr>
 <tr>
  <td width="153" class="table_nemu_new">�۵�(��)</td>
  <td colspan=3 class="table_con"><input type="text" name="tbMsds.rd" style="width:90%"></td>
 
 </tr>
 <tr>
  <td class="table_nemu_new"  width="25%">����ܶ�(ˮ=1)</td>
  <td width="258" class="table_con"  width="25%"><input type="text" name="tbMsds.xdmds" style="width:90%"></td>
  <td width="175" class="table_nemu_new"  width="25%">�е�(��)</td>
  <td width="288" class="table_con"  width="25%"><input type="text" name="tbMsds.fd" style="width:90%"></td>
 </tr>
 <tr>
  <td class="table_nemu_new">����ܶ�(����=1)</td>
  <td class="table_con"><input type="text" name="tbMsds.xdmdkq" style="width:90%"></td>
  <td class="table_nemu_new">��������ѹ(kPa) </td>
  <td class="table_con"><input type="text" name="tbMsds.bhzqs" style="width:90%"></td>
 </tr>
 <tr>
  <td class="table_nemu_new">ȼ����(Kj/mol)</td>
  <td class="table_con"><input type="text" name="tbMsds.rsr" style="width:90%"></td>
  <td class="table_nemu_new">�ٽ��¶�(��)</td>
  <td class="table_con"><input type="text" name="tbMsds.ljwd" style="width:90%"></td>
 </tr>
 <tr>
  <td class="table_nemu_new">�ٽ�ѹ��(MPa)</td>
  <td class="table_con"><input type="text" name="tbMsds.ljyl" style="width:90%"></td>
  <td class="table_nemu_new">����(��)</td>
  <td class="table_con"><input type="text" name="tbMsds.sd" style="width:90%"></td>
 </tr>
 <tr>
  <td class="table_nemu_new">�����ٽ���(kg)</td>
  <td class="table_con"><input type="text" name="tbMsds.zcljl" style="width:90%"></td>
  <td class="table_nemu_new">�����ٽ���(kg)</td>
  <td class="table_con"><input type="text" name="tbMsds.scljl" style="width:90%"></td>
 </tr>
 <tr>
  <td class="table_nemu_new">��ը����[%(V/V)]</td>
  <td class="table_con"><input type="text" name="tbMsds.bzxx" style="width:90%"></td>
  <td class="table_nemu_new">��ը����[%(V/V)]</td>
  <td class="table_con"><input type="text" name="tbMsds.bzsx" style="width:90%"></td>
 </tr>
 <tr>
  <td class="table_nemu_new">�ܽ���</td>
  <td  colspan=3 class="table_con"><input type="text" name="tbMsds.rjx" style="width:90%"></td>
 </tr>
 <tr>
  <td class="table_nemu_new">��Ҫ��;</td>
  <td colspan=3 class="table_con"><textarea name="tbMsds.zyyt" cols="61" rows="5"  style="width:90%;overflow-y:auto"></textarea></td>
 </tr>
 <tr>
  <td colspan=4 height=26 class="table_nemu_new"><b>��ʮ����&nbsp;
  �ȶ��Ժͷ�Ӧ����</b></td>
 </tr>
 <tr>
  <td class="table_nemu_new">�ȶ���</td>
  <td colspan=3 class="table_con"><input type="text" name="tbMsds.wdx" style="width:90%"></td>
 </tr>
 <tr>
  <td class="table_nemu_new">�ۺ�Σ��</td>
  <td colspan=3 class="table_con"><input type="text" name="tbMsds.jhwh" style="width:90%"></td>
 </tr>
 <tr>
  <td class="table_nemu_new">����Ӵ�������</td>
  <td colspan=3 class="table_con"><input type="text" name="tbMsds.bmjctj" style="width:90%"></td>
 </tr>
 <tr>
  <td class="table_nemu_new">������</td>
  <td colspan=3  class="table_con"><input type="text" name="tbMsds.jjw" style="width:90%"></td>
 </tr>
 <tr>
  <td class="table_nemu_new">�ֽ����</td>
  <td colspan=3  class="table_con"><input type="text" name="tbMsds.wxfjch" style="width:90%"></td>
 </tr>
 <tr>
  <td colspan=4 class="table_nemu_new"><b>��ʮһ����&nbsp;
  ����ѧ����</b></td>
 </tr>
 <tr>
  <td height=83 class="table_nemu_new">���Զ���</td>
  <td colspan=3 class="table_con"><input type="text" name="tbMsds.dx" style="width:90%"></td>
 </tr>
 <tr>
  <td colspan=4 class="table_nemu_new"><b>��ʮ������&nbsp; ��̬ѧ����</b></td>  
 </tr>
 <tr>
  <td colspan=4 class="table_nemu_new"><b>��ʮ������&nbsp; �� �� �� ��</b></td>  
 </tr>
 <tr>
  <td colspan=4 class="table_nemu_new"><b>��ʮ�Ĳ���&nbsp; �� �� �� Ϣ</b></td>  
 </tr>
 <tr>
  <td class="table_nemu_new">Σ�����ʱ��</td>
  <td  class="table_con"><input type="text" name="tbMsds.wxhwbh" style="width:90%"></td>
  <td class="table_nemu_new">UN���</td>
  <td class="table_con"><input type="text" name="tbMsds.un" style="width:90%"></td>
 </tr>
 <tr>
  <td class="table_nemu_new">��װ��־</td>
  <td  class="table_con"><input type="text" name="tbMsds.wxhwbzbz" style="width:90%"></td>
  <td class="table_nemu_new">��װ���</td>
  <td class="table_con"><input type="text" name="tbMsds.bzlb" style="width:90%"></td>
 </tr>
 <tr>
  <td height=139 class="table_nemu_new">����ע������</td>
  <td colspan=3 class="table_con"><textarea name="tbMsds.cyzysx" cols="61" rows="5" style="width:90%;overflow-y:auto"></textarea></td>
 </tr>
 <tr>
  <td colspan=4 class="table_nemu_new"><b>��ʮ�岿��&nbsp; �� �� �� Ϣ</b></td>  
 </tr>
 <tr>
  <td colspan=4 class="table_nemu_new"><b>��ʮ������&nbsp; �� �� �� Ϣ</b></td>  
 </tr>
 <tr>
  <td class="table_nemu_new" height="50">������Ϣ</td>
  <td colspan=3 class="table_con"><textarea name="tbMsds.qt" cols="61" rows="5" style="width:90%;overflow-y:auto"></textarea></td>
 </tr>
	  
		</table>
	        </div> 
   	</form>
</div>
</div>
</body>
</html>