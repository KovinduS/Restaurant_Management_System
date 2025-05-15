<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Restaurant Management - Register</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assests/css/style.css">
        <style>
            body{
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            
            .register-container {
                background: #fff;
                padding: 2rem;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba (0,0,0,0.1);
                width: 350px;
                text-align: center;
            }
            
            .register-container h1{
                margin-bottom: 1.5rem;
                color: #333;           
            }
            
            .form-group{
                margin-bottom: 1rem;
                text-align: left;
            }
            
            .form-group label{
                display: block;
                margin-bottom: 0.5rem;
                font-weight: bold;
            }
            
            .form-group input{
                width: 100%;
                padding: 0.75rem;
                border: 1px solid #ddd;
                border-radius: 4px;
                box-sizing: border-box;
            }
            
            button{
                width: 100%;
                padding: 0.75rem;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 1rem;
            }
            
            button:hover{
                background-color: #45a049;
            }
            
            .login-link{
                margin-top: 1rem;
                font-size: 0.9rem;
                
            }
            
            .error{
                color: #ff0000;
                margin-top: 1rem;
            }
            
            </style>
    </head>
    <body>
        <div class="register-container">
            <h1>Create Account</h1>
            <form action="${pageContext.request.contextPath}/auth/register" method="post">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="text" id="password" name="password" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="text" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="fullname">Full Name</label>
                    <input type="text" id="fullname" name="fullname" required>
                </div>
                <button type="submit">Register</button>
                <p class="login-link">Already have an account?<a href="${pageContext.request.contextPath}/views/login.jsp">Login</a></p>
                <c:if tes="${not empty error}">
                    <p class="error">${error}</p>
                
                </c:if>
            </form>
        </div>
    </body>
</html>         
                             
            
    
            
            
