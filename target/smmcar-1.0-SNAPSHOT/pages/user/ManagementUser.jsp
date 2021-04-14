<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>管理用户页面</title>
    <%@include file="/pages/common/head.jsp" %>
    <script type="text/javascript">
        $(function () {
            $("a.link-delUser").click(function () {
                return  confirm("你确定要删除名称为:【"+$(this).parent().parent().find("#usName").text()+"】的用户吗？")
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
            <span class="crumb-name">用户管理</span>
        </div>
    </div>
    <div class="search-wrap">
        <div class="search-content">
            <form action="user/toManagementUserPage" method="post">
                <table class="search-tab">
                    <tr>
                        <th width="150">请输入用户名称:</th>
                        <td>
                            <input class="common-text" placeholder="关键字" name="userName"
                                   value="" id="" type="text">
                        </td>
                        <td>
                            <input class="btn btn-primary btn2" name="sub" value="查询" type="submit">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <div  class="result-wrap">
        <form name="myform" id="myform" method="post">
            <div class="result-title">
                <div class="result-list">
                    <a href="pages/user/addUser.jsp">新增用户</a>
                </div>
            </div>
            <div class="result-content">
                <table class="result-tab" width="100%">
                    <tr>
                        <th>userId</th>
                        <th>用户名</th>
                        <th>密码</th>
                        <th>电话</th>
                        <th>卡余额</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${page.items}" var="user">
                    <tr>
                        <td>${user.id}</td>
                        <td id="usName" title="">${user.userName}</td>
                        <td title="">${user.userPassword}</td>
                        <td title="">${user.tel}</td>
                        <td title="">${user.balance}</td>
                        <td>
                            <a class="link-update"
                               href="user/toadminUpdateUserPage?id=${user.id}&pageNo=${page.pageNo}">修改</a>
                            <a class="link-update" href="user/toRechargePage?id=${user.id}&pageNo=${page.pageNo}">充值</a>
                            <a class="link-delUser" href="user/deleteUser?id=${user.id}&pageNo=${page.pageNo}">删除</a>
                        </td>
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
