<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>购物车</title>
    <link rel="stylesheet" href="/resources/css/buycar/reset.css">
    <link rel="stylesheet" href="/resources/css/buycar/carts.css">
    <link rel="stylesheet" href="/resources/css/buycar/buycar.css ">
    <script src="/resources/js/common/jquery-1.11.1.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
       $("#clear").click(function () {
                alert("购买成功！")
                window.document.f.action="/shop/clearing";
                window.document.f.submit();

            }) ;

        });
  </script>
</head>

 <div id="all">  <div id="top">
    <div id="ulli"><ul>
      <li><a href="#">客户服务</a>&nbsp;&nbsp;|</li>
      <li><a href="#">网站导航</a>&nbsp;&nbsp;|</li>
      <li><a href="#">企业采购</a>&nbsp;&nbsp;|</li>
      <li><a href="#">关于我们</a>&nbsp;&nbsp;|</li>
      <li><a href="/shop/order">我的订单</a>&nbsp;&nbsp;|</li>
    </ul></div>
    <div id="img">
      <img style="position:absolute;top:4px;" src="/resources/img/ReturnFirstPage.png" alt="">
      <span id="shouye" style="position:absolute;left:22px;"><a href="/shop/shouye">首页</a></span>
    </div>
  </div>
     <!--
 购物车表格 -->
        <section class="cartMain">
        <div class="cartMain_hd">
            <ul class="order_lists cartTop">
                <li class="list_chk">
                    <!--所有商品全选-->
                    <input type="checkbox" id="all" class="whole_check">
                  
                    全选
                </li>
                <li class="list_con">商品信息</li>
                <li class="list_info">商品参数</li>
                <li class="list_price">单价</li>
                <li class="list_amount">数量</li>
                <li class="list_sum">金额</li>
                <li class="list_op">操作</li>
            </ul>
        </div>
<div class="cartBox" >
            <div class="shop_info">
                <div class="all_check" style="display:none">
                    <!--店铺全选-->
                    <input type="checkbox"  class="shopChoice" >
                    
                </div>
               
            </div>

            <div class="order_content">
                <form name="f" method="POST" action="">
    <c:forEach var="list" items="${list}">

        <ul class="order_lists">

                    <li class="list_chk">
                        <input type="checkbox" name="check" value="${list.id}"  class="son_check">
                </li>
                    <li class="list_con">
                        <div class="list_img"><a href="javascript:;"><img src="${list.img}" style="width: 90px;height: 90px;" alt=""></a></div>
                        <div class="list_text"><a href="/shop/wupin?id=${list.hotid}">${list.name}</a>
                            <input type="hidden" name="name" value="${list.name}">
                        </div>
                    </li>
                    <li class="list_info">
                        <p>规格：默认</p>
                        <p>尺寸：16*16*3(cm)</p>
                    </li>
                    <li class="list_price">
                        <p class="price">￥${list.price}</p>
                    </li>
                    <li class="list_amount">
                        <div class="amount_box">
                            <a href="javascript:;" class="reduce reSty">-</a>
                            <input type="text" value="${list.number}" name="number" class="sum">
                            <a href="javascript:;" class="plus">+</a>
                            <input type="hidden" value="${list.kucun}" class="kucun">
                            <div class="kucun"></div>
                        </div>
                    </li>
                    <li class="list_sum">
                        <p class="sum_price">￥${list.price*list.number}</p>
                    </li>
                    <li class="list_op">
                        <p class="del"><a href="javascript:;" class="delBtn">移除商品</a>
                            <input id="sl1" type="hidden" name="id"  value="${list.id}">

                        </p>
                    </li>
                </ul>
                </c:forEach>
                    <div id="delsome"><input id="sub" type="button" value="移除选中商品"></div>
            </div>
    </div>

<!--底部-->
        <div class="bar-wrapper">
            <div class="bar-right">
                <div class="piece">已选商品<strong class="piece_num">0</strong>件</div>
                <div class="totalMoney">共计: <strong class="total_text">0.00</strong></div>
                <div class="calBtn">
                    <a href="javascript:;" id="clear">结算</a>
               </div></div>
            </div>
        </div>

    </section>
    <section class="model_bg"></section>
    <section class="my_model">
        <p class="title">删除宝贝<span class="closeModel">X</span></p>
        <p>您确认要删除该宝贝吗？</p>
        <div class="opBtn"><a href="javascript:;" class="dialog-sure">确定</a><a href="javascript:;" class="dialog-close">关闭</a></div>
    </section>
    <script src="/resources/js/buycar/jquery-1.11.0.min.js"></script>
    <script src="/resources/js/buycar/carts.js"></script>
     <div id="empty">
            <ul>
                <img id="bc" src="/resources/img/bigcar.png">
                <li>购物车内暂时没有商品</li>
                <br>
                <li><a id="bsm" href="/shop/shouye">去购物<</a></li>
              </ul>
         </div>
    <div id="under">
              <div id="fir">
                <div class="fl"><dt class="fir1">购物指南</dt>
                  <dd><a href="#">会员介绍</a></dd>
                  <dd><a href="#">常见问题</a></dd>
                  <dd><a href="#">提交建议</a></dd>
                  <dd><a href="#">生活旅行/团购</a></dd>
                  <dd><a href="#">大家电</a></dd>
                  <dd><a href="#">联系客服</a></dd>
                </div>
                <div class="fl"><dt class="fir2">配送方式</dt>
                  <dd><a href="#">上门自提</a></dd>
                  <dd><a href="#">配送服务查询</a></dd>
                  <dd><a href="#">配送费收取标准</a></dd>
                  <dd><a href="#">配送须知</a></dd>
                  <dd><a href="#">常见问题</a></dd>
                </div>

                <div class="fl"> <dt class="fir3">支付方式</dt>
                  <dd><a href="#">货到付款</a></dd>
                  <dd><a href="#">在线支付</a></dd>
                  <dd><a href="#">联系客服</a></dd>
                  <dd><a href="#">分期付款</a></dd>
                  <dd><a href="#">公司转账</a></dd>
                </div>

                <div class="fl"><dt class="fir4">售后服务</dt>
                  <dd><a href="#">售后政策</a></dd>
                  <dd><a href="#">价格保护</a></dd>
                  <dd><a href="#">退款说明</a></dd>
                  <dd><a href="#">取消订单</a></dd>
                  <dd><a href="#">返修</a></dd>
                </div>

                <div class="fl">
                  <dt class="fir5">特色服务</dt>
                  <dd><a href="#">夺宝</a></dd>
                  <dd><a href="#">DIY装机</a></dd>
                  <dd><a href="#">延保服务</a></dd>
                  <dd><a href="#">会员开通</a></dd>
                  <dd><a href="#">至尊会员</a></dd>
                  <dd><a href="#">商家须知</a></dd>
                </div> </div></div>
           </div>
            </div>
 <input type="hidden" id="del" value="">
<input type="hidden" name="username" value="${sessionScope.username}">
</body>
</html>