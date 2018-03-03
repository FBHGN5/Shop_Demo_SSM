var j=0;
function scroll() {
    var title = document.title;
    var a=["欢迎","成为","卖家!"];

    for(var i=0;i<a.length;i++)
    { a[i]=a[i]; }
    document.title = a[j];
    j++;
    if(j>=a.length)
    {
        j=0;
    }
}
function checkLast(str){
    var flag=false;
    var ext=str.split('.')[str.split('.').length-1];
    if(ext=='png'||ext=='jpg'||ext=='bmp'||ext=='jpeg'||ext=='gif'){
        flag=true;
    }
    return flag;
}
function checkPerm(obj){
    if(!checkLast(obj.value.toLowerCase())){
        $.Pop('请选择图片!!!',{Animation:'layer-shake'});
        document.getElementById("permitSpan").innerHTML='<input type="file" name="permitFile" size="14" id="permitCheck" onchange="checkPerm(this);">  ';
    }
}
setInterval(scroll,1000);