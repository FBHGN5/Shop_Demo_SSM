<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--静态包含1个servlet,动态是2个先head加载再加载本页面--%>
<html>
<head>

	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<script src="/resources/js/common/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="/resources/js/login/check.js"></script>
	<script type="text/javascript" src="/resources/js/common/plug-in.js"></script>
	<title>欢迎登陆</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/login/first.css">
</head>
<form name="f">
	<div id="box">
		<img src="/resources/img/bgt.jpg">

		<div id="user"  style="display:none;"><h2 style="margin: 20px 1px;">&nbsp;用户登录</h2>
			<div id="user1">
				<div id="text"><label for=""><i class="iconfont" title="用户名" style="background-image:url(/resources/img/user.jpg);"></i></label>
					<input type="text" style="width: 260px;height:41px; font-size: 17px;"  name="username"  id="username" class="cn" placeholder="请输入用户名或手机号"></div>
				<div id="noexist" class="common">
					<p id="zh1">用户名不存在，请检查用户名。</p>
				</div>
				<div><label for=""><i class="iconfont" title="密码" style="background-image:url(/resources/img/pwd.png);"></i></label>
					<input type="password" style="width: 260px;height:41px;font-size: 17px;"  id="password"  class="cn" placeholder="请输入登录密码">
				</div>
				<div id="error" class="common">
					<p id="zh2">密码错误,请检查密码。</p>
				</div>
				<br>
				<div><input type="button" value="登陆" class="but" id="check" onclick="check()">
					<input type="button" value="注册" class="but" id="zcuser"></div>
			</div>
			<div id="checkup">
				<strong>请输入4位验证码：</strong><input class="cn" type="text" id="cc" placeholder=" 验证码" style="width: 155px;height: 41px;font-size: 17px;">
				<div id="code" class="common"><p id="zh3">验证码错误</p></div>
				<div id="title">
				</div>
				<div id=cs>
					<em>看不清？换一张</em>
				</div>
			</div>
		</div>
	</div></form>
<div id="link">
	<hr style="width:1300px;position: absolute;left:-237px;">
	<br>
	<a href="#">关于我们</a>|
	<a href="#">联系我们</a>|
	<a href="#">人才招聘</a>|
	<a href="#">广告服务</a>|
	<a href="#">销售联盟</a>|
	<a href="#">卖家专属</a>|
	<a href="#">公益活动</a>|
	<a href="#">商家入驻</a>|
	<a href="#">友情链接</a>|
	<a href="#">English site</a>|
</div>
<div id="pic" style="position:absolute;">在线购物</div>

</body>

</html>