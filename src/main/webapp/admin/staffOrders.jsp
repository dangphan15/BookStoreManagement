<%-- 
    Document   : staffOrders.jsp
    Created on : Nov 2, 2022, 4:17:03 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Staff</title>
        <jsp:include page="../include/include_header.jsp"/>
    </head>
    <body>
        <div class="row">
            <div class="col-md-2">
                <jsp:include page="manage_nav.jsp" />
            </div>
            <div class="col-md-10">
                <h1>Order statistics</h1>
                <div>
                    <ul>
                        <li>Name: ${requestScope.USER.fullName}</li>
                        <li>Phone: ${requestScope.USER.username}</li>
                        <li>Email: ${requestScope.USER.email}</li>
                        <li>Address: ${requestScope.USER.address}</li>
                        <li>Gender: ${requestScope.USER.gender}</li>
                    </ul>
                </div>
                <div>
                    <div>
                        Total processed orders : ${requestScope.TOTAL}
                     
                    </div>
                        <div style="width: 50%;">
                        <canvas id="myChart"></canvas>
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
