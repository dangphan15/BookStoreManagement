<%-- 
    Document   : loginPage.jsp
    Created on : Oct 14, 2022, 9:22:26 PM
    Author     : QuanMX
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login</title>
    <jsp:include page="../include/include_header.jsp"/>
    <style>


    </style>
</head>
<body>


<c:set var="error" value="${requestScope.ERROR}"/>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login 1</title>
    <link rel="stylesheet" href="reset.css">
    <link rel="stylesheet" href="styles.css">
    <link
        href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,300;0,400;0,500;0,600;1,400&display=swap"
        rel="stylesheet">
    <link href="https://file.myfontastic.com/yCrHy5en2ZWbMAHZvZHoqL/icons.css" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            background: linear-gradient(rgba(246, 247, 249, 0.8), rgba(246, 247, 249, 0.8)),
            url('../img/bg-clouds.jpg')
            no-repeat center center fixed;
            background-size: cover;
        }

        .main {
            width: 100vw;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;

        }

        .login-wrapper {
            display: flex;
            background-clip: content-box;
            box-shadow: 5px 5px 20px grey;
            border-radius: 15px;
            overflow: hidden;
            max-height: 600px;


        }


        /*--------LEFT---------- */
        .login-wrapper .login-logo-left {
            background-color: #fc8483;
            padding: 0px 60px 0px 60px;

        }

        .login-wrapper .login-logo-left .header-container {
            display: flex;
            /*padding-top: 40px;*/

        }

        .login-wrapper .login-logo-left .header-container h4 {
            align-items: flex-end;
            color: white;
            padding: 20px 50px 20px 20px;
            margin-bottom: 80px;
            font-weight: bold;
        }

        .login-wrapper .login-logo-left .header-container img {
            width: 50px;
            height: 50px;
            object-fit: cover;
        }

        /*------------------------ */
        .login-wrapper .login-logo-left .center-text {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            color: white;
            /*padding-top: 15%;*/
            /*margin-bottom: 60%;*/

        }

        .login-wrapper .login-logo-left .center-text .h1 {
            font-size: 2.5em;
            font-weight: bold;
            color: white;
            justify-content: center;
            margin-bottom: 20px;
        }




        /*------------RIGHT------------ */

        .login-wrapper .login-container-right {
            padding: 100px 60px 100px 60px;
            background-color: white;
        }

        .login-wrapper .login-container-right .h3 {

            font-size: 1.7em;
            font-weight: bold;
            color: #545454;
            margin-bottom: 30px;
        }

        .login-wrapper .login-container-right .input-container {
            display: flex;
            flex-direction: column;
        }

        .login-wrapper .login-container-right input {
            background-color: #eff1f3;
            border-radius: 30px;
            margin-bottom: 20px;
            width: 300px;
            border: none;
            padding: 15px;
        }

        .login-wrapper .login-container-right #link-continue {
            background-color: #fe9091;
            border-radius: 30px;
            margin-bottom: 20px;
            width: 300px;
            border: none;
            padding: 15px;
            text-align: center;
            color: white;
            text-decoration: none;
            letter-spacing: 5px;
            font-size: 1em;
            box-shadow: 5px 5px 10px #8e8a8a;
        }
        #link-continue:hover {
            background-color: rgb(182, 1, 1) !important;
        }


        span {
            color: grey;
            font-size: 0.8em;
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }



        /*--------MEDIA QUERIES----------- */

        /* TABLET 1  */

        @media screen and (min-width: 768px) and (max-width: 1023px) {

            .login-wrapper .login-logo-left {
                background-color: #fc8483;
                padding: 0px 30px 0px 30px;

            }

            .login-wrapper .login-logo-left .header-container {
                display: flex;


            }

            .login-wrapper .login-logo-left .header-container h4 {
                align-items: flex-end;
                color: white;
                padding: 20px 50px 20px 20px;
                margin-bottom: 80px;
                font-weight: bold;
            }

            .login-wrapper .login-logo-left .header-container img {
                width: 50px;
                height: 50px;
                object-fit: cover;
            }

            /*------------------------ */
            .login-wrapper .login-logo-left .center-text {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                color: white;
                padding-top: 30%;
                margin-bottom: 60%;
                text-align: center;

            }

            .login-wrapper .login-logo-left .center-text .h1 {
                font-size: 2.5em;
                font-weight: bold;
                color: white;
                justify-content: center;
                margin-bottom: 20px;
            }

        }

        /* TABLET 2 */

        @media screen and (min-width: 600px) and (max-width: 799px) {
            .login-wrapper .login-container-right {
                padding: 80px 10px 80px 10px;
                background-color: white;
                width: 90%;
            }

            .login-wrapper .login-container-right .h3 {

                font-size: 1.7em;
                font-weight: bold;
                color: #545454;
                margin-bottom: 30px;
            }

            .login-wrapper .login-container-right .input-container {
                display: flex;
                flex-direction: column;
            }

            .login-wrapper .login-container-right input {
                background-color: #eff1f3;
                border-radius: 30px;
                margin-bottom: 20px;
                width: 90%;
                border: none;
                padding: 15px;
            }

            .login-wrapper .login-container-right #link-continue {
                background-color: #fe9091;
                border-radius: 30px;
                margin-bottom: 20px;
                width: 90%;
                border: none;
                padding: 15px;
                text-align: center;
                color: white;
                text-decoration: none;
                letter-spacing: 7px;
                font-size: 0.8em;
                box-shadow: 5px 5px 10px #8e8a8a;
            }

            span {
                color: grey;
                font-size: 0.8em;
                display: flex;
                justify-content: center;
                margin-bottom: 20px;
            }

            .login-wrapper .login-container-right .link-social-media {
                display: flex;
                flex-direction: column;
            }




        }

        /* mobile-landscape: min:480px - max:599px; */

        @media screen and (min-width: 480px) and (max-width: 599px) {
            /*--------LEFT---------- */
            .login-wrapper .login-logo-left {
                background-color: #fc8483;
                padding: 0px 30px 0px 30px;

            }

            .login-wrapper .login-logo-left .center-text {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                color: white;
                padding-top: 30%;
                margin-bottom: 60%;
                text-align: center;
            }


            .login-wrapper .login-logo-left .semi-footer {
                display: flex;
                justify-content: end;
                align-items: flex-end;

            }

            .login-wrapper .login-logo-left .semi-footer a {
                text-decoration: none;
                color: white;
                font-weight: bold;
            }

            .login-wrapper .login-logo-left .semi-footer hr {
                height: 3px;
                width: 100%;
                background-color: white;
                border: none;
                display: flex;
                align-items: flex-start;
            }

            /*RIGHT----------- */
            .login-wrapper .login-container-right {
                padding: 100px 30px 100px 30px;
                background-color: white;
            }

            .login-wrapper .login-container-right .h3 {

                font-size: 1.7em;
                font-weight: bold;
                color: #545454;
                margin-bottom: 30px;
            }

            .login-wrapper .login-container-right .input-container {
                display: flex;
                flex-direction: column;
            }

            .login-wrapper .login-container-right input {
                background-color: #eff1f3;
                border-radius: 30px;
                margin-bottom: 20px;
                width: 90%;
                border: none;
                padding: 15px;
            }

            .login-wrapper .login-container-right #link-continue {
                background-color: #fe9091;
                border-radius: 30px;
                margin-bottom: 20px;
                width: 90%;
                border: none;
                padding: 15px;
                text-align: center;
                color: white;
                text-decoration: none;
                font-size: 0.8em;
                box-shadow: 5px 5px 10px #8e8a8a;
                letter-spacing: normal;

            }

            span {
                color: grey;
                font-size: 0.8em;
                display: flex;
                justify-content: center;
                margin-bottom: 20px;
            }

            .login-wrapper .login-container-right .link-social-media {
                display: flex;
                flex-direction: column;
            }


        }

        /*mobile-portrait: min:320px - max:479px; */

        @media screen and (min-width: 320px) and (max-width: 479px) {
            .main {

                display: flex;
                flex-wrap: wrap;
                align-items: center;
                justify-content: center;
                max-height: 500px;

            }

            .login-wrapper {
                display: flex;
                flex-direction: column;
                background-clip: content-box;
                box-shadow: 5px 5px 20px grey;
                overflow: hidden;
                border-radius: 1%;

            }

            .login-wrapper .login-container-right input {
                background-color: #eff1f3;
                border-radius: 30px;
                margin-bottom: 20px;
                width: 100%;
                border: none;
                padding: 15px;
            }

            .login-wrapper .login-container-right #link-continue {
                background-color: #fe9091;
                border-radius: 30px;
                margin-bottom: 20px;
                width: 100%;
                border: none;
                padding: 15px;
                text-align: center;
                color: white;
                text-decoration: none;
                font-size: 0.8em;
                box-shadow: 5px 5px 10px #8e8a8a;
                letter-spacing: normal;

            }
        }
    </style>
</head>
<body>
<main class="main">
    <div class="login-wrapper">

        <div class="login-logo-left">
            <header class="header-container justify-content-center">
                <img src="../img/logo1.png" alt="web-logo" style="min-width: 300px; min-height: 250px ">

            </header>

            <div class="center-text">
                <h1 class="h1">Welcome back, </h1>
                <h2 class="h2">Sign in to continue access page</h2>
            </div>


        </div>

        <div class="login-container-right ">

            <form  action="loginAction" method="POST">
                <h3 class="h3 text-center">Sign In</h3>

                <div class="input-container">
                    <label class="mb-2">Username</label>
                    <input class="input-text" type="text" name="txtUsername" value="${param.txtUsername}"
                           placeholder="Phone number"/>
                    <label class="mb-2">Password</label>
                    <input class="input-pass" type="password" name="txtPassword" value="" placeholder="Password"/>
                    <div class="mt-3 mb-3 text-center" style="color: red"> ${error}</div>

                    <input id="link-continue"  type="submit" value="Login"/>
                </div>
            </form>



        </div>


    </div>
</main>
</body>

<jsp:include page="../include/include_footer.jsp"/>
</body>
</html>
