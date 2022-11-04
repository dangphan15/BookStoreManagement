<%-- 
    Document   : header.jsp
    Created on : Oct 28, 2022, 12:45:17 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
    .header-title {
        text-align: center;
        margin-top: 20px;
        color: #4B6587;
    }
    header {
        position: relative;
        color: black;
        height: 12vh;
        background-color: white;
        z-index: 100;
        box-shadow: 0px 1px 4px 0px rgba(0,0,0,0.3);
    }
    .order-container {
        height: 97vh;
        background-color: white;
        padding-right: 5px;
        overflow-y: scroll;
        overflow-x: hidden;
    }
    .order-container table {
        border-top: solid 3px;
        
    }
    .navigation {
        height: 50px;
        margin-bottom: 20px;
    }
    .navigation a{
        color: #548CA8;
        text-decoration: none;
        font-size: 170%;
    }
    .navigation .dropdown a {
        font-size: 100%;
    }
    body {
        overflow-x: hidden;
    }
</style>
<!--<header>
    <div class="row">
        <div class="col-md-10">
            <h1 class="header-title">Mangasa orders management system</h1>
        </div>
    </div>
</header>-->