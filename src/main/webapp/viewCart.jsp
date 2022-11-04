<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN"/>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Book Store</title>
    <!--temp style-->
    <style>
        .img-product {
            height: 50px;
        }
        .form-control{
            border-radius: 12px !important;
        }
    </style>
    <jsp:include page="include/include_header.jsp"></jsp:include>
</head>

<body style="background: linear-gradient(0deg, rgba(255, 244, 247, 0.4) 0%,
              rgba(255, 244, 247, 0.4) 100%,
              rgba(255, 244, 247, 0.4) 100%),
              url('img/background_cartpage.jpg');
              background-repeat: no-repeat;
              background-size: cover;
              background-attachment: fixed;">
<jsp:include page="header.jsp"></jsp:include>
<%-- <a href="./">Homepage</a>--%>
<c:set var="items" value="${sessionScope.CART.items}"/>
<c:if test="${not empty items}">

    <div class="row m-5" style="margin-bottom: 225px !important;">
        <div class="col-7">
            <div class="card p-4" style="border-radius: 10px; background: rgba(255,255,255,0.9)">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>No.</th>
                        <th>Book image</th>
                        <th>Book name</th>
                        <th>Quantity</th>
                        <th style="padding-left: 15px">Price</th>
                        <th>Delete</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:set var="totalPrice" value="0"/>
                    <c:forEach items="${items.keySet()}" var="book" varStatus="counter">

                        <c:url var="viewBookDetail" value="viewBookDetailController">
                            <c:param name="ISBN" value="${book.ISBN}"></c:param>
                        </c:url>
                        <tr id="${book.ISBN}">
                            <td>
                                    ${counter.count}.
                            </td>
                            <td>
                                <a href="${viewBookDetail}"><img class="img-product"
                                                                 src="${book.imageAddress}"/></a>
                            </td>
                            <td>
                                <a href="${viewBookDetail}"
                                   class="text-decoration-none text-black">${book.name}</a>
                            </td>
                            <td style="min-width: 100px;">
                                <div class="d-flex justify-content-between align-items-center"
                                     style="border-radius: 15px; border-color: rgba(0,0,0,0.8); border: 1px solid gainsboro  ">
                                    <a href="#" onclick="changeQuantity(this, -1);return false;"
                                       class="text-decoration-none p-2 text-black"
                                       style="font-weight: bold; font-size: 15px">-</a>
                                    <span class="item-quantity">${items.get(book)}</span>
                                    <a href="#" onclick="changeQuantity(this, 1);return false;"
                                       class="text-decoration-none p-2 text-black"
                                       style="font-weight: bold; font-size: 15px">+</a>
                                </div>
                            </td>
                            <td class="item-price" style="font-size: 1.5rem; color: #ED0000 ;padding-left: 15px">
                                <fmt:formatNumber value="${book.currentPrice * items.get(book)}"
                                                  type="currency"/>
                                <c:set var="totalPrice"
                                       value="${totalPrice + book.currentPrice * items.get(book)}"/>
                            </td>
                            <td class="text-start">
                                <input class="form-control" type="hidden" name="pk"
                                       value="${book.ISBN}"/>
                                <button style="background: transparent; border: none; "
                                        type="submit" onclick="removeFromCart(this)">
                                    <i style="margin-left: 15px" class="fa-duotone fa-trash-can fa-lg"></i>
                                </button>
                            </td>
                        </tr>

                        <tr class="error-msg" hidden>
                            <td colspan="6">
                                <span style="color: red;"></span>
                            </td>
                        </tr>
                    </c:forEach>
                    <tr style="border-bottom-style: hidden; ">
                        <td colspan="3">
                        </td>
                        <td class="text-end" style="font-size: 1.2rem; padding-top: 13px">Total:</td>
                        <td id="total-price" style="font-size: 1.5rem; padding-left: 15px">
                             <span style="color: #ED0000">
                                            <fmt:formatNumber value="${totalPrice}" type="currency"/>
                                        </span>
                        </td>
                        <td>

                            <a style="color: black; " href="removeAllBooksAction">
                                <button class="btn btn-danger">Delete all</button>
                            </a>


                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="col-5">
            <div class="w-100 p-4" style="border-radius: 10px; background: rgba(255,255,255,0.9)">
                <div class="text-center mb-2 " style="font-size: 2rem; font-weight: bolder">
                    Information Shipping
                    <hr style="max-width: 100px;margin-left: auto;margin-right: auto;"/>
                </div>

                <c:set var="errors" value="${requestScope.ERROR}"/>
                <c:set var="user" value="${sessionScope.USER}"/>
                <c:if test="${empty errors}">
                    <form action="checkoutAction" method="POST">
                        <div class="form-group row mt-2">
                            <label class="col-4 col-form-label" style="font-weight:bold; font-size: 18px">Recipient
                                name*</label>
                            <div class="col-8">

                                <input class="form-control" type="text" name="txtReceiverName"
                                       value="${user.fullName}"/>
                            </div>

                        </div>
                        <div class="form-group row mt-2">
                            <label class="col-4 col-form-label" style="font-weight:bold; font-size: 18px">Phone
                                number*</label>
                            <div class="col-8">
                                <input class="form-control" type="number" name="txtPhone"
                                       value="${user.username}"/>
                            </div>
                        </div>

                        <div class="form-group row mt-2">
                            <label class="col-4 col-form-label"
                                   style="font-weight:bold; font-size: 18px">Address* </label>
                            <div class="col-8">
                                <input class="form-control" type="text" name="txtAddress"
                                       value="${user.address}"/>
                            </div>
                        </div>

                        <div class="form-group row mt-2">
                            <label class="col-4 col-form-label" style="font-weight:bold; font-size: 18px">Email</label>
                            <div class="col-8">
                                <input class="form-control" type="text" name="txtEmail"
                                       value="${user.email}"/>
                            </div>
                        </div>

                        <div class="form-group row mt-2">
                            <label class="col-4 col-form-label" style="font-weight:bold; font-size: 18px">Payment
                                method*</label>
                            <div class="col-8">
                                <select name="txtPayment" class="form-control">
                                    <option value="COD">Cash on delivery</option>
                                    <c:if test="${param.txtPayment eq 'Paypal'}">
                                        <option value="Paypal" selected="selected">Paypal</option>
                                    </c:if>
                                    <c:if test="${param.txtPayment != 'Paypal'}">
                                        <option value="Paypal">Paypal</option>
                                    </c:if>
                                </select>
                                    ${errors.emptyPaymentMethodError}
                            </div>
                        </div>

                        <div class="text-center mt-3">
                            <input class="form-control btn btn-danger fw-bold" style="width: 15rem"
                                   type="submit" value="Checkout" name="btAction"/>
                        </div>
                    </form>
                </c:if>
                <c:if test="${not empty errors}">
                    <form action="checkoutAction" method="POST">
                        <div class="form-group row mt-2">
                            <label class="col-4 col-form-label">Recipient name*</label>
                            <div class="col-8">
                                <input class="form-control" type="text" name="txtReceiverName"
                                       value="${param.txtReceiverName}"/>
                                    ${errors.emptyReceiverNameError}
                            </div>
                        </div>
                        <div class="form-group row mt-2">
                            <label class="col-4 col-form-label">Phone number*</label>
                            <div class="col-8">
                                <input class="form-control" type="number" name="txtPhone"
                                       value="${param.txtPhone}"/>
                                    ${errors.phoneNumberFormatError}
                                    ${errors.emptyPhoneNumberError}
                            </div>
                        </div>

                        <div class="form-group row mt-2">
                            <label class="col-4 col-form-label">Address*</label>
                            <div class="col-8">
                                <input class="form-control" type="text" name="txtAddress"
                                       value="${param.txtAddress}"/>
                                    ${errors.emptyAddressError}
                            </div>
                        </div>

                        <div class="form-group row mt-2">
                            <label class="col-4 col-form-label">Email</label>
                            <div class="col-8">
                                <input class="form-control" type="text" name="txtEmail"
                                       value="${param.txtEmail}"/>
                                    ${errors.emailFormatError}
                            </div>
                        </div>

                        <div class="form-group row mt-2">
                            <label class="col-4 col-form-label">Payment method*</label>
                            <div class="col-8">
                                <select name="txtPayment" class="form-control">
                                    <option value="COD">Cash on delivery</option>
                                    <c:if test="${param.txtPayment eq 'Paypal'}">
                                        <option value="Paypal" selected="selected">Paypal</option>
                                    </c:if>
                                    <c:if test="${param.txtPayment != 'Paypal'}">
                                        <option value="Paypal">Paypal</option>
                                    </c:if>
                                </select>
                                    ${errors.emptyPaymentMethodError}
                            </div>
                        </div>
                        <div class="text-center mt-3">
                            <input class="form-control btn btn-danger fw-bold" style="width: 15rem"
                                   type="submit" value="Checkout" name="btAction"/>
                        </div>
                    </form>
                </c:if>
            </div>
        </div>
    </div>


