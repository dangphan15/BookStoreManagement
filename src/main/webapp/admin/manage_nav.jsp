<%-- 
    Document   : manage_nav
    Created on : Nov 4, 2022, 7:15:46 AM
    Author     : PC
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    body {
        background-color: #f2f2f7;
        overflow-y: scroll;
        overflow-x: hidden;
    }
    .navv {
        background-color: #fff;
        
/*       background: rgb(21,21,41);
background: linear-gradient(0deg, rgba(21,21,41,1) 70%, rgba(164,143,147,1) 100%);*/
        height: 100%;
        min-height: 100vh;
        width: 80%;
        box-shadow: 1px 0px 2px 0px rgb(151,144,144);
    }
    .logo-nav {
        display: block;
        margin-left: 20px;
        height:  110px;
        margin-bottom: 40px;
    }
    .navv ul {
        list-style: none;
    }
    .navv ul li {
        display: block;
        width: 100%;
        margin-bottom: 30px;
    }
    .navv ul li i {
        width: 15%;
        font-size: 110%;
    }
    .navv ul li a {
        text-decoration: none;
        font-size: 120%;
        color: #7c7f90;
    }
    .choosed {
        color: #4b38b3 !important;
    }
   
</style>
<div class="navv">
    <a class="logo-nav" href="./">
        <img src="../img/logo1.png" alt="web-logo" style="width: 200px; height: 110px;object-fit: cover;">
    </a>
    <ul>
        <li> <a href="adminDashboardAction" 
                <c:if test="${not empty requestScope.LABEL1}">class="choosed"</c:if>
                > <i class="fa-solid fa-gauge"></i> Dashboard</a></li>
        <li><a href="viewFinancialStatisticsAction"
               <c:if test="${not empty requestScope.LABEL}">class="choosed"</c:if>
               ><i class="fa-solid fa-coins"></i>Financial Statistics</a></li>
        <li><a href="manageStaffController"
               <c:if test="${not empty requestScope.STAFFS}">class="choosed"</c:if>
               > <i class="fa-solid fa-clipboard-user"></i>Staff Account</a></li>
        <li><a href="../searchBookController"><i class="fa-solid fa-money-bill"></i>Update price</a></li>
    </ul>
</div>
