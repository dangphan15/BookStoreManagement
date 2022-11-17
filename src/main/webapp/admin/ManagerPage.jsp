<%-- Document : ManagerPage Created on : Oct 28, 2022, 1:24:36 PM Author : Dell --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN" scope="session"/>
<!DOCTYPE html>
<style>
    .stat-container {
        background-color: #fff;
        margin-bottom: 30px;
        padding: 20px;
        width: 90%;
    }
    .stat-container:last-child {
        margin-bottom: 0;
    }
    .stat-title {
        display: block;
        font-weight: bold;
        color: #7c7f90;
    }
    .fa-check {
        color: greenyellow;
        font-size: 200%;
        margin-right: 10px;
    }
    .fa-sack-dollar {
        color: yellow;
        font-size: 200%;
        margin-right: 25px;
    }
    .fa-xmark-large {
        color: red;
        font-size: 200%;
        margin-right: 15px;
    }
    .stat-content {
        margin-top: 10px;
        display: block;
        text-align: center;
        font-size: 170%;
    }
    .number-order {
        background-color: #fff;
        padding: 20px;
        height: 100%;
        width: 90%;
    }
    .number-order h2 {
        font-size : 140%;
        margin-bottom: 50px;
    }
    .circle-order {
        background-color: #fff;
        padding: 20px;
        height: 100%;
        width: 90%;
    }
    .circle-order h2 {
        font-size : 140%;
        margin-bottom: 20px;
    }
    .bottom-container {
        background-color: #fff;
        width: 90%;
        padding: 20px;
        height: 400px;
    }
    .bottom-container h2 {
        font-size : 140%;
        margin-bottom: 20px;
    }

</style>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Page</title>
        <jsp:include page="../include/include_header.jsp"/>
    </head>

    <body>
        <div class="row">
            <div class="col-md-3">
                <jsp:include page="manage_nav.jsp" />
            </div>
            <div class="col-md-9">
                <jsp:include page="admin_header.jsp" />

                <div class="row mb-5">
                    <div class="col-md-3">
                        <div class="stat-container">
                            <span class="stat-title"> <i class="fa-duotone fa-check"></i> Completed orders</span>
                            <span class="stat-content">${requestScope.COMPLETED_ORDER}</span>
                        </div>
                        <div class="stat-container">
                            <span class="stat-title"> <i class="fa-solid fa-sack-dollar"></i>Total revenue</span>
                            <span class="stat-content"><fmt:formatNumber value="${requestScope.REVENUE}" type="currency"/></span>
                        </div>
                        <div class="stat-container">
                            <span class="stat-title"> <i class="fa-solid fa-xmark-large"></i>Cancelled orders</span>
                            <span class="stat-content"> ${requestScope.CANCELLED_ORDER}</span>
                        </div>
                    </div>
                    <div class="col-md-5" >
                        <div class="number-order">
                            <h2>Number of orders in the last 7 days</h2>
                            <div>
                                <canvas id="orderChart"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="circle-order">
                            <h2>State of orders</h2>
                            <div style="width: 300px">
                                <canvas id="orderPieChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="bottom-container">
                            <h2>Top manga in the last 7 days</h2>
                            <c:forEach items="${requestScope.BOOKS}" var="book">
                                <div class="row mb-2">
                                    <div class="col-md-2">
                                        <img style="width: 30px" src="${book.imageAddress}" alt="alt"/>
                                    </div>
                                    <div class="col-md-10">
                                        <a style="text-decoration: none;color:#7c7f90;" href="../viewBookDetailController?ISBN=${book.ISBN}">${book.name}</a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="col">
                       
                        <div class="bottom-container">
                             <h2>Category</h2>
                            <div style="width: 300px">
                                <canvas id="genrePieChart"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        
                        <div class="bottom-container">
                            <h2>Number of book base on price</h2>
                            <div >
                                <canvas id="priceBarChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <jsp:include page="../include/include_footer.jsp"/>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script>
            orderChar();
            orderPieChar();
            genrePieChar();
            priceBarChar();
            function orderChar() {
                const data = {
                    labels: ${requestScope.LABEL1},
                    datasets: [{
                            label: 'Number of orders',
                            backgroundColor: 'rgb(255, 99, 132)',
                            borderColor: 'rgb(255, 99, 132)',
                            data: ${requestScope.DATA1},
                        }]
                };
                const config = {
                    type: 'line',
                    data: data,
                    options: {}
                };
                const myChart = new Chart(
                        document.getElementById('orderChart'),
                        config
                        );
            }
            function orderPieChar() {
                const data = {
                    labels: ['Completed', 'Cancelled', 'Other'],
                    datasets: [{
                            data: [${requestScope.COMPLETED_ORDER},${requestScope.CANCELLED_ORDER}, ${requestScope.OTHER}],
                            label: 'Order status',
                            backgroundColor: [
                                'rgb(54, 162, 235)',
                                'rgb(255, 99, 132)',
                                'rgb(255, 205, 86)'
                            ],
                            hoverOffset: 4
                        }]
                };
                const config = {
                    type: 'doughnut',
                    data: data,
                    options: {}
                };
                const myChart = new Chart(
                        document.getElementById('orderPieChart'),
                        config
                        );
            }
            function genrePieChar() {
                const data = {
                    labels: ${requestScope.LABEL2},
                    datasets: [{
                            data: ${requestScope.DATA2},
                            label: 'Category',
                            backgroundColor: [
                                'rgb(39, 211, 93)',
                                'rgb(244, 133, 81)',
                                'rgb(243, 135, 155)',
                                'rgb(74, 117, 170)',
                                'rgb(233, 34, 228)',
                                'rgb(149, 34, 38)',
                                'rgb(189, 60, 221)'
                            ],
                            hoverOffset: 4
                        }]
                };
                const config = {
                    type: 'doughnut',
                    data: data,
                    options: {}
                };
                const myChart = new Chart(
                        document.getElementById('genrePieChart'),
                        config
                        );
            }
            function priceBarChar() {
                const data = {
                    labels: ['less than 200000', '200000-500000', 'more than 5000000'],
                    datasets: [{
                            data: [${requestScope.LESS},${requestScope.EQUAL},${requestScope.MORE}],
                            label: '',
                            backgroundColor: [
                                'rgb(255, 99, 132)',
                                'rgb(75, 192, 192)',
                                'rgb(153, 102, 255)',
                                'rgb(74, 117, 170)',
                                'rgb(233, 34, 228)',
                                'rgb(149, 34, 38)',
                                'rgb(189, 60, 221)'
                            ]

                        }]
                };
                const config = {
                    type: 'bar',
                    data: data,
                    options: {
                        indexAxis: 'y',
                    }
                };
                const myChart = new Chart(
                        document.getElementById('priceBarChart'),
                        config
                        );
            }
        </script>
    </body>

</html>