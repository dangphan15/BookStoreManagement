<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN"/>
<!-- header -->
<style>
    .user-icon, .user-icon-name {
        cursor: pointer;
        /*display: flex;*/
        /*align-items: center;*/
    }

    .user-icon-name .user-sub-icon {
        /*margin-top: 10px;*/
        /*left: -113px;*/
        /*top: 150%;*/
    }

    .user-icon .user-sub-icon {
        left: -113px;
        /*top: 100%;*/
    }

    .user-icon:hover .user-sub-icon {
        background-color: #ffffff;
        border-color: #F37878;
        border-radius: 15px;
        padding: 5px;
    }

    .user-icon-name:hover .user-sub-icon {
        background-color: #ffffff;
        border-color: #F37878;
        border-radius: 15px;
        padding: 5px;
    }

    .user-button {
        color: #f85b2b !important;
        text-decoration: none;
        background-color: white;
        padding: 5px 5px;
        margin-bottom: 5px;
        border: 1px solid rgba(248, 91, 43, 0.6);
        border-radius: 10px;
    }

    header .navbar .user-icon:hover > .user-sub-icon {
        display: block;
    }

    header .navbar .user-icon-name:hover > .user-sub-icon {
        display: block;
    }

    header .navbar .user-button:hover {
        color: white !important;
        border: none;
        background-color: #f85b2b;
    }

    .user-name {
        font-size: 80%;
        width: 100px;
    }

    /*.btn-blog {*/
    /*    background-color: #FFFFFF;*/
    /*    color: #f85b2b;*/
    /*    border-radius: 18px;*/
    /*    font-weight: bolder;*/
    /*    font-size: 16px;*/
    /*    min-width: 140px;*/
    /*    max-height: 40px;*/
    /*    display: flex;*/
    /*    justify-content: space-between;*/
    /*    padding-top: 0;*/
    /*    padding-bottom: 0;*/
    /*    padding-right: 0;*/
    /*    align-items: center;*/
    /*    border-bottom: 1px solid #f85b2b;*/
    /*    border-top: 1px solid #f85b2b;*/
    /*    border-left: 1px solid #f85b2b;*/
    /*}*/

    /*.btn-blog a div {*/
    /*    color: #FFFFFF;*/
    /*}*/

    /*.btn-blog a div:hover, .btn-blog a div:focus {*/
    /*    background-color: #df5023 !important;*/
    /*    color: #FFFFFF !important;*/
    /*}*/

    .btn-blog {
        background-color: #fbeee0;
        border: 2px solid #422800;
        border-radius: 15px;
        box-shadow: #422800 2px 2px 0 0;
        color: #422800 !important;
        cursor: pointer;
        display: inline-block;
        font-weight: 600;
        font-size: 18px;
        padding: 0 18px;
        line-height: 36px;
        text-align: center;
        text-decoration: none;
        user-select: none;
        -webkit-user-select: none;
        touch-action: manipulation;
    }

    .btn-blog:hover {
        background-color: #fff;
    }

    .btn-blog:active {
        box-shadow: #422800 1px 1px 0 0;
        transform: translate(2px, 2px);
    }

    @media (min-width: 768px) {
        .btn-blog {
            min-width: 130px;
            padding: 0 25px;
        }
        .button-dropdown-category{
            min-width: 130px;
        }
    }
    .dropdown-menu-category[data-bs-popper] {
        top: 70% !important;
        border-radius: 12px;
    }
    .dropdown-menu-category li a:hover{
        background-color:rgba(248, 91, 43, 0.9) ;
        color: #FFFFFF;
    }
    .button-dropdown-category {
        align-items: center;
        appearance: none;
        background-color: rgba(248, 91, 43, 0.9);
        border-radius: 14px;
        border-width: 0;
        box-shadow: rgba(248, 91, 43, 0.4) 0 2px 4px, rgba(248, 91, 43, 0.3) 0 7px 13px -3px, #422800 0 -3px 0 inset;
        box-sizing: border-box;
        color: snow;
        cursor: pointer;
        display: inline-flex;
        font-family: "JetBrains Mono", monospace;
        height: 42px;
        justify-content: center;
        line-height: 1;
        list-style: none;
        overflow: hidden;
        padding-left: 16px;
        padding-right: 16px;
        padding-bottom: 4px;
        position: relative;
        text-align: left;
        text-decoration: none;
        transition: box-shadow .15s, transform .15s;
        user-select: none;
        -webkit-user-select: none;
        touch-action: manipulation;
        white-space: nowrap;
        will-change: box-shadow, transform;
        font-size: 18px;
    }

    .button-dropdown-category:focus {
        box-shadow: #422800 0 0 0 1.5px inset, rgba(248, 91, 43, 0.4) 0 2px 4px, rgba(248, 91, 43, 0.3) 0 7px 13px -3px, #422800 0 -3px 0 inset;
    }

    .button-dropdown-category:hover {
        box-shadow: rgba(248, 91, 43, 0.4) 0 4px 8px, rgba(248, 91, 43, 0.3) 0 7px 13px -3px, #422800 0 -3px 0 inset;
        transform: translateY(-2px);
    }

    .button-dropdown-category:active {
        box-shadow: #D6D6E7 0 3px 7px inset;
        transform: translateY(2px);
    }


