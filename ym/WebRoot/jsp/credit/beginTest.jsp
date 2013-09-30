<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>开始考试</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<script type="text/javascript" src="../time/js/jquery.lwtCountdown-1.0.js"></script>
<link rel="Stylesheet" type="text/css" href="../time/style/main.css"></link>
<script type="text/javascript">
var single = null;//单选题字符串
var scores = 0;//总分
var many = null;//多选题字符串
var judge = null;//判断题字符串
var ejudgeScore=null;//判断题分数
var esingleScore=null;//单选题分数
var emanyScore=null;//多选题分数
var paperId =null;//试卷ID
var SysSecond; //计时器
var InterValObj;  //计时器
var paperScores = 0;//试卷分数
var manyLength =0; //多选题个数
var adst;
var bodyfrm;
	 $(document).ready(
 		function (){
 			$.ajax( {url : '${ctx}/testPaperManage/testPaperManageAction!getById?id=<%=request.getParameter("id")%>',
 				success : function(data) {
			 		$.each(data,function(i,item){
			 			paperId = data.id;
			 		    ejudgeScore=data.judgeScore;
			 		    esingleScore=data.singleScore;
			 		    emanyScore=data.manyScore;
			 		    paperScores =data.paperScore;
						$("#onLineTest").find('span[name="testPaperManage.' + i + '"]').text(item);
						$("#qualified").text(paperScores*60/100);
						manyLength =data.manyNum;//多选题个数
						/***********追加试题的大标题************/
						judges = '<tr class="appendClass"><td colspan="4"><strong>一、判断题（题数'+data.jugeNum+' ，共'+(data.jugeNum*data.judgeScore)+'分）</strong></td></tr>';
						singles = '<tr class="appendClass"><td colspan="4"><strong>二、单选题（题数'+data.singleNum+'， 共'+(data.singleNum*data.singleScore)+'分）</strong></td></tr>';
						manys = '<tr class="appendClass"><td colspan="4"><strong>三、多选题（题数'+data.manyNum+'， 共'+(data.manyNum*data.manyScore)+'分）</strong></td></tr>';
						var judge =''; 
						var single =''; 
						var many =''; 
						if(i == "list"){
						$("#onLineTest").find('.appendTable .appendClass').remove();
						var ele = "";
						var judgeIndex = 0;//判断题题号
						var manyIndex = 0;//多选题题号
						var singleIndex = 0;//单选题题号
							$.each(data.list,function(key,value){
								/***********追加试题的************/
								if(value.qsTypeName == "判断题"){	
									judgeIndex = judgeIndex + 1;//判断题题号
									judge = judge+'<tr><td style="font-weight:bold;font-size:11pt;">'+judgeIndex+'、'+value.qsName+'（'+data.judgeScore+'分）</td></tr>'
									+'<tr id="judge_'+judgeIndex+'"><td><input type="radio" name="'+value.id+'" value="正确"/><span style="font-size:10pt;">正确</span>'
									+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="'+value.id+'" value="错误"/><span style="font-size:10pt;">错误</span></td></tr>'
									+'<tr><td><div id="'+value.id+'" style="border:1px dashed red;display:none;color:red;font-weight:bold;font-size:10pt;">'
									+'正确答案：'+value.qsAnswer+'</div><tr></td></tr>';
									
								}
								if(value.qsTypeName == "单选题"){
									singleIndex = singleIndex + 1;//单选题题号
									if(value.optionD != null && value.opetionD !=''){
										single = single+'<tr><td><span style="font-weight:bold;font-size:11pt;">'+singleIndex+'、'+value.qsName+'（'+data.singleScore+'分）</span></td></tr>'
										+'<tr><td><span style="font-size:10pt;">A：'+value.optionA+'</span></td></tr>'
										+'<tr><td><span style="font-size:10pt;">B：'+value.optionB+'</span></td></tr>'
										+'<tr><td><span style="font-size:10pt;">C：'+value.optionC+'</span></td></tr>'
										+'<tr><td><span style="font-size:10pt;">D：'+value.optionD+'</span></td></tr>'
										+'<tr><td><input type="radio" name="'+value.id+'" value="A"/>A&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="'+value.id+'"value="B"/>'
										+'B&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="'+value.id+'" value="C"/>C&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="'+value.id+'" value="D"/>D</td></tr>'
										+'<tr><td><div id="'+value.id+'" style="border:1px dashed red;display:none;color:red;font-weight:bold;font-size:10pt;">'
										+'正确答案：'+value.qsAnswer+'</div><tr></td></tr>';
									}else{
										single = single+'<tr><td><span style="font-weight:bold;font-size:11pt;">'+singleIndex+'、'+value.qsName+'（'+data.singleScore+'分）</span></td></tr>'
										+'<tr><td><span style="font-size:10pt;">A：'+value.optionA+'</span></td></tr>'
										+'<tr><td><span style="font-size:10pt;">B：'+value.optionB+'</span></td></tr>'
										+'<tr><td><span style="font-size:10pt;">C：'+value.optionC+'</span></td></tr>'
										+'<tr><td><input type="radio" name="'+value.id+'" value="A"/>A&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="'+value.id+'"value="B"/>'
										+'B&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="'+value.id+'" value="C"/>C</td></tr>'
										+'<tr><td><div id="'+value.id+'" style="border:1px dashed red;display:none;color:red;font-weight:bold;font-size:10pt;">'
										+'正确答案：'+value.qsAnswer+'</div><tr></td></tr>';
									}
								}
								if(value.qsTypeName == "多选题"){
									manyIndex = manyIndex + 1;//多选题题号
									if(value.optionE !=null && value.optionE !=''){
										many = many+'<tr><td><span style="font-weight:bold;font-size:11pt;">'+manyIndex+'、'+value.qsName+'（'+data.manyScore+'分）</span></td></tr>'
										+'<tr><td><span style="font-size:10pt;">A：'+value.optionA+'</span></td></tr>'
										+'<tr><td><span style="font-size:10pt;">B：'+value.optionB+'</span></td></tr>'
										+'<tr><td><span style="font-size:10pt;">C：'+value.optionC+'</span></td></tr>'
										+'<tr><td><span style="font-size:10pt;">D：'+value.optionD+'</span></td></tr>'
										+'<tr><td><span style="font-size:10pt;">E：'+value.optionE+'</span></td></tr>'
										+'<tr><td><input type="checkbox" class="c_'+manyIndex+'" name="'+value.id+'" value ="A"/>A&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
										+'<input type="checkbox"  class="c_'+manyIndex+'"  name="'+value.id+'"value="B"/>B'
										+'&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" class="c_'+manyIndex+'" name="'+value.id+'" value="C"/>C&nbsp;&nbsp;&nbsp;&nbsp;'
										+'<input type="checkbox" class="c_'+manyIndex+'" name="'+value.id+'" value="D"/>D'
										+'&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" class="c_'+manyIndex+'"  name="'+value.id+'" value="E"/>E</td></tr>'
										+'<tr><td><div id="'+value.id+'" style="border:1px dashed red;display:none;color:red;font-weight:bold;font-size:10pt;">'
										+'正确答案：'+value.qsAnswer+'</div><tr></td></tr>';
									}else{
										many = many+'<tr><td><span style="font-weight:bold;font-size:11pt;">'+manyIndex+'、'+value.qsName+'（'+data.manyScore+'分）</span></td></tr>'
										+'<tr><td><span style="font-size:10pt;">A：'+value.optionA+'</span></td></tr>'
										+'<tr><td><span style="font-size:10pt;">B：'+value.optionB+'</span></td></tr>'
										+'<tr><td><span style="font-size:10pt;">C：'+value.optionC+'</span></td></tr>'
										+'<tr><td><span style="font-size:10pt;">D：'+value.optionD+'</span></td></tr>'
										+'<tr><td><input type="checkbox" class="c_'+manyIndex+'"  name="'+value.id+'" value ="A"/>A&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
										+'<input type="checkbox"  class="c_'+manyIndex+'" name="'+value.id+'"value="B"/>B'
										+'&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" class="c_'+manyIndex+'"  name="'+value.id+'" value="C"/>C&nbsp;&nbsp;&nbsp;&nbsp;'
										+'<input type="checkbox" class="c_'+manyIndex+'" name="'+value.id+'" value="D"/>D</td></tr>'
										+'<tr><td><div id="'+value.id+'" style="border:1px dashed red;display:none;color:red;font-weight:bold;font-size:10pt;">'
										+'正确答案：'+value.qsAnswer+'</div><tr></td></tr>';
									}
								}
							});
							/***********拼接试题（判断，单选，多选）************/
							var da='';
							if(judge !="") 
							da = da + judges+judge; 
							if(single !="") 
							da = da + singles+single;
							if(many !="") 
							da = da + manys+many;
							var ss = $(da);
							/***********追加到指定的位置************/
							$(ss).appendTo($("#onLineTest").find('.appendTable'));		
						}
			    	});
			   	 SysSecond = parseInt(data.paperTime)*60; //这里获取倒计时的起始时间 
	 			 InterValObj = window.setInterval(SetRemainTime, 1000); //间隔函数，1秒执行
	 			 //div悬浮功能
	 			 bodyfrm =  ( document.compatMode.toLowerCase()=="css1compat" ) ? document.documentElement : document.body;
			   	adst = document.getElementById("remainTime").style;
			    adst.top = ( bodyfrm.clientHeight -530-22 ) + "px";
			    adst.left = ( bodyfrm.clientWidth -155 ) + "px";
			    setInterval("moveR();", 100);
			 }
 		});
 	});
 	  function moveR() {
	    adst.top = ( bodyfrm.scrollTop + bodyfrm.clientHeight - 530-22) + "px";
	    adst.left = ( bodyfrm.scrollLeft + bodyfrm.clientWidth - 155 ) + "px";
    }
 	/** 
	 *屏蔽 F5、Ctrl+N、Shift+F10、Alt+F4 ,CTRL+R
	*如果想要屏蔽其他键，则找到对应的 keyCode 再依照此方法即可 
	*/ 
 	//google
 	window.onkeydown = function(event){  
		event = window.event || event;  
	   if(event.keyCode==116 || (event.ctrlKey && event.keyCode==78) || (event.shiftKey && event.keyCode==121) || (event.altKey && event.keyCode==115)||(event.ctrlKey && event.keyCode==82)){  
	        event.keyCode =0;  
	        event.returnvalue = false;  
	        return false;
  		}  	 
	} 
	//IE firefox
	document.onkeydown = function(event){  
		event = window.event || event;  
	   if(event.keyCode==116 || (event.ctrlKey && event.keyCode==78) || (event.shiftKey && event.keyCode==121) || (event.altKey && event.keyCode==115)||(event.ctrlKey && event.keyCode==82)){  
	        event.keyCode =0;  
	        event.returnvalue = false;  
	        return false;
  		}  	 
	}  
	//屏蔽右键(google)
	window.oncontextmenu = function(){return false;}  
	//IE firefox
	document.oncontextmenu = function(){return false;}  
	
 	
   //将时间减去1秒，计算天、时、分、秒 
	  function SetRemainTime() { 
		   if (SysSecond >0) { 
			    SysSecond = SysSecond - 1; 
			    var second = Math.floor(SysSecond % 60);             // 计算秒     
			    var minite = Math.floor((SysSecond / 60) % 60);      //计算分 
			    var hour = Math.floor((SysSecond / 3600) % 24);      //计算小时 
			    if(SysSecond == 1){
			   	 alert('距离考试结束还有1分钟。');
			    }
			    $("#remainTime").html("距离考试结束"+hour + "：" + minite + "：" + second); 
		   } else{//剩余时间小于或等于0的时候，就停止间隔函数 
			    window.clearInterval(InterValObj); 
			    //这里可以添加倒计时时间为0后需要执行的事件 
			     alert('考试超时，强制提交试卷。');
			    sub();
		   } 
	  } 	
