<%-- Document : errorPage Created on : Sep 22, 2022, 9:56:23 PM Author : Dell --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ERROR PAGE</title>
    </head>

    <body>
        <jsp:include page="include/include_header.jsp"></jsp:include>
        <jsp:include page="header.jsp"></jsp:include>
            <div style="min-height: 45vh;  margin-bottom: 10px;"
                ><h1 style="text-align: center; color: red; margin-top: 40px;">Something Went Wrong!</h1>
                <img style=" display: block;
                     margin-left: auto;
                     margin-right: auto;
                     width: 20%;" src="img/error.png" >
                <a style=" display: block; text-align: center; margin-top: 10px; text-decoration: none; font-size: 25px;" href="./">Back To Home Page</a>
            </div> 
            <jsp:include page="footer.html"></jsp:include>
            <jsp:include page="include/include_footer.jsp"></jsp:include>
    </body>
</html>