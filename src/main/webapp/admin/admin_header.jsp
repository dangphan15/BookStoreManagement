<%-- 
    Document   : admin_header
    Created on : Nov 14, 2022, 1:14:19 PM
    Author     : PC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .admin-header {
        text-align: right;
        margin-right: 50px;
    }
    .user-group {
        margin-bottom: 10px;
    }
    .admin-header h1 {
        font-size: 200%;
        text-decoration: underline;
        color: #7c7f90;
        margin-bottom: 20px;
    }
</style>
<div class="admin-header">
    <div class="dropdown user-group" style="text-align: right; ">
        <button class="btn btn-staff  dropdown-toggle" type="button" id="dropdownMenuButton"
                data-bs-toggle="dropdown" aria-expanded="false">
            <i class="fa-regular fa-user"></i> ${sessionScope.USER.fullName}
        </button>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">

            <li><a class="dropdown-item" href="../userInformation">Edit profile</a></li>
            <li><a class="dropdown-item" href="../logoutAction">Logout</a></li>
        </ul>
           
    </div>
         <c:if test="${not empty requestScope.LABEL1}"><h1>Dashboard</h1></c:if>
          <c:if test="${not empty requestScope.LABEL}"><h1>Financial statistics</h1></c:if>
          <c:if test="${not empty requestScope.STAFFS}"><h1>Manage staff account</h1></c:if>
</div>