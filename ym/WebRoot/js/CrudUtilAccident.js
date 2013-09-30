//需要easyui、DataGridUtil、easyui-loding支持 
/**
 * Crud操作的封装类
 * @param setting  配置信息对象
 * 			autoInit  是否自动初始化查看窗口对象 default为true
 * 			grid 传入的Grid对象
 * 			addFormObject 添加窗口div对象
 *  		searchFormObject 查询窗口div对象
 *  		entityName 实体对象名称
 *  		moduleName 模块中文名
 *  		url 请求的action路径
 *  		css 窗口的样式，default为：{width:"900px",height:"450px"}
 *  		beforeSubmit 表单提交前的回调方法return false则为不提交
 *  		updateInitData(addFormObject, data) 修改窗口初始化数据回调方法，参数为（添加窗口div对象，ajax请求返回数据）
 *  		viewInitData(viewFormObject, data) 查看窗口初始化数据回调方法，参数为（查看窗口div对象，ajax请求返回数据）
 * @returns {Crud}
 */
Crud = function(setting){
	var temp = this;
	temp.params = {
		autoInit: true,
		grid: null, //传入的Grid对象 没有列表时可空
		url: null, //请求的action路径
		addFormObject: null, //添加更新窗口div对象 必需
		viewFormObject: null, 
		searchFormObject: null, //查询窗口div对象 必需
		entityName: null, //实体对象名称 必需
		moduleName: null, //模块中文名 必需
		addFormTitle: null,
		updateFormTitle: null,
		viewFormTitle: null,
		dialogCss:{width:"900px",height:"450px"},
		viewDialogCss: null,
		beforeSubmit: function(){return true;},
		afterUpdateLoadData: null,
		afterViewLoadData: null,
		afterAddSuccess: null,
		afterAddFail: null,
		afterUpdateSuccess: null,
		afterUpdateFail: null,
		afterRemoveSuccess: null,
		afterRemoveFail: null,
		afterAddDialogClose: null,
		afterUpdateDialogClose: null,
		afterViewDialogClose: null
	};
	if(setting !=null && typeof setting == 'object') {
		$.each(setting, function(i, v){
			temp.params[i] = v;
		});
	}
	if(temp.params.grid == null) {
		temp.params.grid = {
			reloadGrid:function(){},
			getSelectNodes:function(){},
			doSearch:function(){}
		};
	}
	if(temp.params.updateFormObject == null)
		temp.params.updateFormObject = temp.params.addFormObject;
	if(temp.params.addFormTitle == null)
		temp.params.addFormTitle = '添加' + temp.params.moduleName + '信息';
	if(temp.params.updateFormTitle == null)
		temp.params.updateFormTitle = '修改' + temp.params.moduleName + '信息';
	if(temp.params.viewFormTitle == null)
		temp.params.viewFormTitle = '查看' + temp.params.moduleName + '信息';
	if(temp.params.addUrl == null)
		temp.params.addUrl = temp.params.url + '!add';
	if(temp.params.getByIdUrl == null)
		temp.params.getByIdUrl = temp.params.url + '!getById';
	if(temp.params.updateUrl == null)
		temp.params.updateUrl = temp.params.url + '!update';
	if(temp.params.deleteUrl == null)
		temp.params.deleteUrl = temp.params.url + '!delete';
	if(temp.params.viewDialogCss == null)
		temp.params.viewDialogCss = temp.params.dialogCss;
	$(temp.params.addFormObject).css(temp.params.dialogCss);
	if(temp.params.autoInit && temp.params.viewFormObject == null) {
		temp.initViewFormObject();
	}
};
/**
 * 强制设置参数方法
 */
Crud.prototype.setParams = function(setting) {
	var temp = this;
	if(setting !=null && typeof setting == 'object') {
		$.each(setting, function(i, v){
			temp.params[i] = v;
		});
	}
};
/**
 * 初始化查看页面渲染方法
 */
