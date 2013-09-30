package generate.tool.template;

import java.util.*;

public class BaseJspTemplate implements ITemplate
{
  protected static String nl;
  public static synchronized BaseJspTemplate create(String lineSeparator)
  {
    nl = lineSeparator;
    BaseJspTemplate result = new BaseJspTemplate();
    nl = null;
    return result;
  }

  public final String NL = nl == null ? (System.getProperties().getProperty("line.separator")) : nl;
  protected final String TEXT_1 = "<%@ page language=\"java\" contentType=\"text/html; charset=UTF-8\"" + NL + "    pageEncoding=\"UTF-8\"%>" + NL + "<%@ include file=\"/common/taglibs.jsp\" %>" + NL + "<%@ include file=\"/common/jqueryhead.jsp\" %>" + NL + "<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">" + NL + "<html>" + NL + "<head>" + NL + "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">" + NL + "<title>";
  protected final String TEXT_2 = "</title>" + NL + "" + NL + "<link rel=\"stylesheet\" type=\"text/css\" href=\"${ctx}/css/bus.css\">" + NL + "<script type=\"text/javascript\" src=\"${ctx}/js/GridUtilToolBar.js\"></script>" + NL + "<script type=\"text/javascript\">" + NL + "        var grid = null;" + NL + "        var tree = null;" + NL + "        var key = null;" + NL + "" + NL + "        // 当点击添加按钮时做的操作" + NL + "        function addFunction() {" + NL + "        \t$('#addForm').form('clear');        \t" + NL + "    \t\t$('#addForm').dialog({" + NL + "    \t\t\ttitle:'增加窗口'," + NL + "    \t\t\tmodal:true," + NL + "    \t\t\tdraggable:false," + NL + "    \t\t\tbuttons:[{" + NL + "    \t\t\t\ttext:'保存'," + NL + "    \t\t\t\ticonCls:'icon-save'," + NL + "    \t\t\t\thandler:function() {    \t\t\t\t\t" + NL + "    \t\t\t\t\t$('#addForm').form('submit',{" + NL + "    \t\t                url:'${ctx}/";
  protected final String TEXT_3 = "/";
  protected final String TEXT_4 = "Action!add'," + NL + "    \t\t                success:function (data) {" + NL + "    \t\t                \t$('#addForm').dialog('close');" + NL + "    \t\t                \tvar data = eval('(' + data + ')');" + NL + "    \t\t                    if (data.operateSuccess) {" + NL + "    \t\t                        $.messager.show({" + NL + "    \t\t                            title:'成功'," + NL + "    \t\t                            msg:data.operateMessage," + NL + "    \t\t                            timeout:2000," + NL + "    \t\t                            showType:'slide'" + NL + "    \t\t                        });" + NL + "    \t\t                        grid.reloadGrid();" + NL + "    \t\t                    } else {" + NL + "    \t\t                        $.messager.show({" + NL + "    \t\t                            title:'失败'," + NL + "    \t\t                            msg:data.operateMessage," + NL + "    \t\t                            timeout:2000," + NL + "    \t\t                            showType:'slide'" + NL + "    \t\t                        });" + NL + "    \t\t                    }" + NL + "    \t\t                }" + NL + "    \t\t            });" + NL + "    \t\t\t\t}" + NL + "    \t\t\t}, {" + NL + "    \t\t\t\ttext:'取消'," + NL + "    \t\t\t\ticonCls:'icon-cancel'," + NL + "    \t\t\t\thandler:function() {" + NL + "    \t\t\t\t\t$('#addForm').dialog('close');" + NL + "    \t\t\t\t}" + NL + "    \t\t\t}]" + NL + "    \t\t});" + NL + "    \t\t$('#addForm').form('validate');" + NL + "        }" + NL + "        " + NL + "        function updateFunction(rowId) {" + NL + "        \t$.loding();" + NL + "    \t\t$.ajax({" + NL + "                url:'${ctx}/";
  protected final String TEXT_5 = "/";
  protected final String TEXT_6 = "Action!getById?id=' + rowId," + NL + "                method:'POST'," + NL + "                success:function (data) {" + NL + "                \tvar obj = {};" + NL + "                \t$.each(data,function(i,item){" + NL + "                \t\tobj[\"";
  protected final String TEXT_7 = ".\"+i] = item;" + NL + "                    });" + NL + "                \t$('#addForm').form('load',obj);" + NL + "                \t$.loded();" + NL + "                \t" + NL + "                \t$('#addForm').dialog({" + NL + "            \t\t\ttitle:'更新窗口'," + NL + "            \t\t\tmodal:true," + NL + "            \t\t\tdraggable:false," + NL + "            \t\t\tbuttons:[{" + NL + "            \t\t\t\ttext:'保存'," + NL + "            \t\t\t\ticonCls:'icon-save'," + NL + "            \t\t\t\thandler:function() {" + NL + "            \t\t\t\t\t$('#addForm').form('submit',{" + NL + "            \t\t\t\t\t\turl:'${ctx}/";
  protected final String TEXT_8 = "/";
  protected final String TEXT_9 = "Action!update'," + NL + "            \t\t                success:function(data) {" + NL + "            \t\t\t\t\t\t$('#addForm').dialog('close');" + NL + "            \t\t                \tvar data = eval('(' + data + ')');" + NL + "            \t\t                    if (data.operateSuccess) {" + NL + "            \t\t                        $.messager.show({" + NL + "            \t\t                            title:'成功'," + NL + "            \t\t                            msg:data.operateMessage," + NL + "            \t\t                            timeout:2000," + NL + "            \t\t                            showType:'slide'" + NL + "            \t\t                        });" + NL + "            \t\t                        grid.reloadGrid();" + NL + "            \t\t                    } else {" + NL + "            \t\t                        $.messager.show({" + NL + "            \t\t                            title:'失败'," + NL + "            \t\t                            msg:data.operateMessage," + NL + "            \t\t                            timeout:2000," + NL + "            \t\t                            showType:'slide'" + NL + "            \t\t                        });" + NL + "            \t\t                    }" + NL + "            \t\t                }" + NL + "            \t\t            });" + NL + "            \t\t\t\t}" + NL + "            \t\t\t}, {" + NL + "            \t\t\t\ttext:'取消'," + NL + "            \t\t\t\ticonCls:'icon-cancel'," + NL + "            \t\t\t\thandler:function() {" + NL + "            \t\t\t\t\t$('#addForm').dialog('close');" + NL + "            \t\t\t\t}" + NL + "            \t\t\t}]" + NL + "            \t\t});" + NL + "                }" + NL + "            });" + NL + "        }" + NL + "        " + NL + "        function viewFunction(rowId) {" + NL + "        \t$.loding();" + NL + "    \t\t$.ajax({" + NL + "                url:'${ctx}/";
  protected final String TEXT_10 = "/";
  protected final String TEXT_11 = "Action!getById?id=' + rowId," + NL + "                method:'POST'," + NL + "                success:function (data) {" + NL + "                \t$.each(data,function(i,item){" + NL + "                \t\t$('#viewForm span[name=\"";
  protected final String TEXT_12 = ".'+i+'\"]').html(item);" + NL + "                    });" + NL + "                \t$.loded();" + NL + "                \t$('#viewForm').dialog({" + NL + "        \t\t\t\ttitle:'查看窗口'," + NL + "        \t\t\t\tmodal:true," + NL + "        \t\t\t\tdraggable:false," + NL + "        \t\t\t\tbuttons:[{" + NL + "        \t\t\t\t\ttext:'取消'," + NL + "        \t\t\t\t\ticonCls:'icon-cancel'," + NL + "        \t\t\t\t\thandler:function() {" + NL + "        \t\t\t\t\t\t$('#viewForm').dialog('close');" + NL + "        \t\t\t\t\t}" + NL + "        \t\t\t\t}]" + NL + "        \t\t\t});" + NL + "                }" + NL + "            });" + NL + "        }" + NL + "" + NL + "        function deleteFunction() {" + NL + "            var rows = grid.getSelectNodes();" + NL + "            if (rows.length == 0) {" + NL + "                $.messager.show({" + NL + "                    title:'提示'," + NL + "                    msg:'请选择要删除的行'," + NL + "                    timeout:2000," + NL + "                    showType:'slide'" + NL + "                });" + NL + "                return;" + NL + "            } else {" + NL + "            \tvar ids = new Array();" + NL + "                $.messager.confirm('警告', '是否要删除该记录?', function (r) {" + NL + "                    if (r) {" + NL + "                    \tvar i = 0;" + NL + "                    \tfor (i=0; i<rows.length; i++) {" + NL + "                            ids.push(rows[i].id);" + NL + "                        }" + NL + "                        $.ajax({" + NL + "                            url:'${ctx}/";
  protected final String TEXT_13 = "/";
  protected final String TEXT_14 = "Action!delete?ids=' + ids," + NL + "                            method:'POST'," + NL + "                            success:function(data) {" + NL + "                            \tvar data = eval('(' + data + ')');" + NL + "                                if (data.operateSuccess) {" + NL + "                                    $.messager.show({" + NL + "                                        title:'成功'," + NL + "                                        msg:data.operateMessage," + NL + "                                        timeout:2000," + NL + "                                        showType:'slide'" + NL + "                                    });" + NL + "                                    grid.reloadGrid();" + NL + "                                } else {" + NL + "                                    $.messager.show({" + NL + "                                        title:'失败'," + NL + "                                        msg:data.operateMessage," + NL + "                                        timeout:2000," + NL + "                                        showType:'slide'" + NL + "                                    });" + NL + "                                }" + NL + "                            }" + NL + "                        });" + NL + "                    }" + NL + "                });" + NL + "            }" + NL + "        }" + NL + "        " + NL + "        function searchFunction(){" + NL + "        \tvar form = $.form2Json($(\"#searchForm\"));" + NL + "\t\t\tgrid.doSearch(form);  \t" + NL + "        }" + NL + "        " + NL + "        function clearSearchGrid(){" + NL + "        \t$('#searchForm').form('clear');" + NL + "        }" + NL + "        " + NL + "        function viewFormInit() {" + NL + "        \t$('#viewForm').append($('#addForm [name=\"addDiv\"]').clone());" + NL + "\t\t\t$('#viewForm td').find('input[name]').each(function(){" + NL + "\t\t\t\tvar span = $('<span>')" + NL + "\t\t\t\t\t .attr('name', $(this).attr('name'));" + NL + "\t\t\t\tvar parent = $(this).parents('td.contentTd');" + NL + "\t\t\t\tparent.empty().append(span);" + NL + "\t\t\t});" + NL + "\t\t\t$('#viewForm td textarea').each(function(){" + NL + "\t\t\t\t$(this).after($('<span></span>')" + NL + "\t\t\t\t\t .attr('name', $(this).attr('name'))" + NL + "\t\t\t\t\t .attr('style', 'width:100%;height:85px;overflow-y:auto;')" + NL + "\t\t\t\t\t );" + NL + "\t\t\t\t$(this).remove();" + NL + "\t\t\t});" + NL + "        }" + NL + "        " + NL + "\t\t$(document).ready(function () {" + NL + "\t\t     grid = new Grid($(\"title\").html(), 'icon-edit'," + NL + "\t\t             '${ctx}/";
  protected final String TEXT_15 = "/";
  protected final String TEXT_16 = "Action!list'," + NL + "\t\t             'data_list','#tb');" + NL + "\t\t     grid.loadGrid();" + NL + "\t\t     viewFormInit();" + NL + "\t\t});" + NL + "        " + NL + "        function gridFormatterLength(value, rowData, rowIndex) {" + NL + "        \tif(value==null || value == '' || value == 'undefined')" + NL + "        \t\treturn '';" + NL + "    \t\tif(value.length > 25)" + NL + "    \t\t\treturn value.substring(0, 25) + '...';" + NL + "    \t\treturn value;" + NL + "    \t}" + NL + "" + NL + "        function gridFormatter(value, rowData, rowIndex) {" + NL + "        \tvar rowId = rowData.id;" + NL + "        \tvar url = \"\";" + NL + "        \turl += \"<input type='button' class='btn1' onclick='updateFunction(\\\"\" + rowId + \"\\\");' value='修改'/>&nbsp;&nbsp;\";" + NL + "        \turl += \"<input type='button' class='btn1' onclick='viewFunction(\\\"\" + rowId + \"\\\");' value='查看'/>&nbsp;&nbsp;\";" + NL + "        \treturn url;" + NL + "        }" + NL + "        " + NL + "</script>" + NL + "</head>" + NL + "<body>" + NL + "" + NL + "" + NL + "" + NL + "<div id=\"tb\">" + NL + "\t<a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-add', plain:true\" onclick=\"addFunction()\">新增</a>" + NL + "\t<a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-delete', plain:true\" onclick=\"deleteFunction()\">删除</a>" + NL + "<!-- \t<a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-exp', plain:true\" onclick=\"expFunction()\">导出</a> -->" + NL + "\t<div>" + NL + "\t<form id=\"searchForm\" style=\"margin: 0;\">" + NL + "\t";
  protected final String TEXT_17 = NL + "\t&nbsp;&nbsp;";
  protected final String TEXT_18 = ":&nbsp;&nbsp;<input type=\"text\" name=\"";
  protected final String TEXT_19 = ".";
  protected final String TEXT_20 = "\" />";
  protected final String TEXT_21 = NL + "\t" + NL + "\t&nbsp;&nbsp;<a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" iconCls=\"icon-search\" onclick=\"searchFunction()\">查询</a>" + NL + "\t&nbsp;&nbsp;" + NL + "\t<a href=\"javascript:void(0);\" class=\"easyui-linkbutton\" iconCls=\"icon-clear\" onclick=\"clearSearchGrid();\">清空</a>" + NL + "\t</form>" + NL + "\t</div>" + NL + "</div>" + NL + "" + NL + "<div style=\"height: 500px\">" + NL + "    <table id=\"data_list\" loadMsg=\"正在努力拉取数据中...\" fit=\"true\" fitColumns=\"true\">" + NL + "        <thead>" + NL + "        <tr>" + NL + "\t\t\t";
  protected final String TEXT_22 = NL + "            <th align=\"center\" field=\"";
  protected final String TEXT_23 = "\" width=\"150\" formatter=\"gridFormatterLength\" >";
  protected final String TEXT_24 = "</th>";
  protected final String TEXT_25 = NL + "            <th field=\"id\" width=\"120\" formatter=\"gridFormatter\">操作</th>         " + NL + "        </tr>" + NL + "        </thead>" + NL + "    </table>" + NL + "</div>" + NL + "" + NL + "\t<!-- 添加更新窗口 -->" + NL + "\t<div style=\"display: none;\">" + NL + "\t\t<form id=\"addForm\" method=\"post\" style=\"width: 960px; height: 500px;\">" + NL + "\t\t\t<input type=\"hidden\" name=\"";
  protected final String TEXT_26 = ".id\"/>" + NL + "\t\t\t<div style=\"margin: 0 auto;\" align=\"center\" name=\"addDiv\">" + NL + "\t\t\t\t<table class=\"detailTable\" style=\"width: 80%;\">" + NL + "\t\t\t\t\t";
  protected final String TEXT_27 = NL + "\t\t\t\t\t\t<tr>" + NL + "\t\t\t\t\t\t\t<td class=\"labelTd\">";
  protected final String TEXT_28 = ":</td>" + NL + "\t\t\t\t\t\t\t<td class=\"contentTd\">" + NL + "\t\t\t\t\t\t\t<input type=\"text\" class=\"easyui-validatebox\" name=\"";
  protected final String TEXT_29 = ".";
  protected final String TEXT_30 = "\"" + NL + "\t\t\t\t\t\t\tdata-options=\"validType:'maxByteLength[100]'\" />" + NL + "\t\t\t\t\t\t\t</td>" + NL + "\t\t\t\t\t\t";
  protected final String TEXT_31 = NL + "\t\t\t\t\t\t\t<td class=\"labelTd\">";
  protected final String TEXT_32 = ":</td>" + NL + "\t\t\t\t\t\t\t<td class=\"contentTd\">" + NL + "\t\t\t\t\t\t\t<input type=\"text\" class=\"easyui-validatebox\" name=\"";
  protected final String TEXT_33 = ".";
  protected final String TEXT_34 = "\"" + NL + "\t\t\t\t\t\t\tdata-options=\"validType:'maxByteLength[100]'\" />" + NL + "\t\t\t\t\t\t\t</td>" + NL + "\t\t\t\t\t\t</tr>" + NL + "\t\t\t\t\t\t";
  protected final String TEXT_35 = NL + "\t\t\t\t\t\t<tr>" + NL + "\t\t\t\t\t\t\t<td class=\"labelTd\">";
  protected final String TEXT_36 = ":</td>" + NL + "\t\t\t\t\t\t\t<td colspan=\"3\" class=\"contentTd\">" + NL + "\t\t\t\t\t\t\t<textarea class=\"easyui-validatebox\" name=\"";
  protected final String TEXT_37 = ".";
  protected final String TEXT_38 = "\"" + NL + "\t\t\t\t\t\t\t style=\"width: 80%; height: 80px;\" data-options=\"validType:'maxByteLength[255]'\">" + NL + "\t\t\t\t\t\t\t</textarea>" + NL + "\t\t\t\t\t\t\t</td>" + NL + "\t\t\t\t\t\t</tr>" + NL + "\t\t\t\t\t\t";
  protected final String TEXT_39 = NL + "\t\t\t\t\t\t\t<td class=\"contentTd\" colspan=\"2\">" + NL + "\t\t\t\t\t\t\t</td>" + NL + "\t\t\t\t\t\t</tr>" + NL + "\t\t\t\t\t\t<tr>" + NL + "\t\t\t\t\t\t\t<td class=\"labelTd\">";
  protected final String TEXT_40 = ":</td>" + NL + "\t\t\t\t\t\t\t<td colspan=\"3\" class=\"contentTd\">" + NL + "\t\t\t\t\t\t\t<textarea class=\"easyui-validatebox\" name=\"";
  protected final String TEXT_41 = ".";
  protected final String TEXT_42 = "\"" + NL + "\t\t\t\t\t\t\t style=\"width: 80%; height: 80px;\" data-options=\"validType:'maxByteLength[255]'\">" + NL + "\t\t\t\t\t\t\t</textarea>" + NL + "\t\t\t\t\t\t\t</td>" + NL + "\t\t\t\t\t\t</tr>";
  protected final String TEXT_43 = NL + "\t\t\t\t</table>" + NL + "\t\t\t</div>" + NL + "\t\t</form>" + NL + "\t</div>" + NL + "\t" + NL + "\t<div style=\"display: none;\">" + NL + "\t\t<div id=\"viewForm\" style=\"width: 960px; height: 500px;\">" + NL + "\t\t\t" + NL + "\t\t</div>" + NL + "\t</div>" + NL + "\t" + NL + "</body>" + NL + "</html>";

