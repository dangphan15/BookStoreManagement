<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <div class="col-md-9">
                <h1>Financial Statistics</h1>
                <c:set var="genres" value="${requestScope.GENRES}"/>
                <c:set var="publishers" value="${requestScope.PUBLISHERS}"/>
                <c:set var="authors" value="${requestScope.AUTHORS}"/>

                <form>
                    <h5>Genre</h5>
                    <select name="txtGenre">
                        <option value="All">All</option>
                        <c:forEach var="genre" items="${genres}">
                            <option value="${genre.name}"
                                    <c:if test="${not empty param.txtGenre && param.txtGenre == genre.name}">
                                        selected
                                    </c:if>
                                    >${genre.name}</option>
                        </c:forEach>

                    </select>
                    <h5>Publisher</h5>
                    <select name="txtPublisher">
                        <option value="All">All</option>
                        <c:forEach var="publisher" items="${publishers}">
                            <option value="${publisher.publisherName}"
                                    <c:if test="${not empty param.txtPublisher && param.txtPublisher == publisher.publisherName}">
                                        selected
                                    </c:if>
                                    >${publisher.publisherName}</option>

                        </c:forEach>
                    </select>
                    <h5>Author</h5>

                    <select name="txtAuthor">
                        <option value="All">All</option>
                        <c:forEach var="author" items="${authors}">
                            <option value="${author.aliasName}"
                                    <c:if test="${not empty param.txtAuthor && param.txtAuthor == author.aliasName}">
                                        selected
                                    </c:if>
                                    >${author.aliasName}</option>
                        </c:forEach>
                    </select>
                    <h5>From</h5>     <input type="date" name="txtFromDate" value="${param.txtFromDate}">
                    <h5>To</h5>    <input type="date" name="txtToDate" id="toDate" value="${param.txtToDate}">
                    <input type="submit" value="Filter" />
                </form>
                <script>
                    getCurentDate();
                    function getCurentDate() {
                        if (${empty param.txtToDate})
                            document.getElementById("toDate").valueAsDate = new Date();

                    }
                </script>
<!--                // Number of completed orders là số lượng order trong khoảng thời gian mình filter<br>
                //Total là tổng số tiền của những cái orders đó<br>-->
                <h5>
                    Number of completed orders: ${requestScope.NUMBER_OF_ORDERS}</h5>
                <h5> Total:  ${requestScope.SUM_OF_TOTAL}</h5>

                <%--<c:if test="${not empty requestScope.TOTAL_PER_DAY}">--%>
                    <!--//key của cái này là ngày, còn total là total của ngày hôm đó <br>-->
                    <%--<c:forEach var="day" items="${requestScope.TOTAL_PER_DAY}">--%>
                        <!--Date: ${day.key}  Total: ${day.value} <br>-->
                    <%--</c:forEach>--%>
                <%--</c:if>--%>
                <div style="width: 50%">
                    <canvas id="myChart"></canvas>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

        <script>
            const labels = ${requestScope.LABEL};

            const data = {
                labels: labels,
                datasets: [{
                        label: 'Finacial',
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
