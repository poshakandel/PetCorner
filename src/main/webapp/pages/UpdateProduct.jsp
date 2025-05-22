<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Update Product | Pet Corner</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <style>
        body {
    height: 100vh;
    margin: 0;
    font-family: 'Poppins', 'Segoe UI', sans-serif;
    background-color: #f3e9ff; /* pale lavender, light purple mist */
    display: flex;
    justify-content: center;
    align-items: center;
    color: #3a0ca3; /* deep indigo purple for text */
    overflow: hidden;
}

.form-container {
    width: 90%;
    max-width: 600px;
    background: #faf8ff; /* off-white with a hint of purple */
    border-radius: 20px;
    box-shadow: 0 6px 25px rgba(106, 13, 173, 0.15); /* soft purple shadow */
    padding: 3rem 2.5rem;
    border: 1px solid #d4bff9; /* very light purple border */
    animation: fadeInUp 0.8s ease forwards;
}

h2 {
    font-weight: 700;
    font-size: 2.4rem;
    margin-bottom: 1.8rem;
    text-align: center;
    color: #4b0082; /* a darker purple for headings */
}

h2 i {
    color: #7b5fff; /* softer purple for icon */
    margin-right: 0.6rem;
    cursor: default;
    transition: transform 0.3s ease;
}

h2 i:hover {
    transform: rotate(15deg);
}

label {
    color: #5d3fd3; /* medium purple */
    font-weight: 600;
    font-size: 1.05rem;
    margin-bottom: 0.4rem;
    display: inline-block;
}

.form-control {
    border: 1.5px solid #c6b9f0; /* soft purple border */
    border-radius: 12px;
    padding: 12px 18px;
    background: #fff;
    color: #3a0ca3;
    font-size: 1rem;
    transition: border-color 0.3s ease, box-shadow 0.3s ease;
}

.form-control:focus {
    border-color: #7b5fff;
    box-shadow: 0 0 8px rgba(123, 95, 255, 0.3);
    outline: none;
    background: #fff;
}

textarea.form-control {
    resize: vertical;
    min-height: 100px;
}

input[type="file"] {
    padding: 6px 10px;
    color: #6e57ff;
}

.btn-primary {
    background: #6a0dad; /* bold purple */
    color: white;
    box-shadow: 0 6px 20px rgba(106, 13, 173, 0.4);
    transition: background 0.3s ease, box-shadow 0.3s ease;
    border-radius: 14px;
    border: none;
    font-weight: 700;
    letter-spacing: 0.03em;
}

.btn-primary:hover, .btn-primary:focus {
    background: #580a9b;
    box-shadow: 0 8px 28px rgba(88, 10, 155, 0.5);
}

.btn-outline-secondary {
    color: #7b5fff;
    border-color: #c6b9f0;
    border-radius: 14px;
    transition: all 0.3s ease;
}

.btn-outline-secondary:hover {
    background: #e6e0ff;
    border-color: #a18fff;
    color: #4b0082;
    box-shadow: 0 0 10px #b0a3ff;
}

.form-actions {
    display: flex;
    justify-content: space-between;
    margin-top: 2.5rem;
}

.form-actions .btn {
    width: 48%;
}

.alert-success {
    background-color: #e9f7f9;
    color: #2e7d32;
    border: 1px solid #a5d6a7;
    border-radius: 12px;
    padding: 0.75rem 1.25rem;
    margin-bottom: 1.5rem;
    box-shadow: none;
}

.alert-danger {
    background-color: #fdecea;
    color: #d32f2f;
    border: 1px solid #ef9a9a;
    border-radius: 12px;
    padding: 0.75rem 1.25rem;
    margin-bottom: 1.5rem;
    box-shadow: none;
}

.alert i {
    margin-right: 0.6rem;
    font-size: 1.2rem;
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
    <div class="form-container">

        <!-- Alert Messages -->
        <c:if test="${not empty param.success}">
            <div class="alert alert-success" role="alert">
                <i class="fas fa-check-circle"></i> ${param.success}
            </div>
        </c:if>
        <c:if test="${not empty param.error}">
            <div class="alert alert-danger" role="alert">
                <i class="fas fa-exclamation-circle"></i> ${param.error}
            </div>
        </c:if>

        <!-- Product Selection -->
        <c:if test="${empty param.productId}">
            <h2><i class="fas fa-edit"></i>Select Product to Update</h2>
            <c:forEach var="product" items="${products}">
                <form action="" method="get" class="mb-3">
                    <input type="hidden" name="productId" value="${product.productId}" />
                    <button type="submit" class="btn btn-outline-secondary w-100 text-start">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h5 class="mb-1">${product.name}</h5>
                                <p class="mb-1 text-muted">${product.description}</p>
                                <p class="mb-0"><strong>$${product.price}</strong></p>
                            </div>
                            <i class="fas fa-chevron-right"></i>
                        </div>
                    </button>
                </form>
            </c:forEach>
            <div class="mt-4 text-end">
                <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-outline-secondary">
                    <i class="fas fa-arrow-left"></i> Back to Dashboard
                </a>
            </div>
        </c:if>

        <!-- Update Form -->
        <c:if test="${not empty param.productId}">
            <c:forEach var="product" items="${products}">
                <c:if test="${product.productId == param.productId}">
                    <h2><i class="fas fa-edit"></i>Update Product</h2>
                    <form action="${pageContext.request.contextPath}/admin/product/update" method="post" enctype="multipart/form-data" novalidate>
                        <input type="hidden" name="productId" value="${product.productId}" />
                        
                        <label for="updateName">Product Name</label>
                        <input type="text" id="updateName" name="name" value="${product.name}" class="form-control" required />

                        <label for="updateDescription" class="mt-3">Description</label>
                        <textarea id="updateDescription" name="description" class="form-control" rows="4" required>${product.description}</textarea>

                        <label for="updatePrice" class="mt-3">Price</label>
                        <input type="number" id="updatePrice" name="price" step="0.01" value="${product.price}" class="form-control" required />

                        <label for="updateImage" class="mt-3">Product Image</label>
                        <input type="file" id="updateImage" name="image" accept="image/*" class="form-control" />
                        <small class="text-muted">Leave empty to keep current image.</small>

                        <div class="form-actions">
                            <button type="submit" class="btn btn-primary">Update</button>
                            <a href="${pageContext.request.contextPath}/admin/product/update" class="btn btn-outline-secondary">Cancel</a>
                        </div>
                    </form>
                </c:if>
            </c:forEach>
        </c:if>

    </div>
</body>
</html>
