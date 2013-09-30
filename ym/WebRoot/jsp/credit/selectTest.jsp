<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看考试成绩</title>
<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
<link rel="stylesheet" href="${ctx}/css/newCrud.css" type="text/css"></link>
<script type="text/javascript">
var single = null;//单选题字符串
var many = null;//多选题字符串
var judge = null;//判断题字符串
	 $(document).ready(
 		function (){
 			$.ajax( {url : '${ctx}/testPaperManage/testPaperManageAction!getByIds?id=<%=request.getParameter("id")%>&testId=<%=request.getParameter("testId")%>',
 				success : function(data) {
			 		$.each(data,function(i,item){
			 		
						$("#onLineTest").find('span[name="testPaperManage.' + i + '"]').text(item);//显示试卷基本内容
						$("#qualified").text(data.paperScore*60/100);
						/************************追加试卷试题大标题*******************************/
						judges = '<tr class="appendClass"><td colspan="4"><strong>一、判断题（题数'+data.jugeNum+' ，共'+(data.jugeNum*data.judgeScore)+'分）</strong></td></tr>';
						singles = '<tr class="appendClass"><td colspan="4"><strong>二、单选题（题数'+data.singleNum+'， 共'+(data.singleNum*data.singleScore)+'分）</strong></td></tr>';
						manys = '<tr class="appendClass"><td colspan="4"><strong>三、多选题（题数'+data.manyNum+'， 共'+(data.manyNum*data.manyScore)+'分）</strong></td></tr>';
						var judge =''; 
						var single =''; 
						var many =''; 
						if(i == "list"){
						$("#onLineTest").find('.appendTable .appendClass').remove();
						var ele = "";
						var judgeIndex = 0;
						var manyIndex = 0;
						var singleIndex = 0;
							$.each(data.list,function(key,value){
							  	/************************追加试卷试题*******************************/
								if(value.qsTypeName == "判断题"){	
									judgeIndex = judgeIndex + 1;
									judge = judge+'<tr><td style="font-weight:bold;font-size:11pt;">'+judgeIndex+'、'+value.qsName+'（'+data.judgeScore+'分）</td></tr>'
									+'<tr><td><input type="radio" id="'+value.id+'_z" name="'+value.id+'" value="正确" disabled/><span style="font-size:10pt;">正确</span>'
									+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" disabled id="'+value.id+'_f" name="'+value.id+'" value="错误"/><span style="font-size:10pt;">错误</span></td></tr>'
									+'<tr><td><div id="'+value.id+'" style="border:1px dashed red;display:block;color:red;font-weight:bold;font-size:10pt;">'
									+'正确答案：'+value.qsAnswer+'</div><tr></td></tr>';
									
								}
								if(value.qsTypeName == "单选题"){
									singleIndex = singleIndex + 1;
									if(value.optionD !=null&&value.optionD !=''){
										single = single+'<tr><td><span style="font-weight:bold;font-size:11pt;">'+singleIndex+'、'+value.qsName+'（'+data.singleScore+'分）</span></td></tr>'
										+'<tr><td><span style="font-size:10pt;">A：'+value.optionA+'</span></td></tr>'
										+'<tr><td><span style="font-size:10pt;">B：'+value.optionB+'</span></td></tr>'
										+'<tr><td><span style="font-size:10pt;">C：'+value.optionC+'</span></td></tr>'
										+'<tr><td><span style="font-size:10pt;">D：'+value.optionD+'</span></td></tr>'
										+'<tr><td><input type="radio" disabled name="'+value.id+'" id="'+value.id+'_a" value="A"/>A&nbsp;&nbsp;&nbsp;&nbsp;'
										+'<input type="radio" id="'+value.id+'_b" disabled name="'+value.id+'"value="B"/>'
										+'B&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id="'+value.id+'_c"  disabled name="'+value.id+'" value="C"/>C'
										+'&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id="'+value.id+'_d"  disabled name="'+value.id+'" value="D"/>D</td></tr>'
										+'<tr><td><div id="'+value.id+'" style="border:1px dashed red;display:block;color:red;font-weight:bold;font-size:10pt;">'
										+'正确答案：'+value.qsAnswer+'</div><tr></td></tr>';
									}else{
										single = single+'<tr><td><span style="font-weight:bold;font-size:11pt;">'+singleIndex+'、'+value.qsName+'（'+data.singleScore+'分）</span></td></tr>'
										+'<tr><td><span style="font-size:10pt;">A：'+value.optionA+'</span></td></tr>'
										+'<tr><td><span style="font-size:10pt;">B：'+value.optionB+'</span></td></tr>'
										+'<tr><td><span style="font-size:10pt;">C：'+value.optionC+'</span></td></tr>'
										+'<tr><td><input type="radio" disabled name="'+value.id+'" id="'+value.id+'_a" value="A"/>A&nbsp;&nbsp;&nbsp;&nbsp;'+
										'<input type="radio" id="'+value.id+'_b" disabled name="'+value.id+'"value="B"/>'
										+'B&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id="'+value.id+'_c"  disabled name="'+value.id+'" value="C"/>C</td></tr>'
										+'<tr><td><div id="'+value.id+'" style="border:1px dashed red;display:block;color:red;font-weight:bold;font-size:10pt;">'
										+'正确答案：'+value.qsAnswer+'</div><tr></td></tr>';
									}
								}
								if(value.qsTypeName == "多选题"){
									manyIndex = manyIndex + 1;
									if(value.optionE !=null&&value.optionE !=''){
										many = many+'<tr><td><span style="font-weight:bold;font-size:11pt;">'+manyIndex+'、'+value.qsName+'（'+data.manyScore+'分）</span></td></tr>'
										+'<tr><td><span style="font-size:10pt;">A：'+value.optionA+'</span></td></tr>'
										+'<tr><td><span style="font-size:10pt;">B：'+value.optionB+'</span></td></tr>'
										+'<tr><td><span style="font-size:10pt;">C：'+value.optionC+'</span></td></tr>'
										+'<tr><td><span style="font-size:10pt;">D：'+value.optionD+'</span></td></tr>'
										+'<tr><td><span style="font-size:10pt;">E：'+value.optionD+'</span></td></tr>'
										+'<tr><td><input type="checkbox"disabled id="'+value.id+'_1" name="'+value.id+'" value ="A"/>A&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
										+'<input type="checkbox" disabled id="'+value.id+'_2" name="'+value.id+'"value="B"/>B'
										+'&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" disabled id="'+value.id+'_3" name="'+value.id+'" value="C"/>C&nbsp;&nbsp;&nbsp;&nbsp;'
										+'<input type="checkbox" disabled id="'+value.id+'_4" name="'+value.id+'" value="D"/>D'
										+'&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" disabled id="'+value.id+'_5" name="'+value.id+'" value="E"/>E</td></tr>'
										+'<tr><td><div id="'+value.id+'" style="border:1px dashed red;display:block;color:red;font-weight:bold;font-size:10pt;">'
										+'正确答案：'+value.qsAnswer+'</div><tr></td></tr>';
									}else{
										many = many+'<tr><td><span style="font-weight:bold;font-size:11pt;">'+manyIndex+'、'+value.qsName+'（'+data.manyScore+'分）</span></td></tr>'
										+'<tr><td><span style="font-size:10pt;">A：'+value.optionA+'</span></td></tr>'
										+'<tr><td><span style="font-size:10pt;">B：'+value.optionB+'</span></td></tr>'
										+'<tr><td><span style="font-size:10pt;">C：'+value.optionC+'</span></td></tr>'
										+'<tr><td><span style="font-size:10pt;">D：'+value.optionD+'</span></td></tr>'
										+'<tr><td><input type="checkbox"disabled id="'+value.id+'_1" name="'+value.id+'" value ="A"/>A&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
										+'<input type="checkbox" disabled id="'+value.id+'_2" name="'+value.id+'"value="B"/>B'
										+'&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" disabled id="'+value.id+'_3" name="'+value.id+'" value="C"/>C&nbsp;&nbsp;&nbsp;&nbsp;'
										+'<input type="checkbox" disabled id="'+value.id+'_4" name="'+value.id+'" value="D"/>D</td></tr>'
										+'<tr><td><div id="'+value.id+'" style="border:1px dashed red;display:block;color:red;font-weight:bold;font-size:10pt;">'
										+'正确答案：'+value.qsAnswer+'</div><tr></td></tr>';
									}	
								}
							});
							/************************追加试卷试题结束*******************************/
							/***********拼接试题（判断，单选，多选）************/
							var da='';
							if(judge !="") 
							da = da + judges+judge; //如果判断题不为空，追加判断题
							if(single !="") 
							da = da + singles+single;//如果单选题不为空，追加单选题
							if(many !="") 
							da = da + manys+many;//如果多选题不为空，追加多选题
							var ss = $(da);
							/***********追加到指定的位置************/
							$(ss).appendTo($("#onLineTest").find('.appendTable'));				
						}
			    	});
			    	$.each(data.listPaper,function(x,val){
			    	$("#username").val(val.username);
			    	/*********************************加载判断题答案**********************************/
			    		$("#contentScores").text("本次考试得分："+val.scores);//显示试卷总分
			    		var judges = val.judgeIds;
			    		if(judges.length>0){
				    		var judgeAnswer = val.judgeAnswer;//获取判断题 作答答案
				    		var arrjudge = judges.split(",");
				    		var arrAnswer = judgeAnswer.split(",");
				    		for(i=0;i<arrjudge.length;i++){
				    			var testAn = arrjudge[i];//id
				    			var an = $("#"+testAn).text();//div值
				    			if(arrAnswer[i] == "正确" ){//判断作答内容的选项
				    				$("#"+testAn+"_z").attr("checked","checked");
				    			}else{
				    				$("#"+testAn+"_f").attr("checked","checked");
				    			}
				    			if(arrAnswer[i]==an.substring(5) ){//判断试卷答案和作答答案是否匹配
				    				$("#"+testAn).css("color","blue");//作答正确 蓝色显示
				    			}
				    		}
			    		}
			    		/*******************************加载单选题答案*********************************/
			    		var singles = val.singleIds;
			    		if(singles.length>0){//判断单选题是否作答
				    		var singleAnswer = val.singleAnswer;//试卷答案
				    		var arrsingle = singles.split(",");
				    		var singleAnswers = singleAnswer.split(",");
				    		for(i=0;i<arrsingle.length;i++){
				    			var singleAn = arrsingle[i];//id
				    			var singleText = $("#"+singleAn).text();//div值
				    			if(singleAnswers[i] == "A"){//判断选项
				    				$("#"+singleAn+"_a").attr("checked","checked");
				    			}else if(singleAnswers[i] == "B"){
				    				$("#"+singleAn+"_b").attr("checked","checked");
				    			}else if(singleAnswers[i] == "C"){
				    				$("#"+singleAn+"_c").attr("checked","checked");
				    			}else if(singleAnswers[i] == "D"){
				    				$("#"+singleAn+"_d").attr("checked","checked");
				    			}
				    			
				    			if(singleAnswers[i]==singleText.substring(5)){////判断试卷答案和作答答案是否匹配
				    				$("#"+singleAn).css("color","blue");//作答正确 蓝色显示
				    			}
				    		}
			    		}
			    		/********************************加载多选题答案*********************************/
			    		var manys = val.manyIds;
			    		if(manys.length>0){
				    		var manyAnswer = val.manyAnswer;
				    		var arrmany = manys.split(",");
				    		var manyAnswers = manyAnswer.split(",");
				    		for(i=0;i<arrmany.length;i++){
				    			var manyAn = arrmany[i];//id
				    			var an = $("#"+manyAn).text();//div值
				    			for(var s=0;s<manyAnswers[i].length;s++){//循环遍历答案
				    				if(manyAnswers[i].substring(s,s+1)){//截取答案
				    					$("#"+manyAn+"_"+(s+1)).attr("checked","checked");//勾选选中项
				    				}
				    			}
				    			if(manyAnswers[i]==an.substring(5) ){
				    				$("#"+manyAn).css("color","blue");//作答正确 蓝色显示
				    			}
				    		}
			    		}
			 		});
 				}
 			});
 	});
 	
 	
</script>
</head>
<body>
<div style="background-color: gray;width: 100%;text-align: center;font-size: 12px">
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
				<tr>
					<td colspan="4" style="text-align: center;"><div id="contentScores" style="border:1px dashed #334455;display: block;color:red;font-weight:bold;font-size:20pt;">本次考试得分：</div></td>
				</tr>
				<td colspan="4">
					<table class="appendTable" style="width:100%;line-height: 50px;"></table>
				</td>
			</table>
		</div>
		</form>
	</div>
</div>
</body>
</html>