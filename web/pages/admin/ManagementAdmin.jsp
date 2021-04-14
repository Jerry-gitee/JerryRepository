<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理管理员页面</title>
    <%@include file="/pages/common/head.jsp" %>
</head>
<body>
<jsp:include page="/pages/common/top.jsp"></jsp:include>
<jsp:include page="/pages/common/left.jsp"></jsp:include>
<script type="text/javascript">
    $(function () {
$("a.link-del").click(function () {
   return  confirm("你确定要删除名称为:【"+$(this).parent().parent().find("#adName").text()+"】的管理员吗？")
});
    });
</script>
<div class="main-wrap">
    <div class="crumb-wrap">
        <div class="crumb-list">
            <span class="crumb-name">管理员管理</span>
        </div>
        <div class="search-wrap">
            <div class="search-content">
                <form action="admin/toManagementAdminPage" method="post">
                    <table class="search-tab">
                        <tr>
                            <th width="150">
                                管理员名称:
                            </th>
                            <td>
                                <input class="common-text" placeholder="关键字" name="adminName"
                                       value="" id="" type="text">
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
                        <a href="pages/admin/addAdmin.jsp">
                            新增管理员</a>
                    </div>
                </div>
                <div class="result-content">
                    <table class="result-tab" width="100%">
                        <tr>
                            <th>AdminId</th>
                            <th>管理员名称</th>
                            <th>密码</th>
                            <th>操作</th>
                        </tr>
                        <c:forEach items="${page.items}" var="admin">
                        <tr>
                            <td>${admin.id}</td>
                            <td id="adName" title="" >${admin.adminName}</td>
                            <td>${admin.adminPassword}</td>
                            <td>
                                <a class="link-update"
                                   href="admin/toUpdateAdminPage?id=${admin.id}&pageNo=${page.pageNo}">修改</a>
                                <a class="link-del" href="admin/deleteAdmin?id=${admin.id}&pageNo=${page.pageNo}">删除</a>
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

</div>
</body>
</html>
