<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
    function setMenu(obj){
        var objul=document.getElementById("menu"+obj)
        if(objul.style.display=="none"){
            objul.style.display="";
        }else{
            objul.style.display="none";
        }

        return false;
    }
</script>
<div class="sidebar-wrap">
        <div class="sidebar-title">
            <h1>菜单</h1>
        </div>
        <div class="sidebar-content">
            <ul class="sidebar-list">
                <li>
                    <a href="pages/loginAndRegister/index.jsp">首页</a>
                </li>
            <!--如果选择的是管理员，页面为一下布局  -->
               <c:if test="${!sessionScope.type.equals('user')}">
                <li>
                    <a  onclick="setMenu(1)" >系统管理</a>
                    <ul class="sub-menu" id="menu1" style="display: none">
                        <li><a href="admin/toManagementAdminPage" >管理员管理</a></li>
                         <li><a href="user/toManagementUserPage" >用户管理</a></li>
                    </ul>
                </li>
                <li>
                    <a onclick="setMenu(2)" >车位管理</a>
                    <ul class="sub-menu" id="menu2" style="display: none">
                        <li><a href="car/toAdminLookCarPage">查看用户车辆信息</a></li>
                        <li><a href="carport/toCarportPage" >车位管理</a></li>
                        <li><a href="carFare/toCarFarePage">车费标准</a></li>
                        <li><a href="parkingRecord/toParkRecordPage">查看停车记录</a></li>
                    </ul>
                </li>
               </c:if>
               <!-- 如果是用户，显示一下菜单信息 -->
               <c:if test="${sessionScope.type.equals('user')}">
                
                <li>
                    <a onclick="setMenu(3)" >个人信息管理</a>
                    <ul class="sub-menu" id="menu3" style="display: none">
                        <li><a href="pages/user/updateUser.jsp">修改个人信息</a></li>
                        <li><a href="pages/user/recharge.jsp">充值</a></li>
                    </ul>
                </li>
                <li>
                    <a onclick="setMenu(4)" >系统使用</a>
                    <ul class="sub-menu" id="menu4" style="display: none">
                        <li><a href="car/toManagementCarPage?userId=${sUser.id}">车辆信息</a></li>
                        <li><a href="carport/toCarportPage" >查看车位信息</a></li>
                        <li><a href="carFare/toCarFarePage" >查看停车收费标准</a></li>
                        <li><a href="parkingRecord/toParkRecordPage?userId=${sUser.id}">我的停车记录</a></li>
                    </ul>
                </li>
               </c:if> 
              
            </ul>
        </div>
    </div>

