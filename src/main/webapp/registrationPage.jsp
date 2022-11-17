<%-- Document : registrationPage Created on : Sep 19, 2022, 8:55:15 PM Author : QuanMX --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Registration Page</title>
    <jsp:include page="include/include_header.jsp"></jsp:include>


    <style>
        .register-form {
            width: 35%;
            margin: 0 auto;
            background: white;
            border-radius: 15px;
            padding: 10px 5%;
            margin-top: 30px;

        }

        .register-title {
            width: 100%;
            text-align: center;
            font-weight: bold;
            font-size: 150%;
            color: #000000;
            text-transform: uppercase;
            margin-top: 20px;
            margin-right: auto;
            margin-left: auto;
        }

        .form {
            max-width: 330px;
            margin-left: auto;
            margin-right: auto;
            margin-top: 20px;
        }

        .register-content {
            width: 100%;
            height: 35px;
            margin: 0 auto;
            background-color: hwb(218deg 91% 0%);
            border-radius: 5px;
            padding-left: 10px;
            outline: none;
            border: none;
            font-size: 110%;
            margin-bottom: 15px;
        }

        .register-button {
            width: 100%;
            height: 35px;
            background: #F65D4E;
            border-radius: 5px;
            color: white;
            border: none;
            font-size: 120%;
            margin-top: 10px;
            margin-bottom: 30px;
        }

        .register-button:hover {
            color: #F65D4E;
            background: #FFFFFF;
            border: solid #F65D4E 1px;
        }

        .login-message {
            color: red;
            font-weight: bold;
            margin-bottom: 5px;
        }

    </style>
</head>

<body style="background: linear-gradient(0deg, rgba(255, 244, 247, 0.6) 0%,
          rgba(255, 244, 247, 0.6) 100%,
          rgba(255, 244, 247, 0.6) 100%),
          url('img/background_searchpage.jpg');
          background-repeat: no-repeat;
          background-size: cover;
          background-attachment: fixed;">
<%@include file="header.jsp" %>
<c:set var="error" value="${requestScope.ERROR}"/>
<div class="register-form">
    <div class="register-title">Create New Account</div>

    <form class="form" action="registerAction" method="POST">
        <label>Phone number(*)</label>
        <input type="text" name="txtPhone" value=""
               class="register-content"
               pattern="^\\+?\\d{1,3}?[- .]?\\(?(?:\\d{2,3})\\)?[- .]?\\d\\d\\d[- .]?\\d\\d\\d\\d$"/><br>
        <div class="login-message"> ${error.phoneNumberLengthError}</div>
        <div class="login-message"> ${error.phoneNumberPatternError}</div>
        <div class="login-message"> ${error.duplicatedUsername}</div>
        <label>Password(* 6-30 characters)</label>
        <input type="password" name="txtPassword" value=""
               class="register-content"/><br>
        <div class="login-message"> ${error.passwordLengthError}</div>
        <label>Confirm password</label>
        <input type="password" name="txtPasswordConfirm" value=""
               class="register-content"/><br>
        <div class="login-message"> ${error.passwordConfirmNotMatch}</div>
        <label>Full name</label>
        <input type="text" name="txtFullname" value=""
               class="register-content"/><br>
        <label>Email</label>
        <input type="text" name="txtEmail" value=""
               class="register-content"/><br>
        <div class="login-message"> ${error.emailPatternError}</div>
        <div class="login-message"> ${error.emailHasbeenUsed}</div>
        <label>Address</label>
        <input type="text" name="txtAddress" value=""
               class="register-content"/><br>
        <div>
            <input type="submit" value="Register" class="register-button"/>
        </div>
    </form>

</div>


<%@include file="footer.html" %>
<jsp:include page="include/include_footer.jsp"></jsp:include>

</body>

</html>