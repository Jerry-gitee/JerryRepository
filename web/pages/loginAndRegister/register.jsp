<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册界面</title>
    <%@include file="/pages/common/head.jsp" %>
    <script type="text/javascript">
        $(function () {//文件加载之后
            //用户名绑定失去焦点事件，当用户名在数据库中以存在时，提示用户，并回写为空。
            $("#name").blur(function () {
                //获取到用户输入的值
                let name = this.value;
                //转发到userServlet并调用ajaxExistsUsername方法判断用户名是否存在
                $.post("loginAndRegister/existsName","name=" + name,function (data) {//回调函数，
                    console.log(data);
                    if (data[0]) {//用户名是存在
                        alert('警告!!!,用户名已存在,请重新输入');
                        //将输入框中的值设置为空
                        $("#name").val('');
                    }
                });
            });
            //给确认密码绑定失去焦点事件，当密码和确认密码不一致时，提示用户
            $("#confirm_Pwd").blur(function () {
                let confirmPwd = $("#confirm_Pwd").val();
                let pwd = $("#pwd").val();
                if (confirmPwd!=''){//不为空，说明用户已经输入数据，防止用户没有输入数据，也提示错误的情况
                    if (pwd != confirmPwd) {
                        alert('警告!!!,密码和确认密码不一致,请重新输入');
                        //将输入框中的值设置为空
                        $("#confirm_Pwd").val('');
                    }}
            });

            //给电话绑定失去焦点事件，利用正则表达式判断电话是否合法。不合法提示用户
            $("#tel").blur(function () {
                //获取用户输入的电话
                let tel = this.value;
                //正则表达式，以1开头，第二个数为3，4，5，7，8，剩下的9位为0-9
                var telPatt = /^1[3|4|5|7|8][0-9]{9}$/;
                //判断电话是否合法
                if (tel!=''){//不为空，说明用户已经输入数据，防止用户没有输入数据，也提示错误的情况
                    if (!telPatt.test(tel)) {//不合法
                        //提示用户
                        alert('警告!!! 电话格式不合法,请重新输入');
                        //将输入框中的值设置为空
                        $("#tel").val('');
                    }}
            });

            //给提交按钮设置单击事件，判断用户名，密码，电话，是否为空，为空提示用户，并阻止提交。
            // 不为空注册成功，跳转到登入界面
            $("#addUser_button").click(function () {
                if ($("#name").val() == "") {
                    alert('警告!!!,姓名不能为空！');
                    return false;
                }
                if ($("#pwd").val() == "") {
                    alert('警告!!!, 密码不能为空！');
                    return false;
                }
                if ($("#tel").val() == "") {
                    alert('警告!!!, 电话不能为空！');
                    return false;
                }
                alert("注册成功，正在跳转到登入页面。");
            });

        });
    </script>
</head>
<body>

<div class="main-wrap1">
    <div class="crumb-wrap">
        <div class="crumb-list">
            <span>用户注册</span>
        </div>
    </div>
    <div class="result-wrap">
        <div class="result-content">

            <form action="loginAndRegister/register"  method="post" id="myform" name="myform">
                <table class="insert-tab" width="100%">
                    <tbody>

                    <tr>
                        <th>登录名：</th>
                        <td>
                            <input class="common-text required" id="name" name="userName"
                                   size="50" value="" type="text">
                        </td>
                    </tr>

                    <tr>
                        <th><i class="require-red"></i>密码：</th>
                        <td>
                            <input class="common-text required" id="pwd" name="userPassword"
                                   size="50" value="" type="password">
                        </td>
                    </tr>
                    <tr>
                        <th>确认密码：</th>
                        <td>
                            <input class="common-text required" id="confirm_Pwd"
                                   size="50" value="" type="password">
                        </td>
                    </tr>
                    <tr>
                        <th>电话：</th>
                        <td>
                            <input class="common-text required" id="tel" name="tel"
                                   size="50" value="" type="text">
                        </td>
                    </tr>
                    <tr>
                        <th></th>
                        <td>
                            <input class="btn btn-primary btn6 mr10" id="addUser_button"
                                   value="提交" type="submit">
                            <input class="btn btn6" onclick="history.go(-1)" value="返回"
                                   type="button">
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
</div>

</body>
</html>
