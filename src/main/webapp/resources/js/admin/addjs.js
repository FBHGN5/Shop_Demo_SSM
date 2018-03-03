function deleteRow(r)
{
    var i=r.parentNode.parentNode.rowIndex;
    document.getElementById('table').deleteRow(i);

}
$(function(){
    $("#buy").click(function () {
       window.document.f.submit();
    });
    $(".fenghao").click(function () {
        var username=$(this).siblings("input").val();
       $(this).parent().siblings(".state").html(1);
        $.post("/shop/userstate",{username:username},function (data) {
            $.Pop('该账户已被封号！',{Animation:'layer-rollIn'});
        });
    });
    $(".jiefeng").click(function () {
        var username=$(this).siblings("input").val();
        $(this).parent().siblings(".state").html(0);
        $.post("/shop/userstate2",{username:username},function (data) {
            $.Pop('该账户已解封！',{Animation:'layer-rollIn'});
        });
    });
    function time(){
        var today=new Date();
        var month=today.getMonth()+1;
var s=today.getFullYear()+"年"+month+"月"+today.getDate()+"日"+"\t星期"+"日一二三四五六".charAt(today.getDay())+"\t"+today.getHours()+"时"+today.getMinutes()+"分"+today.getSeconds()+"秒";
$("#time").text(s);
    }
    $(".submenu li a").click(function(){
        // $(this).animate({left:"10px"});

        if($(this).attr("class")=="add")
        {
            return;
        }
        else{
            $(".submenu li a").removeClass("add");
        $(this).addClass("add");
        if($(this).html()=="用户信息")
        {  $(".container").hide(300);
            $(".list").css("opacity","0");
            $(".list").css("top","-780px");
            $("#usertable").show(300);
        }
        else if($(this).html()=="热卖商品")
        {  $(".container").hide(300);
            $(".list").css("opacity","0");
            $(".list").css("top","-780px");
            $("#hotsale").show(300);
        }
        else if($(this).html()=="购物车")
        {  $(".container").hide(300);
            $(".list").css("opacity","0");
            $(".list").css("top","-780px");
            $("#buycar").show(300);
        }
        else if($(this).html()=="订单信息")
        {  $(".container").hide(300);
            $(".list").css("opacity","0");
            $(".list").css("top","-780px");
            $("#orderlist").show(300);
        }
        else if($(this).html()=="热卖商品图")
        {
            $(".container").hide(300);
            $(".list").css("opacity","0");
            $("#container1").animate({opacity:"1",top:"50px"},400);

        }
        }
    })
    $(".submenu li").mouseenter(function  () {
        $(this).animate({left:"8px"});
    });
    $(".submenu li").mouseleave(function(){
        $(this).animate({left:"0px"});
    });

    $("#search").click(function () {
        var input=$(this).siblings("input").val();
        if(input.length==0)
        {
            $.Pop('请输入信息',{Animation:'layer-rollIn'});
            return;

        }else {
            var username=$("#find").val();
            $.get("/shop/admin", {username:username}, function (data) {
                window.location.href="/shop/admin?username="+username;
            });
        }
    });
    $("#search1").click(function () {
        var input=$(this).siblings("input").val();
        if(input.length==0)
        {
            $.Pop('请输入信息',{Animation:'layer-rollIn'});
            return;

        }else {
            var usernameorder=$("#find1").val();
            $.get("/shop/admin", {usernameorder:usernameorder}, function (data) {
                window.location.href="/shop/admin?usernameorder="+usernameorder;
            });
        }
    });
    // $(".btn.btn-info.aa").click(function () {
    //     var input=$(this).siblings("input").val();
    //     if(input.length==0)
    //     {
    //         $.Pop('请输入信息',{Animation:'layer-rollIn'});
    //         return;
    //
    //     }else {
    //       var username=$("#find").val();
    //      var usernameorder=$("#find1").val();
    //      var i=0;
    //      var j=0;
    //     if(username.length==0)
    //     {
    //         i=0;
    //     }
    //     else{
    //         i=1;
    //     }
    //     if(usernameorder.length==0)
    //     {
    //         j=0;
    //
    //     }
    //     else{
    //         j=1;
    //     }
    //     $.get("/shop/admin", {username:username,usernameorder:usernameorder}, function (data) {
    //         if(i==0&&j==0)
    //         {
    //             return;
    //         }
    //         else if(i==0&&j==1)
    //         {
    //             window.location.href="/shop/admin?usernameorder="+usernameorder;
    //         }
    //         else if(i==1&&j==0)
    //         {
    //             window.location.href="/shop/admin?username="+username;
    //         }
    //        else{
    //             window.location.href="/shop/admin?username="+username+"&usernameorder="+usernameorder;
    //
    //         }
    //
    //     });
    //     }
    // });

    $("#searchall").click(function () {
        var input=$(this).siblings("input").val();
        if(input.length==0)
        {
            return;
        }else{
            window.location.href="/shop/admin?page1=1";
        }
    });
    $("#searchallorder").click(function () {
        var input=$(this).siblings("input").val();
        if(input.length==0)
        {
            return;
        }else{
            window.location.href="/shop/admin?page2=1";
        }
    });
    setInterval(time,10);
});
