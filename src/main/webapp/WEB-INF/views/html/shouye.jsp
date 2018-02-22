<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>首页</title>

<link rel="stylesheet" href="/resources/css/shouye/shouye.css">
<link rel="stylesheet" href="/resources/css/shouye/lunbo.css">
	<link rel="stylesheet" href="/resources/css/shouye/mod.css">
<script src="/resources/js/common/jquery-1.11.1.min.js"></script>
<script src="/resources/js/shouye/lunbo.js"></script>
<script src="/resources/js/shouye/shouye.js"></script>
<script type="text/javascript" src="/resources/js/common/plug-in.js"></script>
<script src="/resources/js/shouye/mod.js"></script>

</head>
<body>
<div id="title">
<div id="wele">欢迎${sessionScope.username}&nbsp;&nbsp;<a href="/shop/login" style="text-decoration:underline;color: red;">${but}</a></div>
<div id="top">
<ul>
<li><a href="#">我的订单</a>|</li>
<li><a href="javascript:void(0)" id="modpass">修改密码</a>|</li>
<li><a href="#">关于我们</a>|</li>
<li><a href="#">网站导航</a>|</li>
<li><a href="#">客户服务</a></li>
</ul>
</div>
</div>
<div id="nav">
<div id="img">
在线购物
</div>
<div id="sc">
<div id="search">
<input id="tex" type="text" placeholder="从你的全世界路过" >
<button>搜索</button>
<div id="book">
<ul>
<li><a href="#">手机</a></li>
<li><a href="#">199减100</a></li>
<li><a href="#">从你的全世界路过</a></li>
<li><a href="#">保温杯</a></li>
<li><a href="#">PHP入门到精通</a></li>
<li><a href="#">中老年女装</a></li>
<li><a href="#">果蔬派对</a></li>
</ul>
</div>
</div>
</div>
<div id="buycar"><img src="/resources/img/buycar01.png" style="position:absolute;top:8px;left:37px;">
    <form action="/shop/buycar" method="post">
        <input type="hidden" name="username" value="${sessionScope.username}">
        <input
        type="submit" value="我的购物车" id="text"></form></div>
