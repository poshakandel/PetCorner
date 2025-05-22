<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title} | Pet Corner</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
</head>
<body>
    <!-- Header Section -->
    <header class="site-header">
        <div class="container">
            <div class="logo">
                <h1><span class="highlight"><i class="fas fa-paw"></i> Pet</span> Corner</h1>
            </div>
            
            <div class="header-spacer"></div>
            
            <nav class="main-nav">
                <ul class="nav-links">
                    <!-- Home Link -->
                    <li><a class="${param.page == 'Home' ? 'active' : ''}" 
                          href="${pageContext.request.contextPath}/home">Home</a></li>

                    <!-- Products Link -->
                    <li><a class="${param.page == 'Products' ? 'active' : ''}" 
                          href="${pageContext.request.contextPath}/products">Products</a></li>

                    <!-- About Us Link -->
                    <li><a class="${param.page == 'About' ? 'active' : ''}" 
                          href="${pageContext.request.contextPath}/about">About Us</a></li>

                    <!-- Contact Link -->
                    <li><a class="${param.page == 'Contact' ? 'active' : ''}" 
                          href="${pageContext.request.contextPath}/contact">Contact</a></li>

                    <!-- Session Handling -->
                    <c:choose>
                        <c:when test="${empty sessionScope.userWithSession}">
                            <li><a href="${pageContext.request.contextPath}/login" 
                                  class="btn btn-login">Login/Register</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="${pageContext.request.contextPath}/logout" 
                                  class="btn btn-logout">Logout</a></li>
                            <c:if test="${sessionScope.userWithSession.role eq 'admin'}">
                                <li><a href="${pageContext.request.contextPath}/admin/dashboard" 
                                      class="btn btn-admin">Dashboard</a></li>
                            </c:if>
                            <c:if test="${sessionScope.userWithSession.role eq 'customer'}">
                                <li><a href="${pageContext.request.contextPath}/cart" 
                                      class="btn btn-admin">Your Shopping Cart</a></li>
                            </c:if>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </nav>
        </div>
    </header>
</body>
</html>
