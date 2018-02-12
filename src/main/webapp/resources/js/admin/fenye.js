$(document).ready(function () {
    /*
    获取地址栏值
     */
    function GetQueryString(name)
    { var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]);
        return null;
    }
    var page= GetQueryString("page");
    var page1= GetQueryString("page1");
    var page2=GetQueryString("page2");
    var username=GetQueryString("username");
    var usernameorder=GetQueryString("usernameorder");
    var flag=false;
    var i=1;
    if(username==null)
    {
       flag=false;
    }
    else {
        flag=true;
    }
    if(usernameorder==null){
        i=1;
    }
    else{
        i=0;
    }
    /*
    让页面调到管理员点击的状态
     */
    if((page==null&&page2==null)&&page1!=null||flag==true)
    {   $(".submenu li a").removeClass("add");
        $("#car").addClass("add");
        $(".container").css("display","none");
        $("#buycar").css("display","block");
    }
    else if(page==null&&page1==null&&page2!=null||i==0)
    {   $(".submenu li a").removeClass("add");
        $("#ord").addClass("add");
        $(".container").css("display","none");
        $("#orderlist").css("display","block");
    }
    else if(page1==null&&page2==null&&page!=null)
    {   $(".submenu li a").removeClass("add");
        $("#hot").addClass("add");
        $(".container").css("display","none");
        $("#hotsale").css("display","block");
    }
})