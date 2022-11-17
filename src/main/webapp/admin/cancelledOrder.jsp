<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN"/>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage orders</title>
        <jsp:include page="../include/include_header.jsp"/>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <c:set var="orders" value="${requestScope.ORDERS}"/>

        <div class="container-fluid">
            <div class="row flex-nowrap">
                <div class="col-auto px-0">
                    <jsp:include page="order-state-nav.html"/>
                </div>
                <div class="col p-0">
                    <div class="order-container">
                        <div class="navigation row d-flex">

                            <a id="sidebar-button" style="color: snow; background-color: transparent!important; max-width: fit-content" href="#" data-bs-target="#sidebar" data-bs-toggle="collapse"
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
                            <nav class="mb-3" style="--bs-breadcrumb-divider: '>'; border-bottom: 1px solid whitesmoke !important;" aria-label="breadcrumb">
                                <ol class="breadcrumb" style="margin-bottom: 8px">
                                    <li class="breadcrumb-item"><a style="text-decoration: none;color: snow;font-size: 18px !important;" href="viewAllOrderAction">All</a></li>
                                    <li class="breadcrumb-item active" aria-current="page"> <a style="color:#02027d!important;font-weight: bolder; font-size: 18px !important;" href="viewCancelledOrderAction">Cancelled</a></li>
                                </ol>
                            </nav>

                            <c:if test="${not empty orders}">

                                <table id="example-table-admin" class="table table-hover table-light table-borderless table-striped">
                                    <thead class="table-dark">
                                        <tr>
                                            <th>No.</th>
                                            <th style="max-width: 80px; padding-left: 10px!important; padding-right: 10px!important;">Order ID</th>
                                            <th>Receiver</th>
                                            <th>Created</th>
                                            <th>Total</th>
                                            <th>Payment</th>

                                            <th>Staff username</th>

                                            <th>Option</th>
                                        </tr>
                                    </thead>
                                    <tbody class="border">
                                        <c:forEach var="order" items="${orders}" varStatus="counter">
                                            <tr>
                                                <td>${counter.count}</td>
                                                <td style="max-width: 80px; padding-left: 10px!important; padding-right: 10px!important;">${order.orderId}</td>
                                                <td>${order.receiverName}</td>
                                                <td><fmt:formatDate type="both" dateStyle="short" timeStyle="short"
                                                                value="${order.orderTime}"/></td>
                                                <td><fmt:formatNumber value="${order.total}" type="currency"/></td>
                                                <td>${order.payment}</td>
                                                <c:if test="${not empty order.staffUsername}">
                                                    <td>${order.staffUsername}</td>
                                                </c:if>
                                                <c:if test="${empty order.staffUsername}">
                                                    <td>Cancelled by customer</td>
                                                </c:if>
                                                <td>
                                                    <form action="viewOrderDetailAction">
                                                        <input type="hidden" name="id" value="${order.orderId}" />
                                                        <input class="btn btn-danger" type="submit" value="View detail" />
                                                    </form>
                                                </td>
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
            </div>
        </div>
        <jsp:include page="../include/include_footer.jsp"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap5.min.js"></script>
        <script>
                                   $(document).ready(function () {
                                       //alert("cc");
                                       $('#example-table-admin').DataTable();
                                   });
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
    </body>
</html>
