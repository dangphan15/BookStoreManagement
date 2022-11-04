<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manga bookstore</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
        <%--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        --%>
        <%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">--%>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.css" rel="stylesheet"
              crossorigin="anonymous">
        <%--<script src="https://kit.fontawesome.com/2ee129af2d.js" crossorigin="anonymous">
            </script>--%>
        <%--<link href="https://cdn.staticaly.com/gh/hung1001/font-awesome-pro/4cac1a6/css/all.css"
            rel="stylesheet" type="text/css" />--%>
        <link href="https://cdn.staticaly.com/gh/hung1001/font-awesome-pro-v6/44659d9/css/all.min.css"
              rel="stylesheet" type="text/css" />

        <link
            href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">
        <fmt:setLocale value="vi_VN"/>
        <style>
            table {
                width: 90%;
                text-align: center;
                border: 1px solid #fff;
                border-spacing: 1px;
                font-family: 'Cairo', sans-serif;
                margin: auto;
            }

            table td {
                padding: 10px;
                background-color: #eee;
            }

            table th {
                background-color: #333;
                color: #fff;
                padding: 10px;
            }
            .fade:not(.show){opacity: 1;}
        </style>
    </head>
    <body>

        <!-- import header -->
        <jsp:useBean id="inventory" class="com.swp391.group3.inventory.InventoryDAO" scope="request"/>
        <div class="shop__sidebar__search" style="width:30%;margin: 50px auto;">
                            <form action="InventoryBookAction" method="post">
                                <input type="text" placeholder="Search Books..." name="txtsearch">
                                <input type="submit" value="Search" name="action">
                            </form>
                        </div>

        <div class="mb-4" style="display:flex; align-items: center; justify-content: center;">
            <a data-target="#addBookModal" class="btn btn-secondary" data-toggle="modal"><i class="fa-solid fa-circle-plus"></i> <span>Add new book</span></a>                                                        
        </div>
        <div id="addBookModal" class="modal">
            <div class="modal-dialog" style="max-width: 600px;">
                <div class="modal-content">
                    <form action="addBookAction" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add new Book</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">	
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>ISBN</label>
                                        <input type="text" name="bookISBN" class="form-control" required="">
                                    </div>
                                    <div class="col-md-6">
                                        <label>Book Name</label>
                                        <input type="text" name="bookName" class="form-control" required="">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6">                                  
                                        <label>Translator</label>
                                        <input type="text" name="bookTranslator" class="form-control" required="">
                                    </div>
                                    <div class="col-md-6">                                   
                                        <label>Author Alias</label>
                                        <input type="text" name="bookAuthorAlias" class="form-control" required="">
                                    </div>
                                </div>                               
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Price</label>
                                        <input type="number" name="bookPrice" class="form-control" required="">  
                                    </div>
                                    <div class="col-md-6">
                                        <label>Image</label>
                                        <input type="file" name="bookImage" class="form-control" required="">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-4">                                  
                                        <label>Weight</label>
                                        <input type="number" name="bookWeight" class="form-control" required="">
                                    </div>
                                    <div class="col-md-4">                                 
                                        <label>Size</label>
                                        <input type="text" name="bookSize" class="form-control" required="">
                                    </div>
                                    <div class="col-md-4">                                 
                                        <label>Quantity</label>
                                        <input type="number" name="bookQuantity" class="form-control" required="">
                                    </div>
                                </div>
                            </div>                        
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Number Of Pages</label>
                                        <input type="number" name="bookPage" class="form-control" required="">
                                    </div>
                                    <div class="col-md-6" style="display: flex;">
                                        <div>
                                            <label for="language">Language</label>
                                            <select name="bookLanguage" id="language">
                                                <option value="English">English</option>
                                                <option value="Japanese">Japanese</option>
                                            </select>     
                                        </div>
                                        <div>
                                            <label for="layout">Layout</label>
                                            <select name="bookLayout" id="layout">
                                                <option value="Paperback">Paperback</option>
                                                <option value="Hardover">Hardover</option>
                                            </select> 
                                        </div>
                                    </div>  
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6">                                  
                                        <label>Year Of Publish</label>
                                        <input type="text" name="bookYearOfPublish" class="form-control" required="">
                                    </div>
                                    <div class="col-md-6">                                 
                                        <label>Publisher</label>
                                        <input type="text" name="bookPublisher" class="form-control" required="">
                                    </div>
                                </div>                               
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea class="form-control" rows="4" cols="50" name="bookDes"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Genre</label>
                                <div>
                                    <c:forEach items="${genreList.keySet()}" var="bookGenre"
                                               varStatus="counter">
                                        <div>
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

                                            <input type="checkbox" name="genres" value="${bookGenre}" id="genre${counter.count}"
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

        <!-- banner start here -->
        <table class="order mb-4">
            <tr>
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
            <c:if test="${not empty bookList}">
                <c:forEach var="book" items="${bookList}">
                    <tr>
                        <td>${book.getISBN()}</td>                     
                        <td>${book.getName()}</td>
                        <td>${book.getPrice()}</td>
                        <td>${book.getAuthors().get(0).getAliasName()}</td>
                        <td>${inventory.getQuantityByBookISBN(book.getISBN())}</td>
                        <td>${book.getBookLayout()}</td>
                        <td>${book.getPublisherName()}</td>
                        <td><img src="${book.getImageAddress()}" style="width:100px;height:100px;"/></td>
                        <td>
                            <a data-target="#updateBookModal${book.getISBN()}" data-toggle="modal" class="delete btn" ><i class="fa-solid fa-gear fa-lg" style="color:blue;"></i></a>
                            <a data-target="#deleteBookModal${book.getISBN()}" data-toggle="modal" class="delete btn"><i class="fa-solid fa-circle-xmark fa-lg" style="color:red;"></i></a>
                        </td>
                    </tr>
                    <div id="deleteBookModal${book.getISBN()}" class="modal">
                        <div class="modal-dialog" style="padding-top:200px;">
                            <div class="modal-content">
                                <form action="deleteBookAction" method="post">
                                    <input type="hidden" value="${book.getISBN()}" name="pId"/>   
                                    <div class="modal-header">						
                                        <h4 class="modal-title">Delete Book</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    </div>
                                    <div class="modal-body">					
                                        <p>Do you want to delete this book?</p>
                                    </div>
                                    <div class="modal-footer">
                                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                        <input type="submit" class="btn btn-danger" value="Delete">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div id="updateBookModal${book.getISBN()}" class="modal">
                        <div class="modal-dialog" style="padding-top:0px;">
                            <div class="modal-content">
                                <form action="updateBookAction" method="post">
                                    <input type="hidden" value="${book.getISBN()}" name="bookISBN"/> 
                                    <div class="modal-header">						
                                        <h4 class="modal-title">Import Book</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    </div>
                                    <div class="modal-body">					
                                        <div class="form-group">
                                            <label>Book Name</label>
                                            <input type="text" value="${book.getName()}" name="bookName" disabled="" class="form-control" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Author</label>
                                            <input type="text" value="${book.getAuthors().get(0).getAliasName()}" name="bookAuthor" disabled="" class="form-control" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Publisher</label>
                                            <input type="text" value="${book.getPublisherName()}" name="bookPublisher" class="form-control" required="">
                                        </div>
                                        <div class="form-group">
                                            <div>
                                                <label>Import Price</label>
                                                <input type="text" value="${book.getPrice()}" name="bookPrice" class="form-control">
                                            </div>
                                            <div>
                                                <label>Import Date</label>
                                                <input type="date" name="import_date" value="${currentDate}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>Quantity</label>
                                            <input type="number" value="${inventory.getQuantityByBookISBN(book.getISBN())}" name="bookQuantity" class="form-control" required="">
                                        </div>                                       
                                        <p>Do you want to update this book?</p>
                                    </div>                                    
                                    <div class="modal-footer">
                                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                        <input type="submit" class="btn btn-success" value="Save">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>    
        </table>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script>
                                                         function toggleCheckbox(id) {
                                                             //alert(id);
                                                             var checkBox = document.getElementById(id);
                                                             checkBox.checked = !checkBox.checked;
                                                             document.getElementById("searchForm").submit();
                                                         }
        </script>
    </body>

</html>
