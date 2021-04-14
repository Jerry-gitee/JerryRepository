<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/16 0016
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>充值</title>
    <%@include file="/pages/common/head.jsp" %>
    <script>
        $(function () {
            $("#recharge_id").blur(function () {
                let rechargeAmount = $("#recharge_id").val();
                //输入的充值金额的整数部分，不以0开头可以有1-无穷位，以0开头只能有一位，小数部分0-2为小数
                var rechargeAmount_Patt = /^(([1-9]{1}\d*)|(0{1}))(\.\d{1,2})?$/;

                if (rechargeAmount!=''){//不为空，说明用户已经输入数据，防止用户没有输入数据，也提示错误的情况
                    if (!rechargeAmount_Patt.test(rechargeAmount)) {//不合法
                        //提示用户
                        alert('警告!!! 输入的金额不合法,请重新输入。本系统的充值金额最多可以有两位小数。整数部分若0开头只能有一位');
                        //将输入框中的值设置为空
                        $("#recharge_id").val('');
                    }}
            });
            //给提交按钮绑定点击事件
$("#recharge_button").click(function () {
    if ( $("#recharge_id").val()==""){
        alert("请输入充值金额！！！")
        return false;
    }
    if ( $("#recharge_id").val()<=0){
        alert("充值金额必须大于0！！！")
        return false;
    }
    $.ajax({
        url:'user/${empty id?"userRecharge":"adminRecharge"}',
        type:'post',
        dataType:'json',
        data:$("#myform").serialize(),
        success:function(result){
            console.log(result);
            if (result!=null) {//用户名是存在
                let b = confirm("充值成功。是否继续充值。");
                if (!b){
                    window.location.href=result;
                }else {
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
               <span>充值</span>
            </div>
        </div>
        <div class="result-wrap">
            <div class="result-content">
                <form method="post" id="myform" name="myform" >
                    <table class="insert-tab" width="100%">
                        <tbody>
                        <tr>
                            <th><i class="require-red">*</i>金额：</th>
                            <td>
                                <input class="common-text required" size="50" name="recharge_amount"
                                       id="recharge_id"  type="text" >
                                <input type="hidden" name="id" value="${empty id?sUser.id:id}">
                                <input type="hidden" name="pageNo" value="${pageNo}">
                            </td>
                        </tr>
                        <tr>
                            <th></th>
                            <td>
                                <input class="btn btn-primary btn6 mr10" id="recharge_button" value="提交" type="button">
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