</div>
</div>
<div id="zuida">
<div id="box">
<div id="fenlei"><span id="sp">全部商品分类</span>
<div id="kind">
<div id="nav-ul">
<ul class="firs">
<li><span class="wupin"><a href="#">图书</a>、<a href="#">电子书刊</a>、<a href="#">音像</a></span>
<div class="act">
<!-- 分类导航 -->
<div class="lei"><a href="#">生活电器</a></div>
<div class="some">
|<a href="#">取暖电器</a>|
<a href="#">净化器</a>|
<a href="#">加湿器</a>|
<a href="#">吸尘器</a>|
<a href="#">饮水机</a>|
<a href="#">电话机</a>|
<a href="#">取暖电器</a>|
<br>
|<a href="#">插座</a>|
<a href="#">电磁炉</a>|
<a href="#">冰箱</a>|
<a href="#">清洁机</a>|
<a href="#">取暖电器</a>|
</div>
<hr style="width:75%;margin-left:12px;height:1px;border:none;border-top:1px dashed red";>
<div class="lei"><a href="#">生活电器</a></div>
<div class="some">
|<a href="#">取暖电器</a>|
<a href="#">净化器</a>|
<a href="#">加湿器</a>|
<a href="#">吸尘器</a>|
<a href="#">饮水机</a>|
<a href="#">电话机</a>|
<a href="#">取暖电器</a>|
<br>
|<a href="#">插座</a>|
<a href="#">电磁炉</a>|
<a href="#">冰箱</a>|
<a href="#">清洁机</a>|
<a href="#">取暖电器</a>|
</div>
<hr style="width:75%;margin-left:12px;height:1px;border:none;border-top:1px dashed red";>
<div class="lei"><a href="#">生活电器</a></div>
<div class="some">
|<a href="#">取暖电器</a>|
<a href="#">净化器</a>|
<a href="#">加湿器</a>|
<a href="#">吸尘器</a>|
<a href="#">饮水机</a>|
<a href="#">电话机</a>|
<a href="#">取暖电器</a>|
<br>
|<a href="#">插座</a>|
<a href="#">电磁炉</a>|
<a href="#">冰箱</a>|
<a href="#">清洁机</a>|
<a href="#">取暖电器</a>|
</div>
<hr style="width:75%;margin-left:12px;height:1px;border:none;border-top:1px dashed red";>
<div class="lei"><a href="#">生活电器</a></div>
<div class="some">
|<a href="#">取暖电器</a>|
<a href="#">净化器</a>|
<a href="#">加湿器</a>|
<a href="#">吸尘器</a>|
<a href="#">饮水机</a>|
<a href="#">电话机</a>|
<a href="#">取暖电器</a>|
<br>
|<a href="#">插座</a>|
<a href="#">电磁炉</a>|
<a href="#">冰箱</a>|
<a href="#">清洁机</a>|
<a href="#">取暖电器</a>|
</div>
<hr style="width:75%;margin-left:12px;height:1px;border:none;border-top:1px dashed red";>
<div class="lei"><a href="#">生活电器</a></div>
<div class="some">
|<a href="#">取暖电器</a>|
<a href="#">净化器</a>|
<a href="#">加湿器</a>|
<a href="#">吸尘器</a>|
<a href="#">饮水机</a>|
<a href="#">电话机</a>|
<a href="#">取暖电器</a>|
<br>
|<a href="#">插座</a>|
<a href="#">电磁炉</a>|
<a href="#">冰箱</a>|
<a href="#">清洁机</a>|
<a href="#">取暖电器</a>|
</div>
<hr style="width:75%;margin-left:12px;height:1px;border:none;border-top:1px dashed red";>
<div class="lei"><a href="#">生活电器</a></div>
<div class="some">
|<a href="#">取暖电器</a>|
<a href="#">净化器</a>|
<a href="#">加湿器</a>|
<a href="#">吸尘器</a>|
<a href="#">饮水机</a>|
<a href="#">电话机</a>|
<a href="#">取暖电器</a>|
<br>
|<a href="#">插座</a>|
<a href="#">电磁炉</a>|
<a href="#">冰箱</a>|
<a href="#">清洁机</a>|
<a href="#">取暖电器</a>|
</div>
<hr style="width:75%;margin-left:12px;height:1px;border:none;border-top:1px dashed red";>
<div class="lei"><a href="#">生活电器</a></div>
<div class="some">
|<a href="#">取暖电器</a>|
<a href="#">净化器</a>|
<a href="#">加湿器</a>|
<a href="#">吸尘器</a>|
<a href="#">饮水机</a>|
<a href="#">电话机</a>|
<a href="#">取暖电器</a>|
<br>
|<a href="#">插座</a>|
<a href="#">电磁炉</a>|
<a href="#">冰箱</a>|
<a href="#">清洁机</a>|
<a href="#">取暖电器</a>|
</div>
<hr style="width:75%;margin-left:12px;height:1px;border:none;border-top:1px dashed red";>
<div class="pic"><img src="/resources/img/5zhe.jpg" alt="">
<br>
<img src="/resources/img/jiadin.jpg" alt="">
<br>
<img src="/resources/img/butie.jpg" alt="">
<br>
<img src="/resources/img/xinpin.jpg" alt="">
</div>
</div></li>
<li><span class="wupin"><a href="#">图书</a>、<a href="#">电子书刊</a>、<a href="#">音像</a></span>
<div class="act">
<div class="lei"><a href="#">生活电器</a></div>
<div class="some">
|<a href="#">取暖电器</a>|
<a href="#">净化器</a>|
<a href="#">加湿器</a>|
<a href="#">吸尘器</a>|
<a href="#">饮水机</a>|
<a href="#">电话机</a>|
<a href="#">取暖电器</a>|
<br>
|<a href="#">插座</a>|
<a href="#">电磁炉</a>|
<a href="#">冰箱</a>|
<a href="#">清洁机</a>|
<a href="#">取暖电器</a>|
</div>
<hr style="width:75%;margin-left:12px;height:1px;border:none;border-top:1px dashed red";>
<div class="lei"><a href="#">生活电器</a></div>
<div class="some">
|<a href="#">取暖电器</a>|
<a href="#">净化器</a>|
<a href="#">加湿器</a>|
<a href="#">吸尘器</a>|
<a href="#">饮水机</a>|
<a href="#">电话机</a>|
<a href="#">取暖电器</a>|
<br>
|<a href="#">插座</a>|
<a href="#">电磁炉</a>|
<a href="#">冰箱</a>|
<a href="#">清洁机</a>|
<a href="#">取暖电器</a>|
</div>
<hr style="width:75%;margin-left:12px;height:1px;border:none;border-top:1px dashed red";>
<div class="lei"><a href="#">生活电器</a></div>
<div class="some">
|<a href="#">取暖电器</a>|
<a href="#">净化器</a>|
<a href="#">加湿器</a>|
<a href="#">吸尘器</a>|
<a href="#">饮水机</a>|
<a href="#">电话机</a>|
<a href="#">取暖电器</a>|
<br>
|<a href="#">插座</a>|
<a href="#">电磁炉</a>|
<a href="#">冰箱</a>|
<a href="#">清洁机</a>|
<a href="#">取暖电器</a>|
</div>
<hr style="width:75%;margin-left:12px;height:1px;border:none;border-top:1px dashed red";>
<div class="lei"><a href="#">生活电器</a></div>
<div class="some">
|<a href="#">取暖电器</a>|
<a href="#">净化器</a>|
<a href="#">加湿器</a>|
<a href="#">吸尘器</a>|
<a href="#">饮水机</a>|
<a href="#">电话机</a>|
<a href="#">取暖电器</a>|
<br>
|<a href="#">插座</a>|
<a href="#">电磁炉</a>|
<a href="#">冰箱</a>|
<a href="#">清洁机</a>|
<a href="#">取暖电器</a>|
</div>
<hr style="width:75%;margin-left:12px;height:1px;border:none;border-top:1px dashed red";>
<div class="lei"><a href="#">生活电器</a></div>
<div class="some">
|<a href="#">取暖电器</a>|
<a href="#">净化器</a>|
<a href="#">加湿器</a>|
<a href="#">吸尘器</a>|
<a href="#">饮水机</a>|
<a href="#">电话机</a>|
<a href="#">取暖电器</a>|
<br>
|<a href="#">插座</a>|
<a href="#">电磁炉</a>|
<a href="#">冰箱</a>|
<a href="#">清洁机</a>|
<a href="#">取暖电器</a>|
</div>
<hr style="width:75%;margin-left:12px;height:1px;border:none;border-top:1px dashed red";>
<div class="lei"><a href="#">生活电器</a></div>
<div class="some">
|<a href="#">取暖电器</a>|
<a href="#">净化器</a>|
<a href="#">加湿器</a>|
<a href="#">吸尘器</a>|
<a href="#">饮水机</a>|
<a href="#">电话机</a>|
<a href="#">取暖电器</a>|
<br>
|<a href="#">插座</a>|
<a href="#">电磁炉</a>|
<a href="#">冰箱</a>|
<a href="#">清洁机</a>|
<a href="#">取暖电器</a>|
</div>
<hr style="width:75%;margin-left:12px;height:1px;border:none;border-top:1px dashed red";>
<div class="lei"><a href="#">生活电器</a></div>
<div class="some">
|<a href="#">取暖电器</a>|
<a href="#">净化器</a>|
<a href="#">加湿器</a>|
<a href="#">吸尘器</a>|
<a href="#">饮水机</a>|
<a href="#">电话机</a>|
<a href="#">取暖电器</a>|
<br>
|<a href="#">插座</a>|
<a href="#">电磁炉</a>|
<a href="#">冰箱</a>|
<a href="#">清洁机</a>|
<a href="#">取暖电器</a>|
</div>
<hr style="width:75%;margin-left:12px;height:1px;border:none;border-top:1px dashed red";>
</div>
</li>
<li><span class="wupin"><a href="#">图书</a>、<a href="#">电子书刊</a>、<a href="#">音像</a></span></li>
<li><span class="wupin"><a href="#">图书</a>、<a href="#">电子书刊</a>、<a href="#">音像</a></span></li>
<li><span class="wupin"><a href="#">图书</a>、<a href="#">电子书刊</a>、<a href="#">音像</a></span></li>
<li><span class="wupin"><a href="#">图书</a>、<a href="#">电子书刊</a>、<a href="#">音像</a></span></li>
<li><span class="wupin"><a href="#">图书</a>、<a href="#">电子书刊</a>、<a href="#">音像</a></span></li>
<li><span class="wupin"><a href="#">图书</a>、<a href="#">电子书刊</a>、<a href="#">音像</a></span></li>
<li><span class="wupin"><a href="#">图书</a>、<a href="#">电子书刊</a>、<a href="#">音像</a></span></li>
<li><span class="wupin"><a href="#">图书</a>、<a href="#">电子书刊</a>、<a href="#">音像</a></span></li>
<li><span class="wupin"><a href="#">图书</a>、<a href="#">电子书刊</a>、<a href="#">音像</a></span></li>
<li><span class="wupin"><a href="#">图书</a>、<a href="#">电子书刊</a>、<a href="#">音像</a></span></li>
<li><span class="wupin"><a href="#">图书</a>、<a href="#">电子书刊</a>、<a href="#">音像</a></span></li>
<li><span class="wupin"><a href="#">图书</a>、<a href="#">电子书刊</a>、<a href="#">音像</a></span></li>
</ul></div>
</div>
</div>
<div id="other">
<ul>
<li><a href="#">服装城</a></li>
<li><a href="#">团购</a></li>
<li><a href="#">玩家国度</a></li>
<li><a href="#">苏宁易购</a></li>
</ul>
</div>
</div>
<!-- 轮播图 -->
<div class="example">
<div class="ft-carousel" id="lunbo">
<ul class="carousel-inner">
<li class="carousel-item"><a href="#"><img src="/resources/img/lunbo1.jpg" /></a></li>
<li class="carousel-item"><a href="#"><img src="/resources/img/lunbo2.jpg" /></a></li>
<li class="carousel-item"><a href="#"><img src="/resources/img/lunbo3.jpg" /></a></li>
<li class="carousel-item"><a href="#"><img src="/resources/img/lunbo4.jpg" /></a></li>
</ul>
</div>
</div>
<div id="xuanc">
<a href="#"><img src="/resources/img/bijiben.jpg" alt=""></a>
<a href="#"><img src="/resources/img/biji2.jpg" alt=""></a>
</div>
<!-- 图标 -->
<div id="icon">
<div class="tubiao"><div class="pi"><a href="#"><img src="/resources/img/icon1.png" alt=""></a>
<p><a href="#">车险</a></p></div>
</div>
<div class="tubiao" ><div class="pi"><a href="#"><img src="/resources/img/icon2.png" alt=""></a>
<p><a href="#">游戏</a></p></div>
</div>
<div class="tubiao"><div class="pi"><a href="#"><img src="/resources/img/icon3.png" alt=""></a>
<p class="te"><a href="#">火车票</a></p></div>
</div>
<div class="tubiao"><div class="pi"><a href="#"><img src="/resources/img/icon4.png" alt=""></a>
<p><a href="#">酒店</a></p></div>
</div>
<div class="tubiao" ><div class="pi"><a href="#"><img src="/resources/img/icon5.png" alt=""></a>
<p><a href="#">演出</a></p></div>
</div>
<div class="tubiao"><div class="pi"><a href="#"><img src="/resources/img/icon6.png" alt=""></a>
<p class="te"><a href="#">水电媒</a></p></div>
</div>
</div>
    <!-- 用户退出 -->
