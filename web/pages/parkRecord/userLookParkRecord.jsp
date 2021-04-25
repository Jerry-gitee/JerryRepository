<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看停车记录</title>
    <%@include file="/pages/common/head.jsp" %>
</head>
<body>
<jsp:include page="/pages/common/top.jsp"></jsp:include>
<jsp:include page="/pages/common/left.jsp"></jsp:include>
<!--/sidebar-->
<div class="main-wrap">

    <div class="crumb-wrap">
        <div class="crumb-list">
            <span class="crumb-name">停车记录</span>
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
                    <tr style="text-align: center;">
                        <td>ID</td>
                        <td>用户ID</td>
                        <td>车牌号</td>
                        <td>入场时间</td>
                        <td>出场时间</td>
                        <td>收费标准</td>
                        <td>停车时长</td>
                        <td>缴费金额</td>
                        <td>停车位</td>
                    </tr>
                    <c:forEach items="${requestScope.page.items}" var="parkingRecord">
                        <tr style="text-align: center;" >
                            <td>${parkingRecord.id}</td>
                            <td>${parkingRecord.userId}</td>
                            <td title="">${parkingRecord.car_number}</td>
                            <td title="">${parkingRecord.in_date}</td>
                            <td title="">${parkingRecord.out_date}</td>
                            <td title="">${parkingRecord.price}</td>
                            <td title="">${parkingRecord.park_time}</td>
                            <td title="">${parkingRecord.total_fare}</td>
                            <td title="">${parkingRecord.carport}</td>
                        </tr>
                    </c:forEach>
                </table>
                <%@include file="/pages/common/page_nav.jsp"%>
                <div  align="right">
                   <a href="parkingRecord/exportParkingRecord">
                       <input class="btn btn-primary btn6 m r10"  value="导出停车记录" type="button" >
                   </a>
                </div>

            </div>
        </form>
    </div>
</div>
<!--/main-->
</div>
</body>
</html>
