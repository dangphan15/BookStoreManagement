<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN" scope="session"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manga bookstore</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Manage orders</title>
    <jsp:include page="../include/include_header.jsp"/>
    <fmt:setLocale value="vi_VN"/>
    <style>
        table {
            border-radius: 15px;
            overflow: hidden;
        }

        th, td {
            padding-right: 20px !important;
            padding-top: 15px !important;
        }

        th {
            background-color: rgba(243, 147, 147, 0.97) !important;
            color: #FFFFFF;
        }

        /*table {*/
        /*    width: 90%;*/
        /*    text-align: center;*/
        /*    border: 1px solid #fff;*/
        /*    border-spacing: 1px;*/
        /*    font-family: 'Cairo', sans-serif;*/
        /*    margin: auto;*/
        /*}*/

        /*table td {*/
        /*    padding: 10px;*/
        /*    background-color: #eee;*/
        /*}*/

        /*table th {*/
        /*    background-color: #333;*/
        /*    color: #fff;*/
        /*    padding: 10px;*/
        /*}*/
        .fade:not(.show) {
            opacity: 1;
        }
        .btn-staff {
            background-color: rgba(243, 147, 147, 0.97) !important;
            color: #FFFFFF !important;
        }

        .btn-staff:hover, .btn-staff:focus {
            background-color: #DE8888FF !important;
            font-weight: bold !important;
            color: #FFFFFF !important;
        }
        .pagination .active a {
            background-color: #F39393F7 !important;
            border-color: rgba(243, 147, 147, 0.97) !important;
        }

        .page-link {
            color: black;
        }

        .page-item a:hover, .page-item a:focus {
            background-color: rgba(243, 147, 147, 0.3) !important;
            color: black;
            border-color: transparent !important;
        }
    </style>
</head>
<header style="z-index: 100; border-bottom: solid 1px #7D7068">
    <div class="navbar navbar-expand-lg navbar-light pt-0 pb-0" style="border-bottom: solid 0.5px black">
        <div class="container-fluid pe-4 ps-4 justify-content-evenly "
             style="background-color: #ffffff; height: 120px">
            <div class="d-flex justify-content-start" >
                <!-- insert web logo -->
                <a class="d-flex " style="padding-left: 40px" href="./">
                    <img src="../img/logo1.png" alt="web-logo"
                         style="min-width: 200px; max-height: 120px; object-fit: cover">
                </a>
            </div>
            <div class="d-flex flex-grow" >
                    <!-- Search form -->
                    <div style="min-width: 600px">
                        <form action="InventoryBookAction" method="post"
                              style="display: flex; border-radius: 18px; border: none; height:40px; background-color: #EAF6F6"
                              class="pe-4">
                            <input class="form-control "
                                   style="border-radius: 15px; border-color: transparent;background-color: #EAF6F6"
                                   type="search"
                                   placeholder="Search book..." aria-label="Search"
                                   name="txtsearch"
                                   value="${txtsearch}" required>
                            <!-- search button -->
                            <button style="border: none; background: none; opacity: 0.36" type="submit">
                                <input type="hidden" value="Search" name="action">
                                <i class="fa-solid fa-magnifying-glass ps-3"></i>
                            </button>
                        </form>
                    </div>
            </div>
            <div class="dropdown user-group" style="text-align: right; ">
                <button class="btn btn-staff dropdown-toggle" type="button" id="dropdownUserButton"
                        data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="fa-regular fa-user me-2"></i> ${sessionScope.USER.fullName}
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownUserButton">
                    <li><a class="dropdown-item" href="../userInformation">Edit profile</a></li>
                    <li><a class="dropdown-item" href="../logoutAction">Logout</a></li>
                </ul>

            </div>
        </div>

    </div>
</header>
<body style="background: linear-gradient(rgba(246, 247, 249, 0.8), rgba(246, 247, 249, 0.8)),
            url('../img/bg-clouds.jpg') no-repeat center center fixed;
            background-size: cover;">
