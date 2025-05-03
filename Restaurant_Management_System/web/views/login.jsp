<%-- 
    Document   : login
    Created on : May 3, 2025, 10:18:21 PM
    Author     : Kavindi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Restaurant Management - Login</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/auth/logout">
        <style>
            
            
            
        </style>
    </head>
    <body>
        <div class="login-container">
            <h1>Restaurant Management</h1>
            
            <form action="${pageContext.request.contextPath}/auth/login" method="post">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <button type="submit">Login</button>
                 <p class="register-link">Don't have an account? <a href="${pageContext.request.contextPath}/views/register.jsp">Register</a></p>
                 <c:if test="${not empty error}">
                       <p class="error">${error}</p>
                 </c:if>
                       <c:if test="${param.registered == 'true'}">
                       </c:if>
            </form>
        </div>
    </body>
</html>
