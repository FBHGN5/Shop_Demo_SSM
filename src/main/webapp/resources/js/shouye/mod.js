$(function () {
    $("#modpass").click(function () {
        $("#box1").show(300);
   });
    $("#close").click(function () {
        $("#box1").hide(300);
        $("#bg").hide(300);
    });
    $("#but").click(function(){

        var old=document.getElementById('old');
        var a=document.getElementById('new1');
        var b=document.getElementById('new2');
        if(a.value!=b.value)
        {
            $.Pop('两次输入的密码不一致！',{Animation:'layer-rollIn'});

        }
        else if(a==""||b==""||old==""){
            $.Pop('原密码或新密码为空！',{Animation:'layer-rollIn'});
        }
        else{
            $.ajax({
                type: "POST",
                cache: false,
                url: "/shop/mod",
                dataType: "json",
                data: $('#ajax').serialize(),
                // 这里是控制器返回值
                /*result是后台返回值*/
                success: function (result) {
                    if (result == 0) {
                        $.Pop('修改完成！', {Animation: 'layer-rollIn'});
                        setInterval(goto,1500);
                        $("#box1").hide(300);
               }
               else if(result==2)
                    {
                        $.Pop('原密码和新密码不能相同！', {Animation: 'layer-rollIn'});
                    }
                    else{
                        $.Pop('你的原密码输入错误！', {Animation: 'layer-rollIn'});
                    }
                },
                error: function(request) {
                    $.Pop('请先登录！',{Animation:'layer-rollIn'});
                }
            });

        }
    });
    function  goto() {
        window.location.href="/shop/login";
  }
});