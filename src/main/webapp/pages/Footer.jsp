<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
    <style>
        /* Sticky footer layout styles (NEW) */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }

        body {
            display: flex;
            flex-direction: column;
        }

        .wrapper {
            flex: 1;
            display: flex;
            flex-direction: column;
        }
    </style>
</head>

<body>
<div class="wrapper">
    </main> <!-- Closing main content from header (leave as is OR remove if redundant) -->


</div>

<footer class="site-footer">
    <div class="container">
        <div class="footer-content">
            <div class="footer-section about">
                <h3 class="footer-title">About Pet Corner</h3>
                <p>Your trusted partner for healthy pets and premium accessories.</p>
                <div class="social-icons">
                    <a href="#" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                    <a href="#" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
            
            <div class="footer-section links">
                <h3 class="footer-title">Quick Links</h3>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/home">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/about">About Us</a></li>
                    <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
                </ul>
            </div>
            
            <div class="footer-section contact">
                <h3 class="footer-title">Contact Us</h3>
                <ul>
                    <li><i class="fas fa-map-marker-alt"></i> Hospital Chowk, Pokhara</li>
                    <li><i class="fas fa-phone"></i> +977 9820000000</li>
                    <li><i class="fas fa-envelope"></i> info@petcorner.com</li>
                </ul>
            </div>
        </div>
        
        <div class="footer-bottom">
            <p>&copy; <%= java.time.Year.now().getValue() %> Pet Corner. All rights reserved.</p>
        </div>
    </div>
</footer>

</body>
</html>
