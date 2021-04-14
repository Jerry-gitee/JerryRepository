<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>主页面</title>
    <%@include file="/pages/common/head.jsp" %>
</head>
<body>
<jsp:include page="/pages/common/top.jsp"></jsp:include>
<div class="container clearfix">
    <jsp:include page="/pages/common/left.jsp"></jsp:include>
    <!--/工具栏-->
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list">
                <span>欢迎使用停车场信息管理系统。</span>
            </div>
        </div>
        <div class="result-wrap">
            <div class="result-title">
                <h1>个人基本信息</h1>
            </div>
            <div class="result-content">
                <ul class="sys-info-list">
                    <%--                   如果为管理员主页显示管理员的基本信息 --%>
                   <c:if test="${sessionScope.type.equals('admin')}">
                       <li>
                           <label class="res-lab">
                               管理员ID：
                           </label>
                           <span class="res-info">${sAdmin.id}</span>
                       </li>
                       <li>
                           <label class="res-lab">
                               管理员名称：
                           </label>
                           <span class="res-info">${sAdmin.adminName}</span>
                       </li>

                       <li>
                           <label class="res-lab">
                               密码：
                           </label>
                           <span class="res-info">${sAdmin.adminPassword}</span>
                       </li>
                   </c:if>
<%--                   如果为用户主页显示用户的基本信息 --%>
                    <c:if test="${sessionScope.type.equals('user')}">

                    <li>
                        <label class="res-lab">
                            用户ID：
                        </label>
                        <span class="res-info">${sUser.id}</span>
                    </li>
                    <li>
                        <label class="res-lab">
                            用户名：
                        </label>
                        <span class="res-info">${sUser.userName}</span>
                    </li>

                    <li>
                        <label class="res-lab">
                            密码：
                        </label>
                        <span class="res-info">${sUser.userPassword}</span>
                    </li>

                    <li>
                        <label class="res-lab">
                            联系电话：
                        </label>
                        <span class="res-info">${sUser.tel}</span>
                    </li>
                    <li>
                        <label class="res-lab">
                            余额：
                        </label>
                        <span class="res-info">${sUser.balance}/元</span>
                    </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
</html>
