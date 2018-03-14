<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html style="height: 100%">
<head>
	<meta charset="utf-8"> 
	<meta name="viewport" content="width=device-width, initial-scale=1">
   <title>在线购物管理系统</title>
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
		<link href="/resources/css/admin/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/resources/css/admin/css/style.css" media="screen" type="text/css" />
    <link rel="stylesheet" href="/resources/css/admin/css/addcss.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="/resources/js/common/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/resources/js/common/plug-in.js"></script>
	<script src="/resources/js/admin/index.js"></script>
    <%--后台脚本--%>
    <script src="/resources/js/admin/addjs.js"></script>
  <script type="text/javascript" src="/resources/js/admin/fenye.js"></script>

  </head>
	<body style="height: 100%; margin: 0">
		<div id="timenow">
<div id="text1" class="tim">当前时间:</div><div class="tim" id="time"></div></div>
		<div id="box">
			<div id="bg"></div>
			<div id="pic">
				<div id="img"><img src="/resources/img/touxianga.png">
				</div>
				<div id="text">${sessionScope.username}管理员</div>
			</div>
			<div id="panel">
				<ul id="accordion" class="accordion">
					<li class="open">
						<div class="link"><i class="fa fa-paint-brush"></i>数据库<i class="fa fa-chevron-down"></i></div>
						<ul class="submenu mysql">
							<li><a  class="add" href="javascript:void(0)">用户信息</a></li>
							 <li><a id="hot" href="javascript:void(0)">热卖商品</a></li>
							<li><a id="car" href="javascript:void(0)">购物车</a></li>
							<li><a id="ord" href="javascript:void(0)">订单信息</a></li>
						</ul>
					</li>
					<li class="open">
						<div class="link"><i class="fa fa-code"></i>统计图<i class="fa fa-chevron-down"></i></div>
						<ul class="submenu aa">
							<li><a href="javascript:void(0)">热卖商品图</a></li>
							<li><a href="javascript:void(0)">注册用户图</a></li>
							<li><a href="javascript:void(0)">问卷调查</a></li>
						</ul>
					</li>
					<li>
						<div class="link"><i class="fa fa-mobile"></i>意见反馈<i class="fa fa-chevron-down"></i></div>
						<ul class="submenu cc">
							<li><a href="javascript:void(0)">收到的意见</a></li>
							<li><a href="javascript:void(0)">问题反馈</a></li>
							<li><a href="javascript:void(0)">问题反馈</a></li>
							<li><a href="javascript:void(0)">问题反馈</a></li>
							
						</ul>
					</li>
					<li><div class="link"><i class="fa fa-globe"></i>网站链接<i class="fa fa-chevron-down"></i></div>
						<ul class="submenu cc">
							<li><a href="/shop/shouye" target="_blank">首页链接</a></li>
							<li> <form action="/shop/buycar" name="f" method="post" target="_blank"><a href="javascript:void(0)" id="buy">购物车链接</a></li>
                            <input type="hidden" name="username" value="${sessionScope.username}"></form>
							 <li><a href="/shop/login">退出管理员系统</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<!-- 用户信息表格 -->
			<div class="container" id="usertable" >
  <div class="panel panel-primary">
      <div class="panel-heading text-center "><h2 class="name">用户信息</h2></div>
       <div class="panel-body">
<table class="table">
	<!-- <caption class="name">用户信息</caption> -->
   <thead>
      <tr>
         <th>用户名</th>
         <th>密码</th>
         <th>用户状态</th>
         <th>注册时间</th>
         <th>操作</th>
          <th>备注</th>
      </tr>
   </thead>
   <tbody>
   <c:forEach var="user" items="${user}">
       <c:if test="${user.username==sessionScope.username}"> <tr style="background-color: #F30F0F;">
           <td>${user.username}</td>
           <td><input  style="width: 50px;border: 0;outline: 0;background-color: #F30F0F;" disabled=＂disabled＂ type="password" value="${user.password}"></td>
           <td>${user.state}</td>
           <td><fmt:formatDate value="${user.createTime}"   pattern="yyyy-MM-dd HH:mm:ss" type="date" dateStyle="long" /></td>
           <td>无法对本账户操作</td>
           <td>用户状态:1封号,0表示正常,2管理员</td>
       </tr></c:if>
       <c:if test="${user.username!=sessionScope.username}">
           <tr>
               <td>${user.username}</td>
               <td><input class="password"  disabled=＂disabled＂ type="password" value="${user.password}"></td>
               <td class="state">${user.state}</td>
               <td><fmt:formatDate value="${user.createTime}"   pattern="yyyy-MM-dd HH:mm:ss" type="date" dateStyle="long" /></td>
               <td class="href"><a href="javascript:void(0)">删除</a>
                   <a href="javascript:void(0)" class="fenghao">封号</a>
                   <a href="javascript:void(0)" class="jiefeng">解封</a>
                   <input type="hidden" value="${user.username}">
               </td>
               <td>用户状态:1封号,0表示正常,2管理员</td>
           </tr>
       </c:if>
   </c:forEach>
   </tbody>
