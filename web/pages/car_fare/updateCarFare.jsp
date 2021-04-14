<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>修改车费标准界面</title>
    <%@include file="/pages/common/head.jsp" %>
<script type="text/javascript">
    $(function () {
     $("#cfButton").click(function () {
         $.ajax({url:'carFare//updateCarFare',
             type:'post',
             dataType:'json',
             data:$("#myform").serialize(),
             success:function (result) {
             if (result=='ok'){
                 alert("修改成功");
             }else {alert("修改失败")}
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
                <i class="icon-font"></i><span>停车费标准</span>
            </div>
        </div>
        <div class="result-wrap">
            <div class="result-content">
                <form  method="post" id="myform" name="myform" >
                    <table class="insert-tab" width="100%">
                        <tbody>
                        <tr>
                            <th><i class="require-red">*</i>车费：</th>
                            <td>
                                <input class="common-text required"  value='${carFare.price}' name="price"
                                       size="5"  type="text">元/小时
                            </td>
                        </tr>
                        <tr>
                            <th></th>
                            <td>
                                <input class="btn btn-primary btn6 mr10"  id="cfButton" value="修改" type="button">
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