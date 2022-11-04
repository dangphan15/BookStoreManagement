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
        </style>
        <jsp:include page="include/include_header.jsp"></jsp:include>
        </head>
        <body>
        <c:set var="blog" value="${requestScope.BLOG}" />
        <%@include file="header.jsp" %>
        <div class="container p-3 mt-4 rounded" style="background-color: whitesmoke">
            <h1 class="blog-title">${blog.title}</h1>
            <div class="blog-meta">
                <p>Author: ${blog.authorFullname}</p>
                <p>Published: <fmt:formatDate type = "both" value="${blog.postedTime}" /></p>
            </div>
            <hr>
            <div class="blog-content">
                ${blog.content}
            </div>
            <c:if test="${not empty sessionScope.USER}">
                <div>
                    <c:if test="${blog.status == 'pending'}">
                        <form action="admin/approveBlogAction" method="POST">
                            <input class="btn btn-primary" type="submit" value="Approve" />
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
                <div>
                    <p>More:</p>
                    <ul>
                        <c:forEach var="dto" items="${requestScope.OTHER_BLOGS}">
                            <li><a href="viewBlogAction?id=${dto.id}">${dto.title}</a></li>
                            </c:forEach>
                    </ul>
                </div>
            </c:if>
        </div>
        <%@include file="footer.html" %>
    </body>
</html>
