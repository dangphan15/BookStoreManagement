<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN"/>
<!-- header -->
<style>
    .user-icon {
        cursor: pointer;
        position: relative;
    }

    .user-sub-icon {
        text-align: center;
        display: inline-block;
        position: absolute;
        top: 100%;
        /*left: -110px;*/
        background-color: white;
        z-index: 99;
        padding-right: 5px ;
        padding-left: 5px;
        padding-top: 10px;
        padding-bottom: 10px;


        border-radius: 15px;
        transition: all .2s;
        display: none;
        border: solid rgba(0, 0, 0, 0.2) 1px;
    }

    .user-icon:hover .user-sub-icon {
        display: inline-block;
    }

    .user-button {
        position: relative;
        display: inline-block;
        color: #f85b2b !important;
        text-decoration: none;
        background-color: white;
        color: white;
        padding: 5px 5px;
        width: 150px;
        z-index: 100;
        margin-bottom: 5px;
        border: 1px solid rgba(248, 91, 43, 0.6);
        border-radius: 10px;
        left:0;
    }

    .login-btn {
        color: white !important;
        border: none;
        background-color: #f85b2b;
    }

    .user-name {
        position: absolute;
        display: inline-block;
        font-size: 80%;
        width: 100px;
        left: 30px;
        top: 8px;
    }

</style>
<header style="z-index: 100; border-bottom: solid 1px #7D7068">
    <div class="navbar navbar-expand-lg navbar-light pt-0 pb-0" style="border-bottom: solid 0.5px black">
        <div class="container-fluid pe-4 ps-4 justify-content-between " style="background-color: #ffffff; height: 120px">

            <!-- insert web logo -->
            <a class="pb-4 ps-2 " href="./"> <img src="img/logo1.png" alt="web-logo"
                                                  style="max-width: 200px;margin-top: 15px">
            </a>

            <div class="flex-grow-1" style="max-width: 800px">
                <div class="d-flex justify-content-center">

                    <!-- Category select -->
                    <div class="pe-4 dropdown">
                        <button
                            style="display: flex; flex-direction: row; justify-content: space-around; align-items: center;
                     background: #f85b2b; color: white; border-radius: 18px; width: 200px; height: 40px;border: none "
                            class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            <img class="m-2 x" src="img/icon_dropdown_category.png"
                                 style="width: 22px; height: 22px"/>
                            <span class="m-2" style="font-size: 20px; font-weight: bold">Category</span>
                        </button>
                        <!-- on click display category list -->
                        <ul class="dropdown-menu " style="min-width: 200px" aria-labelledby="dropdownMenuButton1">
                            <li>

                                <a href="searchBookController?genres=Action" class="dropdown-item">Action </a>
                            </li>

                            <li>

                                <a href="searchBookController?genres=Adventure" class="dropdown-item">Adventure </a>
                            </li>

                            <li>

                                <a href="searchBookController?genres=Comedy" class="dropdown-item">Comedy </a>
                            </li>

                            <li>

                                <a href="searchBookController?genres=Fantasy+Fiction" class="dropdown-item">Fantasy
                                    Fiction </a>
                            </li>

                            <li>

                                <a href="searchBookController?genres=Harem" class="dropdown-item">Harem </a>
                            </li>

                            <li>

                                <a href="searchBookController?genres=Horror" class="dropdown-item">Horror </a>
                            </li>

                            <li>

                                <a href="searchBookController?genres=Paranormal+fiction"
                                   class="dropdown-item">Paranormal fiction </a>
                            </li>

                            <li>

                                <a href="searchBookController?genres=Romantic+comedy" class="dropdown-item">Romantic
                                    comedy </a>
                            </li>

                            <li>

                                <a href="searchBookController?genres=School+life" class="dropdown-item">School life </a>
                            </li>

                            <li>

                                <a href="searchBookController?genres=Science+fiction" class="dropdown-item">Science
                                    fiction </a>
                            </li>

                            <li>

                                <a href="searchBookController?genres=Slide+of+life" class="dropdown-item">Slide of life
                                </a>
                            </li>

                            <li>

                                <a href="searchBookController?genres=Supernatural" class="dropdown-item">Supernatural
                                </a>
                            </li>

                            <li>

                                <a href="searchBookController?genres=Thriller" class="dropdown-item">Thriller </a>
                            </li>
                        </ul>
                    </div>

                    <!-- Search form -->
                    <div style="width: 550px">
                        <form action="searchBookController"
                              style="display: flex; border-radius: 18px; border: none; height:40px; background-color: #EAF6F6"
                              class="pe-4">


                            <input class="form-control "
                                   style= "border-radius: 15px; border-color: transparent;background-color: #EAF6F6"
                                   type="search"
                                   placeholder="Search for manga that you like..." aria-label="Search"
                                   name="searchValue"
                                   value="${requestScope.SEARCH_VALUE}" required>
                            <!-- search button -->

                            <button style="border: none; background: none; opacity: 0.36" type="submit">
                                <i class="fa-solid fa-magnifying-glass ps-3"></i>
                            </button>


                        </form>
                    </div>


                </div>



            </div>
            <!-- cart and user button -->
            <div class="row justify-content-start p-2" style="min-width: 300px">
                <div class="col " style="max-width: 60px">

                    <a href="viewCartPage">

                        <button style="text-decoration: none; background: none; border: none">

                            <i class="fa-light fa-cart-shopping fa-xl"></i>
                            <span class="position-absolute translate-middle badge rounded-pill bg-danger"
                                  style="top: 42px ">
                                <c:set var="itemAmount" value="${sessionScope.CART.items.size()}"/>
                                <span id="cart-item-amount">${not empty itemAmount ? itemAmount : 0}</span>
                            </span>
                        </button>


                    </a>

                </div>
                <div class="col" style="max-width: 40px">
                    <div class="d-flex justify-content-center" style="height: 20px;">
                        <div class="vr"></div>
                    </div>
                </div>

                <%--user--%>

                <div class="col " style="max-width: 40px">
                    <c:set var="user" value="${sessionScope.USER}"/>

                    <div class="user-icon">
                        <i class="fa-light fa-user fa-xl"></i>
                        <!-- on click display category list -->

                        <c:if test="${empty user}">

                            <!-- login button -->
                            <div class="user-sub-icon">
                                <a class="user-button login-btn" href="loginPage">Login</a>
                                <!-- register button -->
                                <a class="user-button" href="registrationPage">Register</a>
                            </div>
                        </c:if>
                        <c:if test="${not empty user}">
                            <span class="user-name">${user.fullName}</span>
                            <!-- User name welcome -->
                            <div class="user-sub-icon">
                                <!-- list of action for user -->
                                <a class="user-button" href="viewOrderHistory">Orders
                                    history</a>

                                <a class="user-button" href="userInformation">Update
                                    Profile</a>

                                <!-- logout button -->
                                <a class="user-button login-btn" href="logoutAction">Logout</a>

                            </div>
                        </c:if>
                    </div>
                </div>


            </div>


        </div>

    </div>

</header>