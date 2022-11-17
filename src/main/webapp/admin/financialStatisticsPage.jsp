<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="../include/include_header.jsp"/>
    </head>
    <style>
        .fin-con {
            background-color: #fff;
            min-height: 80vh;
            margin-right: 50px;
            padding: 20px;
        }
        label {
            font-weight: bold;
        }
        .btnn {
            width: 100%;
            background-color: white;
            border: solid 1px #4b38b3;
            color: #4b38b3;
        }
        .btnn:hover {
            background-color: #4b38b3;
            color: white;
        }
        .stat {
            font-size: 150%;
            font-weight: bold;
        }
    </style>
    <body>
        <div class="row">
            <div class="col-md-3">
                <jsp:include page="manage_nav.jsp" />
            </div>
            <div class="col-md-9">
                <jsp:include page="admin_header.jsp" />
                <c:set var="genres" value="${requestScope.GENRES}"/>
                <c:set var="publishers" value="${requestScope.PUBLISHERS}"/>
                <c:set var="authors" value="${requestScope.AUTHORS}"/>
                <div class="row fin-con">
                    <div class="col-md-4" style="border-right: 1px solid black">
                        <form>
                            <label>Genre</label>
                            <select class="form-select" name="txtGenre">
                                <option value="All">All</option>
                                <c:forEach var="genre" items="${genres}">
                                    <option value="${genre.name}"
                                            <c:if test="${not empty param.txtGenre && param.txtGenre == genre.name}">
                                                selected
                                            </c:if>
                                            >${genre.name}</option>
                                </c:forEach>

                            </select><br>
                            <label>Publisher</label>
                            <select class="form-select" name="txtPublisher">
                                <option value="All">All</option>
                                <c:forEach var="publisher" items="${publishers}">
                                    <option value="${publisher.publisherName}"
                                            <c:if test="${not empty param.txtPublisher && param.txtPublisher == publisher.publisherName}">
                                                selected
                                            </c:if>
                                            >${publisher.publisherName}</option>

                                </c:forEach>
                            </select><br>
                            <label>Author</label>

                            <select class="form-select" name="txtAuthor">
                                <option value="All">All</option>
                                <c:forEach var="author" items="${authors}">
                                    <option value="${author.aliasName}"
                                            <c:if test="${not empty param.txtAuthor && param.txtAuthor == author.aliasName}">
                                                selected
                                            </c:if>
                                            >${author.aliasName}</option>
                                </c:forEach>
                            </select><br>
                            <label>From</label>     <input class="form-control" type="date" name="txtFromDate" value="${param.txtFromDate}"><br>
                            <label>To</label>    <input class="form-control" type="date" name="txtToDate" id="toDate" value="${param.txtToDate}"><br>
                            <input class="btn btn-primary btnn" type="submit" value="Filter" />
                        </form>
                    </div>
                    <script>
                        getCurentDate();
                        function getCurentDate() {
                            if (${empty param.txtToDate})
                                document.getElementById("toDate").valueAsDate = new Date();

                        }
                    </script>
                    <div class="col-md-8"> 
                        <div class="stat"> Number of completed orders: ${requestScope.NUMBER_OF_ORDERS}</div>
                        <div class="stat"> Total revenue: <span style="color: red"><fmt:formatNumber value="${requestScope.SUM_OF_TOTAL}" type="currency"/> </span></div>

                        
                        <div style="margin-top: 20px">
                            <canvas id="myChart"></canvas>
                        </div>
                        <h6 style="text-align: center; margin-top: 10px">Revenue by month</h6>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

        <script>
                        const labels = ${requestScope.LABEL};

                        const data = {
                            labels: labels,
                            datasets: [{
                                    label: 'Revenue',
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
