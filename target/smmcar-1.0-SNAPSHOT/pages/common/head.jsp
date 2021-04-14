<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<%
    String scheme = request.getScheme();
    String serverName = request.getServerName();
    int serverPort = request.getServerPort();
    String contextPath = request.getContextPath();
    String basePath=scheme+"://"+serverName+":"+serverPort+contextPath+"/";
%>
<base href="<%=basePath%>">
<script type="text/javascript" src="pages/static/js/jquery-1.7.2.js"></script>
<link rel="stylesheet" type="text/css"	href="<%=contextPath%>/pages/static/css/common.css" />
<link rel="stylesheet" type="text/css"	href="<%=contextPath%>/pages/static/css/main.css" />