<!-- import header -->
<jsp:useBean id="inventory" class="com.swp391.group3.inventory.InventoryDAO" scope="request"/>
<div id="addBookModal" class="modal" style="background: linear-gradient(rgba(246, 247, 249, 0.8), rgba(246, 247, 249, 0.8)),
            url('../img/bg-clouds.jpg') no-repeat center center fixed;
            background-size: cover;">
    <div class="modal-dialog" style="max-width: 900px; ">
        <div class="modal-content ps-3 pe-3" style="border-radius: 12px !important;">
            <form action="addBookAction" method="post">
                <div class="modal-header">
                    <h4 class="modal-title">Add new Book</h4>
                    <button style="border: none; background-color: transparent" type="button" class="close p-2"
                            data-dismiss="modal" aria-hidden="true">
                        <i class="fa-solid fa-xmark"></i>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group mb-2">
                        <div class="row">
                            <div class="col-md-6">
                                <label style="font-weight: bolder">ISBN</label>
                                <input type="text" name="bookISBN" class="form-control" required=""
                                       pattern="[a-zA-Z0-9]{10}$">
                            </div>
                            <div class="col-md-6">
                                <label style="font-weight: bolder">Book Name</label>
                                <input type="text" name="bookName" class="form-control" required=""
                                      >
                            </div>
                        </div>
                    </div>
                    <div class="form-group mb-2">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Translator</label>
                                <input type="text" name="bookTranslator" class="form-control">
                            </div>
                            <div class="col-md-6">
                                <label style="font-weight: bolder">Author Alias</label>
                                <select class="form-select" name="bookAuthorAlias">
                                    <c:forEach var="a" items="${authorList}">
                                        <option value="${a.getAliasName()}">${a.getAliasName()}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group mb-2">
                        <div class="row">
                            <div class="col-md-6">
                                <label style="font-weight: bolder">Price</label>
                                <input type="number" name="bookPrice" class="form-control" required="" min="1000"
                                       step="1000">
                            </div>
                            <div class="col-md-6">
                                <label style="font-weight: bolder">Image</label>
                                <input type="text" name="bookImage" oninput="changeImgInsert(this)" class="form-control"
                                       required="">
                                <img id="img-book-insert" src="" style="width: 100px;height: 100px; display: none"
                                     onerror="this.src='https://i.ibb.co/8sQwx76/images-q-tbn-ANd9-Gc-TE3ogc-Suv-DVe-N1iwin1a-Tlbrk2-QXSKYv-Vz7t-Sn0-LV9k7h2-L-FPu-Pndu-Ow-HIE8jc3-L.png'">
                            </div>
                        </div>
                    </div>
                    <div class="form-group mb-2">
                        <div class="row">
                            <div class="col-md-4">
                                <label style="font-weight: bolder">Weight(pound)</label>
                                <input type="number" name="bookWeight" placeholder="x.xxx(pound)" class="form-control"
                                       required="" min="0.001" step="0.001">
                            </div>
                            <div class="col-md-6">
                                <label style="font-weight: bolder">Size(cm x cm x cm)</label>
                                <input type="text" name="bookSize" class="form-control" required=""
                                       placeholder="length x width x height">
                            </div>
                            <div class="col-md-2">
                                <label style="font-weight: bolder">Quantity</label>
                                <input type="number" name="bookQuantity" class="form-control" required="">
                            </div>
                        </div>
                    </div>
                    <div class="form-group mb-2">
                        <div class="row">
                            <div class="col-md-6">
                                <label style="font-weight: bolder">Number Of Pages</label>
                                <input type="number" name="bookPage" class="form-control" required="" min="1"
                                       max="5000">
                            </div>
                            <div class="col-md-6" style="display: flex;">
                                <div class="col-md-6 me-2">
                                    <label style="font-weight: bolder" for="language">Language</label>
                                    <select class="form-select" name="bookLanguage" id="language">
                                        <c:forEach var="l" items="${languageList}">
                                            <option value="${l}">${l}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label style="font-weight: bolder" for="layout">Layout</label>
                                    <select class="form-select" name="bookLayout" id="layout">
                                        <c:forEach var="la" items="${layoutList}">
                                            <option value="${la}">${la}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group mb-2">
                        <div class="row">
                            <div class="col-md-6">
                                <label style="font-weight: bolder">Year Of Publish</label>
                                <input type="number" name="bookYearOfPublish" class="form-control" required=""
                                       min="1900" max="2022">
                            </div>
                            <div class="col-md-6">
                                <label style="font-weight: bolder">Publisher</label>
                                <select class="form-select" name="bookPublisher">
                                    <c:forEach var="p" items="${publisherList}">
                                        <option value="${p.getPublisherName()}">${p.getPublisherName()}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Description</label>
                        <textarea class="form-control" rows="4" cols="50" name="bookDes" required=""></textarea>
                    </div>
                    <div class="form-group mb-2">
                        <label style="font-weight: bolder">Genre</label>
                        <div class="d-flex flex-row flex-wrap justify-content-start me-2 ">
                            <c:forEach items="${genreList.keySet()}" var="bookGenre"
                                       varStatus="counter">
                                <div class="d-flex flex-row  justify-content-between p-2 mb-2 me-3"
                                     style="border: 1px solid gainsboro">
                                    <div class="d-flex align-items-center">
                                        <c:if test="${genreList.get(bookGenre)}">
                                            <div class="tag tag-checked genre-tag"
                                                 onclick="toggleCheckbox('genre${counter.count}')">
                                                    ${bookGenre}</div>
                                        </c:if>
                                        <c:if test="${not genreList.get(bookGenre)}">
                                            <div class="tag tag-notcheck genre-tag"
                                                 onclick="toggleCheckbox('genre${counter.count}')">
                                                    ${bookGenre}</div>
                                        </c:if>
                                    </div>
                                    <input class="ms-3" type="checkbox" name="genres" value="${bookGenre}"
                                           id="genre${counter.count}"
                                        <c:if test="${genreList.get(bookGenre)}">
                                            checked
                                        </c:if>
                                    />
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-success" value="Save">
                </div>
            </form>
        </div>
    </div>
