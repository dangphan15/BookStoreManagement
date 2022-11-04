<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order detail</title>
        <jsp:include page="include/include_header.jsp"></jsp:include>
            <style>
                .status-title {
                    width: 14.2%;
                    text-align: center;
                    border-bottom: solid 1px black;
                    padding-bottom: 10px;
                    padding-top: 10px;
                    cursor: pointer;
                    margin-top: 10px;
                    text-decoration: none;
                    color: black;
                    font-size: 120%;
                }

                .status-title-checked {
                    color: #f85b2b;
                    font-weight: bold;
                    border-bottom: solid 3px #f85b2b;
                }

                .oder-container {
                    margin-top: 20px;
                    min-height: 80vh;
                    border-radius: 15px;
                    padding-top: 30px;
                    padding-bottom: 30px;
                }

                .order-row {
                    width: 80%;
                    margin-left: 50%;
                    transform: translateX(-50%);
                    margin-bottom: 20px;
                }

                .order-item {
                    display: block;
                    width: 80%;
                    padding-top: 20px;
                    border: 1px solid gray;
                    padding-left: 10px;
                    padding-right: 10px;
                    margin-top: 20px;
                    border-radius: 10px;
                }

                #no-orders {
                    font-size: 70%;
                    text-align: center;
                    margin-top: 150px;
                }
                .button {
              
                    background: rgba(242,73,74,1);
                    color: white;
                    border-radius: 5px;
                    padding-left: 1rem;
                    padding-right: 1rem;
                    padding-top: 0.5rem;
                    padding-bottom: 0.5rem;
                    text-decoration: none;
                    border: solid 1px rgba(242,73,74,1);
                }
                .button:hover {
                    color: rgba(242,73,74,1);
                    background: white;
                    
                }
                .button-minor {
                    color: rgba(242,73,74,1);
                    background: white;
                    
                }
                .status {
                    text-transform: uppercase;
                    font-weight: bolder;
                    margin-left: 5px;
                    color: #8cff32;
                }
            </style>
        </head>

        <body style="background: linear-gradient(0deg, rgba(255, 244, 247, 0.4) 0%,
              rgba(255, 244, 247, 0.4) 100%,
              rgba(255, 244, 247, 0.4) 100%),
              url('img/background_searchpage.jpg');
              background-repeat: no-repeat;
              background-size: cover;
              background-attachment: fixed;">
        <%@include file="header.jsp" %>



        <c:set var="orderHistory" value="${requestScope.ORDER_HISTORY}" />

        <div class="container bg-white oder-container">
            <div class="text-center fw-bold" style="font-size: 2rem">
                Order History
            </div>
            <div class="d-flex flex-row order-row">
                <a class="status-title
                   <c:if test="${empty param.status}"> status-title-checked</c:if>
                       " href="viewOrderHistory">All</a>
                   <a class="status-title
                   <c:if test="${param.status eq 'To Confirm'}"> status-title-checked</c:if>
                       " href="viewOrderHistory?status=To%20Confirm">To Confirm</a>
                   <a class="status-title
                   <c:if test="${param.status eq 'To Ship'}"> status-title-checked</c:if>
                       " href="viewOrderHistory?status=To%20Ship">To Ship</a>
                   <a class="status-title
                   <c:if test="${param.status eq 'To Receive'}"> status-title-checked</c:if>
                       " href="viewOrderHistory?status=To%20Receive">To Receive</a>
                   <a class="status-title
                   <c:if test="${param.status eq 'Completed'}"> status-title-checked</c:if>
                       " href="viewOrderHistory?status=Completed">Completed</a>
                   <a class="status-title
                   <c:if test="${param.status eq 'Cancelled'}"> status-title-checked</c:if>
                       " href="viewOrderHistory?status=Cancelled">Cancelled</a>
                   <a class="status-title
                   <c:if test="${param.status eq 'Return/Refund'}"> status-title-checked</c:if>
                       " href="viewOrderHistory?status=Return%2FRefund">Return/Refund</a>
                </div>

            <c:if test="${not empty orderHistory}">
                <div class="d-flex flex-column align-items-center">
                    <c:forEach var="order" items="${orderHistory}">
                        <c:set var="books" value="${order.books}" />
                        <div class="ms-5 me-5 order-item">
                            <div class="row">
                                
                                <div class="col">
                                    <span class="status">${order.status}</span>
                                </div>
                                <div class="col">
                                    <span>${order.orderTime}</span> 
                                </div>
                                <div class="col text-end">
                                    <c:if test="${order.status eq 'To Confirm'}">
                                        <a href="viewCancelOrderPage?id=${order.id}" class="button button-minor">Cancel order</a>
                                    </c:if>
                                    <c:url var="viewDetail" value="viewDetailOrder">
                                        <c:param name="orderId" value="${order.id}" />
                                    </c:url>
                                    <a href="${viewDetail}" class="button">View Detail</a>
                                </div>
                            </div>
                            <hr>
                            <table class="table table-borderless">
                                <thead>
                                    <tr>
                                        <th style="width: 640px">Book name</th>
                                        <th>Quantity</th>
                                        <th>Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="book" items="${books}">

                                        <tr>
                                            <td>${book.name}</td>
                                            <td>${book.quantity}</td>
                                            <td style="color: #F2494A; font-size: 1.1rem; font-weight: bold">
                                                <fmt:formatNumber value="${book.price}" type="currency" />
                                            </td>
                                        </tr>

                                    </c:forEach>


                                    <tr>
                                        <td colspan="2" class="text-end">
                                            <span style="font-weight: bolder">Total:</span>
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
                    </c:forEach>
                </div>
            </c:if>
            <c:if test="${empty orderHistory}">
                <div id="no-orders">
                    <h1>No orders yet</h1>

                </div>
            </c:if>
        </div>


        <%@include file="footer.html" %>
        <jsp:include page="include/include_footer.jsp"></jsp:include>

    </body>

</html>