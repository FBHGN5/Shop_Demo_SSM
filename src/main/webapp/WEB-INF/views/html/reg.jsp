<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta charset="utf-8">
	<title>欢迎注册</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/reg/reg.css">
    <script src="/resources/js/common/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="/resources/js/common/plug-in.js"></script>
     <script src="/resources/js/reg/reg.js"></script>
	<script src="/resources/js/reg/time.js"></script>
</head>
<body>
<div id="have">已有账号?请<a href="/shop/login">登录</a></div>
<div id="pic">
	<i>在线购物</i> <span id="welzc">&nbsp;欢迎注册</span>
</div>
<br><br><br><br><br><br>	
<img id="hrr" style="width:1920px;position:absolute;left:0px; " src="/resources/img/hr.png" alt="">
<div id="contain">
	<div id="box">
		<div id="zc"><div class="lab"><label>用&nbsp;&nbsp;户&nbsp;&nbsp;名</label><input type="text" id="us1" class="user" placeholder="您的用户名" >
			<p id="us2" style="position: relative;font-family:'Microsoft YaHei' ;"><img class="IMG" src="/resources/img/zc.png" style="">建议至少使用两种字符组合,不能含有汉字</p></div>
			<div class="lab"><label>设置密码</label><input id="us3" type="password" class="user" placeholder="您的密码">
				<p id="us4" style="position: relative;font-family:'Microsoft YaHei' ;"><img class="IMG"src="/resources/img/zc.png" style="">建议使用大小写字母符号组合</p></div>
				<div class="lab"><label>确认密码</label><input id="us5" type="password" class="user" placeholder="请再次输出密码"></div>
				<p id="us6" style="position:absolute;top:290px;font-family:'Microsoft YaHei' ;"><img class="IMG" src="/resources/img/zc.png" style="">请再次输入密码</p>
				<div class="lab"><label>手&nbsp;&nbsp;机&nbsp;&nbsp号</label><input id="cc" type="text" class="user" placeholder="请输入手机号"></div><p id="us8" style="position:absolute;top:385px;font-family:'Microsoft YaHei' ;"><img class="IMG" src="/resources/img/zc.png" style="">请输入手机号</p>
				 <div class="lab yan"><label>验&nbsp;&nbsp;证&nbsp;&nbsp码</label><input type="text" class="user yan" id="code" placeholder="请输入验证码"><div>
					 <input type="button" id="btn" onclick="sendMessage()" value="获取验证码"></div></div>

			<%--<div id="title">--%>
				<%--</div>--%>
				<%--<div id=cs>--%>
					<%--<em>看不清？换一张</em>--%>
				<%--</div>--%>
				<br>
				<input id="check"  type="button" value="立即注册">
			</div>
		</div>
	</div>
	<div id="link">
		<hr style="width:1300px;position: absolute;left:-200px;">	
		<br>
		<br>
		<a href="#">关于我们|</a>
		<a href="#">联系我们|</a>
		<a href="#">人才招聘|</a>
		<a href="#">广告服务|</a>
		<a href="#">销售联盟|</a>
		<a href="#">卖家专属|</a>
		<a href="#">公益活动|</a>
		<a href="#">商家入驻|</a>
		<a href="#">友情链接|</a>
		<a href="#">English site</a>
	</div>
	</body>
	</html>