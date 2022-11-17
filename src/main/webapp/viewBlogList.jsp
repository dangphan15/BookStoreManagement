<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Blog list</title>
    <jsp:include page="include/include_header.jsp"></jsp:include>
    <style>
        a {
            text-decoration: none;
        }

        .blog-item:hover {
            background-color: #eee;
        }

        .banner-blog {
            padding-top: 100px;
            padding-left: 85px;
            /*margin-top: 120px;*/
            border-radius: 10px;
            width: 100%;
            height: 65vh;
            max-height: 400px;
            background: linear-gradient(-90deg, rgba(255, 153, 102, 0.4), rgba(255, 94, 98, 0.4)),
            url('img/banner-blog.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            background-position: 0 30%;

        }

        .banner-blog .title {
            position: relative;
            color: white;
            height: 120px;
        }

        .banner-blog .title h2 {
            font-size: 200%;
            position: absolute;
            top: 0;
            animation-name: fly-top-in;
            animation-duration: 1s;
        }

        .banner-blog .title h1 {
            font-size: 600%;
            font-weight: bolder;
            position: absolute;
            top: 30px;
            left: -5px;
            animation-name: fly-left-in;
            animation-duration: 1.5s;
        }

        .banner-blog .subtitle {
            color: white;
            font-weight: 400;
            margin-top: 30px;
            font-size: 22px;
            width: 40%;
            animation-name: fade-in;
            animation-duration: 2s;
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

        .btn-continue-blog {
            font-family: "CircularStd-Bold", sans-serif;
            font-weight: normal;
            background-color: transparent !important;
            border: solid 2px #000000 !important;
            color: #000000 !important;
            cursor: pointer;
            display: inline-block;
            font-size: 16px;
            padding: 8px 16px;
            text-decoration: none;
            transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
            /*padding-right: 80px;*/
            margin-left: auto;
            margin-right: auto;
            border-radius: 12px;
        }

        .btn-continue-blog:focus, .btn-continue-blog:hover {
            background-color: #000 !important;
            border-color: #000 !important;
            color: #ffffff !important;
            transition: transform 1s cubic-bezier(0.165, 0.84, 0.44, 1), background-color 0.8s cubic-bezier(0.165, 0.84, 0.44, 1), box-shadow 2s cubic-bezier(0.165, 0.84, 0.44, 1);
            transform: translateY(-4px);
            box-shadow: 4px 4px 0px rgba(3, 4, 3, .2);
        }

        .btn-continue-blog:active {
            transform: translateY(0px);
            box-shadow: 0px 0px 0px rgba(3, 4, 3, .15);
        }


        .btn-continue-blog:hover::after {
            opacity: 1;
        }

        .banner-4 {
            min-height: 370px;
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
            font-size: 18px;
            min-width: 140px;
            background-color: rgb(211, 43, 43);
            padding-left: 8px;
        }

        .price-300 {
            position: relative;
            top: 180px;
            right: -114px;
            color: yellow;
            font-weight: 900;
            font-size: 40px;

        }
        a {
            text-decoration: none;
        }

        .fb a, .fb:before, .fb { background: #3b5999; color: #3b5999; }
        .tw a, .tw:before, .tw { background: #FF0000 ; color: #FF0000; }
        .in a, .in:before, .in { background: #833AB4; color: #F77737; }
        .gh a, .gh:before, .gh { background: #E60023; color: #E60023; }



        ul#buttons-logo-social {
            /*padding: 0;*/
            /*margin: 0;*/
            /*!*position: absolute;*!*/
            /*!*top: 50%;*!*/
            /*!*left: 50%;*!*/
            /*transform: translate(-50%,-50%);*/
            list-style: none;
            display: grid;
            grid-template-columns: repeat(4,1fr);
            grid-gap: 30px;
        }

        ul#buttons-logo-social:before {
            content: "";
            font-size: 2em;
            font-family: Arial;
            font-weight: 300;
            color: #4d4d4d;
            position: absolute;
            width: 100%;
            text-align: center;
            /*margin-top: -60px;*/
        }

        ul#buttons-logo-social li {
            width: 40px;
            height: 40px;
            line-height: 40px;
            text-align: center;
            box-sizing: border-box;
            background: transparent;
            border-radius: 12px;
            position: relative;
            overflow: hidden;
            transition: .5s;
            box-shadow: 0px 8px 16px -6px,
            0px 0px 16px -6px;
        }

        ul#buttons-logo-social li a {
            display: block;
            /*widows: 100%;*/
            height: 100%;
            font-size: 1.25em;
            background: transparent;
            transition: .5s;
            animation: icon-out .5s forwards;
            animation-timing-function: cubic-bezier(0.5, -0.6, 1, 1);
        }

        ul#buttons-logo-social li:before {
            content: "";
            width: 90px;
            height: 90px;
            display: block;
            position: absolute;
            transform: rotate(-45deg) translate(-110%, -23px);
            z-index: -2;
            animation: back-out .5s forwards;
            animation-timing-function: cubic-bezier(0.5, -0.6, 1, 1);
        }

        ul#buttons-logo-social li:hover a {
            animation: icon-in .5s forwards;
            animation-timing-function: cubic-bezier(0, 0, 0.4, 1.6);
        }

        ul#buttons-logo-social li:hover:before {
            animation: back-in .5s forwards;
            animation-timing-function: cubic-bezier(0, 0, 0.4, 1.6);
        }

        @keyframes back-in {
            0% { transform: rotate(-45deg) translate(-110%, -23px); }
            80% { transform: rotate(-45deg) translate(5%, -23px); }
            100% { transform: rotate(-45deg) translate(0%, -23px); }
        }

        @keyframes back-out {
            0% { transform: rotate(-45deg) translate(0%, -23px); }
            20% { transform: rotate(-45deg) translate(5%, -23px); }
            100% { transform: rotate(-45deg) translate(-110%, -23px); }
        }

        @keyframes icon-in {
            0% { font-size: 1.25em; }
            80% { color: #fff; font-size: 1.5em; }
            100% { color: #fff; font-size: 1.35em; }
        }

        @keyframes icon-out {
            0% { color: #fff; font-size: 1.35em; }
            20% { color: #fff; font-size: 1.5em; }
            100% { font-size: 1.25em; }
        }


    </style>
</head>
<body>
<%@include file="header.jsp" %>

<div class="container mt-4 mb-4 p-0">
    <div class="mb-4 banner-blog img-fluid ">
        <div class="title">
            <h2>It's time for</h2>
            <h1>MANGA BLOG</h1>
        </div>
        <h2 class="subtitle">
            A site dedicated to the joyful review of manga!
        </h2>
    </div>
    <div class="d-flex flex-row justify-content-center">
        <label class="align-self-center me-4" style="font-size: 20px; font-weight: bolder">Search blogs by book
            name: </label>
        <form
            style="display: flex; border-radius: 18px; border: none; height:40px; background-color: #EAF6F6;min-width: 400px "
            class="pe-4" action="searchBlogsByBookNameAction" method="POST">
            <input class="form-control "
                   style="border-radius: 15px; border-color: transparent;background-color: #EAF6F6"
                   type="search" name="searchValue" value="${param.searchValue}"
                   placeholder="Enter book name...">
            <button style="border: none; background: none; opacity: 0.36" type="submit" value="Search">
                <i class="fa-solid fa-magnifying-glass ps-3"></i>
            </button>
        </form>
    </div>

</div>
<c:set var="blogs" value="${requestScope.BLOGS}"/>

<c:if test="${not empty blogs}">
    <div class="container row p-0 ms-auto me-auto">
        <div class="col-9">
            <c:forEach var="blog" items="${blogs}" varStatus="counter">
                <div class="row">
                    <div class="p-5 blog-item d-flex flex-row justify-content-start mb-4"
                         style="background-color: #ffffff; border-radius: 12px;
                                box-shadow: rgba(0, 0, 0, 0.4) 0px 2px 4px, rgba(0, 0, 0, 0.3) 0px 7px 13px -3px, rgba(0, 0, 0, 0.2) 0px -3px 0px inset;">
                        <a class="text-decoration-none " style="color: black"
                           href="viewBlogAction?id=${blog.id}">
                            <div>
                                <img width="100%"
                                     style="max-width: 300px;min-height: 300px; object-fit: cover;"
                                     src="${blog.thumbnail}">
                                </p>
                            </div>
                        </a>
                        <div class="ms-4">
                            <div class="d-flex flex-column justify-content-start"
                                 style="max-width: 600px">
                                <p class="mb-1"
                                   style="display: -webkit-box; -webkit-box-orient: vertical;-webkit-line-clamp: 2; overflow: hidden; text-align: justify">
                                    <a href="viewBlogAction?id=${blog.id}"
                                       style="font-family: 'Josefin Sans',sans-serif ;color: black;font-size: 40px; text-decoration: none; font-weight: bolder ">${blog.title}</a>
                                </p>
                                <p style="font-size: 18px; color: #646464; line-height: 8px;">Book: ${blog.bookName}</p>
                                <div class="d-flex mb-2 justify-content-start">
                                    <span class="me-3"
                                          style="text-align: start;margin-bottom: 0px ;color: #8d8d8d; font-size: 18px; ">
                                        <fmt:formatDate type="date" value="${blog.postedTime}"/>
                                    </span>

                                    <i style="color: #f85b2b"
                                       class="me-3 fa-solid fa-horizontal-rule align-self-center"></i>
                                    <span style="text-align: start; margin-bottom: 0px; font-size: 20px; ">
                                        <strong>Author: </strong>${blog.authorFullname}
                                    </span>
                                </div>
                                <p style="display: -webkit-box; -webkit-box-orient: vertical;-webkit-line-clamp: 5; overflow: hidden; text-align: justify; font-size: 18px">
                                        ${blog.content.replaceAll("<[^>]*>", "")}
                                </p>
                                <a href="viewBlogAction?id=${blog.id}" class="btn-continue-blog btn btn-default">Continue reading...</a>
                            </div>
                        </div>

                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="col-3 d-flex flex-column">
            <div class="d-flex ms-4">
                <h4 style="font-weight: 800;" class="m-0 ">Advertising</h4>
                <hr style="color: #f85b2b; min-height: 3px; opacity: 1"
                    class="align-self-center d-flex flex-grow-1 ms-3"/>
            </div>
            <a class="d-flex ms-4 float-end banner-4" href="searchBookController?minPrice=0&maxPrice=300000"
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
            <div class="d-flex ms-4 mt-5">
                <h4 style="font-weight: 800;" class="m-0 ">Social</h4>
                <hr style="color: #f85b2b; min-height: 3px; opacity: 1"
                    class="align-self-center d-flex flex-grow-1 ms-3"/>
            </div>
            <div class="d-flex flex-row" >
                <ul class=" list-unstyled ms-4" id="buttons-logo-social">
                    <li class="fb">
                        <a href="https://www.facebook.com/giao.lang.bis" title="Facebook">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                    </li>
                    <li class="tw">
                        <a href="https://www.youtube.com/c/gi%C3%A1ol%C3%A0ng" title="Youtube">
                            <i class="fab fa-youtube"></i>
                        </a>
                    </li>
                    <li class="in">
                        <a href="https://scontent.fsgn2-7.fna.fbcdn.net/v/t39.30808-6/270961679_10159870536636108_2642967668131478092_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=RT0NGAOqw6sAX8CiquA&_nc_ht=scontent.fsgn2-7.fna&oh=00_AfAX0XxIVkpoejtF1Ja4BUgWlyRuYP-tOYeSaAjbi7F-AA&oe=63763817" title="Instagram" target="_blank">
                            <i class="fab fa-instagram"></i>
                        </a>
                    </li>
                    <li class="gh">
                        <a href="https://scontent.fsgn2-7.fna.fbcdn.net/v/t39.30808-6/270961679_10159870536636108_2642967668131478092_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=RT0NGAOqw6sAX8CiquA&_nc_ht=scontent.fsgn2-7.fna&oh=00_AfAX0XxIVkpoejtF1Ja4BUgWlyRuYP-tOYeSaAjbi7F-AA&oe=63763817" title="Pinterest">
                            <i class="fab fa-pinterest"></i>
                        </a>
                    </li>
                </ul>
            </div>


        </div>
    </div>

</c:if>
<c:if test="${empty blogs}">
    <p>No blogs found!</p>
</c:if>
<%@include file="footer.html" %>
<jsp:include page="include/include_footer.jsp"></jsp:include>
</body>
</html>
