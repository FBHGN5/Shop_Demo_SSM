<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/head.jsp"%>
<html>
<head>
    <meta charset="utf-8">
    <title>我的订单</title>
    <script src="/resources/js/common/jquery-1.11.1.min.js"></script>
    <script type="text/javascript">
        function deleteRow(r)
        {
            var i=r.parentNode.parentNode.rowIndex;
            document.getElementById('table').deleteRow(i);

        }
        $(function () {
            $("#search").click(function () {
                var name=$("#search").siblings("input").val();

                $.get("/shop/order",{name:name},function (data) {
                    window.location.href="/shop/order?name="+name;
                })
            })
        })
    </script>
</head>
<body>
<div class="container">
    <div class="panel panel-info">
        <div class="panel-heading text-center">
            <h3 class="panel-title">面板标题</h3>
        </div>
        <div class="panel-body">
            <div class="search"><input class="setext" type="text" style="width: 300px;" value="${name}">&nbsp;<button id="search" class="btn btn-info">搜索</button></div>
            <table class="table" id="table">
                <thead>
                <tr>
                    <th>商品名</th>
                    <th>总价</th>
                    <th>购买数量</th>
                    <th>创建时间</th>
                    <th>订单编号</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="order" items="${order}">
                    <tr>

                        <td>${order.name}</td>
                        <td>${order.price}</td>
                        <td>${order.number}</td>

                        <td><fmt:formatDate value="${order.creatTime}"   pattern="yyyy-MM-dd HH:mm:ss" type="date" dateStyle="long" /></td>
                        <td>${order.id}</td>
                        <td class="href"><a href="/shop/delorder?id=${order.id}" target="hidden" onclick="if(confirm('确定删除吗?')==false)return false;else{deleteRow(this);return true}">删除</a></td>
                    </tr>
                </c:forEach>
                </tbody>
                <a href="/shop/shouye" class="btn btn-danger">返回首页</a>
            </table>

        </div>
    </div>
</div>
</body>
<iframe name="hidden" id="hidden" style="display:none"></iframe>
</html></html>
