<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Delete Product | Pet Corner</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <style>
        body {
            height: 100vh;
            margin: 0;
            font-family: 'Poppins', 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #f3e8ff 0%, #d6c1ff 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            color: #333;
            overflow: hidden;
        }
        .delete-container {
            width: 90%;
            max-width: 800px;
            background: #ffffff;
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(106, 13, 173, 0.1);
            padding: 3rem 2.5rem;
            border: 1px solid #6A0DAD;
            animation: fadeInUp 0.8s ease forwards;
        }
        h2 {
            font-weight: 700;
            font-size: 2.4rem;
            margin-bottom: 2rem;
            text-align: center;
            color: #6A0DAD;
            user-select: none;
        }
        h2 i {
            margin-right: 0.6rem;
            transition: transform 0.4s ease, color 0.4s ease;
            color: #666;
            cursor: default;
        }
        h2 i:hover {
            transform: rotate(20deg) scale(1.1);
            color: #999;
        }

        .alert-success, .alert-danger {
            border-radius: 12px;
            padding: 1rem 1.2rem;
            font-weight: 600;
            box-shadow: none;
            margin-bottom: 1.8rem;
            display: flex;
            align-items: center;
        }
        .alert-success {
            background-color: #e6f4ea;
            color: #2e7d32;
            border: 1px solid #a5d6a7;
        }
        .alert-danger {
            background-color: #fdecea;
            color: #d32f2f;
            border: 1px solid #ef9a9a;
        }
        .alert i {
            margin-right: 0.7rem;
            font-size: 1.3rem;
        }

        .product-card {
            display: flex;
            align-items: center;
            justify-content: space-between;
            border: 1px solid #ddd;
            border-radius: 14px;
            padding: 1rem 1.5rem;
            margin-bottom: 1.2rem;
            background: #fafafa;
            box-shadow: 0 3px 12px rgba(106, 13, 173, 0.05);
            transition: box-shadow 0.3s ease;
        }
        .product-card:hover {
            box-shadow: 0 6px 18px rgba(106, 13, 173, 0.15);
        }
        .product-info {
            flex-grow: 1;
            padding-right: 1.5rem;
        }
        .product-info h5 {
            margin: 0;
            color: #4B007D;
            font-weight: 700;
            font-size: 1.25rem;
        }
        .product-info p {
            margin: 0.2rem 0;
            color: #666;
            font-size: 0.95rem;
        }
        .product-info p strong {
            color: #6A0DAD;
        }
        form {
            margin: 0;
        }
        .btn-danger {
            border-radius: 14px;
            padding: 0.45rem 1.1rem;
            font-weight: 700;
            font-size: 0.9rem;
            background: #e74a3b;
            border: none;
            box-shadow: 0 4px 15px rgba(231, 74, 59, 0.3);
            transition: background 0.3s ease, box-shadow 0.3s ease;
            display: flex;
            align-items: center;
        }
        .btn-danger i {
            margin-right: 0.5rem;
        }
        .btn-danger:hover, .btn-danger:focus {
            background: #c0392b;
            box-shadow: 0 6px 25px rgba(192, 57, 43, 0.5);
            color: #fff;
        }
        .back-btn {
            margin-top: 2rem;
            display: flex;
            justify-content: center;
        }
        .back-btn a {
            border-radius: 14px;
            padding: 0.5rem 1.4rem;
            font-weight: 700;
            color: #6A0DAD;
            border: 2px solid #6A0DAD;
            text-decoration: none;
            transition: background 0.3s ease, color 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }
        .back-btn a:hover {
            background: #6A0DAD;
            color: white;
            box-shadow: 0 6px 20px rgba(106, 13, 173, 0.6);
        }

        @keyframes fadeInUp {
            0% {
                opacity: 0;
                transform: translateY(25px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <div class="delete-container">
        <h2><i class="fas fa-trash-alt"></i>Delete Products</h2>

        <!-- Success or Error Alerts -->
        <c:if test="${not empty successMessage}">
            <div class="alert alert-success">
                <i class="fas fa-check-circle"></i> ${successMessage}
            </div>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger">
                <i class="fas fa-exclamation-triangle"></i> ${errorMessage}
            </div>
        </c:if>

        <c:forEach var="product" items="${products}">
            <div class="product-card">
                <div class="product-info">
                    <h5>${product.name}</h5>
                    <p>${product.description}</p>
                    <p><strong>$${product.price}</strong></p>
                </div>
                <form action="${pageContext.request.contextPath}/admin/product/delete" method="post" onsubmit="return confirm('Are you sure you want to delete this product?');">
                    <input type="hidden" name="productId" value="${product.productId}" />
                    <button type="submit" class="btn btn-danger">
                        <i class="fas fa-trash"></i> Delete
                    </button>
                </form>
            </div>
        </c:forEach>

        <div class="back-btn">
            <a href="${pageContext.request.contextPath}/admin/dashboard">
                <i class="fas fa-arrow-left"></i> Back to Dashboard
            </a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
