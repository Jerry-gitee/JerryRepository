<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员页面</title>
    <%@include file="/pages/common/head.jsp" %>
    <script type="text/javascript">
        $(function () {
            $("#adminName").blur(function () {
                //获取到用户输入的值
                let name = this.value;
                //如果用户名不等于当前的用户名在去数据库中找是否存在用户，防止判断自己的情况！！
                    //转发到userServlet并调用ajaxExistsUsername方法判断用户名是否存在
                    $.post("admin/existsName","name=" + name,function (data) {//回调函数，
                        console.log(data);
                        if (data[0]) {//用户名是存在
                            alert('警告!!!,用户名已存在,请重新输入');
                            //将输入框中的值设置为空
                            $("#adminName").val('');
                        }
                    });
            });
            $("#updateAdmin_button").click(function () {
                if ($("#adminName").val() == "") {
                    alert('警告!!!,姓名不能为空！');
                    return false;
                }
                if ($("#adminPwd").val() == "") {
                    alert('警告!!!, 密码不能为空！');
                    return false;
                }
                $.ajax({
                    url:'admin/addAdmin',
                    type:'post',
                    dataType:'json',
                    data:$("#myform").serialize(),
                    success:function(result){
                        console.log(result);
                        if (result!=null) {//用户名是存在
                            let b = confirm("添加成功，是否继续添加");
                            if (!b){
                                window.location.href=result;
                            }else{
                                $(':input','#myform')
                                    .not(':button, :submit, :reset, :hidden')
                                    .val('')
                                    .removeAttr('checked')
                                    .removeAttr('selected');
                            }
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
    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list">
                <span>新增管理员</span>
            </div>
        </div>
        <div class="result-wrap">
            <div class="result-content">
                <form method="post" id="myform" name="myform">
                    <table class="insert-tab" width="100%">
                        <tbody>
                        <tr>
                            <th><i class="require-red">*</i>管理员名称：</th>
                            <td>
                                <input class="common-text required" id="adminName" placeholder="请输入管理员名称"
                                       name="adminName" size="50" value="" type="text">
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <i class="require-red"></i>密码：
                            </th>
                            <td>
                                <input class="common-text required" value="" id="adminPwd" placeholder="请输入新密码"
                                       name="adminPassword" size="50" type="password">
                            </td>
                        </tr>
                        <tr>
                            <th></th>
                            <td>
                                <input class="btn btn-primary btn6 mr10" id="updateAdmin_button" value="提交"
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
