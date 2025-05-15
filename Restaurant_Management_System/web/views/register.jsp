<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="UTF-8">
        <title>Maya Bay Restaurant - Join Us</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assests/css/style.css">
        <style>
            
            @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600&family=Poppins:wght@300;400;600&display=swap');
            
            body{
                font-family: 'Poppins',Arial, sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
                min-height: 100vh;
                justify-content: center;
                align-items: center;
                background: url('${pageContext.request.contextPath}/assets/images/cor1.png');
                background-size: cover;
                background-position: center;
                background-attachment: fixed;
                overflow-x: hidden;
                position: relative;
            }
            /* Ocean background with parallax effect */
            .ocean-bg {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                z-index: -10;
            }
            /* Light rays */
            .light-rays {
                position: absolute;
                top: -50%;
                left: 30%;
                width: 40%;
                height: 200%;
                background: linear-gradient(180deg, 
                    rgba(255, 255, 255, 0.15) 0%, 
                    rgba(255, 255, 255, 0) 100%);
                transform: rotate(-30deg);
                animation: lightShift 15s infinite alternate ease-in-out;
                z-index: -5;
                
            }
            
            .light-rays:nth-child(2) {
                left: 10%;
                width: 20%;
                animation-delay: 2s;
                opacity: 0.7;
            }
            
            .light-rays:nth-child(3) {
                left: 60%;
                width: 25%;
                animation-delay: 5s;
                opacity: 0.5;
            }
            
            @keyframes lightShift {
                0% {
                    transform: rotate(-35deg) translateY(0);
                    opacity: 0.1;
                }
                50% {
                    opacity: 0.3;
                }
                100% {
                    transform: rotate(-25deg) translateY(-10%);
                opacity: 0.15;
                }
            }
            /* Particles */
            .particles {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                z-index: -4;
                opacity: 0.5;
            }
            .particle {
                position: absolute;
                width: 3px;
                height: 3px;
                background-color: rgba(255, 255, 255, 0.5);
                border-radius: 50%;
                animation: particleFloat linear infinite;
            }
            @keyframes particleFloat {
            0% {
                transform: translateY(100vh);
            }
            100% {
                transform: translateY(-20px);
            }
        }
        
        /* Generate 20 particles with different positions and animati0-on durations */
        .particle:nth-child(1) { left: 5%; animation-duration: 30s; }
        .particle:nth-child(2) { left: 15%; animation-duration: 24s; animation-delay: 2s; }
        .particle:nth-child(3) { left: 25%; animation-duration: 36s; animation-delay: 5s; }
        .particle:nth-child(4) { left: 35%; animation-duration: 18s; animation-delay: 1s; }
        .particle:nth-child(5) { left: 45%; animation-duration: 22s; animation-delay: 4s; }
        .particle:nth-child(6) { left: 55%; animation-duration: 28s; animation-delay: 3s; }
        .particle:nth-child(7) { left: 65%; animation-duration: 32s; animation-delay: 7s; }
        .particle:nth-child(8) { left: 75%; animation-duration: 26s; animation-delay: 0s; }
        .particle:nth-child(9) { left: 85%; animation-duration: 20s; animation-delay: 6s; }
        .particle:nth-child(10) { left: 95%; animation-duration: 34s; animation-delay: 8s; }
        .particle:nth-child(11) { left: 10%; animation-duration: 21s; animation-delay: 9s; }
        .particle:nth-child(12) { left: 20%; animation-duration: 25s; animation-delay: 11s; }
        .particle:nth-child(13) { left: 30%; animation-duration: 19s; animation-delay: 7s; }
        .particle:nth-child(14) { left: 40%; animation-duration: 33s; animation-delay: 5s; }
        .particle:nth-child(15) { left: 50%; animation-duration: 27s; animation-delay: 2s; }
        .particle:nth-child(16) { left: 60%; animation-duration: 23s; animation-delay: 4s; }
        .particle:nth-child(17) { left: 70%; animation-duration: 29s; animation-delay: 1s; }
        .particle:nth-child(18) { left: 80%; animation-duration: 35s; animation-delay: 8s; }
        .particle:nth-child(19) { left: 90%; animation-duration: 31s; animation-delay: 3s; }
        .particle:nth-child(20) { left: 97%; animation-duration: 17s; animation-delay: 6s; }
        
        /* Registration container */
        .register-container {
            width: 420px;
            padding: 2.5rem;
            border-radius: 18px;
            position: relative;
            z-index: 10;
            background: rgba(5, 57, 97, 0.5);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(8px);
            border: 1px solid rgba(255, 255, 255, 0.15);
            overflow: hidden;
            margin: 20px;
        }
        /* Glassmorphism effect */
        .register-container::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(
                circle at 30% 30%,
                rgba(255, 255, 255, 0.1),
                transparent 30%
            );
             z-index: -1;
        }
         /* Container waves */
         .wave {
             position: absolute;
             bottom: 0;
             left: 0;
             width: 100%;
             height: 50px;
             background: url('data:image/svg+xml;utf8,<svg viewBox="0 0 1200 120" xmlns="http://www.w3.org/2000/svg"><path d="M0,0V46.29c47.79,22.2,103.59,32.17,158,28,70.36-5.37,136.33-33.31,206.8-37.5C438.64,32.43,512.34,53.67,583,72.05c69.27,18,138.3,24.88,209.4,13.08,36.15-6,69.85-17.84,104.45-29.34C989.49,25,1113-14.29,1200,52.47V0Z" opacity=".25" fill="%230099cc" /></svg>') repeat-x;
             background-size: 1200px 50px;
             animation: waveAnim 20s linear infinite;
             z-index: -1;
         }
         .wave:nth-of-type(2) {
             bottom: 10px;
             height: 40px;
             background-size: 1000px 40px;
             opacity: 0.7;
             animation-duration: 15s;
             animation-direction: reverse;
         }
         @keyframes waveAnim {
             0% {
                background-position-x: 0;
            }
            100% {
                background-position-x: 1200px;
            }
        }
        
        /* Header styles */
        .register-header {
            text-align: center;
            margin-bottom: 1.5rem;
            position: relative;
        }
        .register-header h1 {
            font-family: 'Montserrat', sans-serif;
            font-weight: 600;
            font-size: 2rem;
            color: #ffffff;
            margin-bottom: 0.5rem;
            text-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
            position: relative;
            display: inline-block;
        }
        .register-header p {
            color: #B2E4F9;
            font-size: 1rem;
            margin-top: 0;
        }
        /* Form styles */
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
        /* Button styles */
        button {
            width: 100%;
            padding: 1rem;
            background: linear-gradient(135deg, #00BFA5, #00B0FF);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 1.1rem;
            font-weight: 600;
            font-family: 'Montserrat', sans-serif;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(0, 186, 165, 0.3);
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
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
            transition: all 0.6s ease;
        }
        button:hover {
            background: linear-gradient(135deg, #00A896, #0091EA);
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(0, 186, 165, 0.4);
        }
        button:hover::before {
            left: 100%;
        }
        button:active {
            transform: translateY(0);
            box-shadow: 0 2px 8px rgba(0, 186, 165, 0.3);
        }
        /* Login link styles */
        .login-link {
            text-align: center;
            margin-top: 1.5rem;
            color: #B2E4F9;
            font-size: 0.95rem;
        }
        .login-link a {
            color: #4CDBFF;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            position: relative;
        }
        .login-link a::after {
            content: '';
            position: absolute;
            width: 0;
            height: 1px;
            bottom: -2px;
            left: 0;
            background-color: #4CDBFF;
            transition: width 0.3s ease;
        }
        .login-link a:hover {
            color: #80E8FF;
            text-shadow: 0 0 8px rgba(76, 219, 255, 0.5);
        }
        .login-link a:hover::after {
            width: 100%;
        }
        /* Error message styles */
        .error {
            color: #FF8A80;
            background: rgba(255, 0, 0, 0.1);
            padding: 0.75rem;
            border-radius: 6px;
            margin-top: 1rem;
            font-size: 0.9rem;
            text-align: center;
            border-left: 3px solid #FF5252;
        }
        /* Fish decorations */
        .fish {
            position: absolute;
            z-index: -1;
            opacity: 0.6;
            filter: blur(1px);
            animation: fishSwim 30s linear infinite;
        }
        .fish-1 {
            top: 15%;
            left: -100px;
            width: 60px;
            height: 30px;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 50' fill='%2380D8FF'%3E%3Cpath d='M95,25c0,0-20,25-50,25S5,37.5,5,25S25,0,45,0S95,25,95,25z M25,20c-2.8,0-5,2.2-5,5s2.2,5,5,5s5-2.2,5-5S27.8,20,25,20z'/%3E%3C/svg%3E");
            animation-duration: 15s;
        }
        .fish-2 {
            top: 40%;
            left: -80px;
            width: 40px;
            height: 20px;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 50' fill='%234FC3F7'%3E%3Cpath d='M95,25c0,0-20,25-50,25S5,37.5,5,25S25,0,45,0S95,25,95,25z M25,20c-2.8,0-5,2.2-5,5s2.2,5,5,5s5-2.2,5-5S27.8,20,25,20z'/%3E%3C/svg%3E");
            animation-duration: 20s;
            animation-delay: 2s;
        }
        .fish-3 {
            top: 70%;
            left: -120px;
            width: 80px;
            height: 40px;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 50' fill='%2329B6F6'%3E%3Cpath d='M95,25c0,0-20,25-50,25S5,37.5,5,25S25,0,45,0S95,25,95,25z M25,20c-2.8,0-5,2.2-5,5s2.2,5,5,5s5-2.2,5-5S27.8,20,25,20z'/%3E%3C/svg%3E");
            animation-duration: 25s;
            animation-delay: 5s;
        }
        .fish-4 {
            top: 25%;
            right: -100px;
            width: 50px;
            height: 25px;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 50' fill='%2303A9F4'%3E%3Cpath d='M5,25c0,0,20,25,50,25s40-12.5,40-25S75,0,55,0S5,25,5,25z M75,20c2.8,0,5,2.2,5,5s-2.2,5-5,5s-5-2.2-5-5S72.2,20,75,20z'/%3E%3C/svg%3E");
            animation-duration: 18s;
            animation-direction: reverse;
        }
        .fish-5 {
            top: 60%;
            right: -70px;
            width: 45px;
            height: 23px;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 50' fill='%230288D1'%3E%3Cpath d='M5,25c0,0,20,25,50,25s40-12.5,40-25S75,0,55,0S5,25,5,25z M75,20c2.8,0,5,2.2,5,5s-2.2,5-5,5s-5-2.2-5-5S72.2,20,75,20z'/%3E%3C/svg%3E");
            animation-duration: 22s;
            animation-direction: reverse;
            animation-delay: 3s;
        }
        @keyframes fishSwim {
            0% {
                transform: translateX(0) scaleY(1);
            }
            50% {
                transform: translateX(calc(100vw + 150px)) scaleY(0.95);
            }
            50.01% {
                transform: translateX(calc(-100vw - 150px)) scaleY(0.95);
            }
            100% {
                transform: translateX(0) scaleY(1);
            }
        }
        /* Responsive design */
        @media screen and (max-width: 480px) {
            .register-container {
                width: 90%;
                padding: 1.5rem;
                margin: 10px;
             }
              .register-header h1 {
                font-size: 1.7rem;
            }
            .form-group input {
                padding: 0.75rem;
            }
            button {
                padding: 0.85rem;
            }
        }
            </style>
    </head>
    <body>
         <!-- Ocean background -->
    <div class="ocean-bg">
        <div class="light-rays"></div>
        <div class="light-rays"></div>
        <div class="light-rays"></div>
    </div>
    
    <!-- Particles -->
    <div class="particles">
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
    </div>
    
    <!-- Swimming fish -->
    <div class="fish fish-1"></div>
    <div class="fish fish-2"></div>
    <div class="fish fish-3"></div>
    <div class="fish fish-4"></div>
    <div class="fish fish-5"></div>
    
    <!-- Registration form -->
    <div class="register-container">
        <!-- Wave effects -->
        <div class="wave"></div>
        <div class="wave"></div>
        
        <div class="register-header">
            <h1>Join MaYa BaY</h1>
            <p>Dive into an underwater culinary experience</p>
        </div>
            <form action="${pageContext.request.contextPath}/auth/register" method="post">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" placeholder="Choose your underwater identity" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="text" id="password" name="password" placeholder="Your secret coral code" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="text" id="email" name="email" placeholder="your.email@example.com" required>
                </div>
                <div class="form-group">
                    <label for="fullname">Full Name</label>
                    <input type="text" id="fullname" name="fullname" placeholder="Your name as it appears above water" required>
                </div>
                <button type="submit">Begin Your Ocean Journey</button>
                <p class="login-link">Already a seafarer?<a href="${pageContext.request.contextPath}/views/login.jsp">Return to your journey</a></p>

                <c:if tes="${not empty error}">
                    <p class="error">${error}</p>
                
                </c:if>
            </form>
        </div>

    </body>
</html>         
                             
            
    
            
            