<div id="rq">
<div id="toux"><img src="/resources/img/touxiang.png" alt=""></div>
<div id="huany">Hi!&nbsp;&nbsp;${sessionScope.username}</div>
<div id="buts">
	<button class="bu"><a href="/shop/login">${but}</a></button>
	<button class="bu"><a href="/shop/register">注册</a></button>
	<button class="bu"><a href="/shop/sale">出售</a></button>
</div>
</div>
<!-- 促销和公告 -->
<div id="xian"><hr></div>
<div id="notice">
<div id="notice-nav">
<ul>
<li class="sc">促销</li>
<li class="ss">今日热门</li>
</ul>
<div id="pinc"><img src="/resources/img/nav-ads.gif" alt=""></div>
</div>
<div id="tab_c">
<div id="tab" class="tab">
<ul>
<li><a href="#">居家开年盛典满199减100</a></li>
<li><a href="#">每日折扣</a></li>
<li><a href="#">快速领券</a></li>
<li><a href="#">新年狂欢</a></li>
<li><a href="#">5折专区</a></li>
<li><a href="#">5折专区2</a></li>
</ul></div>
<div class="tab"><ol>
<li><a href="#">从你的全世界路过</a></li>
<li><a href="#">斗破苍穹</a></li>
<li><a href="#">斗罗大陆</a></li>
<li><a href="#">斗破苍穹1</a></li>
<li><a href="#">斗破苍穹2</a></li>
<li><a href="#">斗破苍穹3</a></li>
</ol></div>
</div>
</div>
</div>
<!-- 商品展示区 -->
<div id="layer">
<div id="sale">
<h3>
热卖单品
</h3>
<div id="J_Sale">
<ul>
<li><a href="#">男睡衣</a></li>
<li><a href="#">睡衣男</a></li>
<li><a href="#">男睡衣</a></li>
<li><a href="#">睡衣男</a></li>
<li><a href="#">男睡衣</a></li>
<li><a href="#">睡衣男</a></li>
<li><a href="#">男睡衣</a></li>
<li><a href="#">睡衣男</a></li>
<li><a href="#">男睡衣</a></li>
<li><a href="#">睡衣男</a></li>
<li><a href="#">男睡衣</a></li>
<li><a href="#">皮带</a></li>
<li><a href="#">男睡衣</a></li>
<li><a href="#">男睡衣</a></li>
<li><a href="#">男睡衣</a></li>
<li><a href="#">男睡衣</a></li>
<li><a href="#">床垫</a></li>
<li><a href="#">睡衣男</a></li>
<li><a href="#">男睡衣</a></li>
<li><a href="#">皮带</a></li>
<li><a href="#">男睡衣</a></li>
</ul>
</div>
</div>
<div class="item">
<ul>
	<c:forEach var="hs" items="${list}">
		<li><div class="item1"><div><a href="/shop/wupin?id=${hs.id}"><img style="width:200px;height:200px;" src="${hs.img}" alt="载入中..."></a></div><div class="ming"><a href="/shop/wupin?id=${hs.id}">${hs.name}</a></div>
			<div class="jiage"><h5>￥</h5><em class="price">${hs.price}</em></div></li>
	</c:forEach>
</div>
</ul>
</div>
</div>
<div id="box1">
<div id="text1">修改密码</div>
	<div id="close">×</div>
	<div id="infor">
		<div id="tab1">
			<form id="ajax">
				<input type="hidden" id="username" name="username" value="${sessionScope.username}">
			<div class="lab"><em class="emr">*</em>原密码：<input id="old" name="old" class="pass" type="password"></div>
			<div class="lab"><em class="emr">*</em>新密码：<input id="new1" class="pass" name="password" type="password"></div>
			<div class="lab"><em class="emr">*</em>请再次输入新密码：<input class="pass" id="new2" type="password"></div>
		</div></form>
	<div><input type="button" id="but" value="提交"></div>
	</div></div>

<script type="text/javascript">
			$("#lunbo ").FtCarousel({
                index: 0,
				auto: true,
				time: 3000,
				buttons: true
			});
</script>
</body>
</html>