</div>
<div id="addPublisherModal" class="modal" style="background: linear-gradient(rgba(246, 247, 249, 0.8), rgba(246, 247, 249, 0.8)),
            url('../img/bg-clouds.jpg') no-repeat center center fixed;
            background-size: cover;">
    <div class="modal-dialog" style="max-width: 35%;">
        <div class="modal-content" style="border-radius: 12px !important;">
            <form action="addPublisherAction" method="post">
                <div class="modal-header">
                    <h4 class="modal-title">Add new Publisher</h4>
                    <button style="border: none; background-color: transparent" type="button" class="close"
                            data-dismiss="modal" aria-hidden="true">
                        <i class="fa-solid fa-xmark"></i>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group mb-3 ">
                        <label style="font-weight: bolder">Publisher Name</label>
                        <input style="max-width: 320px" type="text" name="publisherName" class="form-control"
                               required="">
                    </div>
                    <div class="form-group">
                        <label style="font-weight: bolder">Website</label>
                        <input type="text" name="publisherWeb" class="form-control">
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-success" value="Save">
                </div>
            </form>
        </div>
    </div>
</div>
<div id="addGenreModal" class="modal" style="background: linear-gradient(rgba(246, 247, 249, 0.8), rgba(246, 247, 249, 0.8)),
            url('../img/bg-clouds.jpg') no-repeat center center fixed;
            background-size: cover;">
    <div class="modal-dialog" style="max-width: 35%;">
        <div class="modal-content" style="border-radius: 12px !important;">
            <form action="addGenreAction" method="post">
                <div class="modal-header">
                    <h4 class="modal-title">Add new Genre</h4>
                    <button style="border: none; background-color: transparent" type="button" class="close"
                            data-dismiss="modal" aria-hidden="true">
                        <i class="fa-solid fa-xmark"></i>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label style="font-weight: bolder">Genre Name</label>
                        <input style="max-width: 320px" type="text" name="genreName" class="form-control" required="">
                    </div>
                    <div class="form-group">
                        <label style="font-weight: bolder">Description</label>
                        <textarea class="form-control" rows="4" cols="50" name="genreDes"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-success" value="Save">
                </div>
            </form>
        </div>
    </div>
