<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mangasa Store</title>
        <!-- temp css -->
        <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
        <style>
            #comment-filter {
                width: 200px;
                margin-left: 20px;
                border-radius: 15px;
                font-weight: bold;
            }

            .comment-row {
                margin: 20px;
                margin-right: 0px;
                background-color: #fafafa;
                border-radius: 15px;
                box-shadow: 10px 10px 5px rgba(231, 231, 231, 0.54);
            }

            .author-avatar {
                margin: 20px;
            }

            .author-name {
                font-size: 1.2rem;
                font-weight: bold;
            }

            .comment-action {
                font-size: 0.9rem;
            }

            .comment-content p {
                white-space: pre-wrap;
            }

            /*star rating css*/
            .rating-wrapper {
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            #rating-star {
                position: relative;
                display: flex;
                margin: 10px 0;
                flex-direction: row-reverse;
            }

            #rating-star input {
                position: relative;
                width: 50px;
                height: 40px;
                display: flex;
                justify-content: center;
                align-items: center;
                appearance: none;
                cursor: pointer;
            }

            #rating-star input::before {
                content: '\eeb8';
                position: absolute;
                font-family: boxicons;
                font-size: 34px;
                color: #d4d4d4;
                transition: all .3s;
            }

            #rating-star input:hover~input::before,
            #rating-star input:hover::before,
            #rating-star input:checked~input::before,
            #rating-star input:checked::before {
                color: #ffc107;
            }

            .user-rating {
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            #user-star {
                position: relative;
                display: flex;
                margin: 10px 0;
                flex-direction: row-reverse;
            }

            #user-star label {
                position: relative;
                width: 30px;
                height: 15px;
                display: flex;
                justify-content: center;
                align-items: center;
                appearance: none;
            }

            #user-star label::before {
                content: '\eeb8';
                position: absolute;
                font-family: boxicons;
                font-size: 16px;
                color: #d4d4d4;
                transition: all .3s;
            }

            #user-star label[name="star"]~label::before,
            #user-star label[name="star"]::before {
                color: #ffc107;
            }

            .rating-card {
                min-width: 1144px;
                background-color: #fff;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            }

            .rating-number {
                font-size: 50px;
                font-weight: 600;
            }

            .rating-number small {
                font-size: 20px;
            }

            .rating-stars:before {
                content: "";
                position: absolute;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                background: #eee;
            }

            .rating-stars .filled-star {
                position: absolute;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                background: #ffc107;
                transition: all .5s;
            }

            .rating-stars svg {
                height: 100%;
                width: 100%;
                display: block;
                position: relative;
                z-index: 1;
            }

            .rating-divided {
                flex: 1;
            }

            .rating-divided>div {
                width: 400px;
            }

            .rating-divided svg {
                height: 15px;
                margin-left: 3px;
            }

            .rating-progress {
                display: flex;
                justify-content: start;
                align-items: center;
            }

            .rating-grade {
                font-size: 21px;
                padding: 3px 20px 3px 0;
                float: left;
                width: 50px;
                text-align: right;
                display: flex;
                justify-content: flex-end;
                align-items: center;
            }

            .progress {
                float: left;
                width: calc(100% - 110px);
                border-radius: 10px;
            }

            .btn-addtocart:hover {
                background-position: left !important;
                background-color: #dc4514 !important;
            }

            .btn-category:hover {
                background-position: left;
                background-color: #F37878FF !important;
            }

            .tabset>input[type="radio"] {
                position: absolute;
                left: -200vw;
            }

            .tabset .tab-panel {
                display: none;
            }

            .tabset>input:first-child:checked~.tab-panels>.tab-panel:first-child,
            .tabset>input:nth-child(3):checked~.tab-panels>.tab-panel:nth-child(2),
            .tabset>input:nth-child(5):checked~.tab-panels>.tab-panel:nth-child(3),
            .tabset>input:nth-child(7):checked~.tab-panels>.tab-panel:nth-child(4),
            .tabset>input:nth-child(9):checked~.tab-panels>.tab-panel:nth-child(5),
            .tabset>input:nth-child(11):checked~.tab-panels>.tab-panel:nth-child(6) {
                display: block;
            }

            .tabset>label {
                position: relative;
                display: inline-block;
                padding: 15px 15px 25px;
                border: 1px solid transparent;
                border-bottom: 0;
                cursor: pointer;
                font-weight: 600;
            }

            .tabset>label::after {
                content: "";
                position: absolute;
                left: 15px;
                bottom: 10px;
                width: 80px;
                height: 4px;
                background: #8d8d8d;
            }

            .tabset>label:hover,
            .tabset>input:focus+label {
                color: #f85b2b;
            }

            .tabset>label:hover::after,
            .tabset>input:focus+label::after,
            .tabset>input:checked+label::after {
                background: #f85b2b;
            }

            .tabset>input:checked+label {
                border-color: #ccc;
                border-bottom: 1px solid #fff;
                margin-bottom: -1px;
            }

            .tab-panel {
                padding: 30px 0;
                border-top: 1px solid #ccc;
            }

            *,
            *:before,
            *:after {
                box-sizing: border-box;
            }

            .fa-solid.fa-minus,
            .fa-solid.fa-plus {
                position: relative;
                top: 10px;
            }

            .tabset {
                justify-items: center;
                max-width: 1200px;
                padding: 40px;
                margin-left: 50px;
                margin-right: 50px;
                border-top: 1px solid gainsboro;
            }

            .form {
                padding: 0px;
                max-width: 225px;
                max-height: 40px;
                margin: 0 auto;
                text-align: center;
            }

            .value-button {
                display: inline-block;
                border: 1px solid #ddd;
                font-weight: bold;
                padding-top: 0px;
                margin: 0px;
                width: 60px;
                height: 40px;
                text-align: center;
                vertical-align: middle;
                /*horiz-align: ;*/
                background: #eee;
                -webkit-touch-callout: none;
                -webkit-user-select: none;
                -khtml-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
            }

            .value-button:hover {
                cursor: pointer;
            }

            form #decrease {
                margin-right: -4px;
                border: none;
                border-radius: 20px 0 0 20px;
            }

            form #increase {
                margin-left: -4px;
                border: none;
                border-radius: 0 20px 20px 0;
            }

            input#quantity {
                text-align: center;
                border: none;
                border-top: 1px solid #ddd;
                border-bottom: 1px solid #ddd;
                margin-top: 0px;
                vertical-align: middle;
                /*padding: 0px;*/
                width: 60px;
                height: 40px;
            }

            input[type=number]::-webkit-inner-spin-button,
            input[type=number]::-webkit-outer-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }
        </style>
        <jsp:include page="include/include_header.jsp"></jsp:include>
        </head>


        <body style="background: linear-gradient(0deg, rgba(255, 244, 247, 0.4) 0%,
              rgba(255, 244, 247, 0.4) 100%,
              rgba(255, 244, 247, 0.4) 100%),
              url('img/background_searchpage.jpg');
              background-repeat: no-repeat;
              background-size: cover;
              background-attachment: fixed;">
        <%@include file="header.jsp" %>
        <c:set var="user" value="${sessionScope.USER}" />
        <div class="container p-3 mt-4" style="background-color: white; ">
            <c:set var="book" value="${requestScope.BOOK}" />
            <div class="card p-4 " style="background:none; border: none">
                <div class="row " style="margin-left: 20px; margin-right: 20px">
                    <div class="col ">
                        <div class="d-flex justify-content-start">
                            <div class="card" style="border: none; width: 450px; height: 550px;
                                 overflow: hidden; background:  transparent; padding: 2rem">
                                <img style=" width: 100%; height: 100%; object-fit: cover; position: center"
                                     src="${book.imageAddress}" alt="alt" />
                            </div>
                        </div>
                    </div>
                    <div class="col" style="margin-top: 32px ">
                        <div class="card d-flex"
                             style=" padding: 32px; background: transparent; min-width: 700px  ">
                            <div class="d-flex">
                                <c:if test="${requestScope.STOCK_STATUS == 'in stock'}">
                                    <div class="card"
                                         style="background: #B2F393;font-weight: bold; padding: 5px; min-width: 100px">
                                        <span
                                            style="font-size:15px; text-transform: uppercase; text-align: center ">
                                            ${requestScope.STOCK_STATUS}</span>
                                    </div>
                                </c:if>
                                <c:if test="${requestScope.STOCK_STATUS != 'in stock'}">
                                    <div class="card"
                                         style="background: #f39393;font-weight: bold; padding: 5px; min-width: 100px">
                                        <span
                                            style="font-size:15px; text-transform: uppercase; text-align: center ">
                                            ${requestScope.STOCK_STATUS}</span>
                                    </div>
                                </c:if>

                            </div>


                            <h2 class="mt-2"> ${book.name}</h2>
                            <div class="row">
                                <div class="col">
                                    <span>Author:</span>
                                    <span>
                                        <c:forEach items="${book.authors}" var="author">
                                            <span>${author.aliasName}</span>
                                        </c:forEach>
                                    </span>

                                </div>
                                <div class="col">
                                    ISBN: <span>${book.ISBN}</span>
                                </div>
                            </div>
                            <hr class="mb-4 mt-4" />
                            <div>
                                <c:if test="${book.currentPrice != book.price}">

                                    <div class="d-flex">
                                        <span class="me-3"
                                              style="color:black; font-weight: normal; font-size: 22px">
                                            Price:</span>
                                        <span style="color: #ED0000; font-weight: bold; font-size: 24px">
                                            <fmt:formatNumber value="${book.currentPrice}" type="currency" />
                                        </span>
                                        <s style="font-size: 15px" class="ms-3 me-3 mt-2">
                                            <fmt:formatNumber value="${book.price}" type="currency" />
                                        </s>
                                        <div class="card ms-3 rounded-pill"
                                             style="background: #ED0000; color: white">
                                            <c:if test="${book.saleOffPercent gt 0}">
                                                <i class="p-1" style="font-size: 18px; font-weight: bold">-
                                                    ${book.saleOffPercent}%</i>
                                                </c:if>
                                        </div>
                                    </div>

                                </c:if>
                                <c:if test="${book.currentPrice == book.price}">
                                    <span class="me-3" style="color:black; font-weight: normal; font-size: 22px">
                                        Price:</span>
                                    <span style="color: #ED0000; font-weight: bold; font-size: 24px">
                                        <fmt:formatNumber value="${book.price}" type="currency" />
                                    </span>

                                </c:if>


                                <!-- add to cart here  -->



                                <!-- add to cart here  -->
                                <span>Quantity</span>
                                <div class="row mt-3" style="max-width: 450px">
                                    <div class="col">
                                        <form class="text-start form">
                                            <div class="value-button" id="decrease" onclick="decreaseValue()"
                                                 value="Decrease Value">
                                                <i class="fa-solid fa-minus"></i>
                                            </div>
                                            <input type="number" id="quantity" value="1" />
                                            <div class="value-button" id="increase" onclick="increaseValue()"
                                                 value="Increase Value">
                                                <i class="fa-solid fa-plus"></i>
                                            </div>
                                        </form>


                                    </div>
                                    <div class="col">
                                        <button class="btn btn-addtocart"
                                                style="border-radius: 20px; min-width: 180px;min-height: 40px; background:#f85b2b; color: white "
                                                type="submit" onclick="addToCart()">
                                            <i class="fa-light fa-cart-shopping ms-3 me-3"></i>
                                            <span class="me-3">Add to cart</span>
                                        </button>
                                    </div>

                                    <div>
                                        <p id="error-msg" class="mt-3" style="color: red;"></p>
                                    </div>
                                </div>
                                </form>

                                <hr class="mb-4 mt-4" />
                                <div>
                                    <span class="me-3">Categories:</span>

                                    <c:forEach items="${book.genres}" var="genre">
                                        <c:url var="searchController" value="searchBookController">
                                            <c:param name="genres" value="${genre.name}" />
                                        </c:url>
                                        <a class="btn btn-category me-1 mb-1"
                                           style="font-size:14px; border-radius:20px; text-decoration: none; color: black; border-color: #F37878"
                                           href="${searchController}">${genre.name} </a>
                                    </c:forEach>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>

                <%-- tab description here--%>
                <div class="tabset">
                    <!-- Tab 1-->
                    <input type="radio" name="tabset" id="book_description_container" aria-controls="Description"
                           checked>
                    <label for="book_description_container"
                           style=" color: black; font-size: 25px; font-weight: bold">Description</label>
                    <!-- Tab 2-->
                    <input type="radio" name="tabset" id="book_info_container" aria-controls="Details">
                    <label for="book_info_container"
                           style=" color: black; font-size: 25px; font-weight: bold">Details</label>



                    <div class="tab-panels">
                        <section id="Description" class="tab-panel">
                            <p>
                                ${book.description}
                            </p>
                        </section>
                        <section id="Details" class="tab-panel">
                            <p><strong>Language: </strong>${book.language}</p>
                            <p><strong>Translator: </strong>
                                ${book.translator}</p>
                            <p><strong>Weight: </strong>
                                ${book.weight}</p>
                            <p><strong>Size: </strong>
                                ${book.size}</p>
                            <p><strong>Number of page:</strong>
                                ${book.numberOfPage}</p>
                            <p><strong>Year of publish: </strong>
                                ${book.yearOfPublishl}</p>
                            <p><strong>Book layout: </strong>
                                ${book.bookLayout}</p>


                        </section>


                    </div>

                </div>
                <%-- tab description end here--%>

                <div>
                    <c:if test="${not empty sessionScope.USER}">
                        <div>
                            <form action="createBlogPage">
                                <input type="submit" value="Create blog" />
                                <input type="hidden" name="ISBN" value="${book.ISBN}" />
                            </form>
                        </div>
                    </c:if>
                    <c:if test="${not empty requestScope.BLOGS}">
                        <div>
                            <p>Blogs about this book:</p>
                            <ul>
                                <c:forEach var="blog" items="${requestScope.BLOGS}">
                                    <li><a href="viewBlogAction?id=${blog.id}">${blog.title}</a></li>
                                    </c:forEach>
                            </ul>
                        </div>
                    </c:if>
                </div>

                <!-- rating overview -->
                <div class="d-flex justify-content-center">
                    <div class="rating-card d-flex p-5 mt-3 rounded">
                        <div class="text-center">
                            <h4>Rating Overview</h4>
                            <br>
                            <h1 class="rating-number mt-2"><span
                                    id="avg-rating">${book.rating.avg}</span><small>/5</small></h1>
                            <div class="rating-stars d-inline-block position-relative mr-2">
                                <%@include file="img/grey-star.svg" %>
                                <div class="filled-star" style="width: ${book.rating.avg * 100 / 5}%"></div>
                            </div>
                            <div class="text-muted"><span id="total-review">${book.rating.totalReview}</span>
                                ratings
                            </div>
                        </div>
                        <div class="rating-divided my-5 mx-5">
                            <div class="rating-progress">
                                <span class="rating-grade">5 <%@include file="img/star.svg" %></span>
                                <div class="progress rounded-pill">
                                    <div class="progress-bar bg-warning rounded-pill" role="progressbar"
                                         style="width: ${book.rating.fiveStar * 100 / book.rating.totalReview}%;"
                                         aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>&nbsp;
                                <span class="rating-value"> ${book.rating.fiveStar}</span>
                            </div>
                            <div class="rating-progress">
                                <span class="rating-grade">4 <%@include file="img/star.svg" %></span>
                                <div class="progress rounded-pill">
                                    <div class="progress-bar bg-warning rounded-pill" role="progressbar"
                                         style="width: ${book.rating.fourStar * 100 / book.rating.totalReview}%;"
                                         aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>&nbsp;
                                <span class="rating-value"> ${book.rating.fourStar}</span>
                            </div>
                            <div class="rating-progress">
                                <span class="rating-grade">3 <%@include file="img/star.svg" %></span>
                                <div class="progress rounded-pill">
                                    <div class="progress-bar bg-warning rounded-pill" role="progressbar"
                                         style="width: ${book.rating.threeStar * 100 / book.rating.totalReview}%;"
                                         aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>&nbsp;
                                <span class="rating-value"> ${book.rating.threeStar}</span>
                            </div>
                            <div class="rating-progress">
                                <span class="rating-grade">2 <%@include file="img/star.svg" %></span>
                                <div class="progress rounded-pill">
                                    <div class="progress-bar bg-warning rounded-pill" role="progressbar"
                                         style="width: ${book.rating.twoStar * 100 / book.rating.totalReview}%;"
                                         aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>&nbsp;
                                <span class="rating-value"> ${book.rating.twoStar}</span>
                            </div>
                            <div class="rating-progress">
                                <span class="rating-grade">1 <%@include file="img/star.svg" %></span>
                                <div class="progress rounded-pill">
                                    <div class="progress-bar bg-warning rounded-pill" role="progressbar"
                                         style="width: ${book.rating.oneStar * 100 / book.rating.totalReview}%;"
                                         aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>&nbsp;
                                <span class="rating-value"> ${book.rating.oneStar}</span>
                            </div>
                        </div>
                    </div>
                </div>



                <div class="m-5">
                    <div class="card p-4 m-4" style="border-radius: 5px; border-color: rgba(204,204,204,0.37)">
                        <c:if test="${requestScope.IS_ALLOWED_TO_RATE}">
                            <!-- Star rating -->
                            <div class="rating-wrapper d-flex flex-column justify-content-center">
                                <p style="font-weight: bold; font-size: 20px">Rate this book: </p>
                                <div id="rating-star">
                                    <input type="radio" name="star-rating" value="5"
                                           onclick="updateRatingStatus(this)">
                                    <input type="radio" name="star-rating" value="4"
                                           onclick="updateRatingStatus(this)">
                                    <input type="radio" name="star-rating" value="3"
                                           onclick="updateRatingStatus(this)">
                                    <input type="radio" name="star-rating" value="2"
                                           onclick="updateRatingStatus(this)">
                                    <input type="radio" name="star-rating" value="1"
                                           onclick="updateRatingStatus(this)">
                                </div>
                                <div id="rating-status" style="font-weight: bold; font-size: 18px;"></div>
                            </div>
                        </c:if>
                        <div class="m-3">
                            <label for="user-comment" style="font-weight: bold; font-size: 20px">Leave your
                                comment</label>
                        </div>
                        <div class="d-flex justify-content-start">
                            <c:if test="${not empty user}">
                                <div>
                                    <img class="rounded-circle m-3" src="https://i.imgur.com/JJ1osje.jpg"
                                         alt="author" width="60">
                                </div>
                            </c:if>
                            <textarea style="border-radius: 20px" class="form-control shadow p-3"
                                      id="user-comment" rows="5" placeholder="Write something here..."></textarea>
                        </div>
                        <div class="d-flex justify-content-end m-3 ">
                            <button class="btn btn-secondary " onclick="cancelComment()">Cancel</button>&nbsp;
                            <button class="btn btn-primary" onclick="postComment()">Comment</button>
                        </div>
                        <div>
                            <select class="form-select" id="comment-filter" onchange="filterComments()">
                                <option value="newest" selected>Newest comments</option>
                                <option value="oldest">Oldest comments</option>
                                <c:if test="${not empty user}">
                                    <option value="user">My comments</option>
                                </c:if>
                            </select>
                        </div>

                        <div class="justify-content-center border-left border-right" id="comment-container">
                        </div>
                        <div class="justify-content-center d-flex" id="load-btn-container"></div>

                    </div>


                </div>


            </div>

            <div class="justify-content-center border-left border-right" id="comment-container"></div>
            <div class="justify-content-center d-flex" id="load-btn-container"></div>

            <%@include file="footer.html" %>

            <jsp:include page="include/include_footer.jsp"></jsp:include>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
                <script>
                                        let oldContent = sessionStorage.getItem("${book.ISBN}");
                                        let oldStar = sessionStorage.getItem("${book.ISBN}-star");
                                        if (oldContent !== null) {
                                            document.getElementById("user-comment").value = oldContent;
                                        }
                                        if (oldStar !== null) {
                                            document.querySelector('#rating-star > input[value="' + oldStar + '"]').checked = true;
                                        }
                                        sessionStorage.removeItem("${book.ISBN}");
                                        sessionStorage.removeItem("${book.ISBN}-star");
            </script>
            <script>
                filterComments();
                function filterComments() {
                    document.getElementById("comment-container").innerHTML = "";
                    loadMoreComments();
                }
                function updateRatingStatus(e) {
                    switch (e.value) {
                        case "1":
                            document.getElementById("rating-status").innerText = "Very bad";
                            break;
                        case "2":
                            document.getElementById("rating-status").innerText = "Bad";
                            break;
                        case "3":
                            document.getElementById("rating-status").innerText = "Not bad";
                            break;
                        case "4":
                            document.getElementById("rating-status").innerText = "Good";
                            break;
                        case "5":
                            document.getElementById("rating-status").innerText = "Very good";
                            break;
                    }
                }
                function addToCart() {
                    const quantityElem = document.getElementById("quantity");
                    let quantity = quantityElem.value;
                    $.ajax({
                        type: "POST",
                        url: "addToCartAction",
                        data: {
                            ISBN: "${book.ISBN}",
                            quantity: quantity
                        },
                        success: function (data) {
                            const errorElem = document.getElementById("error-msg");
                            if (data.invalidQuantityErr !== undefined) {
                                errorElem.innerText = data.invalidQuantityErr;
                            } else if (data.exceedHoldingQuantityErr !== undefined) {
                                errorElem.innerText = data.exceedHoldingQuantityErr;
                            } else {
                                document.getElementById("cart-item-amount").innerText = data;
                                errorElem.innerText = "";
                            }
                        }
                    });
                }
                function createStarBlock(star) {
                    let starBlock =
                            `<div class="user-rating">
                <div id="user-star">`;
                    for (let i = 5; i > 0; --i) {
                        if (i === star) {
                            starBlock += `<label name="star"></label>`;
                        } else {
                            starBlock += `<label></label>`;
                        }
                    }
                    starBlock += `</div></div>`
                    return starBlock;
                }
                function getTime(time) {
                    let sec = Math.floor(((new Date()) - (new Date(time))) / 1000);
                    if (sec < 60) {
                        return sec + " seconds ago";
                    } else {
                        let min = Math.floor(sec / 60);
                        if (min < 60) {
                            return min + " minutes ago";
                        } else {
                            let hour = Math.floor(min / 60);
                            if (hour < 24) {
                                return hour + " hours ago";
                            } else {
                                day = Math.floor(hour / 24);
                                if (day < 10) {
                                    return day + " days ago";
                                } else {
                                    return "on " + (new Date(time).toDateString());
                                }
                            }
                        }
                    }
                }
                function createComment(id, username, fullname, postedTime, star) {
                    let comment =
                            `<div class="comment-row d-flex justify-content-start py-2">
                    <div class="author-avatar">
                        <span><img class="rounded-circle" src="https://i.imgur.com/JJ1osje.jpg" alt="author" width="60"></span>
                    </div>
                    <div class="comment-text" id="` + id + `">
                        <div class="comment-header">
                            <span class="author-name">` + fullname + `</span>
                            <span class="comment-date" title="` + postedTime + `">commented ` + getTime(postedTime) + `</span>`;
                    if (star > 0) {
                        comment += createStarBlock(star);
                    }
                    comment += `</div>
                        <div class="comment-content">
                            <p></p>
                        </div>`;
                    if (${not empty user.username }) {
                        if ("${user.username}" === username) {
                            comment +=
                                    `<div class="comment-footer">
                        <button class="btn btn-primary" onclick="editComment(this)">Edit</button>
                        <button class="btn btn-danger" onclick="deleteComment(this)">Delete</button>
                    </div>`;
                        } else {
                            comment +=
                                    `<div class="comment-footer">
                        <button class="btn btn-secondary" onclick="reportComment(this)">Report</button>
                    </div>`;
                        }
                    }
                    comment += `</div></div>`;
                    return comment;
                }
                function postComment() {
                    let userCommentElement = document.getElementById("user-comment");
                    let content = userCommentElement.value;
                    let star = -1;
                    const ratingStarContainer = document.getElementById("rating-star");
                    if (ratingStarContainer !== null) {
                        star = 0;
                        const checkedStar = ratingStarContainer.querySelector("input:checked");
                        if (checkedStar !== null) {
                            star = checkedStar.value;
                        }
                    }
                    $.ajax({
                        type: "POST",
                        url: "postCommentAction",
                        data: {
                            username: "${user.username}",
                            content: content,
                            ISBN: "${book.ISBN}",
                            star: star,
                            redirect: "viewBookDetailController"
                        },
                        success: function (data) {
                            let comments = document.getElementById("comment-container");
                            comments.innerHTML =
                                    createComment(data.id, data.username, data.fullname, data.postedTime, data.star) + comments.innerHTML;
                            document.getElementById(data.id).getElementsByTagName("p")[0].innerText = content;
                            userCommentElement.value = "";
                            const ratingStarContainer = document.getElementById("rating-star");
                            if (ratingStarContainer !== null) {
                                ratings = ratingStarContainer.getElementsByTagName("input");
                                for (let i = 0; i < ratings.length; ++i) {
                                    ratings[i].checked = false;
                                }
                            }
                            reloadReviewStat();
                        },
                        error: function (xhr, textStatus, errorThrown) {
                            if (xhr.status === 401) {
                                sessionStorage.setItem("${book.ISBN}", content);
                                document.location.href = "loginPage";
                            }
                        }
                    });
                }
                function cancelComment() {
                    document.getElementById("user-comment").value = "";
                    const ratingStarContainer = document.getElementById("rating-star");
                    if (ratingStarContainer !== null) {
                        ratings = ratingStarContainer.getElementsByTagName("input");
                        for (let i = 0; i < ratings.length; ++i) {
                            ratings[i].checked = false;
                        }
                    }
                }
                function reloadReviewStat() {
                    $.ajax({
                        type: "POST",
                        url: "loadReviewStatAction",
                        data: {
                            ISBN: "${book.ISBN}"
                        },
                        success: function (data) {
                            document.getElementById("avg-rating").innerText = data.avg;
                            document.querySelector(".filled-star").style.width = data.avg * 100 / 5 + "%";
                            document.getElementById("total-review").innerText = data.totalReview;
                            let starElem = document.getElementsByClassName("rating-progress")[0];
                            starElem.querySelector(".progress-bar").style.width = data.fiveStar * 100 / data.totalReview + "%";
                            starElem.querySelector(".rating-value").innerText = data.fiveStar;
                            starElem = document.getElementsByClassName("rating-progress")[1];
                            starElem.querySelector(".progress-bar").style.width = data.fourStar * 100 / data.totalReview + "%";
                            starElem.querySelector(".rating-value").innerText = data.fourStar;
                            starElem = document.getElementsByClassName("rating-progress")[2];
                            starElem.querySelector(".progress-bar").style.width = data.threeStar * 100 / data.totalReview + "%";
                            starElem.querySelector(".rating-value").innerText = data.threeStar;
                            starElem = document.getElementsByClassName("rating-progress")[3];
                            starElem.querySelector(".progress-bar").style.width = data.twoStar * 100 / data.totalReview + "%";
                            starElem.querySelector(".rating-value").innerText = data.twoStar;
                            starElem = document.getElementsByClassName("rating-progress")[4];
                            starElem.querySelector(".progress-bar").style.width = data.oneStar * 100 / data.totalReview + "%";
                            starElem.querySelector(".rating-value").innerText = data.oneStar;
                        }
                    });
                }
                function loadMoreComments() {
                    const filter = document.getElementById("comment-filter").value;
                    const amount = document.getElementsByClassName("comment-row").length;
                    $.ajax({
                        type: "POST",
                        url: "loadMoreCommentsAction",
                        data: {
                            amount: amount,
                            ISBN: "${book.ISBN}",
                            filter: filter,
                            username: "${user.username}"
                        },
                        success: function (data) {
                            let comments = document.getElementById("comment-container");
                            let loadBtn = document.getElementById("btn-load-more-comments");
                            if (data.length === undefined && loadBtn !== null) {
                                loadBtn.remove();
                                return;
                            } else if (data.length !== undefined && loadBtn === null) {
                                loadBtn = document.createElement("button");
                                loadBtn.id = "btn-load-more-comments";
                                loadBtn.setAttribute("class", "btn btn-primary");
                                loadBtn.onclick = loadMoreComments;
                                loadBtn.innerText = "Load more";
                                document.getElementById("load-btn-container").appendChild(loadBtn);
                            }
                            for (let i = 0; i < data.length; ++i) {
                                comments.innerHTML += createComment(data[i].id, data[i].username,
                                        data[i].fullname, data[i].postedTime, data[i].star);
                                document.getElementById(data[i].id).getElementsByTagName("p")[0].innerText = data[i].content;
                            }
                        }
                    });
                }
                function editComment(e) {
                    const commentElem = e.parentNode.parentNode;
                    const commentContentElem = commentElem.getElementsByTagName("p")[0];
                    oldContent = commentContentElem.innerText;
                    const commentBoxElem = document.createElement("textarea");
                    commentBoxElem.rows = 5;
                    commentBoxElem.cols = 100;
                    commentBoxElem.setAttribute("class", "form-control shadow mb-2");
                    commentBoxElem.value = oldContent;
                    commentContentElem.parentNode.replaceChild(commentBoxElem, commentContentElem);
                    const commentFooterElem = commentElem.querySelector(".comment-footer");
                    commentFooterElem.innerHTML =
                            `<button class="btn btn-secondary" onclick="cancelEditComment(this)">Cancel</button>
            <button class="btn btn-primary" onclick="saveComment(this)">Save</button>`;
                }
                function saveComment(e) {
                    const commentElem = e.parentNode.parentNode;
                    const id = commentElem.id;
                    const commentBoxElem = commentElem.getElementsByTagName("textarea")[0];
                    let content = commentBoxElem.value;
                    $.ajax({
                        type: "POST",
                        url: "editCommentAction",
                        data: {
                            id: id,
                            username: "${user.username}",
                            content: content
                        },
                        success: function (data) {
                            const commentContentElem = commentElem.querySelector(".comment-content");
                            commentContentElem.innerHTML = "<p></p>";
                            document.getElementById(data.id).getElementsByTagName("p")[0].innerText = data.content;
                            commentElem.querySelector(".comment-date").innerText = "commented " + getTime(data.postedTime);
                            commentElem.querySelector(".comment-date").title = data.postedTime;
                            const commentFooterElem = commentElem.querySelector(".comment-footer");
                            commentFooterElem.innerHTML =
                                    `<button class="btn btn-primary" onclick="editComment(this)">Edit</button>
                    <button class="btn btn-danger" onclick="deleteComment(this)">Delete</button>`;
                        }
                    });
                }
                function cancelEditComment(e) {
                    const commentElem = e.parentNode.parentNode;
                    const commentContentElem = commentElem.getElementsByClassName("comment-content")[0];
                    commentContentElem.innerHTML = "<p></p>";
                    commentElem.getElementsByTagName("p")[0].innerText = oldContent;
                    const commentFooterElem = commentElem.querySelector(".comment-footer");
                    commentFooterElem.innerHTML =
                            `<button class="btn btn-primary" onclick="editComment(this)">Edit</button>
            <button class="btn btn-danger" onclick="deleteComment(this)">Delete</button>`;
                }
                function deleteComment(e) {
                    const id = e.parentNode.parentNode.id;
                    $.ajax({
                        type: "POST",
                        url: "deleteCommentAction",
                        data: {
                            id: id,
                            username: "${user.username}"
                        },
                        success: function (data) {
                            let comment = document.getElementById(data);
                            comment.parentNode.remove();
                            reloadReviewStat();
                        }
                    });
                }
                function increaseValue() {
                    var value = parseInt(document.getElementById('quantity').value, 10);
                    value = isNaN(value) ? 0 : value;
                    value++;
                    document.getElementById('quantity').value = value;
                }
                function decreaseValue() {
                    var value = parseInt(document.getElementById('quantity').value, 10);
                    value = isNaN(value) ? 0 : value;
                    value < 1 ? value = 1 : '';
                    value--;
                    document.getElementById('quantity').value = value;
                }
            </script>


    </body>

</html>