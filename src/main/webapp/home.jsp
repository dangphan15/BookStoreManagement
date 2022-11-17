<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manga bookstore</title>
    <jsp:include page="include/include_header.jsp"></jsp:include>
    <style>
        .book-card {
            /*display: flex;*/
            transition: all .2s;
        }

        .book-card:hover {
            transform: scale(1.05);
            box-shadow: 0px 0px 16px -2px rgba(148, 148, 148, 0.66);
            -webkit-box-shadow: 0px 0px 16px -2px rgba(148, 148, 148, 0.66);
            -moz-box-shadow: 0px 0px 16px -2px rgba(148, 148, 148, 0.66);
        }

        #header {
            top: 0;
            position: fixed;
            width: 100%;
            transition: all .4s;
            visibility: hidden;
            opacity: 0;
        }

        @keyframes fly-top-in {
            0% {
                top: -300px;
            }
            100% {
                top: 0;
            }
        }

        @keyframes fly-left-in {
            0% {
                left: -300px;
            }
            100% {
                left: -5px;
            }
        }

        @keyframes fade-in {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }

        .banner {
            padding-top: 80px;
            padding-left: 200px;
            /*margin-top: 120px;*/
            border-radius: 10px;
            width: 100%;
            height: 65vh;
            max-height: 400px;
            background: linear-gradient(-90deg, rgba(255, 153, 102, 0.8), rgba(255, 94, 98, 0.8)),
            url('img/banner-bg.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            background-position: 0 30%;

        }

        .banner-2 {
            padding-top: 100px;
            padding-left: 200px;
            width: 100%;
            height: 65vh;
            max-height: 400px;
            background: linear-gradient(-90deg, rgba(255, 153, 102, 0.4), rgba(255, 94, 98, 0.4)),
            url('img/banner-bg_2.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            background-position: 0 30%;
            border-radius: 10px;
        }

        .banner-4 {
            max-height: 400px;
            background: linear-gradient(-90deg, rgba(255, 153, 102, 0.2), rgba(255, 94, 98, 0.2)),
            url('img/banner_4.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            background-position: 0 30%;
            border-radius: 10px;
        }

        .title-banner-4 {
            position: absolute;
            top: 130px;
            left: 135px;
            color: #FFFFFF;
            font-weight: 900;
            font-size: 25px;
            min-width: 180px;
            background-color: rgb(211, 43, 43);
            padding-left: 8px;
        }

        .price-300 {
            position: relative;
            top: 180px;
            right: -65px;
            color: yellow;
            font-weight: 900;
            font-size: 60px;

        }


        .title {
            position: relative;
            color: white;
            height: 120px;
        }

        .title h2 {
            font-size: 150%;
            position: absolute;
            top: 0;
            animation-name: fly-top-in;
            animation-duration: 1s;
        }

        .title h1 {
            font-size: 600%;
            font-weight: bolder;
            position: absolute;
            top: 30px;
            left: -5px;
            animation-name: fly-left-in;
            animation-duration: 1.5s;
        }

        .subtitle {
            color: white;
            font-weight: 400;
            margin-top: 10px;
            font-size: 22px;
            width: 40%;
            animation-name: fade-in;
            animation-duration: 2s;
        }

        .shopnow-btn {
            display: inline-block;
            text-decoration: none;
            /*margin-top: 20px;*/
            position: absolute;
            right: 150px;
            top: 200px;
            color: #F65D4E;
            /*background-color: white;*/
            background: linear-gradient(to left, white 50%, #F65D4E 50%) right;
            background-size: 200% 100%;
            padding: 10px;
            transition: all .2s ease;
            border-radius: 15px;
            animation-name: fade-in;
            animation-duration: 4s;
        }

        .shopnow-btn:hover {
            background-position: left;
            color: white;
        }

        html {
            scroll-behavior: smooth;
        }


        .carousel-control-prev.item-control-pre,
        .carousel-control-next.item-control-next {
            /*background-color: gray;*/
            width: 50px;
            height: 50px;
            margin-top: 100px;
            filter: invert(100%);
        }

        .carousel-control-prev.item-control-pre {
            justify-content: start;
        }

        .carousel-control-next.item-control-next {
            justify-content: end;
        }
        .rating-stars:before {
            content: "";
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background: #ccc;
        }

        .rating-stars .filled-star {
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background: #ffc107;
        }

        .rating-stars svg {
            height: 100%;
            width: 100%;
            display: block;
            position: relative;
            z-index: 1;
        }


    </style>
</head>
<body style="/*background: linear-gradient(0deg, rgba(240, 240, 240, 0.6) 0%,
                              rgba(240, 240, 240, 0.6) 100%,
                              rgba(240, 240, 240, 0.6) 100%),
                              url('img/background_homepage.jpg');
                              background-repeat: no-repeat;
                              background-size: cover;
                              background-attachment: fixed;*/
              background-color: white;
              /*overflow: overlay;*/
              ">
<!-- import header -->
<%@include file="header.jsp" %>
<!-- fake header -->
<header id="header" style="z-index: 100;
                border-bottom: solid 1px #7D7068">
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
<!-- banner start here -->
<div class="container mt-2 " style="max-height:600px; ">
    <div class="row">
        <div class="col-lg-9 ps-0">
            <div id="carouselBanner" style="border-radius: 10px;" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselBanner" data-bs-slide-to="0" class="active"
                            aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselBanner" data-bs-slide-to="1"
                            aria-label="Slide 2"></button>

                </div>
                <div class="carousel-inner ">
                    <div class="carousel-item active">
                        <div class="banner img-fluid ">

                            <div class="title">
                                <h2>FIND YOUR FAVORITE</h2>
                                <h1>MANGA</h1>
                            </div>
                            <h2 class="subtitle">
                                Action, adventure, fantasy, mystery, romance, and more—thousands of manga volumes for
                                every fan!
                            </h2>
                            <a href="#viewHomePage" class="shopnow-btn">
                                <span style="font-weight: bold">Start shopping now</span>
                                <i class="fa-solid fa-arrow-right"></i>

                            </a>
                        </div>

                    </div>
                    <div class="carousel-item banner-2 img-fluid">
                        <%--            <span style="font-size: 40px; font-weight: bold; color: #FFFFFF;">--%>
                        <%--                The Most Modern Shonen Manga--%>
                        <%--            </span>--%>

                    </div>


                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselBanner"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselBanner"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>

        <a class="col float-end banner-4" href="searchBookController?minPrice=0&maxPrice=300000"
           style="text-decoration: none">

            <div class="card d-flex">
                    <span class="title-banner-4">
                        DEAL UNDER
                    </span>

            </div>
            <span class="price-300">
                300.000
            </span>


        </a>


    </div>

</div>

<!--banner end here-->
<!--flash sale here-->
<div class="container mt-2 pt-2">
    <div class="row">
        <div class="col-lg-3 flex flex-column justify-content-between p-0 pe-1 " style="max-height: 480px">

            <a class="banner-saleoff" href="viewBookDetailController?ISBN=1974732339">
                <img src="img/banner-saleoff.jpg" style="max-width: 100%; border-radius: 10px">
            </a>
            <a class="banner-saleoff " href="searchBookController?authors=Eiichiro+Oda">
                <img src="img/echiiro-oda.png"
                     style="width: 100%;height: 50%;object-fit: cover; float: bottom; margin-top: 12px; border-radius: 10px ">
            </a>


        </div>
        <div class="col" style="background: rgba(181,181,181,0.07); border-radius: 5px">
            <div class="ms-1 p-1 mb-2" style="background: rgba(255,158,10,0.13); font-size: 30px; font-weight: bolder">
            <span class="spinner-grow text-light"><i class="fa-duotone fa-circle-bolt "
                                                     style="color: #ED0000;"></i></span>
                <span>BEST DEAL</span>
            </div>
            <div id="sale-off-list">

                <div class="row row-cols-lg-5 me-0 ms-0">
                    <!-- get book from req and display -->
                    <c:forEach items="${requestScope.SALE_OFF_LIST}" var="book">
                        <div class="col ps-1 pe-0 me-1" style="min-width: 237px">
                            <div class="d-flex ">
                                <div class="ps-1 pe-1 " style="
                                                             text-align: center;
                                                             clip-path: circle(50px);
                                                             background:#c00;
                                                             color:#fff;

                                                             -webkit-animation-name:salePulse;
                                                             -webkit-animation-duration:1s;
                                                             -webkit-animation-iteration-count:infinite;
                                                             margin: 0 0 0 auto;">
                                    <c:if test="${book.saleOffPercent gt 0}">
                                        <i
                                            style="font-size: 18px;font-weight: bolder;margin: 2px">
                                            -${book.saleOffPercent}%</i>
                                    </c:if>
                                </div>
                            </div>
                            <div class="bg-white mb-1 book-card"
                                 style="height: 380px ">
                                <c:url var="viewBookDetail" value="viewBookDetailController">
                                    <c:param name="ISBN" value="${book.ISBN}"></c:param>
                                </c:url>
                                <a href="${viewBookDetail}" style="text-decoration: none">
                                    <div style="height: 260px;
                                             width:100%;
                                             display: flex;
                                             justify-content: center;
                                             align-items: center;">
                                        <img src="${book.imageAddress}" alt="alt"
                                             style="max-height: 250px;
                                                 width: 80%;
                                                 object-fit: cover"
                                        />
                                    </div>

                                    <div class="p-2 pt-0 d-flex flex-column " style="height: 100px">
                                        <div class="flex-grow-1">
                                            <div
                                                style="font-size: 18px;
                                                    font-weight: bolder;
                                                    color: black;
                                                    text-decoration: none">
                                                <span class="text-truncate d-inline-block" style="max-width: 200px" >${book.name}</span>
                                            </div>
                                            <div class="mt-2" style="color: #7D7068;
                                                     font-size: 10px">
                                                <span>${book.authors.get(0).aliasName}</span>
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-center" style="width: 50%;">
                                            <div class="rating-stars d-inline-block position-relative mr-2">
                                                <%@include file="img/grey-star.svg" %>
                                                <div class="filled-star" style="width: ${book.rating.avg * 100 / 5}%"></div>
                                            </div>
                                            <div style="font-size: 14px;">(${book.rating.totalReview})</div>
                                        </div>

                                        <div class="mb-2">

                                            <c:if test="${book.currentPrice != book.price}">

                                        <span style="color: #ED0000;
                                                          font-size: 18px;
                                                          font-weight: bold">
                                                        <fmt:formatNumber value="${book.currentPrice}" type="currency"/>
                                                    </span>
                                                <s style="color: black;
                                                       font-size: 12px">
                                                    <fmt:formatNumber value="${book.price}" type="currency"/>
                                                </s>


                                            </c:if>

                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>

                    </c:forEach>

                </div>

            </div>
        </div>

    </div>


</div>


<!--sale-off-list end here-->

<!--book display here-->
<div class="container bg-white" id="viewHomePage">


    <!--trending book-->
    <div id="trending-list">


        <div class="d-flex flex-row mt-3 pt-3 mb-3">
            <h2 class="ms-0" style="font-size: 35px ;
                        font-weight: 800;
                        -webkit-text-stroke: 0.1px #FFFFFF;">Trend of the month</h2>
            <hr class="flex-grow-1 ms-5 me-5"/>
            <a href="searchBookController" class="me-0">
                <button class="btn me-0" style="background: #f85b2b;
                                border-radius: 20px;
                                color: white">
                    <span class="ms-3 " style="font-weight: bold">View all</span>
                    <span class="ms-3"><i class="fa-light fa-angle-right"></i></span>
                </button>
            </a>
        </div>
        <div class="ms-0 me-0 carousel slide" id="carouselTrending" data-bs-ride="carousel">
            <div class="carousel-inner">
                <c:forEach begin="0" end="1" varStatus="counter">
                    <div class="carousel-item
                                 <c:if test="${counter.count==1}"> active</c:if>
                                 ">
                        <div class="row row-cols-lg-6 me-0 ms-0">
                            <!-- get book from req and display -->

                            <c:forEach items="${requestScope.TRENDING_LIST}" var="book"
                                       begin="${6 * (counter.count - 1)}" end="${6 * (counter.count - 1) + 5}">
                                <div class="col p-0">
                                    <div class="bg-white  mt-0 mb-1 ms-1 me-0 book-card"
                                         style="border-radius: 1px;
                                                 height: 350px ">
                                        <c:url var="viewBookDetail" value="viewBookDetailController">
                                            <c:param name="ISBN" value="${book.ISBN}"></c:param>
                                        </c:url>
                                        <a href="${viewBookDetail}" style="text-decoration: none">
                                            <div style="height: 210px;
                                                         width:100%;
                                                         display: flex;
                                                         justify-content: center;
                                                         align-items: center;">
                                                <img src="${book.imageAddress}" alt="alt"
                                                     style="max-height: 190px;
                                                             width: 80%;
                                                             object-fit: cover"
                                                     class="p-2 "/>
                                            </div>

                                            <div class="p-2 d-flex flex-column " style="height: 140px">
                                                <div class="flex-grow-1">
                                                    <div
                                                        style="font-size: 16px;
                                                                font-weight: bolder;
                                                                color: black;
                                                                text-decoration: none">
                                                        <span class="text-truncate d-inline-block" style="max-width: 200px">${book.name}</span>
                                                    </div>
                                                    <div class="mt-2" style="color: #7D7068;
                                                                 font-size: 10px">
                                                        <span>${book.authors.get(0).aliasName}</span>
                                                    </div>
                                                </div>
                                                <div class="d-flex align-items-center" style="width: 50%;">
                                                    <div class="rating-stars d-inline-block position-relative mr-2">
                                                        <%@include file="img/grey-star.svg" %>
                                                        <div class="filled-star" style="width: ${book.rating.avg * 100 / 5}%"></div>
                                                    </div>
                                                    <div style="font-size: 14px;">(${book.rating.totalReview})</div>
                                                </div>

                                                <div class="mb-2">

                                                    <c:if test="${book.currentPrice != book.price}">
                                                        <div class="d-flex ">
                                                            <div class="ps-1 pe-1 " style="
                                                                         background:#c00;

                                                                         border-radius:3em;
                                                                         color:#fff;
                                                                         font-weight:bold;
                                                                         -webkit-animation-name:salePulse;
                                                                         -webkit-animation-duration:1s;
                                                                         -webkit-animation-iteration-count:infinite;
                                                                         margin: 0 auto 0 0;">
                                                                <c:if test="${book.saleOffPercent gt 0}">
                                                                    <i
                                                                        style="

                                                                                font-size: 12px;
                                                                                font-weight: bolder;
                                                                                margin: 1px">
                                                                        Sale Off: ${book.saleOffPercent}%</i>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                        <span style="color: #ED0000;
                                                                      font-size: 15px;
                                                                      font-weight: bold">
                                                                    <fmt:formatNumber value="${book.currentPrice}"
                                                                                      type="currency"/>
                                                                </span>
                                                        <s style="color: black;
                                                                   font-size: 12px">
                                                            <fmt:formatNumber value="${book.price}" type="currency"/>
                                                        </s>


                                                    </c:if>
                                                    <c:if test="${book.currentPrice == book.price}">
                                                                <span style="color: #ED0000;
                                                                      font-size: 16px;
                                                                      font-weight: bold">
                                                                    <fmt:formatNumber value="${book.currentPrice}"
                                                                                      type="currency"/>
                                                                </span>
                                                    </c:if>

                                                </div>

                                            </div>
                                        </a>
                                    </div>
                                </div>

                            </c:forEach>

                        </div>
                    </div>
                </c:forEach>
            </div>
            <button class="carousel-control-prev item-control-pre" type="button" data-bs-target="#carouselTrending"
                    data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next  item-control-next" type="button" data-bs-target="#carouselTrending"
                    data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>


    </div>
    <!--trending book end here-->
    <!--bestsellers start here-->
    <div id="bestsellers-list">
        <div class="d-flex flex-row mt-3 pt-3 mb-3 ">
            <h2 class="ms-0" style="font-size: 35px ;
                        font-weight: 800;
                        -webkit-text-stroke: 0.1px #FFFFFF;">Bestsellers</h2>
            <hr class="flex-grow-1 ms-5 me-5"/>
            <a href="searchBookController" class="me-0">
                <button class="btn me-0" style="background: #f85b2b;
                                border-radius: 20px;
                                color: white">
                    <span class="ms-3 " style="font-weight: bold">View all</span>
                    <span class="ms-3"><i class="fa-light fa-angle-right"></i></span>
                </button>
            </a>
        </div>

        <div class="ms-0 me-0 carousel slide" id="carouselBestSeller" data-bs-ride="carousel">
            <div class="carousel-inner">
                <c:forEach begin="0" end="2" varStatus="counter">
                    <div class="carousel-item
                                 <c:if test="${counter.count==1}"> active</c:if>
                                 ">
                        <div class="row row-cols-lg-6 me-0 ms-0">
                            <!-- get book from req and display -->

                            <c:forEach items="${requestScope.BEST_SELLERS}" var="book"
                                       begin="${6 * (counter.count - 1)}" end="${6 * (counter.count - 1) + 5}">
                                <div class="col p-0">
                                    <div class="bg-white  mt-0 mb-1 ms-1 me-0 book-card"
                                         style="border-radius: 1px;
                                                 height: 350px ">
                                        <c:url var="viewBookDetail" value="viewBookDetailController">
                                            <c:param name="ISBN" value="${book.ISBN}"></c:param>
                                        </c:url>
                                        <a href="${viewBookDetail}" style="text-decoration: none">
                                            <div style="height: 210px;
                                                         width:100%;
                                                         display: flex;
                                                         justify-content: center;
                                                         align-items: center;">
                                                <img src="${book.imageAddress}" alt="alt"
                                                     style="max-height: 190px;
                                                             width: 80%;
                                                             object-fit: cover"
                                                     class="p-2 "/>
                                            </div>

                                            <div class="p-2 d-flex flex-column " style="height: 140px">
                                                <div class="flex-grow-1">
                                                    <div
                                                        style="font-size: 16px;
                                                                font-weight: bolder;
                                                                color: black;
                                                                text-decoration: none">
                                                        <span class="text-truncate d-inline-block" style="max-width: 200px">${book.name}</span>
                                                    </div>
                                                    <div class="mt-2" style="color: #7D7068;
                                                                 font-size: 10px">
                                                        <span>${book.authors.get(0).aliasName}</span>
                                                    </div>
                                                </div>
                                                <div class="d-flex align-items-center" style="width: 50%;">
                                                    <div class="rating-stars d-inline-block position-relative mr-2">
                                                        <%@include file="img/grey-star.svg" %>
                                                        <div class="filled-star" style="width: ${book.rating.avg * 100 / 5}%"></div>
                                                    </div>
                                                    <div style="font-size: 14px;">(${book.rating.totalReview})</div>
                                                </div>

                                                <div class="mb-2">

                                                    <c:if test="${book.currentPrice != book.price}">
                                                        <div class="d-flex ">
                                                            <div class="ps-1 pe-1 " style="
                                                                         background:#c00;

                                                                         border-radius:3em;
                                                                         color:#fff;
                                                                         font-weight:bold;
                                                                         -webkit-animation-name:salePulse;
                                                                         -webkit-animation-duration:1s;
                                                                         -webkit-animation-iteration-count:infinite;
                                                                         margin: 0 auto 0 0;">
                                                                <c:if test="${book.saleOffPercent gt 0}">
                                                                    <i
                                                                        style="

                                                                                font-size: 12px;
                                                                                font-weight: bolder;
                                                                                margin: 1px">
                                                                        Sale Off: ${book.saleOffPercent}%</i>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                        <span style="color: #ED0000;
                                                                      font-size: 15px;
                                                                      font-weight: bold">
                                                                    <fmt:formatNumber value="${book.currentPrice}"
                                                                                      type="currency"/>
                                                                </span>
                                                        <s style="color: black;
                                                                   font-size: 12px">
                                                            <fmt:formatNumber value="${book.price}" type="currency"/>
                                                        </s>


                                                    </c:if>
                                                    <c:if test="${book.currentPrice == book.price}">
                                                                <span style="color: #ED0000;
                                                                      font-size: 16px;
                                                                      font-weight: bold">
                                                                    <fmt:formatNumber value="${book.currentPrice}"
                                                                                      type="currency"/>
                                                                </span>
                                                    </c:if>

                                                </div>

                                            </div>
                                        </a>
                                    </div>
                                </div>

                            </c:forEach>

                        </div>
                    </div>
                </c:forEach>
            </div>
            <button class="carousel-control-prev  item-control-pre" type="button" data-bs-target="#carouselBestSeller"
                    data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next item-control-next" type="button" data-bs-target="#carouselBestSeller"
                    data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
    <!--bestseller end here-->
    <!--new release start here-->
    <div id="new-release-list">
        <div class="d-flex flex-row mt-3 pt-3 mb-3">
            <h2 class="ms-0" style="font-size: 35px ;
                        font-weight: 800;
                        -webkit-text-stroke: 0.1px #FFFFFF;">New releases</h2>
            <hr class="flex-grow-1 ms-5 me-5"/>
            <a href="searchBookController" class="me-0">
                <button class="btn me-0" style="background: #f85b2b;
                                border-radius: 20px;
                                color: white">
                    <span class="ms-3 " style="font-weight: bold">View all</span>
                    <span class="ms-3"><i class="fa-light fa-angle-right"></i></span>
                </button>
            </a>
        </div>
        <div class="ms-0 me-0 carousel slide" id="carouselNewRelease" data-bs-ride="carousel">
            <div class="carousel-inner">
                <c:forEach begin="0" end="2" varStatus="counter">
                    <div class="carousel-item
                                 <c:if test="${counter.count==1}"> active</c:if>
                                 ">
                        <div class="row row-cols-lg-6 me-0 ms-0">
                            <!-- get book from req and display -->

                            <c:forEach items="${requestScope.BOOK_LIST}" var="book"
                                       begin="${6 * (counter.count - 1)}" end="${6 * (counter.count - 1) + 5}">
                                <div class="col p-0">
                                    <div class="bg-white  mt-0 mb-1 ms-1 me-0 book-card"
                                         style="border-radius: 1px;
                                     height: 350px ">
                                        <c:url var="viewBookDetail" value="viewBookDetailController">
                                            <c:param name="ISBN" value="${book.ISBN}"></c:param>
                                        </c:url>
                                        <a href="${viewBookDetail}" style="text-decoration: none">
                                            <div style="height: 210px;
                                             width:100%;
                                             display: flex;
                                             justify-content: center;
                                             align-items: center;">
                                                <img src="${book.imageAddress}" alt="alt"
                                                     style="max-height: 190px;
                                                 width: 80%;
                                                 object-fit: cover"
                                                     class="p-2 "/>
                                            </div>

                                            <div class="p-2 d-flex flex-column " style="height: 140px">
                                                <div class="flex-grow-1">
                                                    <div
                                                        style="font-size: 16px;
                                                    font-weight: bolder;
                                                    color: black;
                                                    text-decoration: none">
                                                        <span class="text-truncate d-inline-block" style="max-width: 200px">${book.name}</span>
                                                    </div>
                                                    <div class="mt-2" style="color: #7D7068;
                                                     font-size: 10px">
                                                        <span>${book.authors.get(0).aliasName}</span>
                                                    </div>
                                                </div>
                                                <div class="d-flex align-items-center" style="width: 50%;">
                                                    <div class="rating-stars d-inline-block position-relative mr-2">
                                                        <%@include file="img/grey-star.svg" %>
                                                        <div class="filled-star" style="width: ${book.rating.avg * 100 / 5}%"></div>
                                                    </div>
                                                    <div style="font-size: 14px;">(${book.rating.totalReview})</div>
                                                </div>

                                                <div class="mb-2">

                                                    <c:if test="${book.currentPrice != book.price}">
                                                        <div class="d-flex ">
                                                            <div class="ps-1 pe-1 " style="
                                                             background:#c00;

                                                             border-radius:3em;
                                                             color:#fff;
                                                             font-weight:bold;
                                                             -webkit-animation-name:salePulse;
                                                             -webkit-animation-duration:1s;
                                                             -webkit-animation-iteration-count:infinite;
                                                             margin: 0 auto 0 0;">
                                                                <c:if test="${book.saleOffPercent gt 0}">
                                                                    <i
                                                                        style="

                                                                    font-size: 12px;
                                                                    font-weight: bolder;
                                                                    margin: 1px">
                                                                        Sale Off: ${book.saleOffPercent}%</i>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                        <span style="color: #ED0000;
                                                          font-size: 15px;
                                                          font-weight: bold">
                                                        <fmt:formatNumber value="${book.currentPrice}" type="currency"/>
                                                    </span>
                                                        <s style="color: black;
                                                       font-size: 12px">
                                                            <fmt:formatNumber value="${book.price}" type="currency"/>
                                                        </s>


                                                    </c:if>
                                                    <c:if test="${book.currentPrice == book.price}">
                                                    <span style="color: #ED0000;
                                                          font-size: 16px;
                                                          font-weight: bold">
                                                        <fmt:formatNumber value="${book.currentPrice}" type="currency"/>
                                                    </span>
                                                    </c:if>

                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>

                            </c:forEach>

                        </div>
                    </div>
                </c:forEach>
            </div>
            <button class="carousel-control-prev  item-control-pre" type="button" data-bs-target="#carouselNewRelease"
                    data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next  item-control-next" type="button" data-bs-target="#carouselNewRelease"
                    data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
    <!--new release end here-->
    <!--top manga start here-->
    <div id="top-rated-list">
        <div class="d-flex flex-row mt-3 pt-3 mb-3">
            <h2 class="ms-0" style="font-size: 35px ;
                        font-weight: 800;
                        -webkit-text-stroke: 0.1px #FFFFFF;">Top manga</h2>
            <hr class="flex-grow-1 ms-5 me-5"/>
            <a href="searchBookController" class="me-0">
                <button class="btn me-0" style="background: #f85b2b;
                                border-radius: 20px;
                                color: white">
                    <span class="ms-3 " style="font-weight: bold">View all</span>
                    <span class="ms-3"><i class="fa-light fa-angle-right"></i></span>
                </button>
            </a>
        </div>
        <div class="ms-0 me-0 carousel slide" id="carouselHighRating" data-bs-ride="carousel">
            <div class="carousel-inner">
                <c:forEach begin="0" end="1" varStatus="counter">
                    <div class="carousel-item
                                 <c:if test="${counter.count==1}"> active</c:if>
                                 ">
                        <div class="row row-cols-lg-6 me-0 ms-0">
                            <!-- get book from req and display -->

                            <c:forEach items="${requestScope.HIGH_RATING}" var="book"
                                       begin="${6 * (counter.count - 1)}" end="${6 * (counter.count - 1) + 5}">
                                <div class="col p-0">
                                    <div class="bg-white  mt-0 mb-1 ms-1 me-0 book-card"
                                         style="border-radius: 1px;
                                     height: 350px ">
                                        <c:url var="viewBookDetail" value="viewBookDetailController">
                                            <c:param name="ISBN" value="${book.ISBN}"></c:param>
                                        </c:url>
                                        <a href="${viewBookDetail}" style="text-decoration: none">
                                            <div style="height: 210px;
                                             width:100%;
                                             display: flex;
                                             justify-content: center;
                                             align-items: center;">
                                                <img src="${book.imageAddress}" alt="alt"
                                                     style="max-height: 190px;
                                                 width: 80%;
                                                 object-fit: cover"
                                                     class="p-2 "/>
                                            </div>

                                            <div class="p-2 d-flex flex-column " style="height: 140px">
                                                <div class="flex-grow-1">
                                                    <div
                                                        style="font-size: 16px;
                                                    font-weight: bolder;
                                                    color: black;
                                                    text-decoration: none">
                                                        <span class="text-truncate d-inline-block" style="max-width: 200px">${book.name}</span>
                                                    </div>
                                                    <div class="mt-2" style="color: #7D7068;
                                                     font-size: 10px">
                                                        <span>${book.authors.get(0).aliasName}</span>
                                                    </div>
                                                </div>
                                                <div class="d-flex align-items-center" style="width: 50%;">
                                                    <div class="rating-stars d-inline-block position-relative mr-2">
                                                        <%@include file="img/grey-star.svg" %>
                                                        <div class="filled-star" style="width: ${book.rating.avg * 100 / 5}%"></div>
                                                    </div>
                                                    <div style="font-size: 14px;">(${book.rating.totalReview})</div>
                                                </div>

                                                <div class="mb-2">

                                                    <c:if test="${book.currentPrice != book.price}">
                                                        <div class="d-flex ">
                                                            <div class="ps-1 pe-1 " style="
                                                             background:#c00;

                                                             border-radius:3em;
                                                             color:#fff;
                                                             font-weight:bold;
                                                             -webkit-animation-name:salePulse;
                                                             -webkit-animation-duration:1s;
                                                             -webkit-animation-iteration-count:infinite;
                                                             margin: 0 auto 0 0;">
                                                                <c:if test="${book.saleOffPercent gt 0}">
                                                                    <i
                                                                        style="

                                                                    font-size: 12px;
                                                                    font-weight: bolder;
                                                                    margin: 1px">
                                                                        Sale Off: ${book.saleOffPercent}%</i>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                        <span style="color: #ED0000;
                                                          font-size: 15px;
                                                          font-weight: bold">
                                                        <fmt:formatNumber value="${book.currentPrice}" type="currency"/>
                                                    </span>
                                                        <s style="color: black;
                                                       font-size: 12px">
                                                            <fmt:formatNumber value="${book.price}" type="currency"/>
                                                        </s>


                                                    </c:if>
                                                    <c:if test="${book.currentPrice == book.price}">
                                                    <span style="color: #ED0000;
                                                          font-size: 16px;
                                                          font-weight: bold">
                                                        <fmt:formatNumber value="${book.currentPrice}" type="currency"/>
                                                    </span>
                                                    </c:if>

                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>

                            </c:forEach>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <button class="carousel-control-prev  item-control-pre" type="button" data-bs-target="#carouselHighRating"
                    data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next  item-control-next" type="button" data-bs-target="#carouselHighRating"
                    data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
    <!--top manga end here-->
    <!--action adventure-->
    <div id="action-adventure">
        <div class="d-flex flex-row mt-3 pt-3 mb-3">
            <h2 class="ms-0" style="font-size: 35px ;
                            font-weight: 800;
                            -webkit-text-stroke: 0.1px #FFFFFF;">Action and Adventure</h2>
            <hr class="flex-grow-1 ms-5 me-5"/>
            <a href="searchBookController" class="me-0">
                <button class="btn me-0" style="background: #f85b2b;
                                    border-radius: 20px;
                                    color: white">
                    <span class="ms-3 " style="font-weight: bold">View all</span>
                    <span class="ms-3"><i class="fa-light fa-angle-right"></i></span>
                </button>
            </a>
        </div>
        <div class="ms-0 me-0 carousel slide" id="carouselActionAdventure" data-bs-ride="carousel">
            <div class="carousel-inner">
                <c:forEach begin="0" end="1" varStatus="counter">
                    <div class="carousel-item
                                     <c:if test="${counter.count==1}"> active</c:if>
                                     ">
                        <div class="row row-cols-lg-6 me-0 ms-0">
                            <!-- get book from req and display -->

                            <c:forEach items="${requestScope.ACTION_ADVENTURE_LIST}" var="book"
                                       begin="${6 * (counter.count - 1)}" end="${6 * (counter.count - 1) + 5}">
                                <div class="col p-0">
                                    <div class="bg-white  mt-0 mb-1 ms-1 me-0 book-card"
                                         style="border-radius: 1px;
                                         height: 350px ">
                                        <c:url var="viewBookDetail" value="viewBookDetailController">
                                            <c:param name="ISBN" value="${book.ISBN}"></c:param>
                                        </c:url>
                                        <a href="${viewBookDetail}" style="text-decoration: none">
                                            <div style="height: 210px;
                                                 width:100%;
                                                 display: flex;
                                                 justify-content: center;
                                                 align-items: center;">
                                                <img src="${book.imageAddress}" alt="alt"
                                                     style="max-height: 190px;
                                                     width: 80%;
                                                     object-fit: cover"
                                                     class="p-2 "/>
                                            </div>

                                            <div class="p-2 d-flex flex-column " style="height: 140px">
                                                <div class="flex-grow-1">
                                                    <div
                                                        style="font-size: 16px;
                                                        font-weight: bolder;
                                                        color: black;
                                                        text-decoration: none">
                                                        <span class="text-truncate d-inline-block" style="max-width: 200px">${book.name}</span>
                                                    </div>
                                                    <div class="mt-2" style="color: #7D7068;
                                                         font-size: 10px">
                                                        <span>${book.authors.get(0).aliasName}</span>
                                                    </div>
                                                </div>
                                                <div class="d-flex align-items-center" style="width: 50%;">
                                                    <div class="rating-stars d-inline-block position-relative mr-2">
                                                        <%@include file="img/grey-star.svg" %>
                                                        <div class="filled-star" style="width: ${book.rating.avg * 100 / 5}%"></div>
                                                    </div>
                                                    <div style="font-size: 14px;">(${book.rating.totalReview})</div>
                                                </div>

                                                <div class="mb-2">

                                                    <c:if test="${book.currentPrice != book.price}">
                                                        <div class="d-flex ">
                                                            <div class="ps-1 pe-1 " style="
                                                                 background:#c00;

                                                                 border-radius:3em;
                                                                 color:#fff;
                                                                 font-weight:bold;
                                                                 -webkit-animation-name:salePulse;
                                                                 -webkit-animation-duration:1s;
                                                                 -webkit-animation-iteration-count:infinite;
                                                                 margin: 0 auto 0 0;">
                                                                <c:if test="${book.saleOffPercent gt 0}">
                                                                    <i
                                                                        style="

                                                                        font-size: 12px;
                                                                        font-weight: bolder;
                                                                        margin: 1px">
                                                                        Sale Off: ${book.saleOffPercent}%</i>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                        <span style="color: #ED0000;
                                                              font-size: 15px;
                                                              font-weight: bold">
                                                            <fmt:formatNumber value="${book.currentPrice}"
                                                                              type="currency"/>
                                                        </span>
                                                        <s style="color: black;
                                                           font-size: 12px">
                                                            <fmt:formatNumber value="${book.price}"
                                                                              type="currency"/>
                                                        </s>


                                                    </c:if>
                                                    <c:if test="${book.currentPrice == book.price}">
                                                        <span style="color: #ED0000;
                                                              font-size: 16px;
                                                              font-weight: bold">
                                                            <fmt:formatNumber value="${book.currentPrice}"
                                                                              type="currency"/>
                                                        </span>
                                                    </c:if>

                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>

                            </c:forEach>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <button class="carousel-control-prev  item-control-pre" type="button"
                    data-bs-target="#carouselActionAdventure"
                    data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next  item-control-next" type="button"
                    data-bs-target="#carouselActionAdventure"
                    data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

    </div>
    <!--action adventure end-->
    <!--romantic list-->
    <div id="romantic-comedy">
        <div class="d-flex flex-row mt-3 pt-3 mb-3">
            <h2 class="ms-0" style="font-size: 35px ;
                            font-weight: 800;
                            -webkit-text-stroke: 0.1px #FFFFFF;">Romantic comedy</h2>
            <hr class="flex-grow-1 ms-5 me-5"/>
            <a href="searchBookController" class="me-0">
                <button class="btn me-0" style="background: #f85b2b;
                                    border-radius: 20px;
                                    color: white">
                    <span class="ms-3 " style="font-weight: bold">View all</span>
                    <span class="ms-3"><i class="fa-light fa-angle-right"></i></span>
                </button>
            </a>
        </div>

        <div class="ms-0 me-0">
            <div class="row row-cols-lg-6 me-0 ms-0">
                <!-- get book from req and display -->
                <c:forEach items="${requestScope.ROMANTIC_LIST}" var="book">
                    <div class="col p-0">
                        <div class="bg-white  mt-0 mb-1 ms-1 me-0 book-card"
                             style="border-radius: 1px;
                                         height: 350px ">
                            <c:url var="viewBookDetail" value="viewBookDetailController">
                                <c:param name="ISBN" value="${book.ISBN}"></c:param>
                            </c:url>
                            <a href="${viewBookDetail}" style="text-decoration: none">
                                <div style="height: 210px;
                                                 width:100%;
                                                 display: flex;
                                                 justify-content: center;
                                                 align-items: center;">
                                    <img src="${book.imageAddress}" alt="alt"
                                         style="max-height: 190px;
                                                     width: 80%;
                                                     object-fit: cover"
                                         class="p-2 "/>
                                </div>

                                <div class="p-2 d-flex flex-column " style="height: 140px">
                                    <div class="flex-grow-1">
                                        <div
                                            style="font-size: 16px;
                                                        font-weight: bolder;
                                                        color: black;
                                                        text-decoration: none">
                                            <span class="text-truncate d-inline-block" style="max-width: 200px">${book.name}</span>
                                        </div>
                                        <div class="mt-2" style="color: #7D7068;
                                                         font-size: 10px">
                                            <span>${book.authors.get(0).aliasName}</span>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center" style="width: 50%;">
                                        <div class="rating-stars d-inline-block position-relative mr-2">
                                            <%@include file="img/grey-star.svg" %>
                                            <div class="filled-star" style="width: ${book.rating.avg * 100 / 5}%"></div>
                                        </div>
                                        <div style="font-size: 14px;">(${book.rating.totalReview})</div>
                                    </div>

                                    <div class="mb-2">

                                        <c:if test="${book.currentPrice != book.price}">
                                            <div class="d-flex ">
                                                <div class="ps-1 pe-1 " style="
                                                                 background:#c00;

                                                                 border-radius:3em;
                                                                 color:#fff;
                                                                 font-weight:bold;
                                                                 -webkit-animation-name:salePulse;
                                                                 -webkit-animation-duration:1s;
                                                                 -webkit-animation-iteration-count:infinite;
                                                                 margin: 0 auto 0 0;">
                                                    <c:if test="${book.saleOffPercent gt 0}">
                                                        <i
                                                            style="

                                                                        font-size: 12px;
                                                                        font-weight: bolder;
                                                                        margin: 1px">
                                                            Sale Off: ${book.saleOffPercent}%</i>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <span style="color: #ED0000;
                                                              font-size: 15px;
                                                              font-weight: bold">
                                                            <fmt:formatNumber value="${book.currentPrice}"
                                                                              type="currency"/>
                                                        </span>
                                            <s style="color: black;
                                                           font-size: 12px">
                                                <fmt:formatNumber value="${book.price}" type="currency"/>
                                            </s>


                                        </c:if>
                                        <c:if test="${book.currentPrice == book.price}">
                                                        <span style="color: #ED0000;
                                                              font-size: 16px;
                                                              font-weight: bold">
                                                            <fmt:formatNumber value="${book.currentPrice}"
                                                                              type="currency"/>
                                                        </span>
                                        </c:if>

                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>

                </c:forEach>
            </div>
        </div>
    </div>
    <!--romantic list end here-->
    <!--category carousel-->
    <div>
        <div id="carouselCategory" class="carousel slide mt-5" data-bs-ride="carousel">
            <div class="carousel-inner">
                <c:forEach begin="0" end="3" varStatus="counter">
                    <div class="carousel-item
                                 <c:if test="${counter.count==1}"> active</c:if>
                                 ">
                        <div class="row row-cols-lg-3 me-0 ms-0">
                            <c:forEach var="genre" items="${requestScope.GENRE_LIST2}"
                                       begin="${3 * (counter.count - 1)}" end="${3 * (counter.count - 1) + 2}">
                                <a href="searchBookController?genres=${genre.name}" style="text-decoration: none">
                                    <div class="card p-3"
                                         style="min-height: 230px; border-radius: 20px; background-image: url('img/${genre.name}.jpg')">
                                        <h2 style="color: white ; font-weight: bold">${genre.name}</h2>
                                    </div>

                                </a>
                            </c:forEach>
                        </div>

                    </div>
                </c:forEach>
            </div>
        </div>

    </div>


</div>
<!-- book display end here -->


<!-- import footer -->
<%@include file="footer.html" %>
<jsp:include page="include/include_footer.jsp"></jsp:include>
<!--import footer end here-->
<!--script start here-->
<script>
    window.onscroll = function () {
        stickyHeader();
    };

    //            make header stick to the head when scroll
    function stickyHeader() {//console.log(window.pageYOffset);

        if (window.pageYOffset >= 450) {
            document.getElementById("header").style.visibility = "visible";
            document.getElementById("header").style.opacity = "1";
        } else {
            document.getElementById("header").style.opacity = "0";
            document.getElementById("header").style.visibility = "hidden";
        }
    }


</script>
<!--script end here-->
</body>

</html>