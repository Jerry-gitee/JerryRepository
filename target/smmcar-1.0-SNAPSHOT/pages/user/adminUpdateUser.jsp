<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员修改用户信息界面</title>
    <%@include file="/pages/common/head.jsp" %>
    <script type="text/javascript">
        $(function () {//文件加载之后
            //用户名绑定失去焦点事件，当用户名在数据库中以存在时，提示用户，并回写为空。
            $("#nameByAdmin").blur(function () {
                //获取到用户输入的值
                let name = this.value;
                //如果用户名不等于当前的用户名在去数据库中找是否存在用户，防止判断自己的情况！！

                if (name !=${user.userName}) {
                    //转发到userServlet并调用ajaxExistsUsername方法判断用户名是否存在
                    $.post("loginAndRegister/existsName","name=" + name,function (data) {//回调函数，
                        console.log(data);
                        if (data[0]) {//用户名是存在
                            alert('警告!!!,用户名已存在,请重新输入');
                            //将输入框中的值设置为空
                            $("#nameByAdmin").val('');
                        }
                    });
                }
            });

            //给电话绑定失去焦点事件，利用正则表达式判断电话是否合法。不合法提示用户
            $("#telByAdmin").blur(function () {
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
                        $("#telByAdmin").val('');
                    }
                }
            });

            //给提交按钮设置单击事件，判断用户名，密码，电话，是否为空，为空提示用户，并阻止提交。
            // 不为空注册成功，跳转到主界面
            $("#addUser_buttonByAdmin").click(function () {
                if ($("#nameByAdmin").val() == "") {
                    alert('警告!!!,姓名不能为空！');
                    return false;
                }

                if ($("#pwdByAdmin").val() == "") {
                    alert('警告!!!, 密码不能为空！');
                    return false;
                }
                if ($("#telByAdmin").val() == "") {
                    alert('警告!!!, 电话不能为空！');
                    return false;
                }
                $.ajax({
                    url:'user/adminUpdate',
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
                        <input type="hidden" name="pageNo" value="${pageNo}"/>
                        <input type="hidden" name="id" value="${user.id}"/>
                        <input type="hidden" name="balance" value="${user.balance}"/>
                        <table class="insert-tab" width="100%">
                            <tbody>
                            <tr>
                                <th><i class="require-red"></i>用户名：</th>
                                <td>
                                    <input class="common-text required" value="${user.userName}" id="nameByAdmin"
                                           name="userName" size="50" type="text">
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <i class="require-red"></i>密码：
                                </th>
                                <td>
                                    <input class="common-text required" value="${user.userPassword}" id="pwdByAdmin"
                                            name="userPassword" size="50"  type="text">
                                </td>
                            </tr>

                            <tr>
                                <th>
                                    <i class="require-red"></i>电话：
                                </th>
                                <td>
                                    <input class="common-text required" value="${user.tel}" id="telByAdmin"
                                           name="tel" size="50"  type="text">
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <input class="btn btn-primary btn6 m r10" id="addUser_buttonByAdmin" value="提交"
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
