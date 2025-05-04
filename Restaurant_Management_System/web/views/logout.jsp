<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logged Out</title>
        <style>
            body{
                font-family: Arial,sans-serif;
                background-color: #f4f4f4;
                text-align: center;
                padding-top: 100px;
            }
            .message-box {
                background: white;
                display: inline-block;
                padding: 2rem;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }
            a {
                display: inline-block;
                margin-top: 1rem;
                text-decoration: none;
                color: #4CAF50;
            } 
        </style>
    </head>
    <body>
        <div class="message-box">
            <h2>You have been logged out.</h2>
            <a href="${pageContext.request.contextPath}/views/login.jsp">Return to Login</a>
        </div>
    </body>
</html>
