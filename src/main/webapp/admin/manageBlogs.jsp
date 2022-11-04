<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage blogs</title>
        <style>
            #blog-title {
                min-width: 400px;
                max-width: 400px;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
            }
        </style>
    </head>
    <body>
        <c:set var="blogs" value="${requestScope.BLOGS}"/>
        <div>
            <form action="filterBlogsAction" method="POST">
                <select name="status">
                    <option value="pending"
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
                <input type="submit" value="Search" />
            </form>
        </div>
        <c:if test="${empty blogs}">
            <p>No blogs!</p>
        </c:if>
        <c:if test="${not empty blogs}">
            <table border="1">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>ID</th>
                        <th>ISBN</th>
                        <th>Author</th>
                        <th>Title</th>
                        <th>Posted time</th>
                        <th>Status</th>
                            <c:if test="${not empty blogs[0].staff}">
                            <th>Staff</th>
                            </c:if>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="blog" items="${blogs}" varStatus="counter">
                        <tr>
                            <td>${counter.count}.</td>
                            <td>${blog.id}</td>
                            <td>${blog.ISBN}</td>
                            <td>${blog.author}</td>
                            <td id="blog-title"><a href="../viewBlogAction?id=${blog.id}">${blog.title}</a></td>
                            <td><fmt:formatDate type = "both" value="${blog.postedTime}" /></td>
                            <td>${blog.status}</td>
                            <c:if test="${not empty blog.staff}">
                                <td>${blog.staff}</td>
                            </c:if>
                            <td>
                                <c:if test="${blog.status != 'approved'}">
                                    <a href="approveBlogAction?id=${blog.id}&status=${blog.status}">Approve</a>
                                </c:if>
                                <c:if test="${blog.status != 'deleted'}">
                                    <a href="deleteBlogAction?id=${blog.id}&status=${blog.status}">Delete</a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </body>
</html>
