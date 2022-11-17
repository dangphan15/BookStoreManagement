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
        min-height: 97vh;
        background-color: white;
        padding-right: 5px;
       
    }
    .order-container table {
        border-top: solid 3px;
        
    }
    .navigation {
        height: 60px;
        /*margin-bottom: 20px;*/
        margin-left: 0px;
        /*border-bottom: 1px solid gainsboro;*/
        background: transparent ;
    }
    .dataTables_length{
        display: none;
    }
    .dataTables_filter {
        display: none;
    }
    .dataTables_info {
        display: none;
    }
    .navigation .dropdown a {
        font-size: 100%;
    }
    body {
        overflow-x: hidden;
    }
    .order-container{
        /*background: linear-gradient(rgba(246, 247, 249, 0.5), rgba(241, 117, 151, 0.4)),*/
        /*url(../img/background_admin.jpg)*/
        /*no-repeat center center fixed;*/
        /*background-size: cover;*/
        background: linear-gradient(rgba(246, 247, 249, 0.8), rgba(246, 247, 249, 0.8)),
        url(https://res.cloudinary.com/dxfq3iotg/image/upload/v1564049481/bg-clouds.jpg)
        no-repeat center center fixed;
        background-size: cover;
    }
</style>
<!--<header>
    <div class="row">
        <div class="col-md-10">
            <h1 class="header-title">Mangasa orders management system</h1>
        </div>
    </div>
</header>-->