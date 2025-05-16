<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Maya Bay Restaurant - Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Quicksand:wght@400;500;700&display=swap');
        
        body {
            font-family: 'Quicksand', Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: url('${pageContext.request.contextPath}/assets/images/cor1.png');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            /* Creating bubbles with pseudo-elements */
            position: relative;
            overflow: hidden;
        }
        
        body::before,
        body::after {
            content: '';
            position: absolute;
            border-radius: 50%;
            opacity: 0.4;
            animation: float 15s infinite ease-in-out;
        }
        
        body::before {
            width: 100px;
            height: 100px;
            background: radial-gradient(circle at 30% 30%, #ffffff, #7fdbff);
            bottom: -25px;
            left: 10%;
            animation-duration: 20s;
        }
        
        body::after {
            width: 60px;
            height: 60px;
            background: radial-gradient(circle at 30% 30%, #ffffff, #7fdbff);
            bottom: -15px;
            right: 20%;
            animation-duration: 15s;
            animation-delay: 2s;
        }
        
        @keyframes float {
            0%, 100% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-700px) translateX(30px);
            }
        }
        
        /* Additional bubbles */
        .bubble {
            position: absolute;
            border-radius: 50%;
            background: radial-gradient(circle at 30% 30%, #ffffff, #7fdbff);
            opacity: 0.3;
            animation: float 25s infinite ease-in-out;
        }
        
        .bubble:nth-child(1) {
            width: 40px;
            height: 40px;
            left: 20%;
            bottom: -10px;
            animation-duration: 18s;
        }
        
        .bubble:nth-child(2) {
            width: 25px;
            height: 25px;
            left: 40%;
            bottom: -10px;
            animation-duration: 12s;
            animation-delay: 3s;
        }
        
        .bubble:nth-child(3) {
            width: 35px;
            height: 35px;
            left: 60%;
            bottom: -10px;
            animation-duration: 15s;
            animation-delay: 6s;
        }
        
        .bubble:nth-child(4) {
            width: 20px;
            height: 20px;
            left: 80%;
            bottom: -10px;
            animation-duration: 10s;
            animation-delay: 4s;
        }
        
        .login-container {
            background: rgba(10, 96, 121, 0.65);
            padding: 2.5rem;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3), 
                        0 0 30px rgba(127, 255, 212, 0.2) inset;
            width: 350px;
            text-align: center;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(127, 255, 212, 0.3);
            position: relative;
            z-index: 10;
        }
        .login-container span {
            color: #64dfdf;
        }
        .login-container h1 {
            margin-bottom: 1.5rem;
            color: #E0F7FA;
            font-weight: 700;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            position: relative;
        }
        
        .login-container h1::after {
            content: '';
            font-size: 0.6em;
            position: absolute;
            right: 5px;
            top: 0;
        }
        
        .login-container h1::before {
            content: '';
            font-size: 0.6em;
            position: absolute;
            left: 5px;
            top: 0;
        }
        
        .form-group {
            margin-bottom: 1.5rem;
            text-align: left;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: #B2EBF2;
            text-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
        }
        
        .form-group input {
            width: 100%;
            padding: 0.75rem;
            background-color: rgba(224, 247, 250, 0.9);
            border: 1px solid #4DD0E1;
            border-radius: 8px;
            box-sizing: border-box;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1) inset;
            color: #00363a;
            font-family: 'Quicksand', sans-serif;
            transition: all 0.3s ease;
        }
        
        .form-group input:focus {
            outline: none;
            border-color: #00BCD4;
            box-shadow: 0 0 8px rgba(0, 188, 212, 0.5);
        }
        
        button {
            width: 100%;
            padding: 0.85rem;
            background: linear-gradient(to right, #00897B, #009688);
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1rem;
            font-weight: bold;
            font-family: 'Quicksand', sans-serif;
            letter-spacing: 1px;
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }
        
        button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: all 0.5s ease;
        }
        
        button:hover {
            background: linear-gradient(to right, #00796B, #00897B);
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.3);
            transform: translateY(-2px);
        }
        
        button:hover::before {
            left: 100%;
        }
        
        .register-link {
            margin-top: 1.5rem;
            font-size: 0.95rem;
            color: #B2EBF2;
        }
        
        .register-link a {
            color: #E0F7FA;
            text-decoration: none;
            font-weight: bold;
            transition: all 0.3s ease;
        }
        
        .register-link a:hover {
            color: #4DD0E1;
            text-shadow: 0 0 5px rgba(77, 208, 225, 0.5);
        }
        
        .error {
            color: #FF8A80;
            margin-top: 1rem;
            text-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
        }
        
        .success {
            color: #A5D6A7;
            margin-top: 1rem;
            text-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
        }
        
        /* Seaweed decoration */
        .seaweed {
            position: absolute;
            bottom: -10px;
            width: 30px;
            height: 100px;
            background: linear-gradient(to top, #004D40, #00897B);
            border-radius: 50% 50% 0 0 / 20%;
            transform-origin: bottom center;
            animation: sway 8s infinite ease-in-out;
            z-index: -1;
            filter: blur(1px);
            opacity: 0.8;
        }
        
        /* Coral decoration */
        .coral {
            position: absolute;
            bottom: -5px;
            height: 70px;
            width: 80px;
            background-image: radial-gradient(circle at 50% 0%, 
                                              #FF7043 10%, 
                                              #FF5722 40%, 
                                              #E64A19 90%);
            clip-path: polygon(0% 100%, 
                             20% 40%, 
                             30% 70%, 
                             40% 30%, 
                             50% 60%, 
                             60% 20%, 
                             70% 50%, 
                             80% 30%, 
                             100% 100%);
            z-index: -1;
            opacity: 0.6;
        }
        
        .seaweed:nth-child(1) {
            left: 5%;
            height: 120px;
            animation-delay: 1s;
        }
        
        .seaweed:nth-child(2) {
            left: 8%;
            height: 85px;
            animation-delay: 2s;
        }
        
        .seaweed:nth-child(3) {
            right: 5%;
            height: 110px;
        }
        
        .seaweed:nth-child(4) {
            right: 8%;
            height: 90px;
            animation-delay: 3s;
        }
        
        @keyframes sway {
            0%, 100% {
                transform: rotate(-5deg);
            }
            50% {
                transform: rotate(5deg);
            }
        }
    </style>
</head>
<body>
    <!-- Decorative elements -->
    <div class="bubble"></div>
    <div class="bubble"></div>
    <div class="bubble"></div>
    <div class="bubble"></div>
    
    <div class="seaweed"></div>
    <div class="seaweed"></div>
    <div class="seaweed"></div>
    <div class="seaweed"></div>
    
    <div class="coral" style="left: 10%;"></div>
    <div class="coral" style="right: 10%; transform: scaleX(-1);"></div>
    
    <div class="login-container">
        <h1>MaYa <span>BaY</span><br> Restaurant</h1>
        <form action="${pageContext.request.contextPath}/auth/login" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter your username" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>
            <button type="submit">Dive In</button>
            <p class="register-link">New to the depths? <a href="${pageContext.request.contextPath}/views/register.jsp">Join us</a></p>
            <c:if test="${not empty error}">
                <p class="error">${error}</p>
            </c:if>
            <c:if test="${param.registered == 'true'}">
               
            </c:if>
        </form>
    </div>

            
</body>
</html>