</c:if>
<c:if test="${empty items}">
    <div class="container text-center mt-4 p-4" style="background: #FFFFFF; min-height: 400px; border-radius: 20px">
        <img class="m-3" src="img/no_cart.jpg">
        <h2 class="m-4"> Your shopping cart is empty!!!</h2>
        <a class="pb-4 ps-2 " href="./" style="text-decoration: none; color: #ed0000b3; ">
            <button class="btn btn-danger " style="font-weight: bold; font-size: 18px">
                Continue shopping
                <i class="fa-regular fa-arrow-right"></i>
            </button>

        </a>
    </div>
</c:if>


<%@include file="footer.html" %>

<jsp:include page="include/include_footer.jsp"></jsp:include>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
    function convertPrice(priceText) {
        priceText = priceText.trim().split('.').join("");
        return Number(priceText.substring(0, priceText.length - 2));
    }

    function numberWithDots(x) {
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    }

    function removeFromCart(e) {
        const itemElem = e.parentNode.parentNode;
        const isbn = itemElem.id;
        $.ajax({
            type: "POST",
            url: "removeFromCartAction",
            data: {
                ISBN: isbn
            },
            success: function (data) {
                const totalPriceElem = document.getElementById("total-price").getElementsByTagName("span")[0];
                let itemAmountElem = document.getElementById("cart-item-amount");
                itemAmountElem.innerText = itemAmountElem.innerText - 1;
                itemElem.remove();
                totalPriceElem.innerText = numberWithDots(data) + " đ";
            }
        });
    }

    function changeQuantity(e, n) {
        const itemElem = e.parentNode.parentNode.parentNode;
        const isbn = itemElem.id;
        $.ajax({
            type: "POST",
            url: "changeBookQuantityInCartAction",
            data: {
                ISBN: isbn,
                change: n
            },
            success: function (data) {
                console.log(data);
                const errorElem = itemElem.nextElementSibling;
                const error = errorElem.getElementsByTagName("span")[0];
                if (data.invalidQuantityErr !== undefined) {
                    errorElem.hidden = false;
                    error.innerText = data.invalidQuantityErr;
                } else if (data.exceedHoldingQuantityErr !== undefined) {
                    errorElem.hidden = false;
                    error.innerText = data.exceedHoldingQuantityErr;
                } else {
                    itemElem.getElementsByClassName("item-quantity")[0].innerText = data.quantity;
                    itemElem.getElementsByClassName("item-price")[0].innerText = numberWithDots(data.price) + " đ";
                    document.getElementById("total-price")
                        .getElementsByTagName("span")[0].innerText =
                        numberWithDots(data.totalPrice) + " đ";
                    error.innerText = "";
                    errorElem.hidden = true;
                }
            }
        });
    }
</script>

</body>

</html>