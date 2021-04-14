<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登入界面</title>
    <%
        String scheme = request.getScheme();
        String serverName = request.getServerName();
        int serverPort = request.getServerPort();
        String contextPath = request.getContextPath();
        String basePath=scheme+"://"+serverName+":"+serverPort+contextPath+"/";
    %>
    <base href="<%=basePath%>">
    <script type="text/javascript" src="pages/static/js/jquery-1.7.2.js"></script>
    <script type="text/javascript">
   $(function () {//文件加载之后

//登录按钮的点击事件
$("#login_button").click(function () {
    if($("#nameId").val() == ""){//用户名为空，弹出警告！阻止提交。
        alert('请输入用户名！');
        return false;
    }
    if( $("#passwordId").val() == ""){//密码为空，弹出警告！阻止提交。
        alert('请输入密码！');
        return false;
    }

});
   });
    </script>
</head>
<body>
<div align="center">
    <h2 align="center">欢迎登录停车信息场管理系统</h2>
    <form action="loginAndRegister/login" method="post"><br>
        <lable>用户名：</lable>
        <input type="text" id="nameId" placeholder="请输入用户名"name="name" value=""/><br><br>
        &nbsp;&nbsp;<lable> 密码：&nbsp;</lable>
        <input type="password" id="passwordId" placeholder="请输入密码" name="password" value=""/><br><br>
        <select name="action" style="text-align: center">
            <option value="userLogin">用户</option>
            <option value="adminLogin">管理员</option>
        </select><br><br>
        <input type="submit" id="login_button" value="登录">&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="pages/loginAndRegister/register.jsp">
            <input type="button" id="register_button" value="注册">
        </a>
    </form>
</div>
</body>
</html>
