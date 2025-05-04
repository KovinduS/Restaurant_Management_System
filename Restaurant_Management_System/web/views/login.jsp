<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Restaurant Management - Login</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/auth/logout">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .login-container {
                background: #fff;
                padding: 2rem;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 350px;
                text-align: center;
            }
            .login-container h1 {
                margin-bottom: 1.5rem;
                color: #333;
            }
            .form-group {
                margin-bottom: 1rem;
                text-align: left;
            }
            .form-group label {
                display: block;
                margin-bottom: 0.5rem;
                font-weight: bold;
            }
            .form-group input {
                width: 100%;
                padding: 0.75rem;
                border: 1px solid #ddd;
                border-radius: 4px;
                box-sizing: border-box;
            }
            button {
                width: 100%;
                padding: 0.75rem;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 1rem;
            }
            button:hover {
                background-color: #45a049;
            }
            .register-link {
                margin-top: 1rem;
                font-size: 0.9rem;
            }
            .error {
               color: #ff0000; 
               margin-top: 1rem;
            }
            .success {
                color: #008000;
                margin-top: 1rem;
            }
            
            
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
