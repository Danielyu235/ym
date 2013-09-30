<%@ page language="java" contentType="text/html;charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
<title>菜单树维护</title>
<link href="../../../templets/admin/menuconfig.css" rel="stylesheet" type="text/css" />
<link rel="STYLESHEET" type="text/css" href="../../../dhtml/dhtmlxtree.css" />
<script type="text/javascript" src="../../../dhtml/dhtmlxcommon.js"></script>
<script type="text/javascript" src="../../../dhtml/dhtmlxtree.js"></script>
<script type="text/javascript" src="../../../resources/js/jquery/jquery-1.7.2.js"></script>
<script type="text/javascript" src="../../../js/json2.js"></script>
<style type="text/css">
<!-- 此部分的样式定义被移至“templets/template_2/css/menuconfig.css” -->
</style>
</head>
<body onload="init()">
<div class="divMain">
<div id="titleBar"><div class="barLeft"><span>菜单树维护</span></div></div>
<div class="con_list"><!--firefox下的出现浮动溢出，解决办法是CSS清除浮动，请保留下面这个clear作用的层-->
<div style="clear: both;"></div>
<table class="tdLeftList">
	<tr>
		<td class="tdModeFunc">
		<div class="divModeFunc"><a href="javascript:void(0);"
			onclick="tree.openAllItems('MenuTree');" title="全部展开">全部展开</a> <a
			href="javascript:void(0);"
			onclick="tree.closeAllItems('MenuTree');" title="全部收缩">全部收缩</a></div>
		</td>
	</tr>
	<tr>
		<td class="tdLeftFunc" align="left" width="260px" height="360px" style="margin: 0px;" valign="top">
			<div id="treeboxbox_tree" style="width:260px;height:360px;border:0px solid Silver;"></div><!-- 左侧菜单树 -->
			<div style="text-align:center; margin-top:5px;width:260px;">
				<input id="btnUp" type="button" value="上移" class="b1" title="平级节点的向上移动" onclick="itemUp()"/>
                <input id="btnDown" type="button" value="下移" class="b1" title="平级节点的向下移动" onclick="itemDown()" />
                <input id="btnSaveTree" type="button" value="保存顺序" class="b1" title="移动节点位置之后，需要点此按钮保存整颗树的各节点位置!" onclick="saveTree()"/>
                <!--  <input id="btnDel" type="button" value="删除" class="b1"  title="删除选中节点" />-->
			</div>
        </td>
		<td class="tdRightFunc" valign="top">
			<table class="tableFunc">
				<tr>
					<td>
						<input id="btnAddItem1" type="button" value="增加平级菜单"
							class="btn" title="增加平级菜单" onclick="addItem(); changeColor(this,'item1');" />&nbsp;
						<input id="btnAddItem2" type="button" value="增加选中项子菜单" class="btn"
							title="增加选中子菜单" onclick="addItemChild();changeColor(this,'item2');" />&nbsp;
						<input id="btnSave" type="button" value="保存" class="btn"
							title="保存节点信息" onclick="saveJd();" />&nbsp; 
						<input id="btnDel" type="button" value="删除" class="btn" title="删除选中节点" onclick="delJd()" />&nbsp;
						<input id="btnManager" type="button" value="菜单权限管理" class="btn"  title="菜单权限按钮的维护" onclick="menuManager();"/>	
					</td>
				</tr>
			</table>
			<form id="form1">
			<div class="divRightForm">
			<table class="tableInfo" id="TABLE1">
				<tr>
					<td class="tdInfo1">菜单名称：</td>
					<td class="tdInfo2"><input type="text" ID="txtCdMc"
						name="menu_name" style="width: 70%" /><span class="colorStar">*</span></td>
				</tr>
				
				<tr>
					<td class="tdInfo1">菜单链接：</td>
					<td class="tdInfo2">
						<input type="text" ID="txtCdUrl" name="menu_url" style="width: 70%" /> 
					</td>
				</tr>
				
				<tr>
					<td class="tdInfo1">显示方式：</td>
					<td class="tdInfo2"><select ID="ddlTarget" name="menu_type">
						<option Value="0">新窗口</option>
						<option Value="1" Selected="selected">右侧显示</option>
					</select></td>
				</tr>
				<tr>
					<td class="tdInfo1">是否启用：</td>
					<td class="tdInfo2"><select ID="ddlswitch" name="menu_switch">
						<option Value="1" Selected="selected">是</option>
						<option Value="0" >否</option>
					</select></td>
				</tr>
				<tr>
					<td class="tdInfo1">显示图标：</td>
					<td class="tdInfo2"><div ID="imgDiv" style="display: none"><img border="0" ID="imgShow" width="62" height="51" /></div>
					<input type="hidden" ID="imgOne" name="menu_icon"/><input type="button" value="选择" onClick="selectImages();"/></td>
				</tr>
				<tr>
					<td class="tdInfo1">菜单简介：</td>
					<td class="tdInfo2"><textarea ID="txtCdJj" name="menu_info"
						style="width: 70%;" rows="9" ></textarea></td>
				</tr>
			</table>
			</div>
			<input type="hidden" name="menu_sjbh" id="menu_sjbh" /> 		
			<input type="hidden" name="operateFlag" id="operateFlag" value="update"/>
			<input type="hidden" name="menu_order" id="menu_order" />
			<input type="hidden" name="menu_jb" id="menu_jb" />
			<input type="hidden" name="menu_path" id="menu_path" />
			<input type="hidden" name="menu_id" id="menu_id" />
			
			<input type="hidden" name="addChildItem" id="addChildItem" value="update"/>
			<input type="hidden" name="selected_menuid" id="selected_menuid" />
			
			</form>
		</td>
	</tr>
