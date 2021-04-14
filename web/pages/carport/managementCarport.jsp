<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>车位管理界面</title>
    <%@include file="/pages/common/head.jsp" %>

    <script type="text/javascript">
        $(function () {
            $("a.link-delCarport").click(function () {
               var id=$(this).parent().parent().find("#carportId").text();
                $.ajax({
                    url:'carport/delUpdPrecondition',
                    type:'post',
                    dataType:'json',
                    data:{id:id},
                    success:function(result){
                        if (result=="no"){
                            alert("当前已有用户停在该车位上，请先联系用户挪车");
                        }
                        if (result=="ok"){
                            let b = confirm("你确定要删除id为:【"+id+"】的车位吗？");
                            if (b){
                                window.location.href="carport/deltetCarport?pageNo=${page.pageNo}&id="+id;
                            }
                        }
                        }
                 });
            });

            $("a.link-update").click(function () {
                var idu=$(this).parent().parent().find("#carportId").text();
                $.ajax({
                    url:'carport/delUpdPrecondition',
                    type:'post',
                    dataType:'json',
                    data:{id:idu},
                    success:function(result){
                        console.log(result);
                        if (result=="no"){
                            alert("当前已有用户停在该车位上，请先联系用户挪车");
                        }
                        if (result=="ok"){
                            window.location.href="carport/toUpdateCarportPage?pageNo=${page.pageNo}&id="+idu;
                        }
                    }
                });
            });
        });
    </script>
</head>
<body>
<jsp:include page="/pages/common/top.jsp"></jsp:include>
<jsp:include page="/pages/common/left.jsp"></jsp:include>
<!--/sidebar-->
<div class="main-wrap">

    <div class="crumb-wrap">
        <div class="crumb-list">
            <span class="crumb-name">车位管理</span>
        </div>
    </div>
    <div class="search-wrap">
        <div class="search-content">
            <form action="carport/toCarportPage" method="post">
                <table class="search-tab">
                    <tr>

                        <th width="150">
                            请输入车位号:
                        </th>
                        <td>
                            <input class="common-text" placeholder="关键字" name="carport"
                                   value=""  type="text">
                        </td>
                        <th width="50">
                            区域:
                        </th>
                        <td>
                            <input class="common-text" placeholder="关键字" name="area"
                                   value=""  type="text">
                        </td>
                        <td>
                            <input class="btn btn-primary btn2" name="sub" value="查询"
                                   type="submit">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <div class="result-wrap">
        <form name="myform" id="myform" method="post">
            <div class="result-title">
                <div class="result-list">

                </div>
            </div>
            <div class="result-content">
                <a href="carport/toUpdateCarportPage?pageNo=${page.pageTotal+1}" style="font-size: 17px">&nbsp;&nbsp;新增车位</a>
                <table class="result-tab" width="100%">
                    <tr>
                        <td>ID</td>
                        <td>区域</td>
                        <td>车位号</td>
                        <td>状态</td>
                        <td>车牌号</td>
                        <td>操作</td>
                    </tr>
                    <c:forEach items="${page.items}" var="carport">
                    <tr>
                        <td id="carportId">${carport.id}</td>
                        <td>${carport.area}</td>
                        <td>${carport.carport}</td>
                        <td>${carport.status}</td>
                        <td>${carport.car_number}</td>
                        <td>
                            <a class="link-update">修改</a>
                            <a class="link-delCarport">删除</a>
                        </td>
                    </tr>
                    </c:forEach>
                </table>
                <%@include file="/pages/common/page_nav.jsp"%>
                <div class="list-page">

                </div>
            </div>
        </form>
    </div>
</div>
<!--/main-->
</div>
</body>
</html>
