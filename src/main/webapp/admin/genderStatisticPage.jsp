<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Gender Statistics</h1>

        <form>
            <h5>From</h5>     <input type="date" name="txtFromDate" value="">
            <input type="submit" value="Filter" />
        </form>
        <c:if test="${not empty dateList}">
            <c:forEach var="d" items="${dateList}">                   
                <div>${d}</div>
                <div><p>Male:${amountOfMaleList[dateList.indexOf(d)]}</p></div>
                <div><p>Female:${amountOfFemaleList[dateList.indexOf(d)]}</p></div>
                <div><p>Other:${amountOfOtherList[dateList.indexOf(d)]}</p></div>
                <br>
            </c:forEach>
        </c:if>
    </body>
</html>
