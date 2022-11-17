<%-- Document : orderDetail Created on : Sep 22, 2022, 10:50:04 PM Author : QuanMX --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi_VN"/>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Order detail</title>
    <jsp:include page="../include/include_header.jsp"></jsp:include>
</head>
<style>
    .detail-infor {
        padding-right: 30px;
        padding-left: 30px;
        border: solid 0.5px;
        border-radius: 10px;
        /*min-height: 100%;*/
        overflow-y: scroll;
        background-color: #fafafa;
    }

    .detail-infor h5 {
        margin-top: 20px;
    }

    .order-action {
        border: solid 0.5px;
        margin-right: 5px;
        padding: 10px;
        padding-left: 20px;
        line-height: 50px;
        border-radius: 10px;
        background-color: #fafafa;
    }


</style>
<body>
<jsp:include page="header.jsp"></jsp:include>
<c:set var="orderDto" value="${requestScope.ORDER_INFOR}"/>
<c:set var="books" value="${requestScope.BOOKS}"/>

<div class="container-fluid">
    <div class="row flex-nowrap">
        <div class="col-auto px-0">
            <jsp:include page="order-state-nav.html"/>
        </div>
        <div class="col p-0">
            <div class="order-container">
                <div class="navigation row d-flex">

                    <a id="sidebar-button"
                       style="color: snow; background-color: transparent!important; max-width: fit-content" href="#"
                       data-bs-target="#sidebar" data-bs-toggle="collapse"
                       class="col" onclick="flipAngleButton()">
                        <i class="fa-regular fa-angle-left fa-2xl" style="transition: transform 0.5s"></i>
                    </a>
                    <div class="dropdown col me-3" style="text-align: right">
                        <button class="btn btn-staff dropdown-toggle mt-1" type="button" id="dropdownMenuButton"
                                data-bs-toggle="dropdown" aria-expanded="false">
                            ${sessionScope.USER.fullName}
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">

                            <li><a class="dropdown-item" href="../userInformation">Edit profile</a></li>
                            <li><a class="dropdown-item" href="../logoutAction">Logout</a></li>
                        </ul>
                    </div>


                </div>

                <div class="container">
                    <nav class="mb-3"
                         style="--bs-breadcrumb-divider: '>'; border-bottom: 1px solid whitesmoke !important;"
                         aria-label="breadcrumb">
                        <ol class="breadcrumb" style="margin-bottom: 8px">
                            <li class="breadcrumb-item"><a
                                style="text-decoration: none; color: snow; font-size: 18px !important;"
                                href="viewAllOrderAction">All </a></li>
                            <c:if test="${orderDto.status == 'To Confirm'}">
                                <li class="breadcrumb-item"><a
                                    style="text-decoration: none; color: snow;font-size: 18px !important;"
                                    href="viewToConfirmOrderAction">To Confirm</a></li>
                            </c:if>
                            <c:if test="${orderDto.status == 'To Ship'}">
                                <li class="breadcrumb-item"><a
                                    style="text-decoration: none; color: snow;font-size: 18px !important;"
                                    href="viewToShipOrderAction">To Ship</a></li>
                            </c:if>
                            <c:if test="${orderDto.status == 'To Receive'}">
                                <li class="breadcrumb-item"><a
                                    style="text-decoration: none; color: snow;font-size: 18px !important;"
                                    href="viewToReceiveOrderAction">To Receive</a></li>
                            </c:if>
                            <c:if test="${orderDto.status == 'Completed'}">
                                <li class="breadcrumb-item"><a
                                    style="text-decoration: none; color: snow; font-size: 18px !important;"
                                    href="viewCompletedOrderAction">Completed</a></li>
                            </c:if>
                            <c:if test="${orderDto.status == 'Cancelled'}">
                                <li class="breadcrumb-item"><a
                                    style="text-decoration: none; color: snow; font-size: 18px !important;"
                                    href="viewCancelledOrderAction">Cancelled</a></li>
                            </c:if>

                            <c:if test="${orderDto.status == 'Return/Refund'}">
                                <li class="breadcrumb-item"><a
                                    style="text-decoration: none; color: snow; font-size: 18px !important;"
                                    href="viewReturnAndRefundAction">Return/Refund</a></li>
                            </c:if>
                            <li class="breadcrumb-item active" aria-current="page"><a
                                style="color:#02027d!important;font-weight: bolder; font-size: 18px !important;"
                                href=""> Order ${orderDto.orderId}</a></li>
                        </ol>

                    </nav>

                    <div class="row mt-3">
                        <h2 class="text-start fw-bolder" style="padding-left: 350px">Order detail</h2>
                        <div class="col-md-8">
                            <div class="detail-infor">
                                <div class="row m-auto">
                                    <h5><b>Shipping information</b></h5>
                                    <div class="card " style="border-radius: 15px">
                                        <ul class="list-group">

                                            <li class="list-group-item border-0" style="color: black">
                                            <span
                                                style="font-weight: bold;">Receiver name:</span> ${orderDto.receiverName}
                                                <br>
                                            </li>
                                            <li class="list-group-item border-0 " style="color: black">
                                                <span style="font-weight: bold">Address:</span> ${orderDto.address} <br>
                                            </li>
                                            <li class="list-group-item border-0" style="color: black">
                                                <span style="font-weight: bold">Phone:</span> ${orderDto.phone} <br>
                                            </li>

                                            <c:if test="${not empty orderDto.deliveryCompany}">
                                                <li class="list-group-item border-0" style="color: black">
                                                <span
                                                    style="font-weight: bold">Delivery company:</span> ${orderDto.deliveryCompany}
                                                    <br>
                                                </li>
                                            </c:if>
                                            <c:if test="${not empty orderDto.expectedDate}">
                                                <li class="list-group-item border-0" style="color: black">
                                                    <span style="font-weight: bold">Expected receive date:</span>
                                                    <fmt:formatDate type="date" value="${orderDto.expectedDate}"/> <br>
                                                </li>
                                            </c:if>

                                            <li class="list-group-item border-0" style="color: black">
                                                <span style="font-weight: bold">Payment:</span> ${orderDto.payment} <br>
                                            </li>
                                            <c:if test="${not empty orderDto.staffUsername}">
                                                <li class="list-group-item border-0" style="color: black">
                                                    <span
                                                        style="font-weight: bold">Staff:</span> ${orderDto.staffUsername}
                                                    <br>
                                                </li>
                                            </c:if>
                                        </ul>
                                    </div>


                                </div>

                                <div class="row m-auto">
                                    <h5><b>Details</b></h5>
                                    <table class="table table-light">
                                        <thead class="table-dark">
                                        <tr>
                                            <th>Book name</th>
                                            <th>Quantity</th>
                                            <th>Price</th>
                                            <th>Total</th>
                                        </tr>
                                        </thead>
                                        <tbody class="border">
                                        <c:forEach var="book" items="${books}">

                                            <tr>
                                                <td>${book.name}</td>
                                                <td>${book.quantity}</td>
                                                <td>
                                                    <span>
                                                        <fmt:formatNumber value="${book.price}" type="currency"/>
                                                    </span>
                                                </td>
                                                <td>
                                                    <span>
                                                        <fmt:formatNumber value="${book.price * book.quantity}"
                                                                          type="currency"/>
                                                    </span>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                                <span style="font-weight: bold">
                                                    <fmt:formatNumber value=" ${orderDto.total}" type="currency"/>
                                                </span>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="order-action">
                                <h4 class="text-center"><b>Order information</b></h4>
                                <div><b>Status:</b> ${orderDto.status}</div>
                                <div><b>Order ID:</b> ${orderDto.orderId}</div>

                                <div><b>Time:</b> <fmt:formatDate type="both"
                                                                  dateStyle="short" timeStyle="short"
                                                                  value="${orderDto.orderTime}"/></div>
                                <div><b>Customer phone:</b> ${orderDto.username}</div>
                                <c:if test="${not empty orderDto.statusNote}">
                                    <div class="col">
                                        <span><b>Cancel reason:</b>  ${orderDto.statusNote} </span>
                                    </div>
                                </c:if>
                                <c:if test="${orderDto.status == 'To Confirm'}">
                                    <c:set var="approvalContextPath" value="approvalToConfirmOrderAction"/>
                                    <c:set var="cancelContextPath" value="cancelOrderAction"/>
                                </c:if>
                                <c:if test="${orderDto.status == 'To Ship'}">
                                    <c:set var="approvalContextPath" value="approvalToShipOrderAction"/>
                                    <c:set var="cancelContextPath" value="cancelOrderAction"/>
                                    <div>
                                        <label><b>Delivery Company:</b> </label>
                                        <select name="deliveryCompany" form="approvalForm">
                                            <option value="Viettle Post">Viettle Post</option>
                                            <option value="Grab">Grab</option>
                                            <option value="J&T Express">J&T Express</option>
                                            <option value="Giao Hang Nhanh">Giao Hang Nhanh</option>
                                        </select>
                                    </div>
                                </c:if>
                                <c:if test="${orderDto.status == 'To Receive'}">
                                    <c:set var="approvalContextPath" value="approvalToReceiveOrderAction"/>
                                    <c:set var="cancelContextPath" value="cancelOrderAction"/>
                                    <div>
                                        <form action="setExpectedReceiveDateAction" method="POST">
                                            <div class="d-flex ">
                                                <div>
                                                    <label> <b>Expected Date:</b></label>
                                                    <input class="form-control" type="date" name="expectedDate" value=""
                                                           style="display: inline-block;width: 52%"/>

                                                </div>

                                                <input type="hidden" name="id" value="${orderDto.orderId}"/>
                                                <input class="btn btn-primary " type="submit" value="Set date" name="btAction"/>
                                            </div>

                                            <c:if test="${not empty requestScope.ERRORS}">
                                                <p style="color: red;">${requestScope.ERRORS}</p>
                                            </c:if>
                                        </form>
                                    </div>
                                </c:if>
                                <c:if
                                    test="${orderDto.status != 'Completed' && orderDto.status != 'Cancelled' && orderDto.status != 'Return/Refund'}">
                                    <div>
                                        <form id="approvalForm" action="${approvalContextPath}" method="POST">
                                            <input style="width: 100%" class="btn btn-success" type="submit"
                                                   value="${orderDto.status != "To Receive" ? "Approval order" : "Shipped"}"
                                                   name="btAction" form="approvalForm"/>
                                            <input type="hidden" name="id" value="${orderDto.orderId}"/>
                                        </form>
                                        <c:if
                                            test="${not empty requestScope.ERRORS && requestScope.ORDER_ID == orderDto.orderId}">
                                            <p style="color: red;">${requestScope.ERRORS}</p>
                                        </c:if>
                                    </div>
                                    <div>
                                        <form action="${cancelContextPath}" method="POST">

                                            <div class="d-flex justify-content-center m-2">
                                                <div>
                                                    <label><b>Note:</b> </label>
                                                    <input class="form-control ms-1 " type="text" name="txtNote"
                                                           style="width: 75%; display: inline-block"/>
                                                </div>

                                                <input class="btn btn-danger" type="submit" value="Cancel order"
                                                       name="btnAction"/>
                                            </div>


                                            <input type="hidden" name="id" value="${orderDto.orderId}"/>

                                        </form>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    function flipAngleButton() {
        var isSidebarShown = $('#sidebar').hasClass('shown');
        console.log(isSidebarShown);
        if (isSidebarShown) {
            $('#sidebar-button i').css('transform', 'scaleX(-1)');
            $('#sidebar').addClass('unshown');
            $('#sidebar').removeClass('shown');
        } else {
            $('#sidebar-button i').css('transform', 'scaleX(1)');
            $('#sidebar').addClass('shown');
            $('#sidebar').removeClass('unshown');
        }
    }
</script>

<%--<%@include file="footer.html" %>--%>
<jsp:include page="../include/include_footer.jsp"></jsp:include>
</body>

</html>