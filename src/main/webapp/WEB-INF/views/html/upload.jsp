<%--
  Created by IntelliJ IDEA.
  User: OUER
  Date: 2018/2/13
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/shop/upload" method="post" enctype="multipart/form-data">
    选择文件:<input type="file" name="file" width="120px">
    <input type="file" name="file" width="120px">
    <input type="file" name="file" width="120px">
    <input type="submit" value="上传">
</form>
<form action="/shop/down" method="get">
    <input type="submit" value="下载">
</form>
</body>
</html>
