<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<jsp:include page="Header.jsp">
    <jsp:param name="title" value="About Us" />
    <jsp:param name="page" value="About" />
</jsp:include>

<head>
    <meta charset="UTF-8">
    <title>Pet Corner | About Us</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .about-container {
            width: 80%;
            margin: 40px auto;
            font-size: 17px;
            line-height: 1.7;
            color: #333;
        }

        .about-container h2 {
            font-size: 28px;
            color: #2c3e50;
            margin-bottom: 20px;
        }

        .about-container p {
            margin-bottom: 20px;
        }

        .highlight {
            color: #3498db;
            font-weight: bold;
        }
    </style>
</head>

<body>

<div class="about-container">
    <h2>About Pet Corner</h2>

    <p>
        <span class="highlight">Pet Corner</span> is more than just a pet store — it's a place where love for animals comes to life.
        We are passionate about building a safe, happy, and convenient platform for every pet lover to shop, adopt, and care for their furry friends.
    </p>

    <p>
        The idea for Pet Corner sparked when we realized that many online platforms cater to human needs, but few truly celebrate the unconditional love we receive from our pets. 
        We wanted to change that; by putting pets at the heart of everything we do.
    </p>

    <p>
        Whether you're looking to adopt a pet, buy quality supplies, or explore care tips, we've got you covered. 
        Our goal is to create a seamless and joyful experience for every pet owner.
    </p>

    <p class="highlight">
        Because pets aren't just animals — they are family.
    </p>
</div>

<jsp:include page="Footer.jsp" />
</body>
</html>
