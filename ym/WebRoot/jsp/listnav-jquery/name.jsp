<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>中文首字母排序</title>
    <link rel="stylesheet" href="css/listnav.css" type="text/css" media="screen" charset="utf-8" />
    <link rel="stylesheet" href="css/ihwy-2012.css" type="text/css" media="screen" charset="utf-8" />
    <link rel="stylesheet" href="css/reset-min.css" type="text/css" media="screen" charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="${ctx}/css/bus.css"/>
    <style type="text/css">
		*{margin:0;padding:0;list-style-type:none;font-style:normal;}
		a,img{border:0;}
		a,a:visited{color:#5e5e5e; text-decoration:none;}
		a:hover{color:#4183C4;text-decoration:underline;}
		.clearfix:after{content:".";display:block;height:0;clear:both;visibility:hidden;}
		.clearfix{display:inline-table;}/* Hides from IE-mac \*/
		*html .clearfix{height:1%;}
		.clearfix{display:block;}/* End hide from IE-mac */
		*+html .clearfix{min-height:1%;}
		.clear{height:0;overflow:hidden;clear:both;display:block;}
		body{font:12px/180% Arial, Helvetica, sans-serif, "新宋体";}	
		/* demo */
		.demo{width:950px;margin:20px auto;}
		.demo h2{color:#8FD401;font-size:16px;height:40px;text-align:center;}
		.demo p{line-height:22px;margin-bottom:20px;}
		.demo p a{color:#3366cc;margin:0 5px;font-weight:800;font-size:14px;}
		.demo .fl{float:left;}
		.demo img{border:1px solid #555555;margin:5px 15px 0 0;padding:3px;}
		/* demobtn */
		.demobtn{padding:20px 10px 40px 10px;}
		.demobtn a{display:inline-block;height:24px;line-height:24px;font-size:14px;padding:5px 0;text-align:center;width:210px;}
		/* qtip 提示框基础样式 */
		.qtip .qtip-content{padding:10px;overflow:hidden;}
		.qtip .qtip-content .qtip-title,.qtip-cream .qtip-content .qtip-title{background-color:#F0DE7D;}
		.qtip-light .qtip-content .qtip-title{background-color:#f1f1f1;}
		.qtip-dark .qtip-content .qtip-title{background-color:#404040;}
		.qtip-red .qtip-content .qtip-title{background-color:#F28279;}
		.qtip-green .qtip-content .qtip-title{background-color:#B9DB8C;}
		/* name_card */
		.name_card{background:url("http://img.t.sinajs.cn/t5/style/images/common/footer_bg.png?id=1345196970876") no-repeat -230px bottom;_background:none;}
		.name_card .W_vline{color:#999;}
		/* name_card name */
		.name_card .name dt,.name_card .name dd,.name_card .info dt,.name_card .info dd{float:left;display:inline;}
		.name_card .name{padding:20px 20px 10px;zoom:1;}
		.name_card .name dt img{height:50px;display:block;border-radius: 2px;}
		.name_card .name dd{margin:-4px 0 0 10px;line-height:20px;}
		.name_card .name dd span{padding:0 10px 0 0;}
		.name_card .name dd p{width:260px;word-wrap:break-word;}
		.name_card .name dd div{width: 210px}.
		.name_card .name .address img{margin:0 0 0 3px;}
		/* name_card info */
		.name_card .info{margin:0 20px 8px;line-height:18px;width:330px;}
		.name_card .info dd{width:294px;margin-bottom:2px;word-wrap:break-word;}
		.name_card .info dd a{display:inline-block;}
		.name_card .info li.honour{padding-top:5px;float:left;margin-right:10px;height:24px}
		/* name_card links */
		.name_card .links{margin:0;padding:6px 20px 10px;overflow:hidden}
		.name_card .links .W_vline{margin:0 3px;}
		.name_card .links .W_btn_c{float:right;display:inline;}
		.name_card .links p{float:left;display:inline-block;margin-top:4px}
		.name_card .links p .W_chat_stat{display:inline-block;width:7px;height:7px;border-width:1px;border-style:solid;border-radius:2px;overflow:hidden;}
		.name_card .links p .W_chat_stat_online{margin-right:5px;background-color:#8FDC00;border-color:#48C000;}
		/* name_card userdata */
		.name_card .userdata{width:270px}
		.name_card .userdata li{float:left}
		.name_card .userdata li.W_vline{margin:0 8px;}
		.ygview{
		position:fixed;
		}
	</style>

</head>
<body>
    <div id="noticeMSG">
    	<br/><label><br/></label>
    </div>
    <br />
   
    <!--显示字母序的层。注：此层id必需是ul的id+"-nav"-->
    <div id="demoFour-nav" style="padding:5px"></div>
    <!-- 兼容IE6 加clear:both;-->
    <div id="demo4" style="padding:5px">
		<div id="listWrapper">
			<div id="demoFour-nav" class="listNav"></div>	
			<ul id="demoFour" class="demo"></ul>
			<div class="clr"></div>
		</div>
    </div>
    
    <!-- 弹出层（员工信息） -->
	<div id="view" class="easyui-window" style="width: 1100px; height: 450px" title="员工信息"
		data-options="modal:true,closed:true,minimizable:false,maximizable:false,resizable:false" align="center">
		<table class="detailTable" style="width:95%;padding:5px">					
			<tr style="height:35">
				<td class="labelTd">员工号:</td>
				<td class="contentTd">
					<span id="jobNum"></span>
				</td>						
				<td class="labelTd">员工姓名:</td>
				<td class="contentTd">
					<span id="name"></span>
				</td>
				<td class="contentTd" colspan="2" rowspan="4">
					<img src="" id="passport" width="169" height="202"/>
				</td>
			</tr>
			<tr style="height:35">
				<td class="labelTd">性别:</td>
				<td class="contentTd">
					<span id="genderName"></span>
				</td>
				<td class="labelTd">文化程度:</td>
				<td class="contentTd">
					<span id="education"></span>
				</td>						
			</tr>
			<tr style="height:35">
				<td class="labelTd">出生年月:</td>
				<td class="contentTd">
					<span id="dateOfBirth"></span>
				</td>
				<td class="labelTd">身份证号:</td>
				<td class="contentTd">
					<span id="dateOfBirth"></span>
				</td>						
			</tr>
			<tr style="height:35">
				<td class="labelTd">参加工作时间:</td>
				<td class="contentTd">
					<span id="workTime"></span>
				</td>
				<td class="labelTd">调入本单位时间:</td>
				<td class="contentTd">
					<span id="transferTime"></span>
				</td>				
			</tr>
			<tr style="height:35">
				<td class="labelTd" width="12%">所在部门:</td>
				<td class="contentTd" width="25%">
					<span id="doneName"></span>
					<span id="dtwoName"></span>
				</td>
				<td class="labelTd" width="12%">专业:</td>
				<td class="contentTd">
					<span id="majorName"></span>
				</td>			
				<td class="labelTd" width="12%">岗位:</td>
				<td class="contentTd">
					<span id="postName"></span>
				</td>				
			</tr>						
			<tr style="height:35">	
				<td class="labelTd">手机号码:</td>
				<td class="contentTd" >
					<span id="cellPhoneNumber"></span>
				</td>						
				<td class="labelTd">籍贯:</td>
				<td class="contentTd" colspan="3">
					<span id="homeTown"></span>
				</td>
			</tr>
			<tr style="height:35">
				<td class="labelTd">电话号码:</td>
				<td class="contentTd">
					<span id="phoneNumber"></span>
				</td>
				<td class="labelTd">家庭住址:</td>
				<td class="contentTd" colspan="3">
					<span id="homeAddress"></span>
				</td>
			</tr>
		</table>
		<a id="goView">信誉评价</a>
	</div>	
	
	<script type="text/javascript" src="js/jquery.qtip-1.0.0-rc3.js"></script>
    <script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
	<script type="text/javascript" src="${ctx}/js/DataGridUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/CrudUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/SelectUtil.js"></script>
	<script type="text/javascript" src="${ctx}/js/onloadCombobox.js"></script>
   	<script type="text/javascript" src="js/jquery.charfirst.pinyin.js"></script><!--获取中文首字母的函数，需要jQuery支持-->
  	<script type="text/javascript" src="js/jquery.listnav.min-2.1.js"></script><!--ListNav是一个用于创建按字母顺序分类导航的jQuery插件。-->
	<script type="text/javascript">
         $(document).ready(function(){        	
        	 onloadCombobox('${ctx}','zy',$('#employee_major_v'),$('#employee_post_v'),null);
        		$.ajax({
        			url:"/ym/employees/employeesAction!getAllName?employees.done=<%=departmentf%>&employees.dtwo=<%=departments%>",
        			type:"post",
        			success:function(data){
        				var data=eval(data);
        				for(var i=0;i<data.length;i++ ){
            				$("#demoFour").append("<li><a onclick='openView(\"" + data[i].id + "\")'>"+data[i].name+"</a></li>");
                    	}
        				init();
        				//initbox();
        			}        	
        		});
             })
             function init(){
	        	 $('#demoFour').listnav({
	                 includeOther: true,
	                 noMatchText: '没有内容',
	                 prefixes: ['the', 'a']
	             });
             }  
             //弹出 
             function openView(p){
            	 var $win;
            	 $win = $('#view').window({
            	     title: '员工基本信息',
            	     shadow: true,
            	     modal: true,
            	     closed: true,
                     bodyCls:"ygview",
                     top: ($(document).scrollTop()),
                     left:50,
                     width: 900,
                     height: 450,
            	     minimizable: false,
            	     maximizable: false,
            	     collapsible: false
            	 });

             	$('#view').window('open');
             	$.ajax({
        			url:"${ctx}/employees/employeesAction!getById?id="+p,
        			type:"post",
        			success:function(data){
        				var data = eval(data);
        				$.each(data, function(i, v){
            				if(v == null){
                				v="";
                				}
        					$("#view").find('span[id="'+i+'"]').text(v);
        					if(i == 'passport'){
        						$("#passport").attr("src","${ctx}/upload/"+v);
            					}
        				});
        				$('#goView').attr('href','${ctx}/jsp/reputation/reputation.jsp?eid='+p);
        			}        	
        		});
             }     
    </script>
</body>
</html>