<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login | Pet Corner</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&display=swap" rel="stylesheet">
</head>
<body>

    <div class="login-container">
        <div class="logo-header">
            <h1>Pet Corner</h1>
            <p>Welcome back! Please login to your account</p>
        </div>

        <form action="${pageContext.request.contextPath}/login" method="post">
        <c:if test="${not empty errorMessage}">
                            <div style="color:red;">
                                ${errorMessage}
                            </div>
                        </c:if>
                        
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required placeholder="Enter your username">
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required placeholder="Enter your password">
            </div>

            <button type="submit" class="login-btn">Login</button>

            <div class="register-link">
                Don't have an account? <a href="${pageContext.request.contextPath}/register">Register here</a>
            </div>
        </form>
    </div>
</body>
</html>