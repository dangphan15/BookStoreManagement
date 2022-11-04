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
    <body>
        <div class="row">
            <div class="col-md-2">
                <jsp:include page="manage_nav.jsp" />
            </div>
            <div class="col-md-10">
                <table>
                    <tr>
                        <th>No. </th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>View orders</th>
                    </tr>
                    <c:forEach items="${requestScope.STAFFS}" varStatus="counter" var="staff">
                        <tr>
                            <td>${counter.count}</td>
                            <td>${staff.fullName}</td>
                            <td>${staff.email}</td>
                            <td><a href="viewOrderOfStaff?id=${staff.username}">View</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        <jsp:include page="../include/include_footer.jsp"/>
    </body>
</html>