</div>
<div id="addAuthorModal" class="modal" style="background: linear-gradient(rgba(246, 247, 249, 0.8), rgba(246, 247, 249, 0.8)),
            url('../img/bg-clouds.jpg') no-repeat center center fixed;
            background-size: cover;">
    <div class="modal-dialog" style="max-width: 40%">
        <div class="modal-content" style="border-radius: 12px !important;">
            <form action="addAuthorAction" method="post">
                <div class="modal-header">
                    <h4 class="modal-title">Add new Author</h4>
                    <button style="border: none; background-color: transparent" type="button" class="close"
                            data-dismiss="modal" aria-hidden="true">
                        <i class="fa-solid fa-xmark"></i>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row mb-2">
                        <div class="form-group col-6">
                            <label style="font-weight: bolder">Alias Name</label>
                            <input type="text" name="authorAlias" class="form-control" required="">
                        </div>
                        <div class="form-group col-6">
                            <label style="font-weight: bolder">Real Name</label>
                            <input type="text" name="authorName" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label>BirthDate</label>
                        <input type="date" name="authorBirthdate" class="form-control" required="">
                    </div>
                    <div class="form-group mb-2">
                        <label style="font-weight: bolder">Website</label>
                        <input type="text" name="authorWeb" class="form-control">
                    </div>
                    <div class="form-group mb-2">
                        <label style="font-weight: bolder">Biography</label>
                        <textarea class="form-control" rows="4" cols="50" name="authorBio"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-success" value="Save">
                </div>
            </form>
        </div>
    </div>
