<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setLocale value="vi_VN"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Import Statistics</title>
        <jsp:include page="../include/include_header.jsp"/>
    </head>
    <body>
        <div class="row">
            <div class="col-md-2">
                <jsp:include page="manage_nav.jsp" />
            </div>
            <div class="col-md-10">
                <h1>Import Statistics</h1>
                <c:set var="publishers" value="${requestScope.PUBLISHERS}"/>
                <c:set var="bookImports" value="${requestScope.BOOK_IMPORTS}"/>
                <form action="viewImportStatisticAction">
                    <div>
                        Publisher: 
                        <select name="publisher">
                            <option value="all">All</option>
                            <c:forEach var="publisher" items="${publishers}">
                                <option value="${publisher.publisherName}"
                                        <c:if test="${bookImports[0].publisher == publisher.publisherName}">
                                            selected
                                        </c:if>
                                        >${publisher.publisherName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div>
                        <label>
                            Start date:
                            <input type="date" name="startDate" class="default-today" value="${param.startDate}">
                        </label>
                        <label>
                            End date:
                            <input type="date" name="endDate" class="default-today" value="${param.endDate}">
                        </label>
                        <c:if test="${not empty requestScope.ERRORS}">
                            <p style="color: red;">${requestScope.ERRORS}</p>
                        </c:if>
                    </div>
                    <input type="submit" value="Search" />
                </form>
                <c:if test="${not empty bookImports}">
                    <div>
                        <div>
                            Total quantity: ${requestScope.TOTAL_QUANTITY}
                        </div>
                        <div>
                            Total price: <fmt:formatNumber value="${requestScope.TOTAL_PRICE}" type="currency"/>
                        </div>
                    </div>
<!--                    <div>
                        <c:forEach var="dto" items="${bookImports}">
                            <p>${dto.importMonthYear}: ${dto.quantity}</p>
                        </c:forEach>
                    </div>-->

<!--                    <p>${requestScope.LABEL}</p>
                    <p>${requestScope.DATA}</p>-->
                </c:if>
                <div style="width: 50%">
                    <canvas id="myChart"></canvas>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script>
            <c:if test="${empty param.starDate && empty param.endDate}">
            const dateInputElems = document.querySelectorAll('.default-today');
            for (let i = 0; i < dateInputElems.length; ++i) {
                dateInputElems[i].valueAsDate = new Date();
            }
            </c:if>
        </script>
        <script>
            const labels = ${requestScope.LABEL};

            const data = {
                labels: labels,
                datasets: [{
                        label: 'Book import',
                        backgroundColor: 'rgb(255, 99, 132)',
                        borderColor: 'rgb(255, 99, 132)',
                        data: ${requestScope.DATA},
                    }]
            };

            const config = {
                type: 'line',
                data: data,
                options: {}
            };
        </script>
        <script>
            const myChart = new Chart(
                    document.getElementById('myChart'),
                    config
                    );
        </script>
        <jsp:include page="../include/include_footer.jsp"/>
    </body>
</html>
