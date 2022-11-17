<%-- 
    Document   : manageStaff
    Created on : Oct 31, 2022, 9:05:35 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="../include/include_header.jsp"/>
    </head>
    <style>
   
        label {
            font-weight: bold;
        }
        .btnn {
            width: 100%;
            background-color: white;
            border: solid 1px #4b38b3;
            color: #4b38b3;
        }
        .btnn:hover {
            background-color: #4b38b3;
            color: white;
        }
        input, select {
            margin-bottom: 20px;
        }
        
    </style>
    <body>
        <div class="row">
            <div class="col-md-3">
                <jsp:include page="manage_nav.jsp" />
            </div>
            <div class="col-md-9" >
                <div>
                    <jsp:include page="admin_header.jsp" />
                    <div class="row" style="background-color: #fff; padding: 20px;min-height: 80vh; margin-right: 50px">
                        <div class="col-md-3"  style="border-right: 1px solid black">
                            <h3>Add new staff</h3>
                            <form action="createStaffAction" method="POST">
                                <label>Phone number</label>
                                <input class="form-control" type="text" name="txtUsername" value="" />
                                <label>Password</label>
                                <input class="form-control" type="password" name="txtPassword" value="" />
                                <label>Role</label>
                                <select class="form-select" name="roleId">
                                    <option value="2">
                                        Sale staff
                                    </option>
                                    <option value="3">
                                        Inventory staff
                                    </option>
                                    <option value="6">
                                        Creator
                                    </option>
                                </select>
                                <input class="btn btn-primary btnn" type="submit" value="Add" />
                            </form>
                            <c:if test="${not empty requestScope.ERROR}">
                                <div style="color: red">${requestScope.ERROR.duplicatedUsername}</div>
                                <div style="color: red">${requestScope.ERROR.passwordLengthError}</div>
                                <div style="color: red">${requestScope.ERROR.phoneNumberPatternError}</div>
                                <div style="color: red">${requestScope.ERROR.phoneNumberLengthError}</div>


                            </c:if>
                        </div>

                        <div class="col-md-9">
                            <h3 style="margin-bottom: 33px">Manage Staff Account</h3>
                            <table class="table table-striped">
                                <tr>
                                    <th>No. </th>
                                    <th>Name</th>
                                    <th>Phone</th>
                                    <th>Email</th>
                                    <th>Role</th>
                                    <th>View detail</th>
                                </tr>
                                <c:forEach items="${requestScope.STAFFS}" varStatus="counter" var="staff">
                                    <tr>
                                        <td>${counter.count}</td>
                                        <td>${staff.fullName} <c:if test="${empty staff.fullName}">unknown</c:if></td>
                                        <td>${staff.username}</td>
                                        <td>${staff.email}  <c:if test="${empty staff.email}">unknown</c:if></td>
                                        <c:if test="${staff.roleId == 2}">
                                            <td>Sale staff</td>
                                        </c:if>
                                        <c:if test="${staff.roleId == 3}">
                                            <td>Inventory staff</td>
                                        </c:if>
                                        <c:if test="${staff.roleId == 6}">
                                            <td>Creator</td>
                                        </c:if>
                                            <td><a class="btn btn-primary btnn" href="viewOrderOfStaff?id=${staff.username}">View</a></td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="../include/include_footer.jsp"/>
    </body>
</html>
