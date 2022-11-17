<%-- Document : accountInformation Created on : Sep 20, 2022, 8:57:05 AM Author : Dell --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account information</title>
        <jsp:include page="include/include_header.jsp"></jsp:include>

            <style>
                .profile-form {
                    background-color: white;
                    width: 70%;
                    margin: 0 auto;
                    padding: 30px;
                    margin-top: 50px;
                    border-radius: 20px;
                    margin-bottom: 50px;
                }
                .avatar {
                    text-align: center;
                    border-right: solid 1px #504843;
                }
                .avatar img {
                    width: 70%;
                    border-radius: 50%;

                }
                .update-information {

                }
                .update-title {
                    font-weight: bolder;
                    margin-bottom: 30px;
                }
                .update-sub-title {
                    font-weight: bold;
                    margin-bottom: 20px;
                }
                .input {
                    margin-bottom: 20px;
                }
                label {
                    font-size: 110%;
                    margin-top: 5px;
                }
                input[type="radio"] {
                    margin-left:  20px;
                    margin-top: 10px;
                }
                input[type="text"] {
                    width: 90%;
                    background-color: white;
                    padding: 5px;
                    border: solid 1px black;
                    border-radius: 5px;
                }
                .information {
                    padding-left: 30px;
                }
                .sub-content {
                    margin-bottom: 50px;
                }
                .update-pass  a{
                    text-decoration: underline;
                    color: black;
                }
                .update-pass  a:hover{
                    text-decoration: underline;
                    color: #F65D4E;
                }
                input[type="submit"] {
                    padding: 5px;
                    width: 200px;
                    margin-left: 50%;
                    transform: translateX(-50%);
                    background-color: #F65D4E;
                    border: solid 1px #F65D4E;
                    color: white;
                    border-radius: 5px;
                    transition: all .3s;
                }
                input[type="submit"]:hover {
                    background-color: white;
                    color: #F65D4E;
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

        <c:set var="user" value="${requestScope.USER}" />
        <c:set var="error" value="${requestScope.ERROR}" />
        <form class="profile-form" action="updateAccountInfor" method="POST">
            <h2 class="update-title">Account Information</h2>
            <div class="row">

                <div class="col-md-4 avatar">
                    <img src="img/avatar.jpg" />
                </div>
                <div class="col-md-8 information">
                    <div class="sub-content">
                        <h3 class="update-sub-title">Personal information</h3>
                        <div class="row input" >
                            <div class="col-md-2">
                                <label > Full name </label>
                            </div>
                            <div class="col-md-10">
                                <input  type="text" name="txtFullName" value="${user.fullName}" />
                            </div>
                        </div>
                        <div class="row input" >
                            <div class="col-md-2">
                                <label> Gender </label>
                            </div>
                            <div class="col-md-10">
                                <input type="radio" name="txtGender" value="male" checked="checked" /> Male
                                <input type="radio" name="txtGender" value="female" /> Female
                                <input type="radio" name="txtGender" value="other"  /> Other
                            </div>
                        </div>   
                        <div class="row input">
                            <div class="col-md-2">
                                <label>Address</label>
                            </div>
                            <div class="col-md-10">
                                <input class="col" type="text" name="txtAddress" value="${user.address}" />
                            </div>
                        </div>
                    </div>
                    <div class="sub-content">
                        <h3 class="update-sub-title">Secure information </h3>
                        <div class="row input" >
                            <div class="col-md-2 update-information-title"> 
                                <label>Phone</label>
                            </div>
                            <div class="col-md-10">
                                <input type="text" name="txtPhone" disabled value="${user.username}" pattern="^\\+?\\d{1,3}?[- .]?\\(?(?:\\d{2,3})\\)?[- .]?\\d\\d\\d[- .]?\\d\\d\\d\\d$" />
                            </div>
                        </div>
                        <div class="row input" >
                            <div class="col-md-2 update-information-title">
                                <label>Email</label>
                            </div>
                            <div class="col-md-10"> 
                                <input type="text" name="txtEmail" value="${user.email}" />
                                ${error.emailPatternError}
                                ${error.emailHasbeenUsed}
                            </div>
                        </div>

                        <div class="row input">
                            <div class="col-md-2 update-information-title">Password</div>
                            <div class="col-md-10 update-pass">
                                <a href="updatePasswordPage">Change your password</a>
                            </div>
                            <div class="update-message">${requestScope.MESSAGE}</div>
                        </div>
                    </div>
                    <input type="submit" value="Update" class="update-button" />
                </div>
                            
            </div>




        </div>
        
    </form>
    <%@include file="footer.html" %>
    <jsp:include page="include/include_footer.jsp"></jsp:include>

</body>

</html>