<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View blog</title>
        <style>
            .blog-title {
                font-size: 3em;
            }
            .blog-meta {
                font-size: 13px;
                color: #828282;
            }
            .blog-content {
                min-height: 35vh;
            }
        </style>
        <jsp:include page="include/include_header.jsp"></jsp:include>
        </head>
        <body>
        <c:set var="blog" value="${requestScope.BLOG}" />
        <%@include file="header.jsp" %>
        <div class="container p-5 mt-4 rounded" style="background-color: whitesmoke;">
            <h1 class="blog-title">${blog.title}</h1>
            <div class="blog-meta">
                <p>Author: ${blog.authorFullname}</p>
                <p>Published: <fmt:formatDate type = "both" value="${blog.postedTime}" /></p>
            </div>
            <hr>
            <c:if test="${not empty blog.thumbnail}">
                <div class="d-flex" style="max-height: 500px">
                    <img width="100%" style="object-fit: cover" src="${blog.thumbnail}" alt="blog-thumbnail">
                </div>
            </c:if>
            <div class="blog-content">
                ${blog.content}
            </div>
            <c:if test="${sessionScope.USER.roleId == 2}">
                <div class="d-flex flex-row">
                    <c:if test="${blog.status == 'pending'}">
                        <form action="admin/approveBlogAction" method="POST">
                            <input class="btn btn-primary me-3" type="submit" value="Approve" />
                            <input type="hidden" name="id" value="${blog.id}" />
                        </form>
                    </c:if>
                    <c:if test="${blog.status != 'deleted'}">
                        <form action="admin/deleteBlogAction" method="POST">
                            <input class="btn btn-danger" type="submit" value="Delete" />
                            <input type="hidden" name="id" value="${blog.id}" />
                        </form>
                    </c:if>
                </div>
            </c:if>
            <c:if test="${not empty requestScope.OTHER_BLOGS}">
                <div class="mt-3">
                    <strong style="font-size: 18px">More blogs:</strong>
                    <ul>
                        <c:forEach var="dto" items="${requestScope.OTHER_BLOGS}">
                            <li class="d-flex mt-2 flex-row justify-content-start list-unstyled">
                                <div class="me-3">
                                    <img width="100%"
                                         style="width: 80px;height: 80px; object-fit: cover;"
                                         src="${dto.thumbnail}">
                                </div>
                                <div>
                                    <p style="display: -webkit-box; -webkit-box-orient: vertical;-webkit-line-clamp: 2; overflow: hidden; text-align: justify; ; margin-bottom: 6px">
                                        <a href="viewBlogAction?id=${dto.id}"
                                           style="color: black; text-decoration: none; font-family: 'Josefin Sans',sans-serif ; font-weight: bolder">${dto.title}</a>
                                    </p>
                                    <span style="text-align: start;margin-bottom: 0px; font-size: 14px">
                                                       <fmt:formatDate type="date" value="${dto.postedTime}"/>
                                        </span>
                                </div>
                            </li>
<%--                            <li><a href="viewBlogAction?id=${dto.id}">${dto.title}</a></li>--%>
                        </c:forEach>
                    </ul>
                </div>
            </c:if>
        </div>
        <%@include file="footer.html" %>
    </body>
</html>