</table>

</div>
</div>
</div>
		</div>	
		<!-- 热卖商品表 -->
		<div class="container eq" id="hotsale" >
		<div class="search"><input class="setext" type="text">&nbsp;<button class="btn btn-info">搜索</button></div>
  <div class="panel panel-primary">
      <div class="panel-heading text-center "><h2 class="name">热卖商品</h2></div>
       <div class="panel-body">
<table class="table" id="table">
 <thead>
      <tr>
         <th>商品名</th>
         <th>单价</th>
         <th>首页图片</th>
         <th>库存数量</th>
         <th>物品页图片</th>
         <th>放大镜图片</th>
         <th>创建时间</th>
         <th>商品编号</th>
          <th>操作</th>
      </tr>
   </thead>
   <tbody>
   <c:forEach var="hotsale" items="${hotsale}">
      <tr>
         <td>${hotsale.name}</td>
         <td>${hotsale.price}</td>
         <td>${hotsale.img}</td>
         <td>${hotsale.number}</td>
         <td>${hotsale.wimg}</td>
         <td>${hotsale.bimg}</td>
         <td><fmt:formatDate value="${hotsale.createTime}"   pattern="yyyy-MM-dd HH:mm:ss" type="date" dateStyle="long" /></td>
          <td class="hotid">${hotsale.id}</td>
          <td class="href"><a href="/shop/delhot?hotid=${hotsale.id}" target="hidden" onclick="if(confirm('确定删除吗?')==false)return false;else{deleteRow(this);return true}">删除</a></td>
      </tr>
   </c:forEach>
   </tbody>
</table>
           <%--分页实现--%>
           <p>每页${page.pageSize}条  当前页${page.size}条${page.pageNum}/${page.pages}页
               记录数${page.total}
           </p>
           <ul class="pagination">
              <c:if test="${page.isFirstPage==true}"><li><a>首页</a></li></c:if>
               <c:if test="${page.isFirstPage==false}">
                <li><a href="/shop/admin?page=${page.firstPage}">首页</a></li></c:if>
               <c:if test="${page.hasPreviousPage==true}">
                   <li><a href="/shop/admin?page=${page.prePage}">&laquo;</a></li></c:if>
               <c:if test="${page.hasPreviousPage==false}">
                   <li><a>&laquo;</a></li></c:if>

               <c:set var="index" value="0" />
             <c:forEach begin="1" end="${page.pages}">
                 <c:set var="index" value="${index+1}" />
                       <c:if test="${page.pageNum==index}"><li>
                           <a style="background-color: #337ab7;color:#fff">${index}</a></li>
                       </c:if>
                   <c:if test="${page.pageNum!=index}">
                       <li><a href="/shop/admin?page=${index}">${index}</a></li></c:if>
        </c:forEach>
                <c:if test="${page.hasNextPage==true}">
    <li><a href="/shop/admin?page=${page.nextPage}">&raquo;</a></li></c:if>
               <c:if test="${page.hasNextPage==false}">
                   <li><a>&raquo;</a></li></c:if>
               <c:if test="${page.isLastPage==true}">
                   <li><a >末页</a></li></c:if>
               <c:if test="${page.isLastPage==false}">
                   <li><a href="/shop/admin?page=${page.lastPage}">末页</a></li></c:if>
           </ul>
