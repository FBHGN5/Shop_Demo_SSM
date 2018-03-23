$(document).ready(function(){
  function rec(){
    $("#zc").fadeIn(1000);
    $("#pic").animate({left:"350px"},600); 	
  }
  rec();
  $("#us1").click(function(){
    $("#us2").show();
    $("#us4").hide(1000);
    $("#us6").hide(1000);
    $("#us8").hide(1000);
  });
  $("#us3").click(function(){
    $("#us4").show();
    $("#us2").hide(1000);
    $("#us6").hide(1000);
    $("#us8").hide(1000);
  });
  $("#us5").click(function(){
    var us6=document.getElementById("us6");
    us6.style.color="#CCC";
    us6.innerHTML="<img class='IMG' src='/resources/img/zc.png' />"+"请再次输入密码";
    $("#us6").show();
    $("#us2").hide(1000);
    $("#us4").hide(1000);
    $("#us8").hide(1000);
  });
  $("#cc").click(function(){
    var us3=document.getElementById("us3");
    var us5=document.getElementById("us5");
    var us6=document.getElementById("us6");
    $("#us8").show();
    $("#us2").hide(1000);
    $("#us4").hide(1000);
    if(us3.value!=us5.value)
    {
      us6.style.color="red";   
      us6.innerHTML="<img class='IMG' src='/resources/img/zc.png' />"+"两次输入的密码不一致！！";
      $("#us6").show();
    }
    else{
      $("#us6").hide(1000);
    }
  });
});

window.onload=function(){
  var check=document.getElementById("check");
  check.onclick=function(){
  var text=document.getElementById("code");
console.log(text.value);
  var us3=document.getElementById("us3");
  var us5=document.getElementById("us5");
  var us1=document.getElementById("us1");
  var reg = new RegExp("[\\u4E00-\\u9FFF]+","g");
  if(reg.test(us1.value)){     
 //alert("用户名包含汉字！！");
   $.Pop('用户名不能有非法字符！',{Animation:'layer-shake'});

 }    
 else  if(us3.value!=us5.value)
 {
 // alert("两次输入的密码不一致！！");
     $.Pop('两次输入密码不一致，请重新输入。',{Animation:'layer-shake'});
 }
else if(us1.value==""||us3.value==""||us5.value=="")
  {
      $.Pop('用户名或密码不能为空！',{Animation:'layer-shake'});

  }
  //后台发送请求
else if(text.value==sms)//不区分大小写
{

    $.ajax({
        type: "POST",
        async:true,
        url: "/shop/reg",
        dataType: "json",
        data: {"username": $("#us1").val(), "password": $("#us5").val(),"phone":$("#cc").val()},
        // 这里是控制器返回值
        /*result是后台返回值*/
        success: function (result) {
            if (result["result"] == "fail") {
                $.Pop('该用户名或手机号已注册。', {Animation: 'layer-spread'});

            }
            else {
                $.Pop('恭喜你注册成功！2s后页面自动跳转至登陆。', {Animation: 'layer-rollIn'});
                setInterval(goto,2000);
            }
     },
            error: function(request) {
              $.Pop('发送请求失败！',{Animation:'layer-rollIn'});
            }
     });
}
else{
      $.Pop('验证码输入错误。',{Animation:'layer-shake'});

  }
};
function goto(){
    window.location.href = "/shop/login";
}
    var sms="";
    $("#btn").click(function(){
        var phone=$("#cc").val();
        console.log(phone);
        if(phone!="")
        {
            $.ajax({
                url:"/total/sendSMS",
                type:"POST",
                data:{"phone":phone},
                dataType:"json",
                success:function(result){
                    if(result.status==1){
                        sms=result.data;

                    }
                }
            });

        }

    });

};
