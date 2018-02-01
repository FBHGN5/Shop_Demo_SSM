function rec(){
    var aa=document.getElementById("cc1");
    aa.value=parseInt(aa.value)+1;//字符转换成整型
    console.log(aa.value);
}
function dun(){
    var cc=document.getElementById("cc1");
    if(parseInt(cc.value)<=1)
    	{alert("数值不能小于1");}
    else
	{cc.value=parseInt(cc.value)-1;}//字符转换成整型
}