</div>
</div>
</div>
		</div>	
<!-- 购物车 -->
<div class="container eq" id="buycar" >
<div class="search"><input class="setext" id="find" placeholder="请输入下单用户账户" value="${usernames}" type="text">&nbsp;<button id="search" class="btn btn-info aa">搜索</button>
    &nbsp; <button id="searchall" class="btn btn-info">查看全部</button></div>
  <div class="panel panel-primary">
      <div class="panel-heading text-center "><h2 class="name">购物车</h2></div>
       <div class="panel-body">
<table class="table">
  <thead>
      <tr>
         <th>下单用户账户</th>
         <th>商品名</th>
         <th>单价</th>
         <th>数量</th>
          <th>库存</th>
         <th>创建时间</th>
          <th>商品编号</th>
          <th>购物车编号</th>
          <th>操作</th>
     </tr>
   </thead>
   <tbody>
   <c:forEach var="buycar" items="${buycar}">
      <tr>
         <td>${buycar.username}</td>
         <td>${buycar.name}</td>
         <td>${buycar.price}</td>
          <td>${buycar.number}</td>
         <td>${buycar.number}</td>
          <td><fmt:formatDate value="${buycar.createTime}"   pattern="yyyy-MM-dd HH:mm:ss" type="date" dateStyle="long" /></td>
          <td>${buycar.hotid}</td>
         <td>${buycar.id}</td>
          <td class="href"><a href="javascript:void(0)">删除</a></td>
      </tr>
   </c:forEach>
</tbody>
</table>
           <%--分页实现--%>
           <p>每页${page3.pageSize}条  当前页${page3.size}条${page3.pageNum}/${page3.pages}页
               记录数${page3.total}
           </p>
           <ul class="pagination">
               <c:if test="${page3.isFirstPage==true}"><li><a>首页</a></li></c:if>
               <c:if test="${page3.isFirstPage==false}">
                   <li><a href="/shop/admin?page1=${page3.firstPage}&username=${usernames}">首页</a></li></c:if>
               <c:if test="${page3.hasPreviousPage==true}">
                   <li><a href="/shop/admin?page1=${page3.prePage}&username=${usernames}">&laquo;</a></li></c:if>
               <c:if test="${page3.hasPreviousPage==false}">
                   <li><a>&laquo;</a></li></c:if>

               <c:set var="index" value="0" />
               <c:forEach begin="1" end="${page3.pages}">
                   <c:set var="index" value="${index+1}" />
                   <c:if test="${page3.pageNum==index}"><li>
                       <a style="background-color: #337ab7;color:#fff">${index}</a></li>
                   </c:if>
                   <c:if test="${page3.pageNum!=index}">
                       <li><a href="/shop/admin?page1=${index}&username=${usernames}">${index}</a></li></c:if>
               </c:forEach>
               <c:if test="${page3.hasNextPage==true}">
                   <li><a href="/shop/admin?page1=${page3.nextPage}&username=${usernames}">&raquo;</a></li></c:if>
               <c:if test="${page3.hasNextPage==false}">
                   <li><a>&raquo;</a></li></c:if>
               <c:if test="${page3.isLastPage==true}">
                   <li><a >末页</a></li></c:if>
               <c:if test="${page3.isLastPage==false}">
                   <li><a href="/shop/admin?page1=${page3.lastPage}&username=${usernames}">末页</a></li></c:if>
           </ul>
</div>
</div>
</div>
		</div>	
<!-- 锁定购物车清单--订单信息 -->
<div class="container eq" id="orderlist" >
<div class="search"><input class="setext" id="find1" type="text" placeholder="请输入下单用户账户" value="${usernameorder}">&nbsp;<button id="search1" class="btn btn-info aa">搜索</button>
    &nbsp; <button id="searchallorder" class="btn btn-info">查看全部</button></div>
  <div class="panel panel-primary">
      <div class="panel-heading text-center "><h2 class="name">订单信息</h2></div>
       <div class="panel-body">
