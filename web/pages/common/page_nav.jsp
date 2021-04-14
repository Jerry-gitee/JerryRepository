<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="page_nav" align="center">
    <c:if test="${page.pageNo>1}">
        <a href="${page.url}&pageNo=1">首页</a>
        <a href="${page.url}&pageNo=${page.pageNo-1}">上一页</a>
    </c:if>
    <c:choose>
        <%--				当前页码小于5--%>
        <c:when test="${page.pageTotal<=5}">
            <c:forEach begin="1" end="${page.pageTotal}" var="i">
                <c:if test="${page.pageNo==i}">【${i}】</c:if>
                <c:if test="${page.pageNo!=i}">
                    <a href="${page.url}&pageNo=${i}">${i}</a>
                </c:if>
            </c:forEach>
        </c:when>
        <%--				当前页码大于5--%>
        <c:when test="${page.pageTotal>5}">

            <c:choose>
                <%--					当前页码为前面3个--%>
                <c:when test="${page.pageNo<=3}">
                    <c:forEach begin="1" end="5" var="i">
                        <c:if test="${page.pageNo==i}">【${i}】</c:if>
                        <c:if test="${page.pageNo!=i}">
                            <a href="${page.url}&pageNo=${i}">${i}</a>
                        </c:if>
                    </c:forEach>
                </c:when>
                <%--					当前页码为后3个时个--%>
                <c:when test="${page.pageNo > page.pageTotal-3}">
                    <c:forEach begin="${page.pageTotal-4}" end="${page.pageTotal}" var="i">
                        <c:if test="${page.pageNo==i}">【${i}】</c:if>
                        <c:if test="${page.pageNo!=i}">
                            <a href="${page.url}&pageNo=${i}">${i}</a>
                        </c:if>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <c:forEach begin="${page.pageNo-2}" end="${page.pageNo+2}" var="i">
                        <c:if test="${page.pageNo==i}">【${i}】</c:if>
                        <c:if test="${page.pageNo!=i}">
                            <a href="${page.url}&pageNo=${i}">${i}</a>
                        </c:if>
                    </c:forEach>
                </c:otherwise>
            </c:choose>

        </c:when>
    </c:choose>

    <c:if test="${page.pageNo<page.pageTotal}">
        <a href="${page.url}&pageNo=${page.pageNo+1}">下一页</a>
        <a href="${page.url}&pageNo=${page.pageTotal}">末页</a>
    </c:if>
    共${page.pageTotal}页,${page.pageTotalCount}条记录
    &nbsp;&nbsp;到第<input value="${param.pageNo}" style="width:30px;  text-align: center; " name="pn" id="pn_input"/>页
    <input id="searchPageBth"type="button" value="确定">
    <script type="text/javascript">
        $(function () {
            $("#searchPageBth").click(
                function () {
                    var pageNo=$("#pn_input").val();
                    location.href="${pageScope.href}${page.url}&pageNo="+pageNo;
                }
            );
        });
    </script>
</div>
