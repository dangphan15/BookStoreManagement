<%-- 
    Document   : manage_nav
    Created on : Nov 4, 2022, 7:15:46 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div>
    <div>
        ${sessionScope.USER.fullName}
        <a href="../userInformation">Update profile</a>
        <a href="../logoutAction">Logout</a>
    </div>
    <a href="viewFinancialStatisticsAction">View Financial Statistics</a><br>
    <a href="viewImportStatisticAction">View import statistics</a><br>
    <a href="manageStaffController">Manage staff</a>
</div>
