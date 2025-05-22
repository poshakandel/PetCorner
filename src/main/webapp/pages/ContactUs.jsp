<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<jsp:include page="Header.jsp">
    <jsp:param name="title" value="Contact Us" />
    <jsp:param name="page" value="Contact" />
</jsp:include>

<head>
    <meta charset="UTF-8">
    <title>Pet Corner | Contact Us</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .contact-container {
            width: 80%;
            margin: 40px auto;
            font-size: 17px;
            line-height: 1.7;
            color: #333;
        }

        .contact-container h2 {
            font-size: 28px;
            color: #2c3e50;
            margin-bottom: 20px;
        }

        .contact-container p {
            margin-bottom: 20px;
        }

        .contact-container a {
            color: #3498db;
            text-decoration: none;
        }

        .contact-container a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>

<div class="contact-container">
    <h2>Contact Us</h2>
    <p>
        Welcome to <strong>Pet Corner</strong> — your trusted destination for buying and selling pets online.
        Whether you're looking for a furry companion or seeking a new home for your beloved pet, our platform connects responsible sellers with loving pet seekers.
    </p>
    <p>
        We aim to make pet adoption and purchasing easy, safe, and accessible. From dogs and cats to birds and exotic animals, Pet Corner supports a wide range of pet categories.
    </p>
    <p>
        <strong>If you have any questions, issues, or need assistance</strong>, feel free to reach out to us. Our support team is here to help you!
    </p>
    <p>
        📧 Email: <a href="mailto:support@petcorner.com">info@petcorner.com</a><br>
        📞 Phone: +977 9820000000<br>
        📍 Location: Hospital Chowk, Pokhara
    </p>
</div>

<jsp:include page="Footer.jsp" />
</body>
</html>