<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Create blog</title>
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
    <script src="https://cdn.tiny.cloud/1/5onf13sa72tvdb8w9qeljoq79e8kcqrgmyl8440q3v44nd6p/tinymce/6/tinymce.min.js"
            referrerpolicy="origin"></script>
    <jsp:include page="include/include_header.jsp"></jsp:include>
</head>
<body>
<%@include file="header.jsp" %>
<div class="container p-3 mt-4 rounded" style="background-color: whitesmoke">
    <div>
        <h2>Book: ${param.bookName}</h2>
    </div>
    <form action="createBlogAction" method="post">
        <div class="d-flex">
            <div>
                <div class="my-2">
                            <span style="font-size: large; font-weight: bold;">
                                Blog title:
                            </span> <input class="p-2"
                                           style="border-radius: 12px; border: 1px solid gainsboro; min-width: 500px;"
                                           id="title" type="text" name="title" value="${param.title}"/>
                </div>
                <div class="my-2">
                            <span style="font-size: large; font-weight: bold;">
                                Thumbnail: 
                            </span> <input class="p-2"
                                           style="border-radius: 12px; border: 1px solid gainsboro; min-width: 500px;"
                                           id="thumbnail" type="text" name="thumbnail" value="${param.thumbnail}"/>
                </div>
            </div>
            <div class="mx-3" id="thumbnail-section">
                <c:if test="${not empty param.thumbnail}">
                    <img height="90px" src="${param.thumbnail}" alt="thumbnail-image"/>
                </c:if>
            </div>
        </div>
        <div class="my-2">
            <label>
                        <span style="font-size: large; font-weight: bold;">
                            Content:
                        </span>
                <textarea id="content" class="richtextarea" name="content"
                          placeholder="Write something...">${param.content}</textarea>
            </label>
        </div>
        <input type="hidden" name="ISBN" value="${param.ISBN}"/>
        <input type="hidden" name="bookName" value="${param.bookName}"/>
        <button form="" class="btn btn-secondary" onclick="previewBlog()">Preview</button>
        <input class="btn btn-primary" type="submit">
    </form>
    <c:if test="${not empty requestScope.ERROR}">
        <p style="color: red;">${requestScope.ERROR}</p>
    </c:if>
    <div class="mt-4" id="preview-blog"></div>
</div>

<%@include file="footer.html" %>
</body>
<script>
    function previewBlog() {
        const title = document.getElementById('title').value;
        const thumbnail = document.getElementById('thumbnail').value;
        const content = tinymce.get('content').getContent();
        const previewElem = document.getElementById('preview-blog');
        const today = new Date();
        const date = today.getDate() + '-' + (today.getMonth() + 1) + '-' + today.getFullYear();
        const time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
        const dateTime = time + ' ' + date;
        previewElem.innerHTML = '<hr>';
        previewElem.innerHTML += `<h1 class="blog-title">` + title + `</h1>`;
        previewElem.innerHTML += `<div class="blog-meta">
                <p>Author: ${sessionScope.USER.fullName}</p>
                <p>Published: ` + dateTime + `</p>
            </div><hr>`;
        previewElem.innerHTML += `<div><img width="100%" src="` + thumbnail + `" alt="blog-thumbnail"></div>`;
        previewElem.innerHTML += `<div class="blog-content">` + content + `</div>`;
    }

    tinymce.init({
        selector: '.richtextarea',
        plugins: 'anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount checklist mediaembed casechange export formatpainter pageembed linkchecker a11ychecker tinymcespellchecker permanentpen powerpaste advtable advcode editimage tableofcontents footnotes mergetags autocorrect',
        toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | align lineheight | link image media table | checklist numlist bullist indent outdent | emoticons charmap | removeformat'
    });
    const thumbnailInput = document.getElementById('thumbnail');
    thumbnailInput.addEventListener('change', e => {
        const thumbnailUrl = e.target.value;
        document.getElementById('thumbnail-section').innerHTML = '<img height="90px" src="' + thumbnailUrl + '" alt="thumbnail-image">'
    });
</script>
</html>
