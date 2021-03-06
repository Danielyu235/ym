
/**
 * 普通树
 * 
 * @param loadTreeRemoteURL 树Ajax访问的json action路径
 * @param treePanelId 树上层容器
 * @param treeSearchPanelId 树查询的id
 * @param keyInputId 树id
 * @param callback onclick时回调的函数
 * @param iconFromRemote
 * @returns {Tree}
 */

MenuTree = function(loadTreeRemoteURL, getMenuOptUrl, treePanelId, treeSearchPanelId, keyInputId,
		callback, iconFromRemote) {
	this.loadTreeRemoteURL = loadTreeRemoteURL;
	this.treePanelId = treePanelId;
	this.treeSearchPanelId = treeSearchPanelId;
	this.keyInputId = keyInputId;
	this.filterNodeList = [];
	this.key = $('#' + this.keyInputId);
	this.searchFunction = callback;
	this.iconFromRemote = iconFromRemote || false;
	this.getMenuOptUrl = getMenuOptUrl;
	this.valueId = "";

	this.initTree = function(zNodes) {
		var t = this;
		var nodeOnClick = function(event, treeId, treeNode, clickFlag) {
			if (typeof t.searchFunction == 'function') {
				t.searchFunction(treeNode.id, treeNode.name, treeNode.nodeType,
						treeNode.attributes);
			}
		};
		var addHoverDom = function(treeId, treeNode) {
			//alert(treeNode.id);
/*			if (treeNode.id != -1) {
				var query = {
						'menuId' : treeNode.id
				};
				$.post('/jfds/menu/menuAction!getMenuOptByMenuId.action', query, function(data) {
					//alert(data);
					var obj = $('#' + treeNode.tId + '_a');
					//alert(obj);
					var editStr = data;
					obj.after(editStr);
				});
			}*/
		};
		
		var removeHoverDom = function(treeId, treeNode) {
		};
		
		var addDiyDom = function(treeId, treeNode) {
			if (treeNode.id != -1) {
				var query = {
						'menuId' : treeNode.id
				};
				$.post('/ym/menu/menuAction!getMenuOptByMenuId.action', query, function(data) {
					var obj = $('#' + treeNode.tId + '_a');
					var editStr = data;
					obj.after(editStr);
					
					//加上点击方法
					var mtree=$.fn.zTree.getZTreeObj('menu_opt_tree');
					/*
					$('#' + treeNode.tId +' :checkbox').each(function(){
						if($(this).attr('checked')){
							mtree.checkNode(mtree.getNodeByTId(treeNode.tId),true,true);
						}
					});
					*/
					$('#' + treeNode.tId +' :checkbox').click(function(){
						if($(this).attr('checked')){
							//这里不能用 treeNode.tId 替换 会有上一级的tId出现~~
							mtree.checkNode(mtree.getNodeByTId($(this).parent().attr('id')),true,true);
						}else{
							var flag=true;
							$('#' + treeNode.tId +' :checkbox').each(function(){
								if($(this).attr('checked')){
									flag=false;
								}
							});
							if(flag){
								mtree.checkNode(mtree.getNodeByTId($(this).parent().attr('id')),false,true);
							}
						}
						//alert($(this).parent().attr('id'));
					});
					
				});
			}
		};
		
		function zTreeOnCheck(event, treeId, treeNode) {
		    //alert(treeNode.tId + ", " + treeNode.name + "," + treeNode.checked);
		    if(treeNode.checked)
		    	$('#'+ treeNode.tId +' :checkbox').attr('checked','true');
		    else
		    	$('#'+ treeNode.tId +' :checkbox').removeAttr('checked');
		};
		function zTreeOnAsyncSuccess(event, treeId, treeNode, msg) {
		    alert(msg);
		};
		
		var getFontCss = function(treeId, treeNode) {
			return (!!treeNode.highlight) ? {
				color : "#A60000",
				"font-weight" : "bold"
			} : {
				color : "#333",
				"font-weight" : "normal"
			};
		};
		
		var setting = {
			callback : {
				onClick : nodeOnClick
				,onCheck: zTreeOnCheck
				,onAsyncSuccess: zTreeOnAsyncSuccess
			},
			view : {
				fontCss : getFontCss,
				addHoverDom: addHoverDom,
				removeHoverDom: removeHoverDom,
				addDiyDom: addDiyDom
			},
			data : {
				key : {
					title : "qtip"
				}
			},
			check : {
				enable : true,
				chkboxType : { "Y" : "ps", "N" : "ps" }
			},
			iconFromRemote : t.iconFromRemote
		};
		$.fn.zTree.init($("#" + t.treePanelId), setting, zNodes);
		t.expandAllNode(true);
		
		
		//t.addTreeQitp();
		
	};
	

	this.addTreeQitp = function() {
		var t = this;
		if (_systemConfig.qipShow) {
			$('a[title]').qtip({
						position : {
							my : 'top left',
							target : 'mouse',
							viewport : $(window), // Keep it on-screen at all
							adjust : {
								x : 10,
								y : 20
							}
						},
						hide : {
							fixed : true
						},
						style : _systemConfig.qipStyle
					});
		}
	};
	this.loadTree = function(selectNodeId) {
		var t = this;

		if (typeof(t.loadTreeRemoteURL) == 'string') {
			$.ajax({
						type : "POST",
						url : t.loadTreeRemoteURL,
						data : "",
						// dataType: "json",
						success : function(data) {
							//var data = eval('(' + data + ')');
							t.initTree(data.items);

							if (selectNodeId != undefined) {
								t.selectNodeById(selectNodeId);
							}
							
						}
					});

		} else if (typeof(t.loadTreeRemoteURL) == 'object') {
			t.initTree(loadTreeRemoteURL);
		} else {

		}

	};
	this.expandAllNode = function(status) {
		var t = this;
		var treeObj = t.getZTreeObj();
		treeObj.expandAll(status);
	};
	this.getZTreeObj = function() {
		var t = this;
		return $.fn.zTree.getZTreeObj(t.treePanelId);
	};

	this.changeTreeSearchPanelShow = function() {
		var t = this;
		if ($('#' + t.treeSearchPanelId).css('display') == "none") {
			$('#' + t.treeSearchPanelId).show();
		} else {
			$('#' + t.treeSearchPanelId).hide();
		}
	};

	this.searchNode = function() {
		var t = this;
		var zTree = t.getZTreeObj();

		t.expandAllNode(true);
		t.updateNodes(false);
		
		var value = $.trim(t.key.get(0).value);
		var keyType = "name";
		if (value === "") {
			return;
		}
		
		var filterNode = function(node) {
			value = value.toUpperCase();
			var py = String2Alpha(node.name);
			if (py.indexOf(value) > -1) {
				return true;
			}

			return (node.name.indexOf(value) > -1);
		};
		t.filterNodeList = zTree.getNodesByFilter(filterNode);
		t.updateNodes(true);

	};

	this.selectNodeById = function(id) {
		var t = this;
		var zTree = t.getZTreeObj();
		var node = zTree.getNodeByParam("id", id, null);
		if (node != null) {
			zTree.selectNode(node);
		}

	};
	this.updateNodes = function(highlight) {
		var t = this;
		var zTree = t.getZTreeObj();
		for (var i = 0, l = t.filterNodeList.length; i < l; i++) {
			t.filterNodeList[i].highlight = highlight;
			zTree.updateNode(t.filterNodeList[i]);
		}
		if (!highlight) {
			var nodes = zTree.getNodesByParam("isHidden", true);
			zTree.showNodes(nodes);
		} else {
			var nodes = zTree.getNodesByParam("isHidden", false);
			zTree.hideNodes(nodes);
			for (var i = 0, l = t.filterNodeList.length; i < l; i++) {
				var parentNodes = [];
				t.getAllParentNode(t.filterNodeList[i], parentNodes)
				zTree.showNodes(parentNodes.reverse());
				zTree.showNode(t.filterNodeList[i]);

			}
		}
	};
	this.getAllParentNode = function(node, array) {
		var t = this;
		if (node.getParentNode() != null) {
			array.push(node.getParentNode());
			t.getAllParentNode(node.getParentNode(), array);
		}
	};
	this.getSelectedNodes = function() {
		var treeObj = getZTreeObj();
		return treeObj.getSelectedNodes();
	};
	this.getCheckBoxCheckedValue = function() {
		var value = new Array();
		var checkboxes = $('input[type="checkbox"]');
		var i = 0;
		for (i=0; i<checkboxes.length; i++) {
			var m = checkboxes[i];
			if (m.checked) {
				value.push(m.value);
			}
		}
		return value;
	};
	//全取消
	this.cancelAllNodes = function() {
        var treeObj = this.getZTreeObj();
        treeObj.checkAllNodes(false);
        
        var checkboxes = $('input[checkboxtype="optcheckbox"]');
		var i = 0;
		for (i=0; i<checkboxes.length; i++) {
			var m = checkboxes[i];
			m.checked = false;
		}
    };
    
    this.getNodeById = function(tid){
    	return this.getNodeByTId(tid);
    };
};
