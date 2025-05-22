<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register | Pet Corner</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/register.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
</head>
<body>
    <div class="register-container">
        <div class="header">
            <h1>Pet Corner</h1>
            <p>Create your account</p>
        </div>
        
        <form action="${pageContext.request.contextPath}/register" method="post">
        <input type="hidden" name="action" value="register">
                        <c:if test="${not empty errorMessage}">
                            <div style="color:red;">
                                ${errorMessage}
                            </div>
           				</c:if> 
            <div class="form-group">
                <label for="name">Full Name</label>
                <input type="text" id="name" name="name" required placeholder="Rohan Katwal">
            </div>
            
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required placeholder="angellama@email.com">
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required placeholder="••••••••">
            </div>
            
            <div class="form-group">
                <label for="confirmPassword">Confirm Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required placeholder="••••••••">
            </div>
            
            <button type="submit" class="register-btn">Register</button>
            
            <div class="login-link">
                Already have an account? <a href="${pageContext.request.contextPath}/login">Sign in</a>
            </div>
        </form>
    </div>
</body>
</html>