</script>
</head>
<body>
<div style="background-color: gray;width: 100%;text-align: center;font-size: 12px">
<div id="remainTime" style="font-size:20px;font-weight:800;color:white;position:absolute;z-index:100;background-color: #afdfe4;"></div>
	<div style="width:50%;background-color:white;padding: 10px 20px 10px 20px;margin: 0 auto;" id="onLineTest">
		<form action="" method="post" id ="addForm">
		<div id=content style="border:1px dashed #334455;">
			<table border="0" style="width:100%;line-height: 40px;">
				<tr>
				<td colspan="4" style="text-align: center;">
					<div style="font-size: 14px"> <span style="font-weight: bold;font-size:20pt;" name="testPaperManage.paperName"></span></div>
					
                    <div style="font-size: 14px">试卷说明 </div>
                    <div style="font-size: 14px;text-align: center;">
                        <table cellspacing="0" cellpadding="0" border="0" style="margin: 0 auto;line-height: 20px;">
                            <tbody >
                                <tr>
                                    <td style="font-size: 14px">卷面总分：<span name="testPaperManage.paperScore"></span>&nbsp;分 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                    <td style="font-size: 14px">合格分数：<strong style="color: red;" id="qualified"></strong>&nbsp;分&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                    <td style="font-size: 14px">最高分数：<span name="testPaperManage.paperScore"></span>分&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-size: 14px">试卷题数：<span name="testPaperManage.countNum"></span>&nbsp;题&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                    <td style="font-size: 14px">答题时间：<span name="testPaperManage.paperTime"></span>&nbsp;分钟&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                     <td style="font-size: 14px">试卷来源：阳煤集团&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
	                 </td>
				</tr>
				<tr>
					<td colspan="4"><hr style="color:#fff;border:1px dashed #334455;" /> </td>
				</tr>
				<tr >
					<td colspan="4" style="text-align: center;"><div id="contentScores" style="border:1px dashed #334455;display: none;color:red;font-weight:bold;font-size:20pt;"></div></td>
				</tr>
				<tr >
				<td colspan="4">
					<table class="appendTable" style="width:100%;line-height: 50px;"></table>
				</td>
				</tr>
			</table>
		</div>
			<input type="hidden" value="" name="selectPaper.paperId" id="paperId"/>
			<input type="hidden" value="" name="selectPaper.judgeIds" id="judgeIds"/>
			<input type="hidden" value="" name="selectPaper.manyIds" id="manyIds"/>
			<input type="hidden" value="" name="selectPaper.singleIds" id="singleIds"/>
			<input type="hidden" value="" name="selectPaper.judgeAnswer" id="judgeAnswer"/>
			<input type="hidden" value="" name="selectPaper.manyAnswer" id="manyAnswer"/>
			<input type="hidden" value="" name="selectPaper.singleAnswer" id="singleAnswer"/>
			<input type="hidden" value="" name="selectPaper.scores" id="scores"/>
			<input type="hidden" value="${user_id}" name="selectPaper.username" id="user"/>
			<input type="hidden" value="" name="selectPaper.paperscores" id="paperscores"/>
			<div id="but">
			<a href="javascript:void(0);" onclick="sub();"><img src="${ctx}/images/subPaper.png"/></a>
			</div>	
		</form>
	</div>
