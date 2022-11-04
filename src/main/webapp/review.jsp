<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Review Page</title>
        <jsp:include page="include/include_header.jsp"></jsp:include>
            <style>
                h1 {
                    text-align: center;
                    margin-top: 30px;
                    text-transform: uppercase;
                    font-weight: bold;
                    font-size: 150%;
                }
                .form-container {
                    display: inline-block;
                    width: 500px;
                    margin-left: 50%;
                    border: solid 1px black;
                    transform: translateX(-50%);
                    padding: 20px;
                    margin-top: 20px;
                    border-radius: 10px;
                    margin-bottom: 80px;
                }
                .label {
                    font-size: 110%;
                    font-weight: bold;
                }
                .paybtn {
                    margin-left: 50%;
                     transform: translateX(-50%);
                     background-color : #005a95;
                     color:white;
                     padding: 5px;
                     border: solid 1px #005a95;
                     border-radius: 5px;
                     width: 150px;
                }
            </style>
        </head>
        <body>
        <%@include file="header.jsp" %>
        <h1>Review before paying</h1>
        <div class="form-container">
            <form action="executePayment" method="POST">
                <input type="hidden" name="paymentId" value="${param.paymentId}" />
                <input type="hidden" name="PayerID" value="${param.PayerID}" />

                <div class="row mb-3">
                    <div class="col-md-5">
                        <span class="label">Receiver name: </span>
                    </div>
                    <div class="col-md-7">
                        <span>${sessionScope.PAYPAL_ORDER.receiverName}</span>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-md-5">
                        <span class="label">Address: </span>
                    </div>
                    <div class="col-md-7">
                        <span>${sessionScope.PAYPAL_ORDER.address}</span>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-md-5">
                        <span class="label">Phone: </span>
                    </div>
                    <div class="col-md-7">
                        <span>${sessionScope.PAYPAL_ORDER.phone}</span>
                    </div>
                </div>    
                <div class="row mb-3">
                    <div class="col-md-5">
                        <span class="label">Total: </span>
                    </div>
                    <div class="col-md-7">
                        <span>${TRANSACTION.amount.total} VND</span>
                    </div>
                </div>    
                <div class="row mb-3">
                    <div class="col-md-5">
                        <span class="label">Payer: </span>
                    </div>
                    <div class="col-md-7">
                        <span>${requestScope.PAYER.firstName} ${requestScope.PAYER.lastName}</span>
                    </div>
                </div>    

                    <input class="paybtn" type="submit" value="Pay now" />
            </form>
        </div>
        <%@include file="footer.html" %>
        <jsp:include page="include/include_footer.jsp"></jsp:include>
    </body>
</html>
