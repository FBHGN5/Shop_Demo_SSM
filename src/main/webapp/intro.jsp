<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>在线购物</title>
    <link rel="stylesheet" href="/resources/css/intro/intro.css">

    <script src="/resources/js/common/jquery-1.11.1.min.js" charset="utf-8"></script>
    <script src="/resources/js/intro/XSwitch-min.js" charset="utf-8"></script>
    <script src="/resources/js/intro/intro.js"> </script>
</head>
<body>
<!-- 插件基本结构 -->
<div id="container" data-XSwitch>
    <!-- //第一张 -->
    <div class="sections">
        <div class="section" id="section0">
            <div id="deo"><video id="video" src="/resources/img/com.webm"  autoplay="autoplay"  loop></video></div>
            </video>

            <div class="mid">
                <p class="welcome">欢迎加入我们
                <hr>
                <br>
                <br>
                <hr>
                </p>
                </p>
                <p class="lab">
                    <a href="#"><img src="/resources/img/a-bg.png" >&nbsp;商家须知</a>
                    <a href="#"><img src="/resources/img/a-bg.png" >&nbsp;关于我们</a>
                    <a href="#"><img src="/resources/img/a-bg.png" >&nbsp;销售联盟</a>
                    <a href="#"><img src="/resources/img/a-bg.png" >&nbsp;卖家专属</a>
                </p>
            </div>
        </div>
        <!-- 第二张 -->
        <div class="section" id="section1">
            <div id="sec1" class="zc">
                <p class="zc1">立即注册</p>
                <hr>
                <br>
                <br>
                <hr>
                <a href="javascript:void(0)"><img src="/resources/img/a-bg.png" >&nbsp;注册商家</a>
                <a href="/shop/register"><img src="/resources/img/a-bg.png" >&nbsp;注册用户</a>
            </div>
        </div>
        <!-- 第三张 -->
        <div  class="section" id="section2">
            <div id="vid"><video id="video1" src="/resources/img/phone.webm"  autoplay="autoplay"  muted loop></video></div>
            <div id="sec2" class="zc" >
                <p class="zc1">联系我们</p>
                <hr>
                <br>
                <br>
                <hr>
                <a href="javascript:void(0)"><img src="/resources/img/a-bg.png" >&nbsp;在线客服</a>
                <a href="javascript:void(0)"><img src="/resources/img/a-bg.png" >&nbsp;意见反馈</a>
            </div>
        </div>
        <!-- 第四张 -->
        <div  class="section" id="section3">
            <div id="login">
                <p class="zc1">登陆账号</p>
                <hr>
                <br>
                <br>
                <hr>
                <a href="/shop/login"><img src="/resources/img/a-bg.png" >&nbsp;用户登陆</a>
                <a href="/shop/login"><img src="/resources/img/a-bg.png" >&nbsp;卖家登陆</a>
                <a href="/shop/login"><img src="/resources/img/a-bg.png" >&nbsp;管理员登陆</a>
            </div>
        </div>

    </div>
    <div id="title">
        <dd>
            <li><a href="javascript:void(0)">关于我们</a></li>
            <li><a href="javascript:void(0)">意见反馈</a>|</li>
            <li><a href="/shop/register">注册用户</a>|</li><!-- 不关闭上一网页 -->
            <li><a href="/shop/shouye">购物首页</a>|</li>
        </dd>
    </div>
</body>
</html>



