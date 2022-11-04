<%-- Document : loginPage Created on : Sep 20, 2022, 7:14:54 AM Author : Dell --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign-in</title>
        <jsp:include page="include/include_header.jsp"></jsp:include>
            <style>
                .login-form {
                    width: 30%;
                    margin-left: auto;
                    margin-right: auto;
                    background: white;
                    border-radius: 15px;
                    padding-left: 10px ;
                    padding-right: 10px ;
                    padding-top: 20px;
                    padding-bottom: 20px;
                    margin-top: 30px;
                }

                /* LOGIN FORM */
                .sign-in-title {
                    text-align: center;
                    font-weight: bold;
                    font-size: 150%;
                    color: #000000;
                    text-transform: uppercase;
                    margin-top: 20px;
                }
                .form {
                    width: 330px;
                    margin-left:  auto;
                    margin-right: auto;
                    margin-top: 20px;
                }
                .login-content {
                    width: 100%;
                    height: 40px;
                    margin: 0 auto;
                    background-color: hwb(218deg 91% 0%);
                    border-radius: 5px;
                    padding-left: 30px;
                    outline: none;
                    border: none;
                    font-size: 18px;
                    margin-bottom: 20px;
                }

                .login-forgot {
                    width: 100%;
                    height: 50px;
                    font-weight: 400;
                    font-size: 16px;
                    line-height: 20px;
                    color: #504843;
                    display: flex;
                    justify-content: flex-end;
                    align-content: flex-start;
                }

                .login-forgot a {
                    color: black;
                    text-decoration: none;
                }

                .login-forgot a:hover {
                    color: #F65D4E;
                    opacity: 0.7;
                    text-decoration: underline;
                }

                .login-button {
                    width: 100%;
                    height: 40px;
                                        background: #F65D4E;
                    border-radius: 5px;
                    color: white;
                    border: none;
                    font-size: 120%;
                }

                .login-button:hover {
                    color: #F65D4E;
                    background: #FFFFFF;
                    border: solid #F65D4E 1px;
                }

                .login-register {
                    margin-top: 20px;
                    text-align: right;
                }

                .register:hover {
                    color: #F65D4E;
                    opacity: 0.7;
                }

                .login-message {
                    color: red;
                    font-weight: bold;
                }
                .google-label {
                    text-align: center;
                    margin-top: 20px;
                    margin-bottom: 20px;
                    font-size: 130%;
                    font-weight: bold;
                }
                .google-button {
                    display: inline-block;
                    width: 100%;
                    text-align: center;
                    margin-bottom: 20px;
                }
                .google-button img {
                    width: 60%;
                }
                label{
                    font-size: 18px;
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
        <div>
            <div class="login-form">
                <div class="sign-in-title">Sign-in</div>
                <c:set var="error" value="${requestScope.ERROR}" />
                <form class="form" action="loginAction" method="POST">

                    <label>Phone number</label><br>
                    <input type="tel" name="txtPhone" value="" 
                           class="login-content" /> <br>
                    <label>Password</label><br>
                    <input type="password" name="txtPassword" value="" 
                           class="login-content" />
                    <div class="login-message"> ${error}</div>
                    <div class="login-forgot">
                        <a style="" href="<to be continued>">Forgot your password</a>
                    </div>
                    <div>
                        <input type="submit" value="Login" class="login-button" />
                    </div>

                    <div class="login-register">
                        <a style="text-decoration: none;color:black" href="registrationPage">Do not have any
                            account? <span class="register" style="text-decoration: underline">Register
                                now</span></a>
                    </div>
                    <div class="google-label">OR</div>
                    <a class="google-button" href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8084/BookStoreManagement/googleLoginAction&response_type=code
                       &client_id=1044236251299-peoeb56evfufdlt8cri6p48ds2u13a7f.apps.googleusercontent.com&approval_prompt=force">
                        <img src="img/btn_google_signin_dark_normal_web@2x.png" alt="btn_google_signin_dark_focus"/>
                    </a>
                </form>

            </div>
        </div>


        <%@include file="footer.html" %>
        <jsp:include page="include/include_footer.jsp"></jsp:include>

    </body>

</html>