<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<%
	String departmentf = request.getParameter("departmentf");
	String departments = request.getParameter("departments");
	if(departmentf == null){
		departmentf = "";
	}
	if(departments == null){
		departments = "";
	}
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>人员日常状态</title>
	<link rel="stylesheet" rel="stylesheet" href="${ctx}/css/newCrud.css" />
	<link type="text/css" rel="stylesheet" 	href="${ctx}/css/powerFloat.css" />
	<link type="text/css" rel="stylesheet" 	href="${ctx}/css/xmenu.css" />
	<style type="text/css">
		a { color:#039;text-decoration: none; }
		a:hover { color:#06C; }
		pre.sh_sourceCode { color: #000000; font-weight: normal; font-style: normal; }
		pre.sh_sourceCode .sh_keyword { color: #009; font-weight: bold; font-style: normal; }
		pre.sh_sourceCode .sh_type { color: #0000ff; font-weight: normal; font-style: normal; }
		pre.sh_sourceCode .sh_string { color: #00F; font-weight: normal; font-style: normal; }
		pre.sh_sourceCode .sh_regexp { color: #060; font-weight: normal; font-style: normal; }
		pre.sh_sourceCode .sh_specialchar { color: #C42DA8; font-weight: normal; font-style: normal; }
		pre.sh_sourceCode .sh_comment { color: #999; font-weight: normal; font-style: italic; }
		pre.sh_sourceCode .sh_number { color: #F00; font-weight: normal; font-style: normal; }
		pre.sh_sourceCode .sh_preproc { color: #00b800; font-weight: normal; font-style: normal; }
		pre.sh_sourceCode .sh_symbol { color: #009; font-weight: bold; font-style: normal; }
		pre.sh_sourceCode .sh_function { color: #000; font-weight: normal; font-style: normal; }
		pre.sh_sourceCode .sh_cbracket { color: #009; font-weight: bold; font-style: normal; }
		pre.sh_sourceCode .sh_url { color: #ff0000; font-weight: normal; font-style: normal; }
		pre.sh_sourceCode .sh_date { color: #0000ff; font-weight: bold; font-style: normal; }
		pre.sh_sourceCode .sh_time { color: #0000ff; font-weight: bold; font-style: normal; }
		pre.sh_sourceCode .sh_file { color: #0000ff; font-weight: bold; font-style: normal; }
		pre.sh_sourceCode .sh_ip { color: #ff0000; font-weight: normal; font-style: normal; }
		pre.sh_sourceCode .sh_name { color: #ff0000; font-weight: normal; font-style: normal; }
		pre.sh_sourceCode .sh_variable { color: #ec7f15; font-weight: normal; font-style: normal; }
		pre.sh_sourceCode .sh_oldfile { color: #C42DA8; font-weight: normal; font-style: normal; }
		pre.sh_sourceCode .sh_newfile { color: #ff0000; font-weight: normal; font-style: normal; }
		pre.sh_sourceCode .sh_difflines { color: #0000ff; font-weight: bold; font-style: normal; }
		pre.sh_sourceCode .sh_selector { color: #ec7f15; font-weight: normal; font-style: normal; }
		pre.sh_sourceCode .sh_property { color: #0000ff; font-weight: bold; font-style: normal; }
		pre.sh_sourceCode .sh_value { color: #ff0000; font-weight: normal; font-style: normal; }
		pre.sh_sourceCode .sh_predef_var { color: #909; font-weight: normal; font-style: normal; }
		pre.sh_sourceCode .sh_predef_func { color: #099; font-weight: normal; font-style: normal; }
		.emp{display:block;}
	</style>
</head>
<body>
	<!-- 弹出下拉框 -->		
    <div class="panel-header" style="width:100%;">
		<div class="panel-title panel-with-icon">人员日常状态列表</div>
		<div class="panel-icon icon-edit"></div>
		<div class="panel-tool"></div>
	</div>
	<div class="datagrid-toolbar" id = "tb" style="padding-left:0px; height:10px;">
		<div>
	    	<form id="searchForm" method="post" style="display: inline;">
	            <div style="margin-top:-8px;">	            
		            &nbsp;&nbsp;被谈话人工号:&nbsp;&nbsp;<input type="text" name="dailyStatus.employeeName" style="width: 120px;" id="employee.jobnum"/>
					<!--&nbsp;&nbsp;谈话人:&nbsp;&nbsp;<input type="text" name="dailyStatus.speaker" style="width: 120px;" />  -->
					&nbsp;&nbsp;时间:&nbsp;&nbsp;<input type="text" name="dailyStatus.time" class="easyui-my97 easyui-validatebox" data-options="readOnly:true" style="width: 120px;"/>
					&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="crud.search();">查询</a>
					&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="advancedsearch()">高级查询</a>
					&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-clear" onclick="crud.clearSearch();">清空</a>
	            </div>
	        </form>
	    </div>
    </div>
    <div class="search_add">
		<shiro:hasPermission name="48:add">
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add', plain:true" onclick="crud.add();javascript:replaceSpan();">添加</a>
		</shiro:hasPermission>
		<shiro:hasPermission name="48:delete">		
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove', plain:true" onclick="crud.remove();">删除</a>
		</shiro:hasPermission>
    </div>
	<div style="height:74%;">
	    <table id="data_list" style="display:none">
	        <thead>
	        	<tr>
			        <th align="center" field="jobNum" width="80" formatter="gridFormatterLength" >被谈话人工号</th>
			        <th align="center" field="name" width="80" formatter="gridFormatterLength" >被谈话人</th>
			        <th align="center" field="major" width="80" formatter="gridFormatterLength" >专业</th>
		        	<th align="center" field="post" width="80" formatter="gridFormatterLength" >岗位</th>
			        <th align="center" field="done" width="120" formatter="gridFormatters" >所属部门</th>
			        <th align="center" field="time" width="80" formatter="gridFormatterLength" >时间</th>
		            <th align="center" field="address" width="100" formatter="gridFormatterLength" >地点</th>
		            <th align="center" field="speaker" width="80" formatter="gridFormatterLength" >谈话人</th> 
		            <th align="center" field="id" width="80" formatter="gridFormatter">操作</th> 
	            </tr>     
	        </thead>
	    </table>
	</div>
	
	<!-- 添加更新窗口 -->
	<div style="display: none;">
		<div id="addForm" style="width: 1426px; height: 608px;" data-options="iconCls:'icon-save',modal:true,maximized:true,collapsible:true,draggable:false">
			<form method="post" >
	    	<input type="hidden" name="dailyStatus.id"/>
	    	<input type="hidden" name="dailyStatus.employeeid"/>
		    <div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;" cellspacing="1"  border="0" bgcolor="#aed0ea" width="95%">					
					<tr>
						<td class="table_nemu_new">时间:</td>
						<td class="table_con">
						<input type="text" class="easyui-my97 easyui-validatebox" data-options="required:true,readOnly:true" name="dailyStatus.time" />
						</td>
					
						<td class="table_nemu_new">地点:</td>
						<td class="table_con">
						<input type="text" class="easyui-validatebox" name="dailyStatus.address"
						data-options="validType:'maxByteLength[100]'" />
						</td>
					</tr>									
				  	<tr>
						<td class="table_nemu_new"  width="15%">员工工号</td>
						<td class="table_con" width="35%">
							<div  style="float: left;" width="25%"><input type="text" class="easyui-validatebox" name="dailyStatus.jobNum" disabled/></div>
							<div class="emp" style="float:left;" width="25%"><input type="button" value="单击选择" onclick="eSelect.open()" /></div>						
						</td>	
						<td class="table_nemu_new" width="15%">所在部门</td>
						<td class="table_con" width="35%">
							<input type="text" class="easyui-validatebox" name="dailyStatus.done" disabled style="width:100px"/>
							-
							<input type="text" class="easyui-validatebox" name="dailyStatus.dtwo" disabled style="width:100px"/>
						</td>					
					</tr>					
					<tr>
						<td class="table_nemu_new">员工名称</td>
						<td class="table_con">
							<input type="text" class="easyui-validatebox" name="dailyStatus.name" id="employeeName" disabled/>
						</td>
						<td class="table_nemu_new">专业</td>
						<td class="table_con">
							<input type="text" class="easyui-validatebox" name="dailyStatus.major" disabled />
						</td>						
					</tr>					
					<tr>
						<td class="table_nemu_new">岗位</td>
						<td class="table_con">
							<input type="text" class="easyui-validatebox" name="dailyStatus.post" disabled/>
						</td>				
						<td class="table_nemu_new">谈话人:</td>
						
                        <td class="table_con" >
                 			<input type="text" class="easyui-validatebox" name="dailyStatus.speaker"
								data-options="validType:'maxByteLength[100]',required: true" />
                        </td>	
					</tr>
						
					<tr>
						<td class="table_nemu_new">不放心人员类型:</td>
						<td class="table_con" colspan="3">
							<div id="main">	
								<div id="lead" class="card">			
									<div class="topnav">
										<a id="selectpos" href="javascript:void(0);" class="as">
											<span id="xzry">选择人员类别</span>			
										</a>	
										<input type="hidden" class="easyui-validatebox" name="dailyStatus.personType" id="selectposhidden" data-options="validType:'maxByteLength[100]'" />			
									</div>	
								</div>							
							</div>
		                    <div id="m1" class="xmenu" style="display: none;width:400px;height:250px; overflow-y:scroll; ">
								<div class="select-info">	
									<label class="top-label">人员类别：</label>
									<ul></ul>
									<a name="menu-confirm" href="javascript:void(0);" class="a-btn">
										<span class="a-btn-text">确定</span>
									</a>									
								</div>			
								<dl>
								<dt class="open">第一类：初到岗位的陌生人</dt>
								<dd>       
									<ul>
										<li rel="1" >(1)刚到参加工作的人</li>
										<li rel="2" >(2)变了单位的</li>
										<li rel="3" >(3)变了工种的</li>
										<li rel="4" >(4)变了岗位的</li>
									</ul>						
								</dd>
								<dt class="open">第二类：劳累困乏的疲惫人</dt>
								<dd>       
									<ul>
										<li rel="5" >(5)年老体弱的</li>
										<li rel="6" >(6)加班连点的</li>
										<li rel="7" >(7)工作岗位特别累的</li>
										<li rel="8" >(8)家务特别多，休息不好的</li>
									</ul>						
								</dd>
								<dt class="open">第三类：家遇大事的异常人</dt>
								<dd>       
									<ul>
										<li rel="9" >(9)结婚办事的</li>
										<li rel="10">(10)妻子生小孩的</li>
										<li rel="11" >(11)家中有丧事的</li>
										<li rel="12" >(12)加有重病、急病的</li>
										<li rel="13" >(13)买房搬家的</li>
										<li rel="14" >(14)经商的</li>
										<li rel="15" >(15)孩子考上学校，需要缴纳较大数额学费的</li>
										<li rel="16" >(16)孩子参加中考、高考的</li>
										<li rel="17" >(17)孩子学校毕业或当兵专业，需要排工作的</li>
										<li rel="18" >(18)加遇其他情况，遭受损失的</li>
									</ul>						
								</dd>											
								<dt class="open">第四类：困苦焦虑的愁楚人</dt>
								<dd>       
									<ul>
										<li rel="19">(19)家庭贫穷的</li>
										<li rel="20">(20)家庭不和睦闹矛盾的</li>
										<li rel="21" >(21)社会上遇事的</li>
										<li rel="22" >(22)工作任务压力大的</li>
										<li rel="23" >(23)工作不顺心的</li>
										<li rel="24" >(24)家庭负担重的</li>
									</ul>						
								</dd>
								<dt class="open">第五类：憋气窝火的牢骚人</dt>
								<dd>       
									<ul>
										<li rel="25" >(25)受到批评的</li>
										<li rel="26">(26)挨了处罚的</li>
										<li rel="27" >(27)受了处分的</li>
										<li rel="28" >(28)打架生气的</li>
										<li rel="29" >(29)心理不平衡的</li>
										<li rel="30" >(30)看不惯社会现实的</li>
		
									</ul>						
								</dd>
								<dt class="open">第六类：带有伤病的特殊人</dt>
								<dd>       
									<ul>
										<li rel="31" >(31)小病不伤不休息，仍然上班的</li>
										<li rel="32">(32)自身带有残疾的</li>
										<li rel="33" >(33)带有不可治愈的疾病。如：高血压、糖尿病等</li>
										<li rel="34" >(34)精神失常的</li>
									</ul>						
								</dd>
								<dt class="open">第七类：无知、无证的糊涂人</dt>
								<dd>       
									<ul>
										<li rel="35" >(35)本身文化程度不高，但参加培训不认真的</li>
										<li rel="36">(36)忘心比较大的</li>
										<li rel="37" >(37)对于新设备、新工艺、新技术不懂的</li>
										<li rel="38" >(38)无证临时顶替上岗的</li>
										<li rel="39" >(39)不注重自身理论学习的</li>
									</ul>						
								</dd>
								<dt class="open">第八类：冒失莽撞的蛮感人</dt>
								<dd>       
									<ul>
										<li rel="40" >(40)性格急躁的</li>
										<li rel="41">(41)干活马虎的</li>
										<li rel="42" >(42)干活不顾及前后的</li>
										<li rel="43" >(43)遇到问题不分析的</li>
										<li rel="44" >(44)抢时间、赶任务的</li>
									</ul>						
								</dd>
								<dt class="open">第九类：侥幸麻痹的疏忽人</dt>
							    <dd>       
									<ul>
										<li rel="45" >(45)看惯了、习惯了、干惯了的</li>
										<li rel="46">(46)凭运气，偷工减料图省事、省劲儿的</li>
										<li rel="47" >(47)对危险坏境无所谓的</li>
								    </ul>						
								</dd>
								<dt class="open">第十类：固执、骄傲的逞能人</dt>
							    <dd>       
									<ul>
										<li rel="48" >(48)固执不听劝的</li>
										<li rel="49">(49)爱钻牛角的</li>
										<li rel="50" >(50)危险情况下露一手的</li>
										<li rel="51" >(51)骄傲、狂妄、自以为是的</li>
									</ul>						
								</dd>
								<dt class="open">第十一类：饮酒贪玩的萎靡人</dt>
							    <dd>       
									<ul>
										<li rel="52" >(52)爱喝酒的</li>
										<li rel="53">(53)爱上网的</li>
										<li rel="54" >(54)爱赌博的</li>
										<li rel="55" >(55)爱睡觉的</li>
									</ul>						
								</dd>
								<dt class="open">第十二类：对于监管的失控人</dt>
						      		<dd>       
										<ul>
											<li rel="56" >(56)单人单岗的</li>
											<li rel="57">(57)边远地区的零散人员</li>
											<li rel="58" >(58)单独去处理故障的</li>
											<li rel="59" >(59)迟到早退的</li>
											<li rel="60" >(60)外键队务工人员</li>
										</ul>						
									</dd>
								</dl>			
							</div>
						</td>						
					</tr>
					<tr>
					    <td class="table_nemu_new">谈话事由:</td>
						<td class="table_con" colspan="3">
						<textarea type="text" class="easyui-validatebox" name="dailyStatus.talkReason" style="width:80%;height:80px;"
						data-options="validType:'maxByteLength[1000]'" ></textarea>
						</td>
					</tr>
					<tr>
						<td class="table_nemu_new">谈话内容:</td>
						<td class="table_con" colspan="3">
						<textarea type="text" class="easyui-validatebox" name="dailyStatus.conversation" style="width:80%;height:80px;"
						data-options="validType:'maxByteLength[1000]'" ></textarea>
						</td>
					
					
					</tr>
					<tr>
					   	<td class="table_nemu_new">谈话效果:</td>
						<td class="table_con" colspan="3">
						<textarea type="text" class="easyui-validatebox" name="dailyStatus.effect" style="width:80%;height:80px;"
						data-options="validType:'maxByteLength[1000]'" ></textarea>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
	</div>
	
	<!-- 查看的DIV -->
	<div style="display: none;">
		<div style="padding: 10px 20px 10px 20px;" align="center" name="addDiv" id="viewForm" data-options="iconCls:'icon-save',modal:true,maximized:true,collapsible:true,draggable:false">
				<table id="detailTable" cellpadding="5px" style="font-size:12px;" cellspacing="1" border="0" bgcolor="#aed0ea" width="95%">
					
						<tbody>
						<tr>
							<td class="table_nemu_new" width="25%">时间:</td>
							<td class="table_con" width="25%">
							<span class="addStyle_" name="dailyStatus.time"></span>
							</td>
						
							<td class="table_nemu_new" width="25%">地点:</td>
							<td class="table_con" width="25%">
							<span class="addStyle_" name="dailyStatus.address"></span>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new"  width="25%">员工工号</td>
							<td class="table_con" width="25%">
							<span  name="dailyStatus.jobNum" disabled></span>
							</td>
							<td class="table_nemu_new" width="15%">所在部门</td>
							<td class="table_con" width="35%">
								<span name="dailyStatus.done" disabled></span>
								-
								<span name="dailyStatus.dtwo" disabled></span>
							</td>
						</tr>
					<tr>
						<td class="table_nemu_new">专业</td>
						<td class="table_con">
						<span  name="dailyStatus.major" disabled ></span>
						</td>
					
						<td class="table_nemu_new">岗位</td>
						<td class="table_con">
						<span  name="dailyStatus.post" disabled></span>
						</td>
					</tr>
						<tr>
							<td class="table_nemu_new" width="25%">员工名称</td>
							<td class="table_con" width="25%">
							<span  name="dailyStatus.name" disabled></span>
							</td>
							<td class="table_nemu_new">谈话人:</td>
							
							<td class="table_con">
                               <span  name="dailyStatus.speaker"></span>
							</td>
						</tr>
						
						<tr>
							<td class="table_nemu_new">不放心人员类型:</td>
							<td class="table_con" colspan="3" id="person">
							<div id="lead" class="card">			

				<div class="topnav">
				
					<a id="selectdept" href="javascript:void(0);" class="as">
						<span>查看人员类别</span>
					</a>					
					
				</div>				
			
               <input type="hidden" value="" id="selectdeptidden" />
               <div style="display:none">
               <span class="addStyle_" id="personValue" name="dailyStatus.personType"></span>
               </div>
               

		</div>
			<div id="m2" class="xmenu" style="display: none;width:400px;height:250px; overflow-y:scroll; "  >
			<div class="select-info">	
				<label class="top-label">人员类别：</label>
				<ul>
					
				</ul>
			</div>	
			<dl>
					<dt class="open">第一类：初到岗位的陌生人</dt>
						<dd>       
							<ul>
								<li rel="1" >(1)刚到参加工作的人</li>
								<li rel="2" >(2)变了单位的</li>
								<li rel="3" >(3)变了工种的</li>
								<li rel="4" >(4)变了岗位的</li>
							</ul>						
						</dd>
					<dt class="open">第二类：劳累困乏的疲惫人</dt>
					<dd>       
							<ul>
								<li rel="5" >(5)年老体弱的</li>
								<li rel="6" >(6)加班连点的</li>
								<li rel="7" >(7)工作岗位特别累的</li>
								<li rel="8" >(8)家务特别多，休息不好的</li>
							</ul>						
						</dd>
					<dt class="open">第三类：家遇大事的异常人</dt>
					<dd>       
							<ul>
								<li rel="9" >(9)结婚办事的</li>
								<li rel="10">(10)妻子生小孩的</li>
								<li rel="11" >(11)家中有丧事的</li>
								<li rel="12" >(12)加有重病、急病的</li>
								<li rel="13" >(13)买房搬家的</li>
								<li rel="14" >(14)经商的</li>
								<li rel="15" >(15)孩子考上学校，需要缴纳较大数额学费的</li>
								<li rel="16" >(16)孩子参加中考、高考的</li>
								<li rel="17" >(17)孩子学校毕业或当兵专业，需要排工作的</li>
								<li rel="18" >(18)加遇其他情况，遭受损失的</li>
							</ul>						
						</dd>
								
								<dt class="open">第四类：困苦焦虑的愁楚人</dt>
					<dd>       
							<ul>
								<li rel="19">(19)家庭贫穷的</li>
								<li rel="20">(20)家庭不和睦闹矛盾的</li>
								<li rel="21" >(21)社会上遇事的</li>
								<li rel="22" >(22)工作任务压力大的</li>
								<li rel="23" >(23)工作不顺心的</li>
								<li rel="24" >(24)家庭负担重的</li>
							</ul>						
						</dd>
								<dt class="open">第五类：憋气窝火的牢骚人</dt>
					<dd>       
							<ul>
								<li rel="25" >(25)受到批评的</li>
								<li rel="26">(26)挨了处罚的</li>
								<li rel="27" >(27)受了处分的</li>
								<li rel="28" >(28)打架生气的</li>
								<li rel="29" >(29)心理不平衡的</li>
								<li rel="30" >(30)看不惯社会现实的</li>

							</ul>						
						</dd>
								<dt class="open">第六类：带有伤病的特殊人</dt>
					<dd>       
							<ul>
								<li rel="31" >(31)小病不伤不休息，仍然上班的</li>
								<li rel="32">(32)自身带有残疾的</li>
								<li rel="33" >(33)带有不可治愈的疾病。如：高血压、糖尿病等</li>
								<li rel="34" >(34)精神失常的</li>
							</ul>						
						</dd>
								<dt class="open">第七类：无知、无证的糊涂人</dt>
					<dd>       
							<ul>
								<li rel="35" >(35)本身文化程度不高，但参加培训不认真的</li>
								<li rel="36">(36)忘心比较大的</li>
								<li rel="37" >(37)对于新设备、新工艺、新技术不懂的</li>
								<li rel="38" >(38)无证临时顶替上岗的</li>
								<li rel="39" >(39)不注重自身理论 学习的</li>
							</ul>						
						</dd>
								<dt class="open">第八类：冒失莽撞的蛮感人</dt>
					<dd>       
							<ul>
								<li rel="40" >(40)性格急躁的</li>
								<li rel="41">(41)干活马虎的</li>
								<li rel="42" >(42)干活不顾及前后的</li>
								<li rel="43" >(43)遇到问题不分析的</li>
								<li rel="44" >(44)抢时间、赶任务的</li>
							</ul>						
						</dd>
								<dt class="open">第九类：侥幸麻痹的疏忽人</dt>
					   <dd>       
							<ul>
								<li rel="45" >(45)看惯了、习惯了、干惯了的</li>
								<li rel="46">(46)凭运气，偷工减料图省事、省劲儿的</li>
								<li rel="47" >(47)对危险坏境无所谓的</li>
						    </ul>						
						</dd>
								<dt class="open">第十类：固执、骄傲的逞能人</dt>
					      <dd>       
							<ul>
								<li rel="48" >(48)固执不听劝的</li>
								<li rel="49">(49)爱钻牛角的</li>
								<li rel="50" >(50)危险情况下露一手的</li>
								<li rel="51" >(51)骄傲、狂妄、自以为是的</li>
							</ul>						
						</dd>
						<dt class="open">第十一类：饮酒贪玩的萎靡人</dt>
					      <dd>       
							<ul>
								<li rel="52" >(52)爱喝酒的</li>
								<li rel="53">(53)爱上网的</li>
								<li rel="54" >(54)爱赌博的</li>
								<li rel="55" >(55)爱睡觉的</li>
							</ul>						
						</dd>
						<dt class="open">第十二类：对于监管的失控人</dt>
					      <dd>       
							<ul>
								<li rel="56" >(56)单人单岗的</li>
								<li rel="57">(57)边远地区的零散人员</li>
								<li rel="58" >(58)单独去处理故障的</li>
								<li rel="59" >(59)迟到早退的</li>
								<li rel="60" >(60)外键队务工人员</li>
							</ul>						
						</dd>
				</dl>			
				 
		</div>
							</td>
						</tr>
						<tr>
						    <td class="table_nemu_new" height="80px">谈话事由:</td>
							<td class="table_con" colspan="3" >
							<span class="addStyle_" name="dailyStatus.talkReason"></span>
							</td>
						</tr>
						<tr>
							<td class="table_nemu_new" height="80px">谈话内容:</td>
							<td class="table_con" colspan="3" >
							<span class="addStyle_" name="dailyStatus.conversation"></span>
							</td>
						
						
						</tr>
						<tr>
						   	<td class="table_nemu_new" height="80px">谈话效果:</td>
							<td class="table_con" colspan="3" >
							<span class="addStyle_" name="dailyStatus.effect"></span>
							</td>
						</tr>
				</tbody></table>
			</div>
	</div>
	
	<!-- 弹出层（高级查询） -->
	<div id="advancedsearch" class="easyui-window" style="width: 360px; height: 290px" title="高级查询"
		data-options="modal:true,closed:true,minimizable:false,maximizable:false,resizable:false" align="center">
		<form id="advanced">
			<table style="border:0;padding:5px;width:auto">
				<tr>
					<td style="width:100px">
						<label>员工工号：</label>
					</td>
					<td>
						<input type="text" name="dailyStatus.employeeName" style="width:150px">
					</td>
				</tr>
				<tr>
					<td>
						<label>员工姓名：</label>
					</td>
					<td >
						<input type="text" name="dailyStatus.name" style="width:150px">
					</td>
				</tr>
				<tr>
					<td>
						<label>身份证号：</label>
					</td>
					<td >
						<input type="text" name="dailyStatus.idNumber" style="width:150px">
					</td>
				</tr>
				<tr>
					<td>
						<label>专业：</label>
					</td>
					<td>
						<input class="easyui-combobox" name="dailyStatus.major" id="major" data-options="panelHeight:'200',editable:false,valueField: 'label',textField: 'value'" style="width:150px"/>
					</td>
				</tr>
				<tr>
					<td>
						<label>岗位：</label>
					</td>
					<td>
						<input class="easyui-combobox" name="dailyStatus.post" id="post" data-options="panelHeight:'200',editable:false,valueField: 'label',textField: 'value'" style="width:150px"/>
					</td>
				</tr>
				<tr>
					<td>
						<label>谈话时间：</label>
					</td>
					<td>
						<input type="text" name="dailyStatus.time" class="easyui-my97" style="width:150px"/>
					</td>
				</tr>
				<tr>
					<td>
						<label>谈话人：</label>
					</td>
					<td>
						<input type="text" name="dailyStatus.speaker" style="width:150px"/>
					</td>
				</tr>
			</table>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="submitSearchForm()">确 定</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-back" onclick="crud.clearSearch()">清 空</a>
		</form>
	</div>
	
	<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
	<script type="text/javascript" src="${ctx}/js/jquery-powerFloat-min.js"></script>
	<script type="text/javascript" src="${ctx}/js/jquery-xmenu.js"></script>
	<script type="text/javascript">
			$(document).ready(function () {
				onloadCombobox('${ctx}','zy',$('#employee_major_v'),$('#employee_post_v'),null);
				eSelect = new Select('选择','${ctx}/jsp/safe/EmployeeSelect.jsp'
		   	    		 , null, function(id, jobNum,name,major,post,done,dtwo) {
		   	    		    $('input[name="dailyStatus.employeeid"]').val(id);
		   	    	        $('input[name="dailyStatus.jobNum"]').val(jobNum);
		   	    	        $('#employeeName').val(name);
		   	    	        $('input[name="dailyStatus.major"]').val(major);
		   	    	        $('input[name="dailyStatus.post"]').val(post);
		   	    	     	$('input[name="dailyStatus.done"]').val(done);
			    	        $('input[name="dailyStatus.dtwo"]').val(dtwo);
		   	    });
		   	    //div 全屏选择
				eSelect.selectDialog.dialog({  
					maximized:true
				});
		    grid = new Grid('${ctx}/dailyStatus/dailyStatusAction!list?dailyStatus.done=<%=departmentf%>&dailyStatus.dtwo=<%=departments%>', 'data_list');
		    grid.loadGrid();
			crud = new Crud({
			grid:grid, 
			addFormObject:$('#addForm'), 
			viewFormObject:$('#viewForm'), 
			searchFormObject:$('#searchForm'),
			afterUpdateLoadData:function(){
				$("#xzry").text("查看人员类型");
			},
			afterViewLoadData:function(){
				selectLi();
				crud.params.viewFormObject.find(".emp").remove();
				},
			entityName:'dailyStatus',
			moduleName:'人员日常状态',
			url:'${ctx}/dailyStatus/dailyStatusAction'
				
			});
			//alert(crud.params.viewFormObject.attr('data-options'));
			$("#selectpos").xMenu({
				width :900,
				eventType: "hover", //事件类型 支持focus click hover
				dropmenu:"#m1",//弹出层
				hiddenID : "selectposhidden"//隐藏域ID				
			});	
			$("#selectdept").xMenu({
				width :600, 
				eventType: "hover", //事件类型 支持focus click hover
				dropmenu:"#m2",//弹出层
				hiddenID : "selectdeptidden"//隐藏域ID		
				
			});	
			$('#advancedsearch').window({
		       onBeforeClose:function(){ 
		           crud.params.searchFormObject = $('#searchForm');
		       }
		    });				
		});        
        function gridFormatterLength(value, rowData, rowIndex) {
        	if(value==null || value == '' || value == 'undefined')
        		return '';
    		if(value.length > 25)
    			return value.substring(0, 25) + '...';
    		return value;
    	}
	    function gridFormatters(value, rowData, rowIndex) {
      		return rowData.done+"-"+rowData.dtwo
        }
	    function gridFormatter(value, rowData, rowIndex) {
        	var rowId = rowData.id;
        	var rowName=rowData.craftTypeName;
        	var url = "";
        	<shiro:hasPermission name="48:view">
        	url += "<a title=\"查看\" onclick='crud.view(\""+rowId+"\");' class='btn2'><img src=\"../../images/select.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
        	</shiro:hasPermission>
        	<shiro:hasPermission name="48:update">
        	url += "<a title=\"修改\" onclick='crud.update(\""+rowId+"\");' class='btn2'><img src=\"../../images/update.png\"></a>&nbsp;&nbsp;&nbsp;&nbsp;";
        	</shiro:hasPermission>
        	return url;
        }
        function replaceSpan(){
        	$("#xzry").text("选择人员类别");
        	$("li").removeClass("current");
        	$(".select-info li").remove();
        }
        function selectLi(){
            var temp=$("#personValue").html();
            document.getElementById("selectdeptidden").value =temp;
        } 
        //打开高级查询窗口
		function advancedsearch(){
			$('#advancedsearch').window('open');
			crud.params.searchFormObject = $('#advanced');
		}
		//执行高级查询
		function submitSearchForm(){
			crud.search();
			crud.clearSearch();
			$('#advancedsearch').window('close');
			crud.params.searchFormObject = $('#searchForm');
		}
	</script>
</body>
</html>