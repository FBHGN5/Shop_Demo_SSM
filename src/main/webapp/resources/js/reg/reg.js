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
  var recdd=document.getElementById("cs");
  function generateBig(){
    var title=document.getElementById("title");
    var ch_big = 'A';
    var str_big = '';
    var ch_small='a';
    var str_small='';
    var j=0;
    var alphabet=[];
    var num=[];
    for(var i=0;i<26;i++){
str_big=String.fromCharCode(ch_big.charCodeAt(0)+i);//生成26个大写字母
str_small=String.fromCharCode(ch_small.charCodeAt(0)+i);//小写
alphabet[j]=str_big;
j++;
alphabet[j]=str_small;
j++;
}
for(var i=0;i<=9;i++)
{
  num[i]=i;
}
var ran=[];
for(i=0;i<=61;i++)
  if(i<=9)
    ran.push(num[i]);
  else
    ran.push(alphabet[i-10]);

var a=Math.floor(Math.random()*ran.length);//Math.random()是0<=x<1的数
var b=Math.floor(Math.random()*ran.length);
var c=Math.floor(Math.random()*ran.length);
var d=Math.floor(Math.random()*ran.length);
title.innerHTML=ran[a]+""+ran[b]+""+ran[c]+""+ran[d];
return 
}
generateBig();
check.onclick=function(){

  var text=document.getElementById("cc");
  var title=document.getElementById("title");
  var us3=document.getElementById("us3");
  var us5=document.getElementById("us5");
  var us1=document.getElementById("us1");
  var reg = new RegExp("[\\u4E00-\\u9FFF]+","g");
  if(reg.test(us1.value)){     
 //alert("用户名包含汉字！！");
   $.Pop('用户名不能有非法字符！',{Animation:'layer-shake'});
      img();
      generateBig();
 }    
 else  if(us3.value!=us5.value)
 {
 // alert("两次输入的密码不一致！！");
     $.Pop('两次输入密码不一致，请重新输入。',{Animation:'layer-shake'});
     img();
     generateBig();

}
else if(us1.value==""||us3.value==""||us5.value=="")
  {
      $.Pop('用户名或密码不能为空！',{Animation:'layer-shake'});
      img();
      generateBig();
  }
  //后台发送请求
else if(text.value.toLowerCase()==title.innerHTML.toLowerCase())//不区分大小写
{
 // alert("输入验证码正确！！！！");
    $.ajax({
        type: "POST",
        async:true,
        url: "/shop/reg",
        dataType: "json",
        data: {"username": $("#us1").val(), "password": $("#us5").val()},
        // 这里是控制器返回值
        /*result是后台返回值*/
        success: function (result) {
            if (result["result"] == "fail") {
                $.Pop('该用户名已注册,请修改。', {Animation: 'layer-spread'});
                img();
                generateBig();
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
  //alert("验证码错误");
  $.Pop('验证码输入错误。',{Animation:'layer-shake'});
  generateBig();
}
}
function goto(){
    window.location.href = "/shop/login";
}
recdd.onclick=function(){
    img();
generateBig();
}
var index=1;
function img() {
    if(index==5)
    {
        index=0;
    }
    var title=document.getElementById("title");
    var  img=["/resources/img/bg01.png","/resources/img/bg02.png","/resources/img/bg03.png","/resources/img/bg04.png","/resources/img/CAP.jpg"];
    // var index=Math.floor(Math.random()*img.length);//0到1随机数不包括1
     var e=img[index];
    title.style.backgroundImage="url("+e+")";
    index++
}
}
