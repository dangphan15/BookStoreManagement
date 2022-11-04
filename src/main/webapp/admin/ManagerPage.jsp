<%-- Document : ManagerPage Created on : Oct 28, 2022, 1:24:36 PM Author : Dell --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Page</title>
        <jsp:include page="../include/include_header.jsp"/>
    </head>

    <body>
        <div class="row">
            <div class="col-md-2">
        <jsp:include page="manage_nav.jsp" />
            </div>
            <div class="col-md-9">
                <h1>Welcome, manager</h1>
            </div>
        </div>

        <jsp:include page="../include/include_footer.jsp"/>
    </body>

</html>