<%-- 
    Document   : staffOrders.jsp
    Created on : Nov 2, 2022, 4:17:03 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Staff</title>
        <jsp:include page="../include/include_header.jsp"/>
    </head>
    <style>
        ul {
            list-style: none;
            line-height: 50px;
        }
        span {
            display: inline-block;
            min-width: 80px;
            font-weight: bold;

        }
        #back {
            margin: 0 !important;
            height: 10px;
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
            <!--<a id="back" href="manageStaffController">Back</a>-->
            <div class="col-md-9">
                <jsp:include page="admin_header.jsp" />
                <div class="row" style="background-color: #fff; padding: 20px;min-height: 80vh;margin-right: 50px">
                    <div class="col-md-8" style="border-right: solid 1px black">
                        <h3>Staff information</h3>
                        <ul>
                            <li>
                                <span>Name:</span> ${requestScope.USER.fullName}
                                <c:if test="${empty requestScope.USER.fullName}">unknown</c:if>
                            </li>
                            <li><span>Phone:</span> ${requestScope.USER.username}
                            </li>
                            <li><span>Email:</span> ${requestScope.USER.email}
                                <c:if test="${empty requestScope.USER.email}">unknown</c:if>
                            </li>
                            <li><span>Address:</span> ${requestScope.USER.address}
                                <c:if test="${empty requestScope.USER.address}">unknown</c:if>
                            </li>
                            <li><span>Gender:</span> ${requestScope.USER.gender}
                                <c:if test="${empty requestScope.USER.gender}">unknown</c:if>
                            </li>
                            <li><span>Role: </span>
                                <c:if test="${requestScope.USER.roleId == 2}">
                                    Sale staff
                                </c:if>
                                <c:if test="${requestScope.USER.roleId == 3}">
                                    Inventory staff
                                </c:if>
                                <c:if test="${requestScope.USER.roleId == 6}">
                                    Creator
                                </c:if>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-4">
                        <h3>Change role</h3>
                        <form action="changeStaffRoleAction" method="POST">
                            <select class="form-select" name="roleId">
                                <option value="2"  <c:if test="${requestScope.USER.roleId == 2}">
                                        selected
                                    </c:if>>
                                    Sale staff
                                </option>
                                <option value="3"<c:if test="${requestScope.USER.roleId == 3}">
                                        selected
                                    </c:if> >
                                    Inventory staff
                                </option>
                                <option value="6" <c:if test="${requestScope.USER.roleId == 6}">
                                        selected
                                    </c:if>>
                                    Creator
                                </option>
                            </select>
                            <input type="hidden" name="txtUsername" value="${requestScope.USER.username}" />
                            <input class="btn btn-primary btnn" type="submit" value="Change" />
                        </form>
                        <h3>Update password</h3>
                        <form action="changStaffPasswordAction" method="POST">
                            <input class="form-control" type="password" name="txtPassword" value="" />
                            <input type="hidden" name="txtUsername" value="${requestScope.USER.username}" />
                            <input class="btn btn-primary btnn"type="submit" value="Update" />
                        </form>
                        <c:if test="${not empty requestScope.ERROR}">
                            <div style="color: red">${requestScope.ERROR.passwordLengthError}</div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <jsp:include page="../include/include_footer.jsp"/>
</body>
</html>
