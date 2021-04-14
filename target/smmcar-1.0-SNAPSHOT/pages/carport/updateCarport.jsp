<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>增加车位界面</title>
    <%@include file="/pages/common/head.jsp" %>
        <script type="text/javascript">
            $(function () {
                $("#area").find("option").each(function(){
                    if ($(this).val()=='${carport.area}'){
                        $(this).attr("selected",true);
                    }
                });
                $("#submit_button").click(function () {
                 if ($("#carport").val()==""){
                     alert('警告!!!, 请先输入车位号！');
                     return false;
                 }
                    $.ajax({
                        url:'carport/updateCarport',
                        type:'post',
                        dataType:'json',
                        data:$("#myform").serialize(),
                        success:function(result){
                            if (result!=null) {//用户名是存在
                                if (${empty carport}) {
                                    let b = confirm("添加成功，是否继续添加");
                                    if (!b) {
                                        window.location.href = result;
                                    } else {
                                        $(':input', '#myform')
                                            .not(':button, :submit, :reset, :hidden')
                                            .val('')
                                            .removeAttr('checked')
                                            .removeAttr('selected');
                                    }
                                }else {
                                    alert("修改成功");
                                    window.location.href=result;
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
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list">
                <span>${empty carport?"新增":"修改"}车位</span>
            </div>
            <div class="result-wrap">
                <div class="result-content">
                    <form id="myform" method="post" >
                        <input  type="hidden" name="pageNo" value="${empty carport.id?1024:pageNo}">
                        <input  type="hidden" name="id" value="${carport.id}">
                        <input  type="hidden" name="status" value="${carport.status}">
                        <input  type="hidden" name="car_number" value="${carport.car_number}">
                        <input  type="hidden" name="in_date" value="${carport.in_date}">
                        <table class="insert-tab" width="100%">
                            <tbody>
                            <tr>
                                <th><i class="require-red"></i>选择区域：</th>
                                <td>
                                    <select name="area" id="area" >
                                        <option value="A">A</option>
                                        <option value="B">B</option>
                                        <option value="C">C</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <i class="require-red"></i>车位号：
                                </th>
                                <td>
                                    <input class="common-text required"  placeholder="请输入车位号"
                                         id="carport" name="carport"  value="${carport.carport}"
                                           size="50"  type="text">
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <input class="btn btn-primary btn6 m r10" id="submit_button" value="提交"
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
