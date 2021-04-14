<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>车位管理界面</title>
    <%@include file="/pages/common/head.jsp" %>
    <script type="text/javascript">
        $(function () {
$("a.park").click(function () {
    $.ajax({
        url:'carport/toPark',
        type:'post',
        dataType:'json',
        data:{id:$(this).parent().parent().find("#carportId").text(),pageNo:${page.pageNo},userId:${sUser.id}},
        success:function(result){
            if (result=="noCar"){
                alert("您还未添加车辆，请先添加车辆。");
                return false;
            }
            if (result=="isParking"){
                alert("您的车辆已经停在某车位上，您可以在车辆信息中查看您停的车位");
                return false;
            }
                alert("预定成功");
                window.location.href=result;
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
            <span class="crumb-name">车位信息</span>
        </div>
    </div>
    <div class="search-wrap">
        <div class="search-content">
            <form action="carport/toCarportPage" method="post">
                <table class="search-tab">
                    <tr>

                        <th width="150">
                            请输入车位号:
                        </th>
                        <td>
                            <input class="common-text" placeholder="关键字" name="carport"
                                   value=""  type="text">
                        </td>
                        <th width="50">
                            区域:
                        </th>
                        <td>
                            <input class="common-text" placeholder="关键字" name="area"
                                   value=""  type="text">
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
                        <td>区域</td>
                        <td>车位号</td>
                        <td>状态</td>
                    </tr>
                    <c:forEach items="${page.items}" var="carport">
                        <tr>
                            <td id="carportId">${carport.id}</td>
                            <td>${carport.area}</td>
                            <td>${carport.carport}</td>
                            <c:choose>
                                <c:when test="${carport.status.equals('已停车')}">
                                    <td>${carport.status}</td>
                                </c:when>
                                <c:when test="${carport.status.equals('未停车')}">
                                    <td><a class="park">入场预定</a></td>
                                </c:when>
                            </c:choose>
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
