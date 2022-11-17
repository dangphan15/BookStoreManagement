<%-- Document : orderDetail Created on : Sep 22, 2022, 10:50:04 PM Author : QuanMX --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<fmt:setLocale value="vi_VN"/>

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order detail</title>
        <jsp:include page="include/include_header.jsp"></jsp:include>
            <style>
                .order-tracking {
                    text-align: center;
                    width: 20%;
                    position: relative;
                    display: block;
                }
                .order-tracking-1 {
                    text-align: center;
                    width: 50%;
                    position: relative;
                    display: block;
                }
                .order-tracking-2 {
                    text-align: center;
                    width: 50%;
                    position: relative;
                    display: block;
                }
                .order-tracking .is-complete,
                .order-tracking-2 .is-complete,
                .order-tracking-1 .is-complete {
                    display: block;
                    position: relative;
                    border-radius: 50%;
                    height: 40px;
                    width: 40px;
                    border: 3px solid #f85b2b;
                    /*background-color: #f85b2b;*/
                    margin: 0 auto;
                    transition: background 0.25s linear;
                    -webkit-transition: background 0.25s linear;
                    z-index: 2;
                }
                .order-tracking .is-complete:after,
                .order-tracking-2 .is-complete:after {
                    display: block;
                    position: absolute;
                    content: '';
                    height: 14px;
                    width: 7px;
                    top: -2px;
                    bottom: 0;
                    left: 5px;
                    margin: auto 0;
                    border: 0px solid #AFAFAF;
                    border-width: 0px 2px 2px 0;
                    transform: rotate(45deg);
                    opacity: 0;
                }
                .order-tracking.completed .is-complete,
                .order-tracking-2.completed .is-complete,
                .order-tracking-1.completed .is-complete {
                    border-color: #27aa80;
                    border-width: 0px;
                    background-color: #27aa80;
                }
                .order-tracking.completed .is-complete:after,
                .order-tracking-2.completed .is-complete:after {
                    border-color: #fff;
                    border-width: 0px 3px 3px 0;
                    width: 8px;
                    left: 16px;
                    opacity: 1;
                }
                .order-tracking-1 .is-complete:after {
                    display: block;
                    position: absolute;
                    content: '\d7';
                    top: -32px;
                    bottom: 0;
                    left: 5px;
                    margin: auto 0;
                    font-size: 30px;
                    color: #FFF;
                    line-height: 100px;
                    text-align: center;
                }
                .order-tracking-1.completed .is-complete:after {
                    border-color: #fff;
                    border-width: 0px 3px 3px 0;
                    width: 8px;
                    left: 11px;
                    opacity: 1;
                }
                .order-tracking p,
                .order-tracking-2 p,
                .order-tracking-1 p {
                    color: #A4A4A4;
                    font-size: 16px;
                    margin-top: 8px;
                    margin-bottom: 0;
                    line-height: 20px;
                }
                .order-tracking p span,
                .order-tracking-2 p span,
                .order-tracking-1 p span {
                    font-size: 14px;
                }
                .order-tracking.completed p,
                .order-tracking-2.completed p,
                .order-tracking-1.completed p {
                    color: #000;
                }
                .order-tracking::before {
                    content: '';
                    display: block;
                    height: 3px;
                    width: calc(100% - 40px);
                    background-color: rgba(248, 91, 43, 0.7);
                    top: 20px;
                    position: absolute;
                    left: calc(-50% + 20px);
                    z-index: 0;
                }
                .order-tracking-2::before,
                .order-tracking-1::before {
                    content: '';
                    display: block;
                    height: 3px;
                    /*width: calc(100% + 640px);*/
                    width: calc(100% - 40px);
                    background-color: rgba(248, 91, 43, 0.7);
                    top: 20px;
                    position: absolute;
                    /*right: calc(0% + 80px);*/
                    left: calc(-50% + 20px);
                    z-index: 0;
                }
                .order-tracking:first-child:before,
                .order-tracking-2:first-child:before,
                .order-tracking-1:first-child:before {
                    display: none;
                }
                .order-tracking.completed:before,
                .order-tracking-2.completed:before,
                .order-tracking-1.completed:before {
                    background-color: #27aa80;
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
        <jsp:include page="header.jsp"></jsp:include>
        <c:set var="orderDto" value="${requestScope.ORDER_INFOR}"/>
        <c:set var="books" value="${requestScope.BOOKS}"/>
        <div class="container mt-5 mb-5 p-5" style="background:rgba(255,255,255,0.9); border-radius: 20px; max-width: 1000px ">
            <c:if test="${orderDto.status == 'Completed'}">
                <div class="row p-5 mb-3"
                     style="border-radius:10px;background-color: rgba(39,170,128,0.6); margin-right: auto; margin-left: auto">
                    <div class="col text-center">
                        <h4>Your order has completed</h4>
                        <span>Thank you for shopping at Mangasa!!</span>
                    </div>
                    <div class="col text-end">
                        <i class="fa-light fa-hand-holding-box fa-3x"></i>
                    </div>

                </div>
            </c:if>
            <div class="mb-3" style="border:1px solid gainsboro; border-radius: 10px">
                <div class="text-end p-2 pe-5" style="background-color: rgba(221,221,221,0.5) ">
                    <span class="fst-italic">ORDER ID:</span>
                    <strong>${orderDto.getOrderId()}</strong>
                    <div class="vr ms-2 me-2 mb-auto"></div>
                    <c:if test="${orderDto.status == 'Return/Refund' || orderDto.status == 'Cancelled'}">
                        <span class="fw-bolder"
                              style="text-transform: uppercase; color: rgba(248, 91, 43, 1)">${orderDto.status}</span>
                    </c:if>
                    <c:if test="${!(orderDto.status == 'Return/Refund' || orderDto.status == 'Cancelled')}">
                        <span class="fw-bolder"
                              style="text-transform: uppercase; color: #27aa80">${orderDto.status}</span>
                    </c:if>


                </div>
                <div class="row justify-content-between  pt-5 pb-5 mb-3" style="margin-left: auto; margin-right: auto">

                    <c:if test="${orderDto.status == 'Cancelled'}">

                        <div class="order-tracking-2 completed">
                            <span class="is-complete"></span>
                            <strong><br>Order Placed<br></strong>
                        </div>
                        <div class="order-tracking-1 completed">
                            <span class="is-complete"></span>
                            <strong><br>Cancelled<br></strong>
                        </div>

                    </c:if>
                    <c:if test="${orderDto.status == 'Return/Refund'}">

                        <div class="order-tracking-2 completed">
                            <span class="is-complete"></span>
                            <strong><br>Order Placed<br></strong>
                        </div>
                        <div class="order-tracking-1 completed">
                            <span class="is-complete"></span>
                            <strong><br>Return/Refund<br></strong>
                        </div>

                    </c:if>
                    <c:if test="${orderDto.status == 'To Confirm'}">

                        <div class="order-tracking completed">
                            <span class="is-complete"></span>
                            <strong><br>Order Placed<br></strong>
                        </div>
                        <div class="order-tracking completed">
                            <span class="is-complete"></span>
                            <strong><br>To Confirm<br></strong>
                        </div>
                        <div class="order-tracking">
                            <span class="is-complete"></span>
                            <p><br>To Ship<br></p>
                        </div>
                        <div class="order-tracking">
                            <span class="is-complete"></span>
                            <p><br>To Receive<br></p>
                        </div>
                        <div class="order-tracking ">
                            <span class="is-complete"></span>
                            <p><br>Completed<br></p>
                        </div>

                    </c:if>
                    <c:if test="${orderDto.status == 'To Ship'}">

                        <div class="order-tracking completed">
                            <span class="is-complete"></span>
                            <strong><br>Order Placed<br></strong>
                        </div>
                        <div class="order-tracking completed">
                            <span class="is-complete"></span>
                            <strong><br>To Confirm<br></strong>
                        </div>
                        <div class="order-tracking completed">
                            <span class="is-complete"></span>
                            <strong><br>To Ship<br></strong>
                        </div>
                        <div class="order-tracking">
                            <span class="is-complete"></span>
                            <p><br>To Receive<br></p>
                        </div>
                        <div class="order-tracking">
                            <span class="is-complete"></span>
                            <p><br>Completed<br></p>
                        </div>

                    </c:if>
                    <c:if test="${orderDto.status == 'To Receive'}">

                        <div class="order-tracking completed">
                            <span class="is-complete"></span>
                            <strong><br>Order Placed<br></strong>
                        </div>
                        <div class="order-tracking completed">
                            <span class="is-complete"></span>
                            <strong><br>To Confirm<br></strong>
                        </div>
                        <div class="order-tracking completed">
                            <span class="is-complete"></span>
                            <strong><br>To Ship<br></strong>
                        </div>
                        <div class="order-tracking completed">
                            <span class="is-complete"></span>
                            <strong><br>To Receive<br></strong>
                        </div>
                        <div class="order-tracking ">
                            <span class="is-complete"></span>
                            <p><br>Completed<br></p>
                        </div>

                    </c:if>
                    <c:if test="${orderDto.status == 'Completed'}">

                        <div class="order-tracking completed">
                            <span class="is-complete"></span>
                            <strong><br>Order Placed<br></strong>
                        </div>
                        <div class="order-tracking completed">
                            <span class="is-complete"></span>
                            <strong><br>To Confirm<br></strong>
                        </div>
                        <div class="order-tracking completed">
                            <span class="is-complete"></span>
                            <strong><br>To Ship<br></strong>
                        </div>
                        <div class="order-tracking completed">
                            <span class="is-complete"></span>
                            <strong><br>To Receive<br></strong>
                        </div>
                        <div class="order-tracking completed">
                            <span class="is-complete"></span>
                            <strong><br>Completed<br></strong>
                        </div>

                    </c:if>
                </div>
                <div class="row p-3"
                     style="border-top: 1px solid rgba(217,217,217,0.87); margin-left: auto; margin-right: auto">
                    <div class="col">
                        <span><strong>Receiver name: </strong>${orderDto.receiverName}</span><br/>
                        <span><strong>Address: </strong>${orderDto.address}</span><br>
                        <c:if test="${not empty orderDto.deliveryCompany}">
                            <span><strong>Delivery company: </strong>${orderDto.deliveryCompany}</span>
                        </c:if>

                    </div>
                    <div class="col text-end">
                        <span><strong>Time: </strong><fmt:formatDate type="both"
                                        dateStyle="short" timeStyle="short"
                                        value="${orderDto.orderTime}"/></span><br/>
                        <span><strong>Phone: </strong>${orderDto.phone}</span><br>
                        <c:if test="${not empty orderDto.expectedDate}">
                            <span><strong>Expected receive date: </strong>
                                <fmt:formatDate value="${orderDto.expectedDate}" pattern="dd-MM-yyyy" />
                            </span>
                        </c:if>
                    </div>
                </div>
            </div>
            <h4>Order details</h4>
            <table class="table table-borderless table-hover mt-3" style="border-radius: 6px; overflow: hidden;">
                <thead class="border " style="background-color: rgba(221,221,221,0.5)">
                    <tr >
                        <th>Book name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <tbody class="border">
                    <c:forEach var="book" items="${books}">

                        <tr>
                            <td>${book.name}</td>
                            <td>${book.quantity}</td>
                            <td>
                                <span style="color: #ED0000; font-size: 19px; font-weight: bold">
                                    <fmt:formatNumber value="${book.price}" type="currency"/>
                                </span>
                            </td>

                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="1"></td>
                        <td class="text-end" style="font-size: 19px; font-weight: bold">Total:</td>
                        <td><span style="color: #ED0000; font-size: 19px; font-weight: bold">
                                <fmt:formatNumber value=" ${orderDto.total}" type="currency"/>
                            </span></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <%@include file="footer.html" %>
        <jsp:include page="include/include_footer.jsp"></jsp:include>
    </body>

</html>