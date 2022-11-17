<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manga bookstore</title>

    <!-- <script src="https://kit.fontawesome.com/28e27214ee.js" crossorigin="anonymous"></script> -->
    <jsp:include page="include/include_header.jsp"></jsp:include>
    <style>
        .book-card {
            transition: all .2s;
        }

        .book-card:hover {
            transform: scale(1.05);
            box-shadow: 0px 0px 16px -2px rgba(148, 148, 148, 0.66);
            -webkit-box-shadow: 0px 0px 16px -2px rgba(148, 148, 148, 0.66);
            -moz-box-shadow: 0px 0px 16px -2px rgba(148, 148, 148, 0.66);
        }

        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        body {

            background: linear-gradient(0deg, rgba(255, 244, 247, 0.5) 0%, rgba(255, 244, 247, 0.5) 100%, rgba(255, 244, 247, 0.5) 100%),
            url('img/background_searchpage.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            background-attachment: fixed;
            background-position: 0 60%;

        }

        .filter {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 10px 5%;
            border-radius: 5px;
            margin-bottom: 25px;
            margin-top: 30px;
        }

        h2,
        h3 {
            font-size: 27px;
        }

        h3 {
            font-size: 20px;
        }


        input[type=number] {
            -moz-appearance: textfield;
        }

        /*
        */
        input[type="checkbox"] {
            display: none;
        }

        /*

                        */

        .filter-header {
            border-bottom: gray 3px solid;
            margin-bottom: 20px;
        }

        .tag {
            margin-left: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            border: solid 0.2px #F37878;
            padding-left: 5px;
            padding-right: 5px;
            cursor: pointer;
        }

        .tag-notcheck {
            color: #F37878;
        }

        .tag-checked {
            color: white;
            background-color: #F37878;
        }

        .input-price {
            color: #F37878;
            width: 100px;
            margin-left: 20px;
            margin-right: 20px;
            border: solid 0.2px #F37878;
            border-radius: 5px;
        }

        .button-price {
            width: 70px;
            border: none;
            background-color: #F37878;
            color: white;
            border-radius: 5px;
        }

        .button-clear-all {
            text-decoration: none;
            color: white;
            background-color: #F37878;
            border-radius: 5px;
            height: 30px;
            text-align: center;
        }

        .button-sort {
            background-color: #F37878;
            border: none;
            color: white;
            padding: 10px 25px;
            font-size: 110%;
            border-radius: 15px;
        }

        .button-showmore {
            color: #F37878;
            background-color: white;
            border: solid #F37878 0.3px;
            display: none;
            text-align: center;
            width: 60%;
            cursor: pointer;
            border-radius: 5px;
        }

        .button-showless {
            color: #F37878;
            background-color: white;
            border: solid #F37878 0.3px;
            display: none;
            text-align: center;
            width: 60%;
            cursor: pointer;
            border-radius: 5px;
            transform: scaleY(-1);
        }

        .book-container {
            margin-top: 20px;
            padding-top: 20px;
            border-radius: 5px;
        }

        .paging-bar {
            display: inline-block;
            margin-top: 30px;
        }

        .paging-bar .page-item .page-link-pre {
            border-bottom-left-radius: 15px;
            border-top-left-radius: 15px;
        }

        .paging-bar .page-item .page-link-next {
            border-bottom-right-radius: 15px;
            border-top-right-radius: 15px;
        }

        .paging-bar .page-item .page-link {
            color: #F37878;
        }

        .paging-bar .page-item.active .page-link {
            background-color: #F37878 !important;
            color: white !important;
            border: 1px solid #F37878 !important;
            margin: 0 !important;
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

<body>
<!-- import header -->
<%@include file="header.jsp" %>

<!-- book filter  -->
<div class="container p-0">
    <div class="filter container-fluid">
        <div class="row filter-header">
            <h2 class="col-1">Filter</h2>
            <div class="col-10 d-flex flex-row flex-wrap align-items-center">
                <c:if test="${not empty requestScope.SEARCH_VALUE}">
                    <div class="tag tag-checked" onclick="removeSearch()">
                            ${requestScope.SEARCH_VALUE} <i class="fa-solid fa-circle-xmark"></i></div>
                </c:if>
                <c:forEach items="${requestScope.GENRE_LIST.keySet()}" var="genre" varStatus="counter">
                    <c:if test="${requestScope.GENRE_LIST.get(genre)}">
                        <div class="tag tag-checked" onclick="toggleCheckbox('genre${counter.count}')">
                                ${genre} <i class="fa-solid fa-circle-xmark"></i></div>
                    </c:if>
                </c:forEach>
                <c:forEach items="${requestScope.AUTHOR_LIST.keySet()}" var="author"
                           varStatus="counter">
                    <c:if test="${requestScope.AUTHOR_LIST.get(author)}">
                        <div class="tag tag-checked" onclick="toggleCheckbox('author${counter.count}')">
                                ${author} <i class="fa-solid fa-circle-xmark"></i></div>
                    </c:if>
                </c:forEach>
                <c:forEach items="${requestScope.PUBLISHER_LIST.keySet()}" var="publisher"
                           varStatus="counter">
                    <c:if test="${requestScope.PUBLISHER_LIST.get(publisher)}">
                        <div class="tag tag-checked"
                             onclick="toggleCheckbox('publisher${counter.count}')"> ${publisher} <i
                            class="fa-solid fa-circle-xmark"></i>
                        </div>
                    </c:if>
                </c:forEach>
                <c:forEach items="${requestScope.LAYOUT_LIST.keySet()}" var="layout"
                           varStatus="counter">
                    <c:if test="${requestScope.LAYOUT_LIST.get(layout)}">
                        <div class="tag tag-checked" onclick="toggleCheckbox('layout${counter.count}')">
                                ${layout}<i class="fa-solid fa-circle-xmark"></i></div>
                    </c:if>
                </c:forEach>
                <c:forEach items="${requestScope.LANGUAGE_LIST.keySet()}" var="language"
                           varStatus="counter">
                    <c:if test="${requestScope.LANGUAGE_LIST.get(language)}">
                        <div class="tag tag-checked"
                             onclick="toggleCheckbox('language${counter.count}')"> ${language} <i
                            class="fa-solid fa-circle-xmark"></i>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
            <a class="col-1 button-clear-all" href="searchBookController">Clear all</a>
        </div>
        <form action="searchBookController" id="searchForm">
            <input type="hidden" id="searchInput" name="searchValue" value="${requestScope.SEARCH_VALUE}"/>
            <div class="row">
                <h3 class="col-1">Category </h3>
                <div class="col-10 d-flex flex-row flex-wrap align-items-start"
                     id="genre-tag-container">
                    <c:forEach items="${requestScope.GENRE_LIST.keySet()}" var="genre"
                               varStatus="counter">
                        <c:if test="${requestScope.GENRE_LIST.get(genre)}">
                            <div class="tag tag-checked genre-tag"
                                 onclick="toggleCheckbox('genre${counter.count}')">
                                    ${genre}</div>
                        </c:if>
                        <c:if test="${not requestScope.GENRE_LIST.get(genre)}">
                            <div class="tag tag-notcheck genre-tag"
                                 onclick="toggleCheckbox('genre${counter.count}')">
                                    ${genre}</div>
                        </c:if>

                        <input type="checkbox" name="genres" value="${genre}" id="genre${counter.count}"
                            <c:if test="${requestScope.GENRE_LIST.get(genre)}">
                                checked
                            </c:if>
                        />

                    </c:forEach>
                </div>
                <div class="col-1" style="text-align: center;">
                    <div class="button-showmore" id="genre-showmore" onclick="showMoreTag('genre')">
                        <i class="fa-solid fa-circle-chevron-down"></i>
                    </div>
                    <div class="button-showless" id="genre-showless" onclick="hideTag('genre')">
                        <i class="fa-solid fa-circle-chevron-down"></i>
                    </div>
                </div>
            </div>


            <div class="row">
                <h3 class="col-1">Author </h3>
                <div class="col-10 d-flex flex-row flex-wrap align-items-start"
                     id="author-tag-container">
                    <c:forEach items="${requestScope.AUTHOR_LIST.keySet()}" var="author"
                               varStatus="counter">
                        <c:if test="${requestScope.AUTHOR_LIST.get(author)}">
                            <div class="tag tag-checked author-tag"
                                 onclick="toggleCheckbox('author${counter.count}')">
                                    ${author}</div>
                        </c:if>
                        <c:if test="${not requestScope.AUTHOR_LIST.get(author)}">
                            <div class="tag tag-notcheck author-tag"
                                 onclick="toggleCheckbox('author${counter.count}')"> ${author}</div>
                        </c:if>

                        <input type="checkbox" name="authors" value="${author}"
                               id="author${counter.count}" <c:if
                            test="${requestScope.AUTHOR_LIST.get(author)}">
                            checked
                        </c:if>
                        />

                    </c:forEach>
                </div>
                <div class="col-1" style="text-align: center;">
                    <div class="button-showmore" id="author-showmore" onclick="showMoreTag('author')">
                        <i class="fa-solid fa-circle-chevron-down"></i>
                    </div>
                    <div class="button-showless" id="author-showless" onclick="hideTag('author')">
                        <i class="fa-solid fa-circle-chevron-down"></i>
                    </div>
                </div>
            </div>
            <div class="row">
                <h3 class="col-1">Publisher </h3>
                <div class="col-10 d-flex flex-row flex-wrap align-items-start"
                     id="publisher-tag-container">
                    <c:forEach items="${requestScope.PUBLISHER_LIST.keySet()}" var="publisher"
                               varStatus="counter">
                        <c:if test="${requestScope.PUBLISHER_LIST.get(publisher)}">
                            <div class="tag tag-checked publisher-tag"
                                 onclick="toggleCheckbox('publisher${counter.count}')"> ${publisher}
                            </div>
                        </c:if>
                        <c:if test="${not requestScope.PUBLISHER_LIST.get(publisher)}">
                            <div class="tag tag-notcheck publisher-tag"
                                 onclick="toggleCheckbox('publisher${counter.count}')"> ${publisher}
                            </div>
                        </c:if>

                        <input type="checkbox" name="publishers" value="${publisher}"
                               id="publisher${counter.count}" <c:if
                            test="${requestScope.PUBLISHER_LIST.get(publisher)}">
                            checked
                        </c:if>
                        />
                    </c:forEach>
                </div>
                <div class="col-1" style="text-align: center;">
                    <div class="button-showmore" id="publisher-showmore"
                         onclick="showMoreTag('publisher')">
                        <i class="fa-solid fa-circle-chevron-down"></i>
                    </div>
                    <div class="button-showless" id="publisher-showless" onclick="hideTag('publisher')">
                        <i class="fa-solid fa-circle-chevron-down"></i>
                    </div>
                </div>
            </div>
            <div class="row">
                <h3 class="col-1">Layout </h3>
                <div class="col-10 flex-row flex-wrap d-flex align-items-start">
                    <c:forEach items="${requestScope.LAYOUT_LIST.keySet()}" var="layout"
                               varStatus="counter">
                        <c:if test="${requestScope.LAYOUT_LIST.get(layout)}">
                            <div class="tag tag-checked"
                                 onclick="toggleCheckbox('layout${counter.count}')">
                                    ${layout}</div>
                        </c:if>
                        <c:if test="${not requestScope.LAYOUT_LIST.get(layout)}">
                            <div class="tag tag-notcheck"
                                 onclick="toggleCheckbox('layout${counter.count}')"> ${layout}</div>
                        </c:if>

                        <input type="checkbox" name="layouts" value="${layout}"
                               id="layout${counter.count}" <c:if
                            test="${requestScope.LAYOUT_LIST.get(layout)}">
                            checked
                        </c:if>
                        />
                    </c:forEach>
                </div>
            </div>
            <div class="row">
                <h3 class="col-1">Language </h3>
                <div class="col-10 d-flex flex-row flex-wrap align-items-start">
                    <c:forEach items="${requestScope.LANGUAGE_LIST.keySet()}" var="language"
                               varStatus="counter">
                        <c:if test="${requestScope.LANGUAGE_LIST.get(language)}">
                            <div class="tag tag-checked"
                                 onclick="toggleCheckbox('language${counter.count}')"> ${language}</div>
                        </c:if>
                        <c:if test="${not requestScope.LANGUAGE_LIST.get(language)}">
                            <div class="tag tag-notcheck"
                                 onclick="toggleCheckbox('language${counter.count}')"> ${language}</div>
                        </c:if>

                        <input type="checkbox" name="languages" value="${language}"
                               id="language${counter.count}" <c:if
                            test="${requestScope.LANGUAGE_LIST.get(language)}">
                            checked
                        </c:if>
                        />

                    </c:forEach>
                </div>
            </div>
            <div class="row">
                <h3 class="col-1">Price</h3>
                <input class="col-2 input-price" type="number" name="minPrice"
                       value="${requestScope.MIN_PRICE}"/> -
                <input class="col-2 input-price" type="number" name="maxPrice"
                       value="${requestScope.MAX_PRICE}"/>
                <button class="col-1 button-price" type="submit">Find</button>
            </div>
    </div>
    <input type="hidden" id="oderByInput" name="orderBy" value="${requestScope.ORDER_BY}"/>
    <input type="hidden" id="pageInput" name="page" value="1"/>


    <div class="row">
        <div class="dropdown">
            <button class="button-sort dropdown-toggle" type="button" id="dropdownMenuButton1"
                    data-bs-toggle="dropdown" aria-expanded="false">
                Sort by: ${requestScope.ORDER_BY}
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                <li>
                    <div onclick="sortBookList('none')">none</div>
                </li>
                <li>
                    <div onclick="sortBookList('price descending')">price descending</div>
                </li>
                <li>
                    <div onclick="sortBookList('price ascending')">price ascending</div>
                </li>
                <li>
                    <div onclick="sortBookList('rating')">rating</div>
                </li>
            </ul>
        </div>
    </div>
    </form>

</div>
<!-- book display -->
<div class="container bg-white book-container">
    <div class="ms-0 me-0">
        <div class="row row-cols-lg-6 me-0 ms-0">
            <!-- get book from req and display -->
            <c:if test="${not empty requestScope.BOOK_LIST}">
                <c:forEach items="${requestScope.BOOK_LIST}" var="book">
                    <div class="col p-0">
                        <div class="bg-white  mt-0 mb-1 ms-1 me-0 book-card"
                             style="border-radius: 1px;
                                 height: 380px ">
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
                                            <span class="text-truncate d-inline-block"
                                                  style="max-width: 200px">${book.name}</span>
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
            </c:if>
            <c:if test="${empty requestScope.BOOK_LIST}">
                <h4 style="width: 100%; text-align: center; margin-top: 20px; margin-bottom: 20px">No search
                    result!!!</h4>
            </c:if>
        </div>
    </div>
    <c:if test="${not empty requestScope.BOOK_LIST and requestScope.NUM_OF_PAGE > 1}">
        <div style="text-align: center">
            <nav class="paging-bar" aria-label="Page navigation">
                <ul class="pagination">
                    <li class="page-item">
                        <a class="page-link page-link-pre" onclick="loadPage('${requestScope.PAGE - 1}')"
                           aria-label="Previous">
                            <span aria-hidden="true">«</span>
                        </a>
                    </li>
                    <c:forEach begin="1" end="${requestScope.NUM_OF_PAGE}" varStatus="counter">
                        <c:if test="${counter.count != requestScope.PAGE}">
                            <li class="page-item"><a class="page-link"
                                                     onclick="loadPage('${counter.count}')">${counter.count}</a></li>
                        </c:if>
                        <c:if test="${counter.count == requestScope.PAGE}">
                            <li class="page-item active"><a class="page-link">${counter.count}</a></li>
                        </c:if>
                    </c:forEach>
                    <li class="page-item">
                        <a class="page-link page-link-next" onclick="loadPage('${requestScope.PAGE + 1}')"
                           aria-label="Next">
                            <span aria-hidden="true">»</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </c:if>
</div>
<!-- import footer -->
<%@include file="footer.html" %>
<jsp:include page="include/include_footer.jsp"></jsp:include>

<script>
    hideTagStart("genre");
    hideTagStart("author");
    hideTagStart("publisher");

    function showTag(s) {
        var tagList = document.getElementsByClassName(s + "-tag");
        for (var i = 0; i < tagList.length; ++i) {
            tagList[i].style.display = "block";
        }
    }

    function hideTagStart(s) {
        var containerLen = document.getElementById(s + "-tag-container").offsetWidth - 100;
        var tagList = document.getElementsByClassName(s + "-tag");
        var len = 0;
        var check = false;
        var unCheck = false;
        for (var i = 0; i < tagList.length; ++i) {
            len += tagList[i].offsetWidth;
            //console.log(containerLen + " " + len);
            if (len > containerLen) {
                check = true;
                if (tagList[i].classList.contains("tag-checked"))
                    unCheck = true;
                tagList[i].style.display = "none";
            }
        }
        if (check) {
            document.getElementById(s + "-showmore").style.display = "inline-block";
            document.getElementById(s + "-showless").style.display = "none";
        }
        if (unCheck) {
            showMoreTag(s);
        }
    }

    function hideTag(s) {
        var containerLen = document.getElementById(s + "-tag-container").offsetWidth - 100;
        var tagList = document.getElementsByClassName(s + "-tag");
        var len = 0;
        var check = false;

        for (var i = 0; i < tagList.length; ++i) {
            len += tagList[i].offsetWidth;
            //console.log(containerLen + " " + len);
            if (len > containerLen) {
                check = true;
                tagList[i].style.display = "none";
            }
        }
        if (check) {
            document.getElementById(s + "-showmore").style.display = "inline-block";
            document.getElementById(s + "-showless").style.display = "none";
        }

    }

    function showMoreTag(s) {
        showTag(s);
        document.getElementById(s + "-showless").style.display = "inline-block";
        document.getElementById(s + "-showmore").style.display = "none";
    }

    function toggleCheckbox(id) {
        //alert(id);
        var checkBox = document.getElementById(id);
        checkBox.checked = !checkBox.checked;
        document.getElementById("searchForm").submit();
    }

    function sortBookList(s) {
        document.getElementById("oderByInput").value = s;
        document.getElementById("searchForm").submit();
    }

    function loadPage(s) {
        document.getElementById("pageInput").value = s;
        document.getElementById("searchForm").submit();
    }

    function removeSearch() {
        document.getElementById("searchInput").value = "";
        document.getElementById("searchForm").submit();
    }
</script>
</body>

</html>