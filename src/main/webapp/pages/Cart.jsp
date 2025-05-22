<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h1, h2 {
            color: #333;
        }
        .products-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .product-card {
            border: 1px solid #ccc;
            padding: 15px;
            width: 200px;
            text-align: center;
        }
        .product-image {
            width: 100%;
            height: auto;
        }
        .product-name {
            font-weight: bold;
            margin-top: 10px;
        }
        .product-price {
            color: green;
            margin-top: 5px;
        }
        .delete-btn {
            margin-top: 10px;
            padding: 5px 10px;
            background-color: #e74c3c;
            color: white;
            border: none;
            cursor: pointer;
        }
        .delete-btn:hover {
            background-color: #c0392b;
        }
        .cart-summary {
            margin-top: 20px;
            font-size: 18px;
            font-weight: bold;
        }
        .empty-cart {
            text-align: center;
            margin-top: 50px;
        }
        .back-home {
            display: inline-block;
            margin-top: 30px;
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .back-home:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>

<h1>Your Shopping Cart</h1>

<c:choose>
    <c:when test="${not empty cartItems}">
        <div class="products-grid">
            <c:forEach var="cartItem" items="${cartItems}">
                <!-- Find the matching product by productId -->
                <c:set var="product" value="${null}" />
                <c:forEach var="prod" items="${productsInCart}">
                    <c:if test="${prod.productId == cartItem.productId}">
                        <c:set var="product" value="${prod}" />
                    </c:if>
                </c:forEach>

                <div class="product-card">
                    <c:if test="${not empty product.productImage}">
                        <img src="${pageContext.request.contextPath}${product.productImage}" alt="${product.name}" class="product-image">
                    </c:if>
                    <div class="product-name">${product.name}</div>
                    <div class="product-price">$${product.price}</div>
                    <form action="${pageContext.request.contextPath}/removeFromCart" method="post">
                        <input type="hidden" name="cartItemId" value="${cartItem.cartItemId}">
                        <button type="submit" class="delete-btn">Remove from Cart</button>
                    </form>
                </div>
            </c:forEach>
        </div>

       <div class="cart-summary">
    Total: $<fmt:formatNumber value="${totalPrice}" type="number" maxFractionDigits="0" />
</div>


    </c:when>
    <c:otherwise>
        <div class="empty-cart">
            <h2>Your cart is empty</h2>
            <p>Start shopping to add items to your cart!</p>
        </div>
    </c:otherwise>
</c:choose>

<!-- Back to Home button -->
<a href="${pageContext.request.contextPath}/home" class="back-home">← Back to Home</a>

</body>
</html>
