<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户修改信息界面</title>
    <%@include file="/pages/common/head.jsp" %>
    <script type="text/javascript">
        $(function () {//文件加载之后
            //用户名绑定失去焦点事件，当用户名在数据库中以存在时，提示用户，并回写为空。
            $("#name").blur(function () {
                //获取到用户输入的值
                let name = this.value;
                if (name!=${sUser.userName}){
                //转发到userServlet并调用ajaxExistsUsername方法判断用户名是否存在
                $.post("loginAndRegister/existsName","name=" + name,function (data) {//回调函数，
                    console.log(data);
                    if (data[0]) {//用户名是存在
                        alert('警告!!!,用户名已存在,请重新输入');
                        //将输入框中的值设置为空
                        $("#name").val('');
                    }
                });
                }
            });
            //给旧密码绑定失去焦点事件，先判断用户是否输入，用户输入了如果不等于原来的密码，提示用户。
            $("#oldPwd").blur(function () {
                let oldPwdText = $("#oldPwd").val();
                if (oldPwdText!=""){
                if (oldPwdText !=${sessionScope.sUser.userPassword}) {
                         alert("警告！！！密码不正确，请重新输入");
                    $("#oldPwd").val("");
                }}
            });
            //给确认密码绑定失去焦点事件，当密码和确认密码不一致时，提示用户
            $("#confirm_Pwd").blur(function () {
                let confirmPwd = $("#confirm_Pwd").val();
                let pwd = $("#pwd").val();
                if (confirmPwd != '') {//不为空，说明用户已经输入数据，防止用户没有输入数据，也提示错误的情况
                    if (pwd != confirmPwd) {
                        alert('警告!!!,密码和确认密码不一致,请重新输入');
                        //将输入框中的值设置为空
                        $("#confirm_Pwd").val('');
                    }
                }
            });

            //给电话绑定失去焦点事件，利用正则表达式判断电话是否合法。不合法提示用户
            $("#tel").blur(function () {
                //获取用户输入的电话
                let tel = this.value;
                //正则表达式，以1开头，第二个数为3，4，5，7，8，剩下的9位为0-9
                var telPatt = /^1[3|4|5|7|8][0-9]{9}$/;
                //判断电话是否合法
                if (tel != '') {//不为空，说明用户已经输入数据，防止用户没有输入数据，也提示错误的情况
                    if (!telPatt.test(tel)) {//不合法
                        //提示用户
                        alert('警告!!! 电话格式不合法,请重新输入');
                        //将输入框中的值设置为空
                        $("#tel").val('');
                    }
                }
            });

            //给提交按钮设置单击事件，判断用户名，密码，电话，是否为空，为空提示用户，并阻止提交。
            // 不为空注册成功，跳转到主界面
            $("#addUser_button").click(function () {
                if ($("#name").val() == "") {
                    alert('警告!!!,姓名不能为空！');
                    return false;
                }
                if ($("#oldPwd").val()=="")
                {
                    alert('警告!!!, 旧密码不能为空！');
                    return false;
                }
                if ($("#pwd").val() == "") {
                    alert('警告!!!, 新密码不能为空！');
                    return false;
                }
                if ($("#confirm_Pwd").val()==""){
                    alert('警告!!!, 请确认密码！');
                    return false;
                }
                if ($("#tel").val() == "") {
                    alert('警告!!!, 电话不能为空！');
                    return false;
                }
                $.ajax({
                    url:'user/userUpdate',
                    type:'post',
                    dataType:'json',
                    data:$("#myform").serialize(),
                    success:function(result){
                        console.log(result);
                        if (result!=null) {//用户名是存在
                            alert("修改成功");
                            window.location.href=result;
                        }
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
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list">
                <span>修改用户</span>
            </div>
            <div class="result-wrap">
                <div class="result-content">
                    <form method="post" id="myform" name="myform" >
                        <input type="hidden" name="id" value="${sessionScope.sUser.id}"/>
                        <input type="hidden" name="balance" value="${sessionScope.sUser.balance}"/>
                        <table class="insert-tab" width="100%">
                            <tbody>
                            <input name="type" type="hidden" id="type" value='type'>
                            <tr>
                                <th><i class="require-red"></i>用户名：</th>
                                <td>
                                    <input class="common-text required" value="${sessionScope.sUser.userName}" id="name"
                                           name="userName"
                                           size="50" type="text">
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <i class="require-red"></i>旧密码：
                                </th>
                                <td>
                                    <input class="common-text required" value="" placeholder="请输入旧密码"
                                           id="oldPwd"  size="50"  type="password">
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <i class="require-red"></i>新密码：
                                </th>
                                <td>
                                    <input class="common-text required" value="" id="pwd" placeholder="请输入新密码"
                                           name="userPassword" size="50"  type="password">
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <i class="require-red"></i>确认密码：
                                </th>
                                <td>
                                    <input class="common-text required" value="" id="confirm_Pwd"
                                           placeholder="请输入再次输入新密码" size="50"  type="password">
                                </td>
                            </tr>

                            <tr>
                                <th>
                                    <i class="require-red"></i>电话：
                                </th>
                                <td>
                                    <input class="common-text required" value="${sessionScope.sUser.tel}" id="tel"
                                           name="tel" size="50"  type="text">
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <input class="btn btn-primary btn6 m r10" id="addUser_button" value="提交"
                                           type="button">
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
