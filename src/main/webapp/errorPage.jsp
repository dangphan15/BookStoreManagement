<%-- Document : errorPage Created on : Sep 22, 2022, 9:56:23 PM Author : Dell --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ERROR PAGE</title>
        <jsp:include page="include/include_header.jsp"></jsp:include>
        </head>

        <body>
            <h1>Chúc mừng bé đã quay vào ô fix bug!</h1>
        <jsp:include page="include/include_footer.jsp"></jsp:include>
        ${requestScope.errorMessage};
    </body>

</html>