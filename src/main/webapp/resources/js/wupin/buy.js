$(function () {
    $("#add").click(function () {
        var cc=document.getElementById("cc");
        if($("#username").val()=="")
        {
            $.Pop('请先登录！',{Animation:'layerFadeIn'});
            setInterval(go,1000);
            return;
        }
        else if(parseInt($("#cc").html())-parseInt($("#cc1").val())<0)
        {
            $.Pop('库存不足!',{Animation:'layerFadeIn'});
        }

        else if(parseInt($("#cc").html())==0)
        {
            $.Pop('该商品已经卖完,谢谢惠顾!',{Animation:'layerFadeIn'});
            return;
        }
        else{
  $.ajax({
            type: "POST",
            url: "/shop/buy",
            dataType: "json",
            data: {"img": $("#img2").val(),
                "name": $("#name").html(),
                "price":parseInt($("#price").html()),
                "username":$("#username").val(),
                 "id":parseInt($("#id").val()),
                "number":parseInt($("#cc1").val()),
                "kucun":parseInt($("#cc").html())
            },
            // 这里是控制器返回值
            /*result是后台返回值*/
            success: function (result) {
                 $.Pop('该商品已添加到购物车！',{Animation:'layer-spread'});
            },
            error: function(request) {
                $.Pop('发送请求失败！',{Animation:'layer-rollIn'});
            }
        });
        }
    });
    function go() {
        window.location.href="/shop/login";
    }
});