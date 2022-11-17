<%-- 
    Document   : cancelOrder
    Created on : Oct 18, 2022, 9:31:59 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cancel order</title>
    <jsp:include page="include/include_header.jsp"></jsp:include>
</head>
<body style="background: linear-gradient(0deg, rgba(255, 244, 247, 0.4) 0%,
              rgba(255, 244, 247, 0.4) 100%,
              rgba(255, 244, 247, 0.4) 100%),
              url('img/background_searchpage.jpg');
              background-repeat: no-repeat;
              background-size: cover;
              background-attachment: fixed;">
<%@include file="header.jsp" %>
<div class="container mt-5 mb-5 pt-4 pb-5" style="background: white; max-width: 1000px!important; border-radius: 15px; margin-bottom: 270px !important; padding-right: 120px; padding-left: 120px">
    <div class="row" style="font-size: 120%; margin-bottom: 30px">
        <a href="viewOrderHistory?status=To%20Confirm" style="color:#f85b2b ">Back</a>
    </div>
    <h2 style="text-align: center">
        Confirm before <span style="color: #f85b2b">canceling</span>
    </h2>

    <c:set var="order" value="${requestScope.ORDER}"></c:set>
    <div class="p-3 mt-3 mb-3" style="border: 1px solid lightgray; border-radius: 10px">
        <div class="row">
            <div style="font-weight: bold" class="col">${order.receiverName}</div>
            <div class="col">${order.orderTime}</div>
            <div style="color: saddlebrown; font-weight: bold" class="col text-center">${order.payment}</div>
        </div>
        <hr style="color:rgba(242,73,74,1) "/>
        <table class="table table-borderless">
            <thead>
            <tr>
                <th style="width: 620px">Book name</th>
                <th style="width: 100px">Quantity</th>
                <th>Price</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="orderBook" items="${requestScope.ORDER_BOOK_LIST}">
                <tr >
                    <td >${orderBook.name}</td>
                    <td >${orderBook.quantity}</td>
                    <td style="color: #F2494A; font-size: 1.1rem; font-weight: bold"><fmt:formatNumber value="${orderBook.price}" type="currency" /></td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="2" class="text-end ">
                    <span style="font-weight: bolder; font-size: 18px; padding-right: 12px">Total:</span>
                </td>
                <td>
                      <span style="color: #F2494A; font-size: 1.1rem; font-weight: bold">
                      <fmt:formatNumber value="${order.total}" type="currency" />
                      </span>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <form action="cancelOrderActionByUser" method="POST">
        <div class="row">
            <div class="col-lg-10">
                <select class="form-select" name="reason" aria-label="reason">
                    <option selected >Want to change shipping address</option>
                    <option>Want to change the number of products in the order</option>
                    <option>The payment procedure is too complicated</option>
                    <option>Find cheaper prices elsewhere</option>
                    <option>Change my mind, don't want to buy anymore</option>
                </select>
            </div>
            <div class="col-lg-2 text-end">
                <input type="hidden" name="id" value="${order.orderId}"/>
                <input class="btn btn-danger" type="submit" value="Confirm"/>
            </div>

        </div>


    </form>
</div>


<%@include file="footer.html" %>
<jsp:include page="include/include_footer.jsp"></jsp:include>
</body>
</html>
