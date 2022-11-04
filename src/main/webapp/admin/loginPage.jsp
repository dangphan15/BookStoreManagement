<%-- 
    Document   : loginPage.jsp
    Created on : Oct 14, 2022, 9:22:26 PM
    Author     : QuanMX
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <jsp:include page="../include/include_header.jsp"/>
        <style>
            h1{
                text-align: center;
                margin-top: 50px;
            }
            form {
                display: inline-block;
                margin-left: 50%;
                transform: translateX(-50%);
                padding: 10px;
                
            }
            form input[type="submit"] {
                width: 100%;
            }
            
            .form-container {
                
            }
        </style>
    </head>
    <body>
        <div class="form-container">
        <h1>Login </h1>
        <c:set var="error" value="${requestScope.ERROR}"/>
        <form action="loginAction" method="POST">
            <div class="form-outline mb-4">
                <label class="form-label">Username</label><br>
                <input class="form-control" type="text" name="txtUsername" value="${param.txtUsername}"/> 
            </div>
            <div class="form-outline mb-4">
                <label class="form-label">Password</label><br>
                <input class="form-control" type="password" name="txtPassword" value="" />
                <div style="color: red"> ${error}</div>
            </div>

            <input type="submit" value="Login" class="btn btn-primary btn-block mb-4" />

        </form>
            </div>
        <jsp:include page="../include/include_footer.jsp"/>
    </body>
</html>
