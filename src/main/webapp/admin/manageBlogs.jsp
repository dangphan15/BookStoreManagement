<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage blogs</title>
        <jsp:include page="../include/include_header.jsp"/>
        <style>
            #blog-title {
                min-width: 400px;
                max-width: 400px;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
            }
            #form-select-blog{
                max-width: 25%;
            }
            #form-select-blog .form-select{
                border-radius: 12px;
            }
            #form-select-blog .btn-danger{
                border-radius: 12px;
            }
        </style>
    </head>
    <body>
    <jsp:include page="header.jsp"/>
    <div class="container-fluid" >
        <div class="row flex-nowrap" >
            <div class="col-auto px-0">
                <jsp:include page="order-state-nav.html"/>
            </div>
            <div class="col p-0" >
                <div class="order-container" >
                    <div class="navigation row d-flex">

                        <a id="sidebar-button" style="color: snow; background-color: transparent!important; max-width: fit-content" href="#" data-bs-target="#sidebar" data-bs-toggle="collapse"
                           class="col" onclick="flipAngleButton()">
                            <i class="fa-regular fa-angle-right fa-2xl" style="transition: transform 0.5s"></i>
                        </a>
                        <div class="dropdown col me-3" style="text-align: right; ">
                            <button class="btn btn-staff  dropdown-toggle mt-1" type="button" id="dropdownMenuButton"
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                ${sessionScope.USER.fullName}
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">

                                <li><a class="dropdown-item" href="../userInformation">Edit profile</a></li>
                                <li><a class="dropdown-item" href="../logoutAction">Logout</a></li>
                            </ul>
                        </div>


                    </div>

                    <div class="container" >

                        <nav class="mb-3" aria-label="breadcrumb" style="border-bottom: 1px solid whitesmoke !important;">
                            <ol class="breadcrumb" style=" margin-bottom: 8px ">
                                <li class="breadcrumb-item active" aria-current="page">
                                    <a style="color:#02027d!important; font-weight: bolder; font-size: 18px !important;" href="viewBlogsAction">Manage blog</a>
                                </li>
                            </ol>
                        </nav>
                        <c:set var="blogs" value="${requestScope.BLOGS}"/>
                        <div id="form-select-blog">
                            <form class="d-flex" action="filterBlogsAction" method="POST">
                                <select class="form-select me-2 " name="status">
                                    <option class="form-select-status-blog" value="pending"
                                        <c:if test="${blogs[0].status == 'pending'}">
                                            selected="true"
                                        </c:if>
                                    >Pending</option>
                                    <option value="approved"
                                        <c:if test="${blogs[0].status == 'approved'}">
                                            selected="true"
                                        </c:if>
                                    >Approved</option>
                                </select>
                                <input class="btn btn-danger" type="submit" value="Search" />
                            </form>
                        </div>
                        <c:if test="${empty blogs}">
                            <div class="container text-center d-flex flex-column justify-content-center align-items-center mt-4 p-4 "
                                 style="background: #FFFFFF; min-height: 400px; border-radius: 20px; vertical-align: center">
                                <i class="fa-solid fa-file-xmark fa-10x"></i>
                                <h2 class="m-4">There are no blogs !!!</h2>
                            </div>

                        </c:if>
                        <c:if test="${not empty blogs}">
                            <table id="example-table-admin" class="table table-hover table-striped table-light table-borderless " style="background-color: rgba(153,50,204,0.2)">
                                <thead>
                                <tr>
                                    <th>No.</th>
                                    <th style="max-width: 80px; padding-left: 10px!important; padding-right: 10px!important;">ID</th>
                                    <th>ISBN</th>
                                    <th>Author</th>
                                    <th>Title</th>
                                    <th>Posted time</th>
                                    
                                    
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody class="border">
                                <c:forEach var="blog" items="${blogs}" varStatus="counter">
                                    <tr>
                                        <td>${counter.count}.</td>
                                        <td style="max-width: 80px; padding-left: 10px!important; padding-right: 10px!important;">${blog.id}</td>
                                        <td>${blog.ISBN}</td>
                                        <td>${blog.author}</td>
                                        <td id="blog-title"><a href="../viewBlogAction?id=${blog.id}">${blog.title}</a></td>
                                        <td><fmt:formatDate type = "both" value="${blog.postedTime}" /></td>
                                        <td>
                                            <c:if test="${blog.status != 'approved'}">
                                                <a class="btn btn-success mb-2" style="min-width: 88px" href="approveBlogAction?id=${blog.id}&status=${blog.status}">Approve</a>
                                            </c:if>
                                            <c:if test="${blog.status != 'deleted'}">
                                                <a class="btn btn-danger" style="min-width: 88px" href="deleteBlogAction?id=${blog.id}&status=${blog.status}">Delete</a>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../include/include_footer.jsp"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap5.min.js"></script>
    <script>
        $(document).ready(function () {
            //alert("cc");
            $('#example-table-admin').DataTable();
        });

        function flipAngleButton() {
            var isSidebarShown = $('#sidebar').hasClass('shown');
            console.log(isSidebarShown);
            if (isSidebarShown) {
                $('#sidebar-button i').css('transform', 'scaleX(-1)');
                $('#sidebar').addClass('unshown');
                $('#sidebar').removeClass('shown');
            } else {
                $('#sidebar-button i').css('transform', 'scaleX(1)');
                $('#sidebar').addClass('shown');
                $('#sidebar').removeClass('unshown');
            }
        }
    </script>

    </body>
</html>
