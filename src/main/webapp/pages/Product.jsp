<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<jsp:include page="Header.jsp">
    <jsp:param name="title" value="Products" />
    <jsp:param name="page" value="Products" />
</jsp:include>

<head>
    <meta charset="UTF-8">
    <title>Pet Corner | Product</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/product.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9f9;
        }

        .products-title-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            margin-top: 1rem;
            margin-bottom: 0.5rem;
            width: 100%;
        }

        .products-title {
            font-size: 2rem;
            font-weight: bold;
            color: #333;
        }

        .search-container {
            text-align: center;
            margin-bottom: 0.5rem;
        }

        .search-container form {
            display: inline-flex;
            justify-content: center;
            gap: 10px;
        }

        .search-container input,
        .search-container button {
            padding: 8px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        .search-container button {
            background-color: #1cc88a;
            color: white;
            border: none;
            cursor: pointer;
        }

        .search-container button:hover {
            background-color: #17a673;
        }

     .container {
    width: 100%;
    padding: 0 20px;
    margin: 0 auto;
    box-sizing: border-box;
}

.product-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
    gap: 20px;
    width: 100%;
    box-sizing: border-box;
    justify-content: center;
}


        .products-title {
            font-size: 2rem;
            font-weight: bold;
            color: #333;
        }

        .products-description {
            font-size: 1rem;
            font-weight: normal;
            color: #555;
            margin-top: 1rem;  /* Space between title and description */
        }

        /* Product Grid Section */
        .product-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 2rem;
        }

        .product-card {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 12px;
            padding: 1.5rem;
            text-align: center;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .product-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.15);
        }

        .product-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 8px;
        }

        .product-name {
            font-size: 1.2rem;
            margin-top: 0.75rem;
            font-weight: bold;
            color: #333;
        }

        .product-description {
            font-size: 0.9rem;
            color: #555;
            margin: 0.75rem 0;
        }

        .product-price {
            font-weight: bold;
            color: #4e73df;
            margin-top: 0.5rem;
        }

        .add-to-cart-btn {
            background-color: #1cc88a;
            color: white;
            border: none;
            padding: 0.6rem 1.2rem;
            margin-top: 1rem;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .add-to-cart-btn:hover {
            background-color: #17a673;
        }
        
        <c:if test="${empty products}">
    <div style="
        display: flex;
        justify-content: center;
        align-items: center;
        height: 200px;
        text-align: center;
        color: #888;
        font-size: 1.2rem;
        margin-top: 2rem;
        width: 100%;
    ">
        No products found matching your search.
    </div>
</c:if>
        

        @media (max-width: 768px) {
            .product-container {
                grid-template-columns: repeat(auto-fill, minmax(180px, 1fr));
            }
        }
        <div style="text-align: center; margin-top: 3rem;">
    <img src="${pageContext.request.contextPath}/images/empty-box.png" alt="Not Found" style="width:100px; opacity:0.6;" />
    <p style="color: #666; font-size: 1.2rem;">No products found matching your search.</p>
</div>
        
    </style>
</head>

<body>
    <div class="products-title-container">
        <h2 class="products-title">Our Products</h2>
    </div>

    <div class="search-container">
        <form action="${pageContext.request.contextPath}/products" method="get">
            <input type="text" name="search" placeholder="Search products..." style="width: 250px;">
            <button type="submit">Search</button>
        </form>
    </div>

    <!-- Products Section -->
<div class="container">
    <c:if test="${empty products}">
        <div style="text-align: center; color: #888; font-size: 1.2rem; margin-top: 2rem;">
            No products found matching your search.
        </div>
    </c:if>

    <div class="product-container">
        <c:forEach var="product" items="${products}">
            <div class="product-card">
                <img src="${pageContext.request.contextPath}${product.productImage}" alt="${product.name}" class="product-image">
                <h3 class="product-name">${product.name}</h3>
                <p class="product-description">${product.description}</p>
                <p class="product-price">$. ${product.price}</p>
                <form action="${pageContext.request.contextPath}/addToCart" method="post">
                    <input type="hidden" name="productId" value="${product.productId}">
                    <input type="hidden" name="redirect" value="${pageContext.request.contextPath}/products">
                    <button type="submit" class="add-to-cart-btn">Add to Cart</button>
                </form>
            </div>
        </c:forEach>
    </div>
</div>

</body>

<jsp:include page="Footer.jsp" />
</html>