<table class="table">
  <thead>
      <tr>
         <th>下单用户账户</th>
         <th>商品名</th>
         <th>总价</th>
         <th>数量</th>
         <th>商品编号</th>
          <th>创建时间</th>
         <th>订单编号</th>
          <th>操作</th>
      </tr>
   </thead>
   <tbody>
   <c:forEach var="order" items="${order}">
      <tr>
         <td>${order.username}</td>
         <td>${order.name}</td>
         <td>${order.price}</td>
          <td>${order.number}</td>
         <td>${order.hotid}</td>
         <td><fmt:formatDate value="${order.creatTime}"   pattern="yyyy-MM-dd HH:mm:ss" type="date" dateStyle="long" /></td>
          <td>${order.id}</td>
          <td class="href"><a href="javascript:void(0)">删除</a></td>
  </tr>
   </c:forEach>
</tbody>
</table>
           <%--分页实现--%>
           <p>每页${page4.pageSize}条  当前页${page4.size}条${page4.pageNum}/${page4.pages}页
               记录数${page4.total}
           </p>
           <ul class="pagination">
               <c:if test="${page4.isFirstPage==true}"><li><a>首页</a></li></c:if>
               <c:if test="${page4.isFirstPage==false}">
                   <li><a href="/shop/admin?page2=${page4.firstPage}&usernameorder=${usernameorder}">首页</a></li></c:if>
               <c:if test="${page4.hasPreviousPage==true}">
                   <li><a href="/shop/admin?page2=${page4.prePage}&usernameorder=${usernameorder}">&laquo;</a></li></c:if>
               <c:if test="${page4.hasPreviousPage==false}">
                   <li><a>&laquo;</a></li></c:if>

               <c:set var="index" value="0" />
               <c:forEach begin="1" end="${page4.pages}">
                   <c:set var="index" value="${index+1}" />
                   <c:if test="${page4.pageNum==index}"><li>
                       <a style="background-color: #337ab7;color:#fff">${index}</a></li>
                   </c:if>
                   <c:if test="${page4.pageNum!=index}">
                       <li><a href="/shop/admin?page2=${index}&usernameorder=${usernameorder}">${index}</a></li></c:if>
               </c:forEach>
               <c:if test="${page4.hasNextPage==true}">
                   <li><a href="/shop/admin?page2=${page3.nextPage}&usernameorder=${usernameorder}">&raquo;</a></li></c:if>
               <c:if test="${page4.hasNextPage==false}">
                   <li><a>&raquo;</a></li></c:if>
               <c:if test="${page4.isLastPage==true}">
                   <li><a>末页</a></li></c:if>
               <c:if test="${page4.isLastPage==false}">
                   <li><a href="/shop/admin?page2=${page4.lastPage}&usernameorder=${usernameorder}">末页</a></li></c:if>
           </ul>
</div>
</div>
</div>
		</div>	
		<!-- 统计图板块 -->
		<div id="container1" class="list" style="height: 80%"></div>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-gl/echarts-gl.min.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-stat/ecStat.min.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>
       <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=ZUONbpqGBsYGXNIYHicvbAbM"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/simplex.js"></script>
       <script type="text/javascript">
var dom = document.getElementById("container1");
var myChart = echarts.init(dom);
var app = {};
option = null;
option = {
    
    tooltip : {
        trigger: 'item',
        formatter: "{a} <br/>{b} : {c} ({d}%)"
    },
    legend: {
       bottom: 10,
        left: 'center',
        data: [ '益州','兖州','荆州','西凉']
    },
    series : [
        {
            type: 'pie',
            radius : '65%',
            center: ['50%', '50%'],
            selectedMode: 'single',
            data:[
               
                {value:535, name: '荆州'},
                {value:510, name: '兖州'},
                {value:634, name: '益州'},
                {value:735, name: '西凉'}
            ],
            itemStyle: {
                emphasis: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        }
    ]
};
;
if (option && typeof option === "object") {
    myChart.setOption(option, true);
}
       </script>
        <iframe name="hidden" id="hidden" style="display:none"></iframe>
<iframe allowtransparency="true" frameborder="0" width="385" height="96" scrolling="no" src="http://tianqi.2345.com/plugin/widget/index.htm?s=2&z=3&t=0&v=0&d=3&bd=0&k=&f=&ltf=009944&htf=cc0000&q=1&e=1&a=1&c=54511&w=385&h=96&align=center"></iframe>
	</body>
	</html>