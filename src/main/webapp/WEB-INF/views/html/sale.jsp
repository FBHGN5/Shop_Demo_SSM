<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>  
    <title>成为卖家</title>
    <meta charset="utf-8">  
    <script type="text/javascript" src="/resources/js/sale/sale.js"> </script>
    <script src="/resources/js/common/jquery-1.11.1.min.js"></script>
    <script src="/resources/js/common/plug-in.js"></script>
    <style>
.input{
  width:500px;
  height:30px;
}
    </style>
</head>  
<body>
<form action="/shop/ins" method="post" enctype="multipart/form-data">
<input type="hidden" class="input" name="username" value="${sessionScope.username}">

&nbsp;&nbsp;输入商品名:<input class="input" name="name" type="text">
<br>
<br>
&nbsp;输入商品单价:<input class="input" name="price" type="number">
<br>
<br>
&nbsp;输入出售数量:<input class="input" name="number" type="number">
<br>
<br>
请上传3张商品图片:
<br>
<br>
    &nbsp;&nbsp;首页展示图(分辨率200*200): <span id="permitSpan"><input class="input" type="file" name="file"  onchange="checkPerm(this);"></span>
<br>
<br>
    &nbsp;物品页展示图(分辨率350*350): <span id="permitSpan"><input class="input" type="file" name="file" onchange="checkPerm(this);"></span>
<br>
<br>
    物品页放大镜图(分辨率800*800): <span id="permitSpan"><input class="input" type="file" name="file" onchange="checkPerm(this);"></span>
    <br>
    <br>
&nbsp;购物车展示图(分辨率90*90): <span id="permitSpan"><input class="input" type="file" name="file" onchange="checkPerm(this);"></span>
    <br>
    <br>
    <input type="submit" value="提交">
</form>
</body>
</html>

  
  
 