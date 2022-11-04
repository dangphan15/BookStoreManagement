<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create blog</title>
        <script src="https://cdn.tiny.cloud/1/tirlhxru7zyr9q6ij0zsqm8vz37zxwwz19vj9cv5shnp010e/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
        <jsp:include page="include/include_header.jsp"></jsp:include>
        </head>
        <body>
        <%@include file="header.jsp" %>
        <div class="container p-3 mt-4 rounded" style="background-color: whitesmoke">
            <form action="createBlogAction" method="post">
                <div>
                    <label>
                        <span style="font-size: large; font-weight: bold;">
                            Title:
                        </span> <input type="text" name="title" value="" />
                    </label>
                </div>
                <div>
                    <label>
                        <span style="font-size: large; font-weight: bold;">
                            Content:
                        </span> <textarea class="richtextarea" name="content" placeholder="Write something..."></textarea>
                    </label>
                </div>
                <input type="hidden" name="ISBN" value="${param.ISBN}" />
                <input class="btn btn-primary" type="submit">
            </form>
        </div>
        <%@include file="footer.html" %>
    </body>
    <script>
        tinymce.init({
            selector: '.richtextarea',
            plugins: 'anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount checklist mediaembed casechange export formatpainter pageembed linkchecker a11ychecker tinymcespellchecker permanentpen powerpaste advtable advcode editimage tableofcontents footnotes mergetags autocorrect',
            toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | align lineheight | link image media table | checklist numlist bullist indent outdent | emoticons charmap | removeformat'
        });
    </script>
</html>
