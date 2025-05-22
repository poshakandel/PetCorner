<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<jsp:include page="Header.jsp">
    <jsp:param name="title" value="Home" />
    <jsp:param name="page" value="Home" />
</jsp:include>

<head>
    <meta charset="UTF-8">
    <title>Pet Corner | Home</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
    <style>
        /* Banner Section */
        .banner {
            width: 100%;
            height: 300px;
            background: url('${pageContext.request.contextPath}/images/banner.jpg') center/cover no-repeat;
            border-radius: 12px;
            margin-bottom: 2rem;
        }

        /* Our Products Section */
        .products-title-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            margin-top: 2rem;
            margin-bottom: 1.5rem;
            width: 100%;
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
        
        

        /* Responsive Styling */
        @media (max-width: 768px) {
            .product-container {
                grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            }
        }
    </style>
</head>

<body>

    <!-- Banner Section -->
    <div class="container mt-3">
        <div class="banner"></div>
    </div>
    

    <!-- Our Products Section (Text) -->
    <div class="container">
        <div class="products-title-container">
            <div class="products-title">
                Featured Products
            </div>
            <div class="products-description">
                "A special collection of the best pet products just for you!"
            </div>
        </div>
    </div>

    <!-- Products Section -->
    <div class="container">
        <div class="product-container">
            <c:forEach var="product" items="${products}">
                <div class="product-card">
                    <img src="${pageContext.request.contextPath}${product.productImage}" alt="${product.name}" class="product-image">
                    <h3 class="product-name">${product.name}</h3>
                    <p class="product-description">${product.description}</p>
                    <p class="product-price">$. ${product.price}</p>
                    <form action="${pageContext.request.contextPath}/addToCart" method="get">
                        <input type="hidden" name="productId" value="${product.productId}">
                        <button type="submit" class="add-to-cart-btn">Add to Cart</button>
                    </form>
                </div>
            </c:forEach>
        </div>
    </div>
    <div id="popup" class="popup">Product added to cart!</div>
    <style>
    .popup {
    visibility: hidden;
    min-width: 200px;
    background-color: #4CAF50; /* Green */
    color: white;
    text-align: center;
    border-radius: 4px;
    padding: 12px;
    position: fixed;
    z-index: 1000;
    bottom: 30px;
    right: 30px;
    font-size: 16px;
    box-shadow: 0 2px 6px rgba(0,0,0,0.3);
    transition: visibility 0s, opacity 0.5s ease;
    opacity: 0;
}

/* Show the popup */
.popup.show {
    visibility: visible;
    opacity: 1;
}
    </style>
    
    <script>
// Function to show popup
function showPopup(message) {
    var popup = document.getElementById('popup');
    popup.textContent = message;
    popup.classList.add('show');

    // Hide after 3 seconds
    setTimeout(function() {
        popup.classList.remove('show');
    }, 3000);
}

window.onload = function() {
    var urlParams = new URLSearchParams(window.location.search);
    var successStatus = urlParams.get('success');
    if (successStatus === 'added') {
        showPopup("Product added to cart!");
    }
};
</script>

</body>

<jsp:include page="Footer.jsp" />
</html>
