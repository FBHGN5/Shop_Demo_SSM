var InterValObj; //timer变量，控制时间
var count = 60; //间隔函数，1秒执行
var curCount;//当前剩余秒数
function sendMessage(){
    console.log("发送验证码");
    if($("#cc").val().length==0)
    {
        $("#us8").show();
        return;
    }
    curCount = count;
    $("#btn").attr("disabled", "true");
    $("#btn").css("font-size", "10px");
    $("#btn").val(curCount + "秒后可重新发送");
    InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次请求后台发送验证码 TODO
}
//timer处理函数
function SetRemainTime() {
    if (curCount == 0) {
        window.clearInterval(InterValObj);//停止计时器
        $("#btn").removeAttr("disabled");//启用按钮
        $("#btn").val("重新发送验证码");
    }
    else {
        curCount--;
        $("#btn").val(curCount + "秒后可重新发送");
    }
}