</div>

<script type="text/javascript">
	function sub(){
	  /*******************************计算多选题，判断题得分开始**************************************/
	    var judgeIds = new Array();
	    var singleIds = new Array();
	    var judgeAnswer = new Array();
	    var singleAnswer = new Array();
		var itemradio = $(":input:radio");   
        var itemvalue = '';    
        var itemName = '';    
        for(i=0;i<itemradio.length;i++)     
        {     
            if(itemradio[i].checked){  //判断是否被选中
                  itemvalue = itemradio[i].value;  
                  itemName = itemradio[i].name;
                  var text = $("#"+itemName).text();
                  var ss = text.substring(5);
                  if(text.substring(5) == itemvalue){//判断答题是否正确
                  	if(itemvalue.length>1){//判断是单选题还是判断题
                  		scores = parseInt(scores) + parseInt(ejudgeScore);
                  	}
                  	else{
                  		scores = parseInt(scores) + parseInt(esingleScore);
                  	}
                  	$("#"+itemName).css("color","blue");
                  }
                  if(itemvalue.length>1){//答案填入数据库
                  	judgeIds.push(itemName);
                  	judgeAnswer.push(itemvalue);
                  }else{
                  	singleIds.push(itemName);//作答的题目ID 存入数据库
                  	singleAnswer.push(itemvalue);//作答的题目答案
                  }
             }  
        }   
         /*******************************计算单选题，判断题得分结束**************************************/
        /*******************************计算多选题得分 开始**************************************/
        var manyIds = new Array();
        var manyAnswer = new Array();
        for(var i =1;i<=manyLength;i++){
	        var checkvalue = '';
	 		var checkvalues = '';
	 		var checkname = '';
        	var itemcheck =$(".c_"+i);
			for(n=0;n<itemcheck.length;n++){
				if(itemcheck[n].checked){//判断是否被选中
					checkvalue=itemcheck[n].value;
					checkvalues = checkvalues+checkvalue;
				}
				if(n==itemcheck.length-1){//判断是否是每组最后一个元素
					checkname=itemcheck[n].name;
					var checkText = $("#"+checkname).text();
	       			manyIds.push(checkname);//作答的题目ID 存入数据库
	       			manyAnswer.push(checkvalues);//作答的题目答案
	       			if(checkText.substring(5) == checkvalues){//判断试卷答案和我的答案是否相等
	                  	scores = parseInt(scores) + parseInt(emanyScore);//计算试卷分数
	                  	$("#"+checkname).css("color","blue");
	            	}
            	}
			}        	
        }
          /*******************************计算多选题得分  结束**************************************/
          /*******************************得分情况赋值  开始**************************************/
         $("#paperId").val(paperId);
         $("#manyIds").val(manyIds);
         $("#singleIds").val(singleIds);
         $("#judgeIds").val(judgeIds);
         $("#judgeAnswer").val(judgeAnswer);
         $("#manyAnswer").val(manyAnswer);
         $("#singleAnswer").val(singleAnswer);
         $("#scores").val(scores);
         $("#paperscores").val(paperScores);
         /*******************************得分情况赋值  结束**************************************/
        subData();//提交方法
        //剩余时间小于或等于0的时候，就停止间隔函数 
		 window.clearInterval(InterValObj); 
        if(confirm("是否要查看答题情况？")){
	        $("#contentScores").text("本次考试得分："+scores);
			var len=$("div").length;
	 		for ( i=0;i<len;i++) {//显示div
				$("div")[i].style.display="block";
			}
		}
		$("#but").attr({style:"display:none"});//隐藏按钮
 	}
 	
 	 /*******************************提交考试成绩**************************************/
 	function subData(){
 	 $('#addForm').form({
	        url:'${ctx}/selectPaper/selectPaperAction!add.action',
	        method:'POST',
	        success:function (data) {
	        }
	    });
	    $('#addForm').submit();
 	}
</script>
</body>
</html>