Crud.prototype.initViewFormObject = function() {
	var temp = this;
	//viewFormInit
	var tempDiv_ = $('<div style="display: none;"></div>');
	var tempForm = $('<div data-options="iconCls:\'icon-save\',modal:true,minimizable:true,maximizable:true,collapsible:true,draggable:false" id="addView"></div>');
	temp.params.viewFormObject = tempForm;
	$(tempForm).css(temp.params.viewDialogCss).appendTo(tempDiv_);
	$(tempDiv_).appendTo("body");
	
	$(tempForm).append($(temp.params.addFormObject).find('[name="addDiv"]').clone());
	$(tempForm).find('td').find('input[name]').each(function(){
		var attrName = $(this).attr('name');
		var span = $('<span>').attr('class', 'addStyle_')
			 .attr('name', attrName);
		if($(this).parent().is('td')) {
			$(this).after(span);
		} else {
			$(this).parents('td').append(span);
		}
		var parent = $(this).parents('td');
		parent.find('span').each(function(){
			if($(this).attr('class')!= 'addStyle_')
				$(this).remove();
		});
		$(this).remove();
		parent.find('input').each(function(){
			if($(this).attr('type') != 'text' && $(this).attr('type') != 'hidden')
				$(this).remove();
		});
	});
	$(tempForm).find('td textarea').each(function(){
		$(this).after($('<span></span>')
			 .attr('name', $(this).attr('name'))
			 .attr('style', 'width:100%;height:85px;overflow-y:auto;')
			 );
		$(this).remove();
	});
};
/**
 * 添加方法
 */
Crud.prototype.add = function() {
	var temp = this;
	Crud.clearForm($(temp.params.addFormObject).find('form'));      	
	$(temp.params.addFormObject).dialog({
		title:' ',
		modal:true,
		draggable:false,
		closed:true,
		cache:false,
		buttons:[{
			text:'保存',
			iconCls:'icon-save',
			handler:function() {    		
				if(!temp.params.beforeSubmit()) return;
				$(temp.params.addFormObject).find('form').form('submit',{
	                url: temp.params.addUrl,
	                success:function (data) {
	                	$(temp.params.addFormObject).dialog('close');
	                	var data = eval('(' + data + ')');
	                    if (data.operateSuccess) {
	                        $.messager.show({
	                            title:'成功',
	                            msg:data.operateMessage,
	                            timeout:2000,
	                            showType:'slide'
	                        });
	                        temp.params.grid.reloadGrid();
	                        if(typeof temp.params.afterAddSuccess == 'function') {
	                        	temp.params.afterAddSuccess(data);
	                        }
	                    } else {
	                        $.messager.show({
	                            title:'失败',
	                            msg:data.operateMessage,
	                            timeout:2000,
	                            showType:'slide'
	                        });
	                        if(typeof temp.params.afterAddSuccess == 'function') {
	                        	temp.params.afterAddFail(data);
	                        }
	                    }
	                }
	            });
			}
		}, {
			text:'取消',
			iconCls:'icon-cancel',
			handler:function() {
				$(temp.params.addFormObject).dialog('close');
				if(typeof temp.params.afterAddDialogClose == 'function') {
                	temp.params.afterAddDialogClose();
                }
			}
		}]
	});
	$(temp.params.addFormObject).dialog('open');
};
/**
 * 更新方法
 * @param rowId
 */
Crud.prototype.update = function(rowId) {
	var temp = this;
	Crud.clearForm($(temp.params.updateFormObject).find('form'));
	$(temp.params.updateFormObject).dialog({
		title:temp.params.updateFormTitle,
		cache:false,
		modal:true,
		draggable:false,
		closed:true,
		buttons:[{
			text:'保存',
			iconCls:'icon-save',
			handler:function() {
				if(!temp.params.beforeSubmit()) return;
				$(temp.params.updateFormObject).find('form').form('submit',{
					url: temp.params.updateUrl,
	                success:function(data) {
					$(temp.params.updateFormObject).dialog('close');
	                	var data = eval('(' + data + ')');
	                    if (data.operateSuccess) {
	                        $.messager.show({
	                            title:'成功',
	                            msg:data.operateMessage,
	                            timeout:2000,
	                            showType:'slide'
	                        });
	                        temp.params.grid.reloadGrid();
	                        if(typeof temp.params.afterUpdateSuccess == 'function') {
	                        	temp.params.afterUpdateSuccess(data);
	                        }
	                    } else {
	                        $.messager.show({
	                            title:'失败',
	                            msg:data.operateMessage,
	                            timeout:2000,
	                            showType:'slide'
	                        });
	                        if(typeof temp.params.afterUpdateFail == 'function') {
	                        	temp.params.afterUpdteFail(data);
	                        }
	                    }
	                }
	            });
			}
		}, {
			text:'取消',
			iconCls:'icon-cancel',
			handler:function() {
				$(temp.params.updateFormObject).dialog('close');
				if(typeof temp.params.afterUpdateDialogClose == 'function') {
                	temp.params.afterUpdateDialogClose(rowId);
                }
			}
		}]
	});
	$.loding();
	$.ajax({
        url: temp.params.getByIdUrl + '?id=' + rowId,
        method:'POST',
        success:function (data) {
	        temp.updateLoadData(data);
	        if(typeof temp.params.afterUpdateLoadData == 'function') {
	        	temp.params.afterUpdateLoadData($(temp.params.updateFormObject), data);
	        } 
        	$.loded();
        	$(temp.params.updateFormObject).dialog('open');
        	//$(temp.params.updateFormObject).form('validate');
        }
    });
};
/**
 * 更新Dialog加载数据方法
 * @param data
 */
