<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Products | Pet Corner</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #4e73df;
            --light-bg: #f8f9fc;
        }
        body {
            background-color: var(--light-bg);
            padding-top: 20px;
        }
        .page-header {
            color: var(--primary-color);
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid #eee;
        }
        .product-card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0,0,0,0.05);
            margin-bottom: 2rem;
            transition: transform 0.3s ease;
            height: 100%;
        }
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }
        .product-image-container {
            height: 200px;
            overflow: hidden;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
            background: #f8f9fa;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .product-image {
            max-height: 100%;
            max-width: 100%;
            object-fit: contain;
        }
        .product-body {
            padding: 1.5rem;
        }
        .product-title {
            font-size: 1.2rem;
            margin-bottom: 0.5rem;
            color: #333;
        }
        .product-description {
            color: #6c757d;
            font-size: 0.9rem;
            margin-bottom: 1rem;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }
        .product-price {
            font-weight: bold;
            color: var(--primary-color);
            font-size: 1.1rem;
        }
        .action-buttons {
            margin-top: 1rem;
            display: flex;
            gap: 10px;
        }
        .no-products {
            text-align: center;
            padding: 3rem;
            background: white;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0,0,0,0.05);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row mb-4">
            <div class="col-md-6">
                <h2 class="page-header"><i class="fas fa-paw"></i> Our Products</h2>
            </div>
            <div class="col-md-6 text-md-end">
                <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-secondary">
                    <i class="fas fa-arrow-left"></i> Back to Dashboard
                </a>
                <a href="${pageContext.request.contextPath}/admin/product/add" class="btn btn-primary">
                    <i class="fas fa-plus"></i> Add New Product
                </a>
            </div>
        </div>

        <c:choose>
            <c:when test="${not empty products}">
                <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                    <c:forEach var="product" items="${products}">
                        <div class="col">
                            <div class="product-card">
                                <div class="product-image-container">
                                    <c:choose>
                                        <c:when test="${not empty product.productImage}">
                                            <img src="${pageContext.request.contextPath}${product.productImage}" 
                                                 alt="${product.name}" class="product-image">
                                        </c:when>
                                        <c:otherwise>
                                            <i class="fas fa-image fa-3x text-muted"></i>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="product-body">
                                    <h5 class="product-title">${product.name}</h5>
                                    <p class="product-description">${product.description}</p>
                                    <p class="product-price">$${product.price}</p>
                                    <div class="action-buttons">
                                        <a href="${pageContext.request.contextPath}/admin/product/update?id=${product.productId}" 
                                           class="btn btn-sm btn-warning">
                                            <i class="fas fa-edit"></i> Edit
                                        </a>
                                        <a href="${pageContext.request.contextPath}/admin/product/delete?id=${product.productId}" 
                                           class="btn btn-sm btn-danger"
                                           onclick="return confirm('Are you sure you want to delete this product?')">
                                            <i class="fas fa-trash"></i> Delete
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <div class="no-products">
                    <i class="fas fa-box-open fa-3x text-muted mb-3"></i>
                    <h4>No Products Found</h4>
                    <p class="text-muted">There are currently no products available.</p>
                    <a href="${pageContext.request.contextPath}/admin/product/add" class="btn btn-primary mt-2">
                        <i class="fas fa-plus"></i> Add Your First Product
                    </a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>