<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户管理车辆信息界面</title>
    <%@include file="/pages/common/head.jsp" %>
    <script type="text/javascript">
        $(function () {
        $("#delCar").click(function () {
            $.ajax({
                url:'car/delUpdPrecondition',
                type:'post',
                dataType:'json',
                data:{car_id:${car.car_id}},
                success:function(result){
                    if (result=="isParking"){
                        alert("您的车还停在【${car.carport}】车位上，请先出场再删除车辆");
                    }
                    if (result=="ok"){
                        let b = confirm("你确定要删除您的车辆信息吗？");
                        if (b){
                            window.location.href="car/deleteCar?user_id=${car.user_id}&car_id=${car.car_id}";
                        }
                    }
                }
            });
        });

        });
    </script>
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
    <div class="result-wrap">
        <form name="myform" id="myform" method="post">
            <div class="result-title">
                <div class="result-list" id="result-list">
                </div>
            </div>
            <div class="result-content">
                <c:choose>
                    <c:when test="${empty requestScope.car}">
                        <a href="pages/car/addCar.jsp">添加车辆信息</a>
                        <p>您当前并未添加任何车辆信息，请添加车辆信息</p>
                    </c:when>
                    <c:when test="${!empty requestScope.car}">
                        <table class="result-tab" width="100%">
                            <tr align="center">
                                <td>ID</td>
                                <td>车牌号</td>
                                <td>车辆品牌</td>
                                <td>车辆照片</td>
                                <td>停车状态</td>
                                <td>停车位</td>
                                <td>操作</td>
                            </tr>
                            <tr align="center">
                                <td>${car.car_id}</td>
                                <td title="">${car.car_number}</td>
                                <td title="">${car.car_brand}</td>
                                <td title="">
                                    <img src="${car.car_imge}" style="width:150px;height: 80px;"></td>
                                <c:choose>
                                    <c:when test="${car.car_status.equals('已停车')}">
                                        <td>
                                            <a href="parkingRecord/toPayPage?carport=${car.carport}&car_number=${car.car_number}">出场缴费</a>
                                        </td>
                                    </c:when>
                                    <c:when test="${car.car_status.equals('未停车')}">
                                        <td title="">${car.car_status}</td>
                                    </c:when>
                                </c:choose>
                                <td title="">${car.carport}</td>
                                <td>
                                    <a class="link-update"  href="car/toUpdateCarPage?car_id=${car.car_id}">修改</a>
                                    <a class="link-del" id="delCar">删除</a>
                                </td>
                            </tr>
                        </table>
                    </c:when>
                </c:choose>
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