Crud.prototype.updateLoadData = function(data) {
	var temp = this;
	var obj = {};
	$.each(data,function(i,item){
		obj[temp.params.entityName + '.' + i] = item;
    });
	$(temp.params.updateFormObject).find('form').form('load',obj);
};
/**
 * 删除方法
 */
Crud.prototype.remove = function () {
	var temp = this;
    var rows = temp.params.grid.getSelectNodes();
    if (rows.length == 0) {
        $.messager.show({
            title:'提示',
            msg:'请选择要删除的行',
            timeout:2000,
            showType:'slide'
        });
        return;
    } else {
    	var ids = new Array();
        $.messager.confirm('警告', '是否要删除该记录?', function (r) {
            if (r) {
            	var i = 0;
            	for (i=0; i<rows.length; i++) {
                    ids.push(rows[i].id);
                }
                temp.removeByIds(ids);
            }
        });
    }
};
/**
 * 通过ID数组删除方法
 * @param ids
 */
Crud.prototype.removeByIds = function(ids) {
	var temp = this;
	$.ajax({
        url:temp.params.deleteUrl + '?ids=' + ids,
        method:'POST',
        success:function(data) {
        	var data = eval('(' + data + ')');
            if (data.operateSuccess) {
                $.messager.show({
                    title:'成功',
                    msg:data.operateMessage,
                    timeout:2000,
                    showType:'slide'
                });
                temp.params.grid.reloadGrid();
                if(typeof temp.params.afterRemoveSuccess == 'function') {
                	temp.params.afterRemoveSuccess(data);
                }
            } else {
                $.messager.show({
                    title:'失败',
                    msg:data.operateMessage,
                    timeout:2000,
                    showType:'slide'
                });
                if(typeof temp.params.afterRemoveFail == 'function') {
                	temp.params.afterRemoveFail(data);
                }
            }
        }
    });
};
/**
 * 查看方法
 * @param rowId
 */
Crud.prototype.view = function (rowId) {
	var temp = this;
	$.loding();
	$.ajax({
        url: temp.params.getByIdUrl + '?id=' + rowId,
        method:'POST',
        success:function (data) {
	        temp.viewLoadData(data);
        	if(typeof temp.params.afterViewLoadData == 'function') {
	        	temp.params.afterViewLoadData($(temp.params.viewFormObject), data);
	        } 
        	$.loded();
        	$(temp.params.viewFormObject).dialog({
				title:temp.params.viewFormTitle,
				modal:true,
				draggable:false,
				cache:false,
				buttons:[{
					text:'取消',
					iconCls:'icon-cancel',
					handler:function() {
						$(temp.params.viewFormObject).dialog('close');
						if(typeof temp.params.afterViewDialogClose == 'function') {
    	                	temp.params.afterViewDialogClose(rowId);
    	                }
					}
				}]
			});
        }
    });
};
/**
 * 查看Dialog加载数据方法
 * @param data
 */
Crud.prototype.viewLoadData = function(data) {
	var temp = this;
	if(data == null) return;
	$.each(data,function(i,item){
		$(temp.params.viewFormObject).find('span[name="' + temp.params.entityName + '.' + i + '"]').html(item);
    });
};
/**
 * 查询方法
 */
Crud.prototype.search = function() {
	var temp = this;
	var form = $.form2Json(temp.params.searchFormObject);
	temp.params.grid.doSearch(form);
};
/**
 * 清空查询表单方法
 */
Crud.prototype.clearSearch = function(){
	var temp = this;
	var formObjectTemp = null;
	if($(temp.params.searchFormObject).is('form')) {
		formObjectTemp = $(temp.params.searchFormObject);
	} else {
		formObjectTemp = $(temp.params.searchFormObject).find('form');
	}
	Crud.clearForm(formObjectTemp);
};
/**
 * 清空表单
 * @param formObject jquery或DOM表单对象
 */
Crud.clearForm = function(formObject) {
	if(typeof formObject != 'object') return;
	if(formObject.jquery) {
		if(formObject.length == 0) return;
		$(formObject).each(function(){
			$(this).find('input[name]').val('');
			$(this)[0].reset();
		});
	} else {
		formObject.reset();
	}
};