</div>
<div class="container">
    <div class="d-flex flex-row justify-content-between mt-4 mb-4">
        <a data-target="#addBookModal" class="btn btn-danger" style="border-radius: 12px" data-toggle="modal"><i
            class="fa-solid fa-circle-plus"></i>
            <span>Add new book</span></a>
        <a data-target="#addPublisherModal" class="btn btn-danger" style="border-radius: 12px" data-toggle="modal"><i
            class="fa-solid fa-circle-plus"></i> <span>Add new publisher</span></a>
        <a data-target="#addAuthorModal" class="btn btn-danger" style="border-radius: 12px" data-toggle="modal"><i
            class="fa-solid fa-circle-plus"></i> <span>Add new author</span></a>
        <a data-target="#addGenreModal" class="btn btn-danger" style="border-radius: 12px" data-toggle="modal"><i
            class="fa-solid fa-circle-plus"></i> <span>Add new genre</span></a>
    </div>
    <c:if test="${not empty bookList}">
        <table id="example-table-admin" class="table table-hover order table-striped table-light table-borderless "
               style="background-color: rgba(153,50,204,0.2)">
            <thead>
            <tr>
                <th style="padding-left: 40px">No.</th>
                <th>ISBN</th>
                <th>Book Name</th>
                <th>Price</th>
                <th>Author</th>
                <th>Quantity</th>
                <th>Layout</th>
                <th>Publisher</th>
                <th>Image</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody class="border">
            <c:forEach var="book" items="${bookList}" varStatus="counter">
                <tr>
                    <td style="padding-left: 40px">${counter.count}</td>
                    <td>${book.getISBN()}</td>
                    <td>${book.getName()}</td>
                    <td><fmt:formatNumber value="${book.getPrice()}" type="currency"/></td>
                    <td>${book.getAuthors().get(0).getAliasName()}</td>
                    <td>${inventory.getQuantityByBookISBN(book.getISBN())}</td>
                    <td>${book.getBookLayout()}</td>
                    <td>${book.getPublisherName()}</td>
                    <td><img src="${book.getImageAddress()}" width="100%"
                             onerror="this.src='https://i.ibb.co/8sQwx76/images-q-tbn-ANd9-Gc-TE3ogc-Suv-DVe-N1iwin1a-Tlbrk2-QXSKYv-Vz7t-Sn0-LV9k7h2-L-FPu-Pndu-Ow-HIE8jc3-L.png'"
                             style="max-width:80px;max-height:80px;"/></td>
                    <td>
                        <a data-target="#updateBookModal${book.getISBN()}" data-toggle="modal"
                           class="delete btn"><i class="fa-solid fa-pen-to-square fa-xl"></i></a>
                    </td>
                </tr>
                <div id="updateBookModal${book.getISBN()}" class="modal" style="background: linear-gradient(rgba(246, 247, 249, 0.8), rgba(246, 247, 249, 0.8)),
            url('../img/bg-clouds.jpg') no-repeat center center fixed;
            background-size: cover;">
                    <div class="modal-dialog " style="max-width: 800px;">
                        <div class="modal-content ps-3 pe-3 " style="border-radius: 12px !important;">
                            <form action="updateBookAction" method="post">
                                <input type="hidden" value="${book.getPrice()}" name="updateBookPrice"/>
                                <input type="hidden" value="${book.getISBN()}" name="updateBookISBN"/>
                                <div class="modal-header">
                                    <h4 class="modal-title">Import Book</h4>
                                    <button style="border: none; background-color: transparent" type="button"
                                            class="close" data-dismiss="modal" aria-hidden="true">
                                        <i class="fa-solid fa-xmark"></i>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group mb-2">
                                        <div class="row">
                                            <div class="col-md-9">
                                                <label style="font-weight: bolder">Book Name</label>
                                                <input type="text" value="${book.getName()}"
                                                       name="updateBookName"
                                                       class="form-control" required="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group mb-2">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label style="font-weight: bolder">Translator</label>
                                                <input type="text" value="${book.getTranslator()}"
                                                       name="updateBookTranslator" class="form-control"
                                                       >
                                            </div>
                                            <div class="col-md-6 d-flex flex-column">
                                                <label style="font-weight: bolder">Author Alias</label>
                                                <select class="form-select" name="updateBookAuthorAlias">
                                                    <c:forEach var="a" items="${authorList}">
                                                        <option value="${a.getAliasName()}" <c:if
                                                            test="${book.getAuthors().get(0).getAliasName().equals(a.getAliasName())}">selected</c:if>>${a.getAliasName()}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group mb-2">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label style="font-weight: bolder">Image</label>
                                                <input type="text" value="${book.getImageAddress()}"
                                                       oninput="changeImg(this, ${counter.count})"
                                                       name="updateBookImage" class="form-control" required="">
                                            </div>
                                            <div class="col-md-6">
                                                <img id="img-book${counter.count}"
                                                     onerror="this.src='https://i.ibb.co/8sQwx76/images-q-tbn-ANd9-Gc-TE3ogc-Suv-DVe-N1iwin1a-Tlbrk2-QXSKYv-Vz7t-Sn0-LV9k7h2-L-FPu-Pndu-Ow-HIE8jc3-L.png'"
                                                     src="${book.getImageAddress()}"
                                                     style="max-width:100px;max-heigh:100px" width="100%">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group mb-2">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <label style="font-weight: bolder">Weight(pound)</label>
                                                <input type="number" value="${book.getWeight()}"
                                                       placeholder="x.xxx(pound)" name="updateBookWeight"
                                                       class="form-control" required="" min="0.001"
                                                       step="0.001">
                                            </div>
                                            <div class="col-md-3">
                                                <label style="font-weight: bolder">Size(cm x cm x cm)</label>
                                                <input type="text" value="${book.getSize()}" name="bookSize"
                                                       class="form-control" required=""
                                                       placeholder="length x width x heigth">
                                            </div>
                                            <div class="col-md-3">
                                                <label style="font-weight: bolder">Quantity</label>
                                                <input type="number"
                                                       value="${inventory.getQuantityByBookISBN(book.getISBN())}"
                                                       name="bookQuantity" class="form-control" required="">
                                            </div>
                                            <div class="col-md-3">
                                                <label style="font-weight: bolder">Number Of Pages</label>
                                                <input type="number" value="${book.getNumberOfPage()}"
                                                       name="bookPage" class="form-control" required="" min="1"
                                                       max="5000">
                                            </div>

                                        </div>
                                    </div>
                                    <div class="form-group mb-3">
                                        <div class="row">
                                            <div class="col-md-2 d-flex flex-column">
                                                <label style="font-weight: bolder" for="language">Language</label>
                                                <select class="form-select" name="bookLanguage" id="language">
                                                    <c:forEach var="l" items="${languageList}">
                                                        <option value="${l}">${l}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="col-md-3 d-flex flex-column">
                                                <label style="font-weight: bolder" for="layout">Layout</label>
                                                <select class="form-select" name="bookLayout" id="layout">
                                                    <c:forEach var="la" items="${layoutList}">
                                                        <option value="${la}">${la}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="col-md-3 d-flex flex-column">
                                                <label style="font-weight: bolder">Year Of Publish</label>
                                                <input type="number" value="${book.getYearOfPublishl()}"
                                                       name="bookYearOfPublish" class="form-control" required=""
                                                       step="1" min="1900" max="2022">
                                            </div>
                                            <div class="col-md-4 d-flex flex-column">
                                                <label style="font-weight: bolder">Publisher</label>
                                                <select class="form-select" name="bookPublisher" id="available-publisher">
                                                    <c:forEach var="p" items="${publisherList}">
                                                        <option value="${p.getPublisherName()}" <c:if
                                                            test="${book.getPublisherName().equals(p.getPublisherName())}">selected</c:if>>${p.getPublisherName()}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group mb-2">
                                        <label style="font-weight: bolder">Description</label>
                                        <textarea class="form-control" rows="4" cols="50"
                                                  name="updateBookDes">${book.getDescription()}</textarea>
                                    </div>
                                    <div class="form-group mb-2">
                                        <label style="font-weight: bolder">Genre</label>
                                        <div class="d-flex flex-row flex-wrap justify-content-start me-2 ">
                                            <c:forEach items="${genreList.keySet()}" var="bookGenre"
                                                       varStatus="counter">
                                                <div class="d-flex flex-row  justify-content-between p-2 mb-2 me-3"
                                                style="border: 1px solid gainsboro">
                                                    <div class="d-flex align-items-center">
                                                        <c:if test="${genreList.get(bookGenre)}">
                                                            <div class="tag tag-checked genre-tag"
                                                                 onclick="toggleCheckbox('genre${counter.count}')">
                                                                    ${bookGenre}</div>
                                                        </c:if>
                                                        <c:if test="${not genreList.get(bookGenre)}">
                                                            <div class="tag tag-notcheck genre-tag"
                                                                 onclick="toggleCheckbox('genre${counter.count}')">
                                                                    ${bookGenre}</div>
                                                        </c:if>
                                                    </div>

                                                    <input class="ms-3"  type="checkbox" name="updateGenres"
                                                           value="${bookGenre}" id="genre${counter.count}"
                                                        <c:forEach items="${book.getGenres()}" var="bookGenres">
                                                            <c:if
                                                                test="${bookGenre.equals(bookGenres.getName())}">
                                                                checked
                                                            </c:if>
                                                        </c:forEach>
                                                    />
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <input type="button" class="btn btn-default" data-dismiss="modal"
                                           value="Cancel">
                                    <input type="submit" class="btn btn-success" value="Save">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
    <div class="d-flex justify-content-center mt-2">
        <ul class="pagination" >
            <c:forEach begin="1" end="${endPage}" var="i" varStatus="counter">
                <li class="page-item">
                    <a  style="min-height: 50px !important; min-width: 50px" class="d-flex justify-content-center align-items-center page-link" href="InventoryBookAction?index=${i}&txtsearch=${txtsearch}">${i}</a>
                </li>
            </c:forEach>
        </ul>

    </div>
</div>
<!-- banner start here -->

<jsp:include page="../include/include_footer.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>
    function toggleCheckbox(id) {
        //alert(id);
        var checkBox = document.getElementById(id);
        checkBox.checked = !checkBox.checked;
        document.getElementById("searchForm").submit();
    }

    function changeImg(e, c) {
        console.log("cccc");
        var tmp = e.value;
        var i = document.getElementById("img-book" + c);
        console.log(i);
        console.log(tmp);
        i.src = tmp;
        //                 i.style.display="none";
        console.log(i);
    }

    function changeImgInsert(e) {
        console.log("cccc");
        var tmp = e.value;
        var i = document.getElementById("img-book-insert");
        console.log(i);
        console.log(tmp);
        i.src = tmp;
        i.style.display = "block";
        console.log(i);
    }

    <c:if test="${not empty MESSEGE}">
    $(document).ready(function () {
        alert("${MESSEGE}");
    });
    </c:if>

</script>
</body>

</html>