</style>
<header style="z-index: 100; border-bottom: solid 1px #7D7068">
    <div class="navbar navbar-expand-lg navbar-light pt-0 pb-0" style="border-bottom: solid 0.5px black">
        <div class="container-fluid pe-4 ps-4 justify-content-between "
             style="background-color: #ffffff; height: 120px">
            <div class="d-flex justify-content-evenly" style="min-width: 540px">
                <!-- insert web logo -->
                <a class="d-flex " style="padding-left: 40px" href="./">
                    <img src="img/logo1.png" alt="web-logo"
                         style="min-width: 200px; max-height: 120px; object-fit: cover">
                </a>
                <!-- Category select -->
                <div class="dropdown ms-4 d-flex justify-content-center align-items-center">
                    <button class="dropdown-toggle button-dropdown-category" role="button" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fa-solid fa-shapes me-2"></i>
                        <span>Category</span>
                    </button>
                    <!-- on click display category list -->
                    <ul class="dropdown-menu dropdown-menu-category" style="min-width: 130px" aria-labelledby="dropdownMenuButton1">
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
                <div class="d-flex ms-4 justify-content-center align-items-center">

                    <a class="btn-blog text-decoration-none" href="viewBlogListAction"><span>Blogs</span></a>
                    <%--                        <a class="text-decoration-none" href="viewBlogListAction">--%>
                    <%--                            <div class="d-flex align-items-center justify-content-center"--%>
                    <%--                                 style="min-width: 35px;min-height: 40px; background-color: #f85b2b; border-bottom-right-radius: 18px;border-top-right-radius: 18px;">--%>
                    <%--                                <i class="fa-solid fa-caret-right fa-sm"></i>--%>
                    <%--                            </div>--%>
                    <%--                        </a>--%>

                </div>
            </div>

            <div class="flex-grow-1" style="max-width: 500px">
                <div>
                    <!-- Search form -->
                    <div style="min-width: 400px">
                        <form action="searchBookController"
                              style="display: flex; border-radius: 18px; border: none; height:40px; background-color: #EAF6F6"
                              class="pe-4">


                            <input class="form-control "
                                   style="border-radius: 15px; border-color: transparent;background-color: #EAF6F6"
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
            <div class="row" style="padding-right: 5%">
                <div class="col d-flex justify-content-center align-items-center">

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
                <div class="col d-flex justify-content-center align-items-center">
                    <div class="d-flex justify-content-center ms-2" style="height: 20px;">
                        <div class="vr"></div>
                    </div>
                </div>

                <%--user--%>

                <div class="col d-flex justify-content-center align-items-center">
                    <c:set var="user" value="${sessionScope.USER}"/>

                    <%--                        <button class="btn" type="button" id="dropdownUserButton"  aria-haspopup="true" aria-expanded="false">--%>
                    <%--                            <i class="fa-light fa-user fa-xl"></i>--%>
                    <%--                        </button>--%>

                    <!-- on click display category list -->

                    <c:if test="${empty user}">
                        <div class="user-icon dropdown ">
                            <button class="btn" type="button" id="dropdownUserButton" aria-haspopup="true"
                                    aria-expanded="false">
                                <i class="fa-light fa-user fa-xl"></i>
                            </button>

                            <!-- login button -->
                            <div class="user-sub-icon dropdown-menu " aria-labelledby="dropdownUserButton">
                                <a class="user-button dropdown-item login-btn" href="loginPage">Login</a>
                                <!-- register button -->
                                <a class="user-button dropdown-item" href="registrationPage">Register</a>
                            </div>
                        </div>
                    </c:if>


                    <c:if test="${not empty user}">
                        <div class="user-icon-name dropdown ">
                            <div style="min-height: 40px" class="d-flex align-items-center" type="button"
                                 id="dropdownUserButton1" aria-haspopup="true"
                                 aria-expanded="false">
                                <i class="fa-light fa-user fa-xl me-2"></i>
                                <span class="user-name align-self-end mb-1">${user.fullName}</span>
                            </div>
                            <!-- User name welcome -->
                            <div class="user-sub-icon dropdown-menu" aria-labelledby="dropdownUserButton1">
                                <!-- list of action for user -->
                                <a class="user-button  dropdown-item" href="viewOrderHistory">Orders
                                    history</a>

                                <a class="user-button  dropdown-item" href="userInformation">Update
                                    Profile</a>

                                <!-- logout button -->
                                <a class="user-button login-btn dropdown-item" href="logoutAction">Logout</a>

                            </div>
                        </div>
                    </c:if>

                </div>


            </div>
        </div>

    </div>

</header>