<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/jqueryhead.jsp" %>
<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title></title>

		<link rel="stylesheet" href="style.css">

		<meta name="viewport" content="width=device-width">

		<script src="//use.typekit.net/vgf3zbf.js"></script>
		<script>try{Typekit.load();}catch(e){}</script>
	</head>
	<body>

		<div class="banner">
			<ul>
				<li style="background-image: url('img/ymwelcom.jpg');">
                       <!-- 
                       <div class="inner">
						<h1>成功的企业首先是所学校</h1>
						<h1>优秀的员工永远都是学生</h1>
					   </div>
					   -->
				</li>

				<li style="background-image: url('img/ymwelcom2.jpg');">

				</li>

			</ul>
		</div>







		<script src="${ctx}/unslider-master/src/unslider.min.js"></script>
		<script>
			if(window.chrome) {
				$('.banner li').css('background-size', '100% 100%');
			}

			$('.banner').unslider({
				arrows: true,
				fluid: true,
				dots: true
			});

			//  Find any element starting with a # in the URL
			//  And listen to any click events it fires
			$('a[href^="#"]').click(function() {
				//  Find the target element
				var target = $($(this).attr('href'));

				//  And get its position
				var pos = target.offset(); // fallback to scrolling to top || {left: 0, top: 0};

				//  jQuery will return false if there's no element
				//  and your code will throw errors if it tries to do .offset().left;
				if(pos) {
					//  Scroll the page
					$('html, body').animate({
						scrollTop: pos.top,
						scrollLeft: pos.left
					}, 1000);
				}

				//  Don't let them visit the url, we'll scroll you there
				return false;
			});

			var GoSquared = {acct: 'GSN-396664-U'};
		</script>
	</body>
</html>
