<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="gb2312" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>救援物资</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<script type="text/javascript">
var aid='';
$(document).ready(
 	function (){
 		$("#tc").find('.appendTable .appendClass').remove();
 		aid=getArgs();//事故Id
 		$.ajax({
 			url : '${ctx}/tbRescueSupplies/tbRescueSuppliesAction!getSuppList',
 			success : function(data) {
			 		$.each(data.suppList,function(i,item){
			 			var str=(i+1)+','+item.wzmc+','+item.wzlb+','+item.ssdw+','+item.cfwz+','+item.remark;
						$('#tc').find('.appendTable tbody').append('<tr class="appendClass>'
						+'<tr class="appendClass><td class="table_con" style="width:20px"><input type="checkbox" name="check" value="'+str+'"/></td>'
						+'<td class="table_con" style="width:20px">'+(i+1)+'</td><td class="table_con" style="width:100px">'+item.wzmc+'</td>'
						+'<td class="table_con" style="width:80px">'+item.wzlb+'</td><td class="table_con" style="width:20px">'+item.ssdw+'</td>'
						+'<td class="table_con" style="width:20px">'+item.wzsl+'</td>'
						+'<td class="table_con" style="width:20px">'+
						'<input id="'+(i+1)+'" type="text" name="sl" value="" style="width:40px" required="true" missingMessage="必须填写0~'+item.wzsl+'之间的整数" /></td>'
						+'<td class="table_con" style="width:80px">'+item.cfwz+'</td>'
						+'<td class="table_con" style="width:50px">'+item.remark+'</td>'
						+'</tr>');
						$('#'+(i+1)).numberbox({ 
							min:0,
							max:parseInt(item.wzsl), 
							precision:0 
						}); 
			 		});
			 } 	
		});
 	}); 
 	  //获取URL参数
	  function getArgs() {
	    var query = location.search.substring(1);    
	    var pos =query.indexOf('=');   
	    var argname = query.substring(0,pos); 
	    var value = query.substring(pos+1);   
	    value = decodeURIComponent(value);               
	    return value;                                  
	} 
 	//全选 和取消全选功能
 	function selectAll(checkBoxName) { 
	 	var flag='';
	 	if($("input:checkbox[name='full']").attr("checked")){
		  flag=true;
		 }else{
		  flag=false;
		 }
	     $("input:checkbox[name='" + checkBoxName + "']").each(function () { 
	        $(this).attr("checked", flag); 
	    });	
    } 
    //选择物质
    function selectSupplies(checkBoxName){
    var arr = new Array();
    	 $("input:checkbox[name='" + checkBoxName + "']").each(function () { 
	         if($(this).attr("checked")){
                   arr.push($(this).val());
              }
	    });	
	    $.each(arr,function(key,val){ 
	    	var dataText = val;
	    	var strs= new Array(); //定义一数组
			strs=val.split(","); //字符分割  
	    	var ids = strs[0];//数量input Id
	    	var num = $("#"+ids).val();//更新后数量
	    	if(num == null||num == 0|| num==''){
	    	$.messager.show({
                            title:'提示',
                            msg:"请填写所选物资的数量!",
                            timeout:2000,
                            showType:'slide'
                        });
	    		return;
	    	}
	    	$.ajax({
                url:'${ctx}/accidentSupplies/accidentSuppliesAction!add?accidentSupplies.materialName='+strs[1]+'&accidentSupplies.model='+strs[2]+'&accidentSupplies.unit='+strs[3]+'&accidentSupplies.num='+num+'&accidentSupplies.warehouse='+strs[4]+'&accidentSupplies.remark='+strs[5]+'&accidentSupplies.acId='+aid,
                method:'POST',
                success:function (data) {
               		 var data = eval('(' + data + ')');
                    if (data.operateSuccess) {
                        $.messager.show({
                            title:'成功',
                            msg:data.operateMessage,
                            timeout:2000,
                            showType:'slide'
                        });
                    } else {
                        $.messager.show({
                            title:'失败',
                            msg:data.operateMessage,
                            timeout:2000,
                            showType:'slide'
                        });
                    }
                }
            });
	    });
    }
    		
</script>
</head>
<body>
<div style="padding: 10px 20px 10px 20px;" id="tc" align="center" name="addDiv">
<table class="appendTable" style="border:solid #add9c0; border-width:2px 2px 2px 2px;width: 80%;text-align: center;">
<tr>
	<td class="table_con" style="width:20px">全选<input type="checkbox" name="full" onclick="selectAll('check')"/></td>
	<td class="table_con" style="width:20px">序号</td>
	<td class="table_con" style="width:80px">材料名称</td>
	<td class="table_con" style="width:80px">型号规格</td>
	<td class="table_con" style="width:50px">单位</td>
	<td class="table_con" style="width:50px">库存</td>
	<td class="table_con" style="width:20px">所需数量</td>
	<td class="table_con" style="width:80px">存放位置</td>
	<td class="table_con" style="width:50px">用途</td>
</tr>
</table>
<a href="javascript:void(0)" onclick="selectSupplies('check');"> 保存</a>
</div>
</body>
</html>