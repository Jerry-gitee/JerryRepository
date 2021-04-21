<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>主页面</title>
    <%@include file="/pages/common/head.jsp" %>
    <script type="text/javascript">
        $(function () {
            $("#payButton").click(function () {
                $.ajax({
                    url:'parkingRecord/parkingPay',
                    type:'post',
                    dataType:'json',
                    data:$("#myform").serialize(),
                    success:function (result) {
                            alert("缴费成功");
                        window.location.href=result;
                    }
                });
            });
        });
    </script>
</head>
<body>
<jsp:include page="/pages/common/top.jsp"></jsp:include>
<div class="container clearfix">
    <jsp:include page="/pages/common/left.jsp"></jsp:include>
    <!--/工具栏-->
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list">
                <span>停车缴费界面</span>
            </div>
        </div>
        <div class="result-wrap">
            <div class="result-title">
                <h1>缴费详情</h1>
            </div>
            <div class="result-content">
                <form method="post" id="myform" name="myform">
                    <input name="balance" value="${balance}" type="hidden"/>
                    <table class="insert-tab" width="100%">
                        <tbody>
                        <tr>
                            <th>用户id：</th>
                            <td>
                                <input class="common-text required" value='${parkingRecord.userId}' name="userId"
                                       size="50"  style="border:none;">
                            </td>
                        </tr>
                        <tr>
                            <th>车牌号：</th>
                            <td>
                                <input class="common-text required" value='${parkingRecord.car_number}' name="car_number"
                                       size="50" readonly="readonly" style="border:none;">
                            </td>
                        </tr>
                        <tr>
                            <th>停车位：</th>
                            <td>
                                <input class="common-text required" value='${parkingRecord.carport}' name="carport"
                                       size="50" readonly="readonly" style="border:none;">
                            </td>
                        </tr>
                        <tr>
                            <th>入场时间：</th>
                            <td>
                                <input class="common-text required" value='${parkingRecord.in_date}' name="in_date"
                                       size="50" readonly="readonly" style="border:none;">
                            </td>
                        </tr>
                        <tr>
                            <th>出场时间：</th>
                            <td>
                                <input class="common-text required" value='${parkingRecord.out_date}' name="out_date"
                                       size="50" readonly="readonly" style="border:none;">
                            </td>
                        </tr>
                        <tr>
                            <th>总时长：</th>
                            <td>
                                <input class="common-text required" value='${parkingRecord.park_time}' name="park_time"
                                       size="1"  readonly="readonly" style="border:none; text-align: right;">/小时
                            </td>
                        </tr>
                        <tr>
                            <th>收费标准：</th>
                            <td>
                                <input class="common-text required" value='${parkingRecord.price}' name="price"
                                       size="1" readonly="readonly" style="border:none;text-align: right;">/元
                            </td>
                        </tr>
                        <tr>
                            <th>需缴费金额：</th>
                            <td>
                                <input class="common-text required" value='${parkingRecord.total_fare}' name="total_fare"
                                       size="2" readonly="readonly" style="border:none;text-align: right;">/元
                            </td>
                        </tr>
                        <tr>
                            <th>当前余额：</th>
                            <td>
                                <input class="common-text required" value='${sUser.balance}' size="2"
                                       readonly="readonly" style="border:none;text-align: right;">/元
                            </td>
                        </tr>

                        <tr>
                            <c:choose>
                                <c:when test="${balance>=0}">
                                    <th></th>
                                    <td>
                                        <input class="btn btn6" id="payButton" value="继续缴费" type="button">
                                        <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
                                    </td>
                                </c:when>
                                <c:when test="${balance<0}">
                                    <th><label class="res-lab" style="color: red;">余额不足！请先充值：</label></th>
                                    <td>
                                        <a href="pages/user/recharge.jsp"><input class="btn btn6" value="去充值"
                                                                                 type="button"></a>
                                        <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
                                    </td>
                                </c:when>
                            </c:choose>
                        </tr>
                        </tbody>
                    </table>
                </form>

            </div>
        </div>
    </div>
</div>
</body>
</html>
