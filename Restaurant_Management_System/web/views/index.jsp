<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Maya Bay - Underwater Restaurant</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <style>
        /* Reset and Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f8ff; 
            color: #333;  
            line-height: 1.6;
        }
        
        /* Header Styles */
        header {
            background: linear-gradient(rgba(0, 46, 76, 0.8), rgba(0, 92, 151, 0.7));
            color: white;
            padding: 0.5rem 0;
            position: fixed;
            width: 100%;
            z-index: 1000;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        }
        
        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
        }
        
        .logo {
            font-size: 2rem;
            font-weight: bold;
            color: #fff;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
        }
        
        .logo span {
            color: #64dfdf;
        }
        
        nav ul {
            display: flex;
            list-style: none;
        }
        
        nav ul li {
            margin-left: 2rem;
        }
        
        nav ul li a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            transition: all 0.3s ease;
        }
        
        nav ul li a:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }
        
        .auth-buttons a {
            display: inline-block;
            padding: 0.6rem 1.2rem;
            margin-left: 1rem;
            border-radius: 4px;
            text-decoration: none;
            font-weight: bold;
            transition: all 0.3s ease;
        }
        
        .login-btn {
            background-color: transparent;
            color: white;
            border: 2px solid white;
        }
        
        .login-btn:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }
        
        .register-btn {
            background-color: #00a8cc;
            color: white;
            border: 2px solid #00a8cc;
        }
        
        .register-btn:hover {
            background-color: #0096b7;
            border-color: #0096b7;
        }
        
        /* Hero Section with Carousel */
        .hero {
            height: 100vh;
            position: relative;
            overflow: hidden;
        }
        
        .carousel {
            width: 100%;
            height: 100%;
            position: relative;
        }
        
        .carousel-slide {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0;
            transition: opacity 1s ease-in-out;  
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }
        
        .carousel-slide.active {
            opacity: 1;
        }
        
        .carousel-content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            color: white;
            z-index: 10;
            width: 80%;
            max-width: 800px;
            padding: 2rem;
          /*  background-color: rgba(0, 46, 76, 0.7); */
            border-radius: 8px;
         /*   box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3); */
        }
        .carousel-content  span {
            color: #64dfdf;
        }
        
        .carousel-content h1 {
            font-size: 3.5rem;
            margin-bottom: 1rem;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
        }
        
        .carousel-content p {
            font-size: 1.2rem;
            margin-bottom: 2rem;
            text-shadow: 0 1px 2px rgba(0, 0, 0, 0.5);
        }
        
        .carousel-btn {
            display: inline-block;
            padding: 1rem 2rem;
            background-color: #00a8cc;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-weight: bold;
            transition: all 0.3s ease;
            margin: 0 0.5rem;
        }
        
        .carousel-btn:hover {
            background-color: #0096b7;
            transform: translateY(-3px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        
        .carousel-controls {
            position: absolute;
            bottom: 8rem;
            left: 50%;
            transform: translateX(-50%);
            display: flex;
            z-index: 10;
         
        }
        
        .carousel-dot {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            background-color: rgba(255, 255, 255, 0.5);
            margin: 0 8px;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .carousel-dot.active {
            background-color: white;
            transform: scale(1.3);
        }
        
        .carousel-arrows {
            position: absolute;
            top: 50%;
            width: 100%;
            display: flex;
            justify-content: space-between;
            padding: 0 2rem;
            z-index: 10;
        }
        
        .carousel-arrow {
            width: 50px;
            height: 50px;
            background-color: rgba(0, 0, 0, 0.5);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            cursor: pointer;
            font-size: 1.5rem;
            transition: all 0.3s ease;
        }
        
        .carousel-arrow:hover {
            background-color: rgba(0, 0, 0, 0.8);
        }
        
        /* Overlay for carousel images */
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(to bottom, rgba(0, 0, 0, 0.4), rgba(0, 65, 106, 0.7));
        }
        
        /* Footer */
        footer {
            background: linear-gradient(rgba(0, 46, 76, 0.8), rgba(0, 92, 151, 0.7));
            color: white;
            text-align: center;
            padding: 0.5rem 0;
        }
        
        .footer-content {
            max-width: 1200px;
            margin: 0 auto;
/*            display: flex;*/
            flex-direction: column;
            align-items: center;
        }
        
        .footer-links {
/*            display: flex;*/
            margin-bottom: 1rem;
        }
        
        .footer-links a {
            color: white;
            margin: 0 1rem;
            text-decoration: none;
        }
        
        .footer-links a:hover {
            text-decoration: underline;
        }
        
        .footer-text {
            font-size: 0.9rem;
            color: rgba(255, 255, 255, 0.7);
        }

        /* Media Queries */
        @media (max-width: 768px) {
            .header-container {
                flex-direction: column;
                padding: 1rem;
            }
            
            nav ul {
                margin-top: 1rem;
            }
            
            nav ul li {
                margin-left: 0.5rem;
                margin-right: 0.5rem;
            }
            
            .auth-buttons {
                margin-top: 1rem;
            }
            
            .carousel-content h1 {
                font-size: 2.5rem;
            }
            
            .carousel-content p {
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="header-container">
            <div class="logo">MaYa <span>BaY</span></div>
            
            <div class="auth-buttons">
                <a href="${pageContext.request.contextPath}/views/login.jsp" class="login-btn">Login</a>
                <a href="${pageContext.request.contextPath}/views/register.jsp" class="register-btn">Register</a>
            </div>
        </div>
    </header>

    <section class="hero">
        <div class="carousel">
            <div class="carousel-slide active" style="background-image: url('${pageContext.request.contextPath}/assets/images/bg2.png');">
                <div class="overlay"></div>
            </div>
            <div class="carousel-slide" style="background-image: url('${pageContext.request.contextPath}/assets/images/bg6.png');">
                <div class="overlay"></div>
            </div>
            <div class="carousel-slide" style="background-image: url('${pageContext.request.contextPath}/assets/images/bg3.png');">
                <div class="overlay"></div>
            </div>
            <div class="carousel-slide" style="background-image: url('${pageContext.request.contextPath}/assets/images/bg5.png');">
                <div class="overlay"></div>
            </div>
            
            <div class="carousel-content">
                <h1>Welcome to   MaYa <span>BaY</span></h1>
                <p>Experience the extraordinary underwater dining in a magical setting surrounded by vibrant marine life.</p>
                
            </div>
            
            <div class="carousel-controls">
                <div class="carousel-dot active" data-slide="0"></div>
                <div class="carousel-dot" data-slide="1"></div>
                <div class="carousel-dot" data-slide="2"></div>
                <div class="carousel-dot" data-slide="3"></div>
            </div>
            
            <div class="carousel-arrows">
                <div class="carousel-arrow prev">&lt;</div>
                <div class="carousel-arrow next">&gt;</div>
            </div>
        </div>
    </section>
        <footer>
     <div class="footer-content">
            <div class="footer-links">
                <a href="#">Privacy Policy</a>
                <a href="#">Terms of Service</a>
             
            </div>
            <p class="footer-text"> &copy; <%= new java.util.Date().getYear() + 1900 %> Maya Bay Restaurant | <%= new java.util.Date() %></p>
        </div>

    </footer>

    <script>
        // Image Carousel Functionality
        document.addEventListener('DOMContentLoaded', function() {
            const slides = document.querySelectorAll('.carousel-slide');
            const dots = document.querySelectorAll('.carousel-dot');
            const prevBtn = document.querySelector('.carousel-arrow.prev');
            const nextBtn = document.querySelector('.carousel-arrow.next');
            let currentSlide = 0;
            
            // Function to update the current slide
            function showSlide(n) {
                // Remove active class from all slides and dots
                slides.forEach(slide => slide.classList.remove('active'));
                dots.forEach(dot => dot.classList.remove('active'));
                
                // Update current slide index
                currentSlide = (n + slides.length) % slides.length;
                
                // Add active class to current slide and dot
                slides[currentSlide].classList.add('active');
                dots[currentSlide].classList.add('active');
            }
            
            // Event listeners for dots
            dots.forEach((dot, index) => {
                dot.addEventListener('click', () => {
                    showSlide(index);
                });
            });
            
            // Event listeners for arrows
            prevBtn.addEventListener('click', () => {
                showSlide(currentSlide - 1);
            });
            
            nextBtn.addEventListener('click', () => {
                showSlide(currentSlide + 1);
            });
            
            // Auto slide every 5 seconds
            setInterval(() => {
                showSlide(currentSlide + 1);
            }, 5000);
        });
    </script>
</body>
</html>