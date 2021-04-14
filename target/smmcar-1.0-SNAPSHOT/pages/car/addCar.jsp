<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>增加车辆界面</title>
    <%@include file="/pages/common/head.jsp" %>
</head>
<body>
<jsp:include page="/pages/common/top.jsp"></jsp:include>
<div class="container clearfix">
    <jsp:include page="/pages/common/left.jsp"></jsp:include>
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list">
                <span>增加车辆</span>
            </div>
            <div class="result-wrap">
                <div class="result-content">
                    <form action="car/addAndUpdateCar" method="post" id="myform" name="myform" enctype="multipart/form-data">
                        <input name="user_id" value="${sUser.id}" type="hidden"/>
                        <table class="insert-tab" width="100%">
                            <tbody>
                            <tr>
                                <th><i class="require-red"></i>车牌号：</th>
                                <td>
                                    <input class="common-text required" placeholder="请输入车牌号"
                                          name="car_number" size="50" type="text">
                                </td>
                            </tr>
                            <tr>
                                <th><i class="require-red"></i>车辆品牌：</th>
                                <td>
                                    <input class="common-text required"  placeholder="请输入车辆品牌" name="car_brand" size="50"  type="text">
                                </td>
                            </tr>
                            <tr>
                                <th><i class="require-red"></i>请选择车辆照片：</th>
                                <td>
                                    <input class="common-text required"  name="car_imgeFile" size="50"  type="file">
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <input class="btn btn-primary btn6 m r10" id="" value="提交"
                                           type="submit">
                                    <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </div>
        <!--/main-->
    </div>
</body>
</html>
