<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>中文首字母排序</title>
  <script type="text/javascript">
         $(document).ready(function(){
        		$.ajax({
        			url:"/ym/employee/employeeAction!getAllName?id='0323e293210'",
        			type:"post",
        			success:function(data){
        				var data=eval(data);
        				for(var i=0;i<data.length;i++ ){
        				
            					$("#message").html("fdfd");
            				}
        			}
        		});
        		

             })


    </script>

</head>

<body>
<div class="content">
	<div class="name_card">
		<dl class="name clearfix">
			<dd>
				<p>
					<a href="http://www.jsfoot.com/">微博搞笑排行榜</a>
					<span>( <a href="javascript:;">设置备注</a> )</span>
				</p>
				<p class="address">广东 广州 </p>
				<div>
					<ul class="userdata clearfix">
						<li><a href="http://www.jsfoot.com/">关注</a> 1095</li>
						<li class="W_vline">|</li>
						<li><a href="http://www.jsfoot.com/">粉丝</a> 963万</li>
						<li class="W_vline">|</li>
						<li><a href="http://www.jsfoot.com/">微博</a> 63514</li>
					</ul>
				</div>
			</dd>
		</dl>
		<dl class="info clearfix">
			<dt>简介：</dt>
			<dd>微博搞笑中心！每天搜罗最搞笑最好玩的微博。关注我，获得每日新鲜笑料...</dd>
			<dd>
				<ul class="clearfix">
					<li class="honour"><a href="http://www.jsfoot.com/"><img width="24" height="24" alt="身强体硕" src="http://img.t.sinajs.cn/t4/style/images/medal/543_s.gif" /></a></li>
					<li class="honour"><a href="http://www.jsfoot.com/"><img width="24" height="24" alt="微身份" src="http://img.t.sinajs.cn/t4/style/images/medal/433_s.gif" /></a></li>
					<li class="honour"><a href="http://www.jsfoot.com/"><img width="24" height="24" alt="舌战群儒" src="http://img.t.sinajs.cn/t4/style/images/medal/101_s.gif" /></a></li>
					<li class="honour"><a href="http://www.jsfoot.com/"><img width="24" height="24" alt="微博控" src="http://img.t.sinajs.cn/t4/style/images/medal/297_s.gif" /></a></li>
					<li class="honour"><a href="http://www.jsfoot.com/"><img width="24" height="24" alt="语惊四座" src="http://img.t.sinajs.cn/t4/style/images/medal/98_s.gif" /></a></li>
					<li class="honour"><a href="http://www.jsfoot.com/"><img width="24" height="24" alt="谈笑风生" src="http://img.t.sinajs.cn/t4/style/images/medal/8_s.gif" /></a></li>
				</ul>
			</dd>
		</dl>
		<div class="links clearfix">
			<p>
				<span class="W_chat_stat W_chat_stat_online"></span>
				<a href="javascript:;">聊天</a>
				<span class="W_vline">|</span>
				<span><a href="javascript:void(0);">求关注</a></span>
				<span class="W_vline">|</span>
				<span><a href="javascript:;">设置分组</a></span>
			</p>
			<div class="W_btn_c">
				已关注
				<em class="W_vline">|</em>
				<a class="W_linkb" href="javascript:;"><em>取消</em></a>
			</div>
		</div>
	</div>
</div>
		<div id="message">
		</div>
</body>
</html>