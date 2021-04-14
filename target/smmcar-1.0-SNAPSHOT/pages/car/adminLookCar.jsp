<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>车位管理界面</title>
    <%@include file="/pages/common/head.jsp" %>
</head>
<body>
<jsp:include page="/pages/common/top.jsp"></jsp:include>
<jsp:include page="/pages/common/left.jsp"></jsp:include>
<!--/sidebar-->
<div class="main-wrap">

    <div class="crumb-wrap">
        <div class="crumb-list">
            <span class="crumb-name">车辆信息</span>
        </div>
    </div>
    <div class="search-wrap">
        <div class="search-content">
            <form action="car/toAdminLookCarPage" method="get">
                <table class="search-tab">
                    <tr>

                        <th width="150">
                            请输入用户id:
                        </th>
                        <td>
                            <input class="common-text" placeholder="关键字" name="user_id" type="text">
                        </td>
                        <th width="100">
                            车牌号:
                        </th>
                        <td>
                            <input class="common-text" placeholder="关键字" name="car_number" type="text">
                        </td>
                        <td>
                            <input class="btn btn-primary btn2" name="sub" value="查询"
                                   type="submit">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <div class="result-wrap">
        <form name="myform" id="myform" method="post">
            <div class="result-title">
                <div class="result-list">

                </div>
            </div>
            <div class="result-content">
                <table class="result-tab" width="100%">
                    <tr>
                        <td>ID</td>
                        <td>用户ID</td>
                        <td>车牌号</td>
                        <td>车辆品牌</td>
                        <td>车辆照片</td>
                        <td>停车状态</td>
                        <td>停车位</td>
                    </tr>
                    <c:forEach items="${page.items}" var="car">
                        <tr>
                            <td>${car.car_id}</td>
                            <td>${car.user_id}</td>
                            <td title="">${car.car_number}</td>
                            <td title="">${car.car_brand}</td>
                            <td title=""><img src="${car.car_imge}" style="width:150px;height: 80px;"></td></td>
                            <td title="">${car.car_status}</td>
                            <td title="">${car.carport}</td>
                        </tr>
                    </c:forEach>
                </table>
                <%@include file="/pages/common/page_nav.jsp"%>
                <div class="list-page">

                </div>
            </div>
        </form>
    </div>
</div>
<!--/main-->
</div>
</body>
</html>