  public String generate(Object argument)
  {
    final StringBuffer stringBuffer = new StringBuffer();
     
	Object[] o=(Object[])argument;
	String tableName = o[0].toString();
	List<String> fieldNames=(List<String>)o[3];
	Map<String,String> chineseNameMap=(Map<String,String>)o[5];
	String lowerClassName = o[7].toString();
	Map<String,Boolean> multiLineMap=(Map<String,Boolean>)o[8];
	boolean flag = true;

    stringBuffer.append(TEXT_1);
    stringBuffer.append(chineseNameMap.get(tableName) );
    stringBuffer.append(TEXT_2);
    stringBuffer.append(lowerClassName);
    stringBuffer.append(TEXT_3);
    stringBuffer.append(lowerClassName);
    stringBuffer.append(TEXT_4);
    stringBuffer.append(lowerClassName);
    stringBuffer.append(TEXT_5);
    stringBuffer.append(lowerClassName);
    stringBuffer.append(TEXT_6);
    stringBuffer.append(lowerClassName);
    stringBuffer.append(TEXT_7);
    stringBuffer.append(lowerClassName);
    stringBuffer.append(TEXT_8);
    stringBuffer.append(lowerClassName);
    stringBuffer.append(TEXT_9);
    stringBuffer.append(lowerClassName);
    stringBuffer.append(TEXT_10);
    stringBuffer.append(lowerClassName);
    stringBuffer.append(TEXT_11);
    stringBuffer.append(lowerClassName);
    stringBuffer.append(TEXT_12);
    stringBuffer.append(lowerClassName);
    stringBuffer.append(TEXT_13);
    stringBuffer.append(lowerClassName);
    stringBuffer.append(TEXT_14);
    stringBuffer.append(lowerClassName);
    stringBuffer.append(TEXT_15);
    stringBuffer.append(lowerClassName);
    stringBuffer.append(TEXT_16);
    for(int i=0;i<fieldNames.size();i++){ 
	String fieldName = fieldNames.get(i);
	
    stringBuffer.append(TEXT_17);
    stringBuffer.append(chineseNameMap.get(fieldName));
    stringBuffer.append(TEXT_18);
    stringBuffer.append(lowerClassName);
    stringBuffer.append(TEXT_19);
    stringBuffer.append(fieldName);
    stringBuffer.append(TEXT_20);
    }
    stringBuffer.append(TEXT_21);
    for(int i=0;i<fieldNames.size();i++){ 
			String fieldName = fieldNames.get(i);
			
    stringBuffer.append(TEXT_22);
    stringBuffer.append(fieldName);
    stringBuffer.append(TEXT_23);
    stringBuffer.append(chineseNameMap.get(fieldName));
    stringBuffer.append(TEXT_24);
    }
    stringBuffer.append(TEXT_25);
    stringBuffer.append(lowerClassName);
    stringBuffer.append(TEXT_26);
    
					flag = true; //是否是一行开始
					for(int i=0;i<fieldNames.size();i++){ 
					String fieldName = fieldNames.get(i);
					boolean isMultiLine = multiLineMap.get(fieldName);
					
    if(flag && !isMultiLine){
    stringBuffer.append(TEXT_27);
    stringBuffer.append(chineseNameMap.get(fieldName));
    stringBuffer.append(TEXT_28);
    stringBuffer.append(lowerClassName);
    stringBuffer.append(TEXT_29);
    stringBuffer.append(fieldName);
    stringBuffer.append(TEXT_30);
    
							flag = !flag;
							} else if(!flag && !isMultiLine) {
						
    stringBuffer.append(TEXT_31);
    stringBuffer.append(chineseNameMap.get(fieldName));
    stringBuffer.append(TEXT_32);
    stringBuffer.append(lowerClassName);
    stringBuffer.append(TEXT_33);
    stringBuffer.append(fieldName);
    stringBuffer.append(TEXT_34);
    
							flag = !flag;
							} else if(flag && isMultiLine) {
						
    stringBuffer.append(TEXT_35);
    stringBuffer.append(chineseNameMap.get(fieldName));
    stringBuffer.append(TEXT_36);
    stringBuffer.append(lowerClassName);
    stringBuffer.append(TEXT_37);
    stringBuffer.append(fieldName);
    stringBuffer.append(TEXT_38);
    
							flag = true;
							} else if(!flag && isMultiLine) {
						
    stringBuffer.append(TEXT_39);
    stringBuffer.append(chineseNameMap.get(fieldName));
    stringBuffer.append(TEXT_40);
    stringBuffer.append(lowerClassName);
    stringBuffer.append(TEXT_41);
    stringBuffer.append(fieldName);
    stringBuffer.append(TEXT_42);
    
							flag = true;
							}
						
    }
    stringBuffer.append(TEXT_43);
    return stringBuffer.toString();
  }
}
