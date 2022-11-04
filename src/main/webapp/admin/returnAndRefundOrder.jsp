
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage orders</title>
        <jsp:include page="../include/include_header.jsp"/>
    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <div class="row">
            <jsp:include page="order-state-nav.html"/>
            <c:set var="orders" value="${requestScope.ORDERS}"/>
            <div class="col-md-10">
                <div class="order-container">
                    <div class="navigation row">
                        <div class="col">
                        <a href="viewAllOrderAction">All -> </a>
                        <a href="viewReturnAndRefundAction">Return/Refund</a>
                        </div>
                          <div class="dropdown col" style="text-align: right">
                            <button class="btn btn-secondary dropdown-toggle mt-1" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                                ${sessionScope.USER.fullName}
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                               
                                <li><a class="dropdown-item" href="#">Edit profile</a></li>
                                 <li><a class="dropdown-item" href="#">Logout</a></li>
                            </ul>
                        </div>
                    </div>
                    <c:if test="${not empty orders}">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Order ID</th>
                                    <th>Receiver</th>
                                    <th>Created</th>
                                    <th>Total</th>
                                    <th>Payment</th>
                                        <c:if test="${not empty orders[0].staffUsername}">
                                        <th>Staff username</th>
                                        </c:if>
                                    <th>Option</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="order" items="${orders}" varStatus="counter">
                                    <tr>
                                        <td>${counter.count}</td>
                                        <td>${order.orderId}</td>
                                        <td>${order.receiverName}</td>
                                        <td>
                                            <fmt:formatDate type = "both" 
                                                            dateStyle = "short" timeStyle = "short" value = "${order.orderTime}" />
                                        </td>
                                        <td><fmt:formatNumber value="${order.total}" type="currency"/></td>
                                        <td>${order.payment}</td>
                                        <c:if test="${not empty order.staffUsername}">
                                            <td>${order.staffUsername}</td>
                                        </c:if>
                                        <td><a style="color: #f85757" href="viewOrderDetailAction?id=${order.orderId}">View detail</a></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                    <c:if test="${empty orders}">
                        <p>No orders!</p>
                    </c:if>
                </div>
            </div>
        </div>
                            <jsp:include page="../include/include_footer.jsp"/>
    </body>
</html>
