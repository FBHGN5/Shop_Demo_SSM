<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="utf-8">
<title>${hotsale.name}</title>
<link rel="stylesheet" href="/resources/css/wupin/wupin.css">
<script src="/resources/js/common/jquery-1.11.1.min.js"></script>
<script src="/resources/js/wupin/wupin.js"></script>
<script src="/resources/js/wupin/buy.js"></script>
    <script src="/resources/js/wupin/add.js"></script>
    <script type="text/javascript" src="/resources/js/common/plug-in.js"></script>
</head>
<body>
<div id="top">
<div id="img">
<a href="/shop/shouye"><img style="position:absolute;top:4px;" src="/resources/img/ReturnFirstPage.png"><span style="position:absolute;left:32px;"><a
        href="/shop/shouye">首页</a></span></a>
</div>
<div id="some">
<ul>
<li><a href="/shop/order">我的订单</a>|</li>
<li><a href="#">关于我们</a>|</li>
<li><a href="#">企业导购</a>|</li>
<li><a href="#">网站导航</a>|</li>
<li><a href="#">客户服务</a></li>
</ul>
</div>
</div>
<div id="pic">
<img src="/resources/img/book.jpg">
</div>
<div id="search">
<input id="tex" type="text" placeholder="斗破苍穹">
<button>搜索</button>
<div id="book">
<ul>
<li><a href="#">斗罗大陆</a></li>
<li><a href="#">斗破苍穹</a></li>
<li><a href="#">夏至未至</a></li>
<li><a href="#">白夜行</a></li>
<li><a href="#">龙族</a></li>
</ul>
</div>
</div>
<div id="buycar"><img src="/resources/img/buycar01.png" style="position:absolute;top:8px;left:20px;"><a href="#"><span id="car">我的购物车</span></a></div>
<hr>
<!-- 商品展示部分 -->
<div id="under">
<div id="container">
<div id="in">
<!-- 放大镜 图片大小必须和容器大小一致-->
<div>
<div id="box">
<div id="picture"><img style="width: 350px;height:350px;" src="${hotsale.wimg}" alt="载入中...">
</div>
<div id="float">
</div>
</div>
<div id="big"><img style="width:800px;height:800px;"  src="${hotsale.bimg}" alt="载入中..."></div>
</div>
<div id="infor">
<div id="name">${hotsale.name}</div>
<div id="sma"><p>价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 格： <strong>￥<i style="font-style: normal" id="price">${hotsale.price}</i></strong></p>
<p>服&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 务： 提供售后服务. 23:00前下单,预计明天(12月31日)送达</p>
<p>增值业务：礼品包装</p></div>
<p>库存数量：<div id="bor">仅剩<em id="cc" style="font-style:normal;">${hotsale.number}</em>件
      </div>
    <p id="shul">数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 量：<div id="leijia"><div id="input"><input type="button" class="but" name="jian" value="-" onclick="dun()" style="cursor: pointer;">
    <input type="text" id="cc1" class="but" value="1">
   <input type="button" class="but" name="zeng" value="+" onclick="rec()" style="cursor: pointer;"></p></div></div>
 <div><input id="add" type="button" value="加入购物车"></div>
 <p id="tishi">温馨提示：
支持7天无理由退货</p>
</div>
</div>
</div>
</div>
<div id="lin">
<hr id="xian" style="width:1200px;position:absolute;top:10px;left:-168px;">	
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
<a href="#">English site</a>
</div>
<input type="hidden" id="username" value="${sessionScope.username}">
<input type="hidden" id="img2" value="${hotsale.buycarimg}">
<input type="hidden" id="id" value="${hotsale.id}">
</body>
</html>