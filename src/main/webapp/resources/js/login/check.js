$(function() {
function rec(){
    $("#user").fadeIn(1000);
    $("#pic").animate({left:"350px"});
  }
  rec();
    $(".cn").click(function () {
        $("p").hide(200);

    })
    $("#zcuser").click(function () {
        window.location.href="/shop/register";
    })
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

  var a=Math.floor(Math.random()*ran.length);
  var b=Math.floor(Math.random()*ran.length);
  var c=Math.floor(Math.random()*ran.length);
  var d=Math.floor(Math.random()*ran.length);
  title.innerHTML=ran[a]+""+ran[b]+""+ran[c]+""+ran[d];
  }
generateBig();
check.onclick=function(){

$.ajax({
        type: "POST",
        url: "/shop/user",
        dataType: "json",
        data: {"username": $("#username").val(), "password": $("#password").val()},
 // 这里是控制器返回值
/*result是后台返回值*/
success: function (result) {
         if(result==0)
         {
             charcode();
         }
         else if(result==1)
         {
            $("#zh1").show(300);
             generateBig();
             img();
         }
         else if(result==2)
         {
            $("#zh2").show(300);
             generateBig();
             img();

         }
         else if(result==3){
             $.Pop('你的账户已被管理员封停！',{Animation:'layer-rollIn'});
             generateBig();
             img();
          }
         else if(result==-1)
         {
             window.location.href="/shop/admin";
         }
        },
       error: function(request) {
       $.Pop('发送请求失败！',{Animation:'layer-rollIn'});

    }
  });
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
    var  img=["/resources/img/CAP.jpg","/resources/img/bg01.png","/resources/img/bg02.png","/resources/img/bg03.png","/resources/img/bg04.png"];
    // var index=Math.floor(Math.random()*img.length);//0到1随机数不包括1

    var e=img[index];
    title.style.backgroundImage="url("+e+")";
    index++
}
function charcode() {
var text=document.getElementById("cc");
  var title=document.getElementById("title");
  check.value="登陆中..";
if(text.value.toLowerCase()==title.innerHTML.toLowerCase())//不区分大小写
{
  check.value="登陆中..";

window.location.href="/shop/shouye";

}

else{
  //$("#zh3").show(300);
    $.Pop('验证码错误',{Animation:'layer-rollIn'});
    generateBig();
  img();
  check.value="登陆";
}
}
}
