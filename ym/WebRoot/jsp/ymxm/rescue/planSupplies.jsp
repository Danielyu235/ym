<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="gb2312" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��Ԯ����</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<script type="text/javascript">
var aid='';
$(document).ready(
 	function (){
 		$("#tc").find('.appendTable .appendClass').remove();
 		aid=getArgs();//�¹�Id
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
						'<input id="'+(i+1)+'" type="text" name="sl" value="" style="width:40px" required="true" missingMessage="������д0~'+item.wzsl+'֮�������" /></td>'
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
 	  //��ȡURL����
	  function getArgs() {
	    var query = location.search.substring(1);    
	    var pos =query.indexOf('=');   
	    var argname = query.substring(0,pos); 
	    var value = query.substring(pos+1);   
	    value = decodeURIComponent(value);               
	    return value;                                  
	} 
 	//ȫѡ ��ȡ��ȫѡ����
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
    //ѡ������
    function selectSupplies(checkBoxName){
    var arr = new Array();
    	 $("input:checkbox[name='" + checkBoxName + "']").each(function () { 
	         if($(this).attr("checked")){
                   arr.push($(this).val());
              }
	    });	
	    $.each(arr,function(key,val){ 
	    	var dataText = val;
	    	var strs= new Array(); //����һ����
			strs=val.split(","); //�ַ��ָ�  
	    	var ids = strs[0];//����input Id
	    	var num = $("#"+ids).val();//���º�����
	    	if(num == null||num == 0|| num==''){
	    	$.messager.show({
                            title:'��ʾ',
                            msg:"����д��ѡ���ʵ�����!",
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
                            title:'�ɹ�',
                            msg:data.operateMessage,
                            timeout:2000,
                            showType:'slide'
                        });
                    } else {
                        $.messager.show({
                            title:'ʧ��',
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
	<td class="table_con" style="width:20px">ȫѡ<input type="checkbox" name="full" onclick="selectAll('check')"/></td>
	<td class="table_con" style="width:20px">���</td>
	<td class="table_con" style="width:80px">��������</td>
	<td class="table_con" style="width:80px">�ͺŹ��</td>
	<td class="table_con" style="width:50px">��λ</td>
	<td class="table_con" style="width:50px">���</td>
	<td class="table_con" style="width:20px">��������</td>
	<td class="table_con" style="width:80px">���λ��</td>
	<td class="table_con" style="width:50px">��;</td>
</tr>
</table>
<a href="javascript:void(0)" onclick="selectSupplies('check');"> ����</a>
</div>
</body>
</html>