</table>
<br />
</div>
</div>
</body>
<script type="text/javascript">
 function menuManager(){
	 var menuId = $("#menu_id").val();
	 var menuName = $("#txtCdMc").val();
	 //if($("#menu_jb").val()!=3){
		 //alert("请选择三级菜单！");
		// return false;
		 
	// }else{
		 //window.location.href="../../../menuOpt/menuOpt!list.action?menuId="+menuId+"&menuName="+menuName;
		 //修改方式，wgw修改于2012-12-25
	 var form = $("<form>").attr("action","${ctx}/jsp/dev/menuOpt/menuOptList.jsp").attr("method", "post").appendTo($("body"));
	 form.append($("<input name='menuId' />").attr("value", menuId));
	 form.append($("<input name='menuName' />").attr("value", menuName));
	 form.submit();
// 	 window.location.href="${ctx}/jsp/dev/menuOpt/menuOptList.jsp?menuId="+menuId+"&menuName="+menuName;
	// }
 }

 var treeboxbox_tree = $("#treeboxbox_tree");
    treeboxbox_tree.add("<span id='imgShowLoad' class='showLoad'><img align='absmiddle'  alt='' src='App_Themes/Blue/images/loading.gif'/>数据加载中，请稍等...</span>");
 	//新建一个树对象
   	var tree = new dhtmlXTreeObject("treeboxbox_tree", "100%", "100%", "MenuTree");  
    function myErrorHandler(type, desc, erData) {
        alert("菜单读取出错！请联系管理员！");
    }
    
    //初始化树
    function initTree(flag, cdId) { 
   		//tree设置属性
   		if(flag!="0"){
			//flag=0 表示第一次进入页面，flag =1 表示是添加平级菜单、子菜单 或者  修改左侧某个节点的信息后，点击保存后后重新加载左侧的树
   			tree.destructor();//将当前的树清空
   			treeboxbox_tree.add("<span id='imgShowLoad' class='showLoad'><img align='absmiddle'  alt='' src='App_Themes/Blue/images/loading.gif'/>数据加载中，请稍等...</span>");
   		   	tree = new dhtmlXTreeObject("treeboxbox_tree", "100%", "100%", "MenuTree");  
   	   	}
        tree.setSkin('dhx_skyblue');
        tree.setImagePath("../../../dhtml/imgs/csh_dhx_skyblue/");
        //把父亲控件颜色先还原
        $("#btnAddItem1").attr("class","btn");
        $("#btnAddItem2").attr("class","btn");
        //节点之间有线条
        tree.enableTreeLines(true);
        //节点不可拖曳
        tree.enableDragAndDrop(true);
        //
        tree.enableDragAndDropScrolling(false);
        //显示出异常信息    
        dhtmlxError.catchError("LoadXML", myErrorHandler);
        //下面进行Jquery ajax
        $.post('../../../menu/menuAction!initTree.action',{
				
            },function (data){            	    
        	 	tree.loadXMLString(data,
                     function() {
                         //去除加载提示
                         if ($("#imgShowLoad").get(0) != null) {
                             treeboxbox_tree.remove("#imgShowLoad");
                         }
                         
                         
                         if (flag=="0"){
                        	 //flag=0 表示第一次进入页面，默认将第一个节点的子节点打开！
                         	 tree.openItem(tree.getSubItems(tree.getSelectedItemId()).split(',')[0]);
	                         if (tree.getSelectedItemId() != "noMenu") {
	                             showItem(tree.getSelectedItemId());
	                          }
                         }else{
							//flag =1 表示是添加平级菜单、子菜单 或者  修改左侧某个节点的信息后，点击保存后后重新加载左侧的树
 							if (tree.getSelectedItemId() != "noMenu") {
                             	if (cdId != "" && cdId != "noMenu") {
                                 	tree.openItem(cdId);
                                 	tree.focusItem(cdId);
                                 	showItem(cdId);
                                 	tree.selectItem(cdId, true);
                             	}else{
                                 	//如果此时cdId="noMenu",说明此时树只有一个一级菜单，且该菜单还没有子菜单
                             		tree.openItem(tree.getSubItems("MenuTree").split(',')[0]);
                             		showItem(tree.getSubItems("MenuTree").split(',')[0]);
                                }
                         	}
                         }
                         
                         //打开链接
                         tree.attachEvent("onClick", function (id) { showItem(id); });
                        
                         
                     });      
        },"text");      
    }
    //初始菜单
    initTree("0","");
	
	//根据传入的菜单id ，初始化菜单详细信息 
    function showItem(menuId) {
    	init();//清空菜单详细信息
        //把父亲控件颜色先还原
        $("#btnAddItem1").attr("class","btn");
        $("#btnAddItem2").attr("class","btn");
        
        $("#operateFlag").val("update");

        //根据当前选中节点的id值，从userdata中获取该节点的相关信息
        $("#menu_id").val(menuId);
        $("#txtCdMc").val(tree.getItemText(menuId));
        $("#txtCdUrl").val(tree.getUserData(menuId,"menu_url"));
        $("#ddlTarget").val(tree.getUserData(menuId,"menu_type")); 
        var txtCdJj = tree.getUserData(menuId,"menu_info");
        if('null'!=txtCdJj){
        	$("#txtCdJj").val(tree.getUserData(menuId,"menu_info"));
        }else{
        	$("#txtCdJj").val("");
        }
        $("#imgOne").val(tree.getUserData(menuId,"menu_icon"));
        $("#ddlswitch").val(tree.getUserData(menuId,"menu_switch"));
        
        $("#menu_sjbh").val(tree.getUserData(menuId,"menu_sjbh"));
        $("#menu_order").val(tree.getUserData(menuId,"menu_order"));
        $("#menu_jb").val(tree.getUserData(menuId,"menu_jb")); 
        $("#menu_path").val(tree.getUserData(menuId,"menu_path"));
        
       
        
        var imgStr = tree.getUserData(menuId,"menu_icon");
        if(imgStr.indexOf(".")>0){
	        //imgStr = imgStr.substring(6);//去掉menu_icon中的字符串'admin\'
	        $("#imgDiv").attr("style","display: display;");
	        $("#imgShow").attr("src","../../../"+imgStr);
        }else{
        	$("#imgDiv").attr("style","display: display;");
        	$("#imgShow").attr("src","../icon/images/noimg.png");
        }
     }
     

  	//添加选中项的平级项
    function addItem() {
        init();//初始化页面
        $("#operateFlag").val("additem");
      //保存当前操作的类型，以确保不能添加第四级菜单
        $("#addChildItem").val("addFather");
        
        //将当前选中节点的id保存起来，方便点击保存操作后重新加载左侧的树，并默认打开新增加的节点
        $("#selected_menuid").val(tree.getSelectedItemId());
        
        var menu_sjbh = "0";
        var menu_jb = "1";
        var menu_path = "0";
        var menu_order = "1";
		
		
		
        menu_sjbh = tree.getParentId(tree.getSelectedItemId());//取得同级别菜单的父节点ID 
        menu_jb =   tree.getUserData(tree.getSelectedItemId(),"menu_jb");//需要取得当前节点的级别
        menu_path = tree.getUserData(tree.getSelectedItemId(),"menu_path");//取得当前节点的路径
        menu_order = tree.hasChildren(tree.getParentId(tree.getSelectedItemId()))+1;//获取同级别节点的总个数
        
       
        
        if(tree.getParentId(tree.getSelectedItemId())=="MenuTree"){
			//说明此时添加的菜单为一级菜单
			menu_sjbh = "0";			
		}
		if(tree.getSelectedItemId()=="noMenu"){
			//说明此时数据库中尚无菜单记录，此时增加的菜单为第一个菜单
			menu_jb = "1";
			menu_path = "0";
			menu_order = "1";
		}
		$("#menu_sjbh").val(menu_sjbh); //对应数据库中上级节点编号字段  
       	$("#menu_order").val(menu_order);//对应数据库中菜单显示顺序字段
       	$("#menu_jb").val(menu_jb); //对应数据库中菜单级别字段
       	$("#menu_path").val(menu_path);//对应数据库中菜单路径字段
       	
       
    }
    
	//新增子项
    function addItemChild() {        
        init();       
        $("#operateFlag").val("additem");  
        //保存当前操作的类型，以确保不能添加第四级菜单
        $("#addChildItem").val("addChild");
        
      	//将当前选中节点的id保存起来，方便点击保存操作后重新加载左侧的树，并默认打开新增加的节点
        $("#selected_menuid").val(tree.getSelectedItemId());
         
        if(tree.getSelectedItemId()=="noMenu"){
			//说明此时数据库中尚无菜单记录
			alert("目前暂无菜单列表，请先增加平级菜单！");
		}else{			
	        $("#menu_sjbh").val(tree.getSelectedItemId()); //取得当前节点ID ，对应数据库中上级节点编号       
	        $("#menu_order").val(tree.hasChildren(tree.getSelectedItemId())+1);//获取当前节点的子节点总个数，菜单显示顺序       
	        $("#menu_jb").val(parseInt(tree.getUserData(tree.getSelectedItemId(),"menu_jb"))+1); //需要取得当前节点的子节点级别
	        $("#menu_path").val(tree.getUserData(tree.getSelectedItemId(),"menu_path")+","+tree.getSelectedItemId());//取得当前节点的路径
		}	      
    }
    
  //保存新增或修改的节点信息
    function saveJd() {
        
        //这里采用JSON数据回传给服务器
         var elemMenuinfo = $('#form1');
         var menuinfo = elemMenuinfo.serializeObject();
         var jsonmenuinfo = JSON.stringify(menuinfo);      
        //通过验证了
        if (checkInput()) {          
        	 $.ajax({
                 type : 'POST',
                 contentType : 'application/json',
                 url : '../../../menu/menuAction!addMenu.action',
                 data : jsonmenuinfo,
                 dataType : 'text',
                 success : function(data){                   
                 	alert(data);
        		 	//window.location.reload();         		 
        		 	//保存成功后，重新读取数据库，获得树
        		 	var flag = $("#operateFlag").val();
        		 	if(flag=="update"){        		 		
        		 		initTree("1",$('#menu_id').val());  
            		}
            		else if(flag=="additem"){
            			initTree("1",$('#selected_menuid').val());  
            		}
            		
                 },
                 error : function(data){
                     alert("操作失败!");
                 }
             }); 			          
       }
    }

    //删除选中节点
    function delJd() {
        if (confirm("删除选中节点，其子节点也将全部删除，确定？")) {
        	 $.post('../../../menu/menuAction!delMenu.action',{
 			 	menuId : tree.getSelectedItemId()		 	
 			 }, function (data){
 			 		
 			        alert(data);
 			        //window.location.reload(); 

 			        //删除成功后，重新读取数据库，获得树 
 			        if("MenuTree" == tree.getParentId(tree.getSelectedItemId())){
 			        	//如果删除的是某个一级菜单，取得当前所有一级菜单的个数
 			        	var i = tree.hasChildren(tree.getParentId(tree.getSelectedItemId()));
 			        	if(i==1){
							//说明此时只有一个一级菜单
 			        		window.location.reload(); 
 	 	 			    }else{
 	 	 	 			    //说明此时至少有两个一级菜单（两个或以上），    重新加载后默认显示第一个一级菜单。
 	 	 	 			    for(var m=0; m<i; m++){
								if( tree.getSelectedItemId()== tree.getSubItems(tree.getParentId(tree.getSelectedItemId())).split(',')[m] ){
									if(m==0){
										//说明此时删除的是第一个一级菜单，则重新加载后默认显示第二个一级菜单。
										initTree("1",tree.getSubItems(tree.getParentId(tree.getSelectedItemId())).split(',')[1]);  
									}
									else{
										//说明此时删除的不是第一个一级菜单，则重新加载后默认显示第一个一级菜单
										initTree("1",tree.getSubItems(tree.getParentId(tree.getSelectedItemId())).split(',')[0]);  	
									}
								}
 	 	 	 	 			}
 			        		
 	 	 			    }
 	 			    }else{
 	 			    	initTree("1",tree.getParentId(tree.getSelectedItemId())); 
 	 	 	 		}
 			        
 		   	   },"text");  	
        }
    }
	//决定按钮是否可用
    function changeLx(_this) {
        if (_this.selectedIndex != 2) {
            document.getElementById("btnSelectDx").disabled = true;
        }
        else {
            document.getElementById("btnSelectDx").disabled = false;
        }
    }

	//检验数据
    function checkInput() {
        if ($("#txtCdMc").value == "") {
            alert("菜单名称不可为空！");
            return false;
        }
        var choose = $("#addChildItem").val();
        //如果当前操作为增加子菜单，并且选中节点已经为三级菜单的时候，给出提示
        /* 
        if( (choose =="addChild") && (tree.getUserData((tree.getSelectedItemId()),"menu_jb")=="3") ){
            alert("目前最多添加三层菜单,请重新添加");
            return false;
        }
 		*/
        return true;
    }
	//下移菜单
    function itemUp() {
        var tmpNode = tree.getSelectedItemId();
        var tmpNodeIndex = tree.getIndexById(tmpNode);
        tree.moveItem(tree.getSelectedItemId(), 'up_strict');
        tree.selectItem(tmpNode);
        if (tree.getIndexById(tmpNode) == tmpNodeIndex) {
            alert("已在所属节点首位");
        }
    }
	//上移菜单
    function itemDown() {
        var tmpNode = tree.getSelectedItemId();
        var tmpNodeIndex = tree.getIndexById(tmpNode);
        tree.moveItem(tree.getSelectedItemId(), 'down_strict');
        tree.selectItem(tmpNode);
        if (tree.getIndexById(tmpNode) == tmpNodeIndex) {
            alert("已在所属节点末位");
        }
    }

    //获取整颗树
    function getTreeMenu(id) {
        var t = tree.getSubItems(id).split(',');
        var temp = "";
        var tt = "";
        for (var i = 0; i < t.length; i++) {
            temp += getSpace(tree.getLevel(t[i]) - 1) + t[i] + "--" + tree.getItemText(t[i]) + "节点级别：" + tree.getLevel(t[i]) + "\r\n ";
            if (tree.hasChildren(t[i])) {
                tt = getTreeMenu(t[i]);
                temp += tt + "\r\n";
            }
        }
        return temp;
    }

    function getSpace(k) {
        var t = "";
        for (var i = 0; i < k; i++) {
            t += "--";
        }
        return t;
    }

    //初始化控件,清空 页面 
    function init() {  
        $("#txtCdMc").val("");//菜单名称
        $("#txtCdUrl").val("");//菜单url地址 
        $("#ddlTarget").val("1");//菜单显示方式     
        $("#txtCdJj").val("");//菜单简介
        $("#imgOne").val("");//显示图标
        $("#imgDiv").attr("style","display:none;");
        $("#ddlswitch").val("1");//菜单是否启用
        $("#txtCdbh").val(""); //菜单节点编号
    }

    //按钮点击后变色
    function changeColor(obj,itemname) {
        obj.className = "btnBg";
        if(itemname=="item1"){
        	 $("#btnAddItem2").attr("class","btn");
        }
        else if(itemname=="item2"){
        	 $("#btnAddItem1").attr("class","btn");
        }
    }

    //获取当前节点的父级节点
    function getNodeLj(id) {
        var tmpReturnNode = "";
        var parentId = tree.getParentId(id);
        if (parentId != "") {
            tmpReturnNode += getNodeLj(parentId) + "," + parentId + ",";
        }
        return tmpReturnNode;
    }


    //保存树（移动位置后）
    function saveTree() {
        //获取所有节点的级别，上级编号，路径，进行更改！

        //document.getElementById("hfTreeMenuJson").value = tree.serializeTreeToJSON();
        //alert(tree.serializeTreeToJSON());

        var tmpAllNodes = tree.getAllSubItems("MenuTree").split(',');

        //alert(tmpAllNodes.length);

        var tmpNodeXx = "";

        var cd_id = "";
        var cd_jb = "";
        var cd_sjbh = "";
        var cd_lj = "";
        var cd_order = 1;


        for (var i = 0; i < tmpAllNodes.length; i++) {

            cd_id = tmpAllNodes[i];
            cd_jb = tree.getLevel(tmpAllNodes[i]);
            cd_sjbh = tree.getParentId(tmpAllNodes[i]).replace(/MenuTree/g, "0");
            cd_lj = getNodeLj(tmpAllNodes[i]).replace(/,,/g, ",").replace(/MenuTree/g, "0");
            cd_lj = cd_lj.substring(1, cd_lj.length - 1);

            var tmpCurParNode = tree.getSubItems(tree.getParentId(tmpAllNodes[i])).split(',');
            for (var j = 0; j < tmpCurParNode.length; j++) {
                if (tmpCurParNode[j] == tmpAllNodes[i]) {
                    cd_order = j + 1; //该点在树同级别节点中的位置
                }
            }

            tmpNodeXx += cd_id + "*aykj*" + cd_jb + "*aykj*" + cd_sjbh + "*aykj*" + cd_lj + "*aykj*" + cd_order + "&aykj&";

        }
        if (tmpNodeXx != "") {
            tmpNodeXx = tmpNodeXx.substring(0, tmpNodeXx.length - 6);
        }

        //将数据送往后台进行保存！
		  $.post('../../../menu/menuAction!saveTreeMenuByIDs.action',
        	{menuId : tmpNodeXx 
       		 }, function (data){  
       			 alert(data);
       		 
       		 },"text"); 
       
        return true;
    }
    //给JQuery 增加一个新的方法
    $.fn.serializeObject = function() {
        var o = {};
        var a = this.serializeArray();
        $.each(a, function() {
            if (o[this.name]) {
                if (!o[this.name].push) {
                    o[this.name] = [ o[this.name] ];
                }
                o[this.name].push(this.value || '');
            } else {
                o[this.name] = this.value || '';
            }
        });
      return o;
    };

function selectImages(){
	window.open('../../../icon/iconAction!list.action?operflag=menuSelect&time='+new Date(),'_blank','top=0,left=0,width=710,height=500');
} 

</script>
</html>
