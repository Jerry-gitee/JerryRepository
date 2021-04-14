<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
   String path = request.getContextPath();
 %>
<div class="topbar-wrap white">
			<div class="topbar-inner clearfix">
				<div class="topbar-logo-wrap clearfix">
					<a class="on" href="#">停车场管理系统</a>
				</div>
				<div class="top-info-wrap">
					<ul class="top-info-list clearfix">

                        <c:if test="${!sessionScope.type.equals('user')}">
						<li><span>管理员：${sAdmin.adminName}</span></li>
						</c:if>

							<c:if test="${sessionScope.type.equals('user')}">
						<li><span>用户：${sUser.userName}</span></li>
							</c:if>

						<li>
							<a href="loginAndRegister/loginOut">退出</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
