<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MaYa BaY - Add New User</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <style>
        /* ===== Base Styles ===== */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #e0f7fa;
            color: #003f5c;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 2rem auto;
            padding: 0 2rem;
        }

        /* ===== Form Container ===== */
        .form-container {
            background: white;
            padding: 2.5rem;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0, 150, 136, 0.1);
            border: 1px solid #b2ebf2;
            max-width: 600px;
            margin: 0 auto;
        }

        h1 {
            color: #006064;
            margin-bottom: 1.5rem;
            font-size: 2rem;
            border-bottom: 2px solid #4dd0e1;
            padding-bottom: 0.5rem;
        }

        /* ===== Form Elements ===== */
        .form-group {
            margin-bottom: 1.8rem;
        }

        label {
            display: block;
            margin-bottom: 0.6rem;
            font-weight: 600;
            color: #00838f;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        select {
            width: 100%;
            padding: 0.9rem;
            border: 1px solid #b2ebf2;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background-color: #f5fdff;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus,
        select:focus {
            outline: none;
            border-color: #00acc1;
            box-shadow: 0 0 0 3px rgba(0, 172, 193, 0.2);
            background-color: white;
        }

        /* ===== Password Strength Indicator ===== */
        .password-strength {
            margin-top: 0.5rem;
            font-size: 0.9rem;
            padding: 0.5rem;
            border-radius: 4px;
        }

        .strength-weak {
            background-color: rgba(244, 67, 54, 0.1);
            color: #d32f2f;
        }

        .strength-medium {
            background-color: rgba(255, 152, 0, 0.1);
            color: #f57c00;
        }

        .strength-strong {
            background-color: rgba(76, 175, 80, 0.1);
            color: #388e3c;
        }

        /* ===== Buttons ===== */
        .form-actions {
            margin-top: 2.5rem;
            display: flex;
            gap: 1.5rem;
        }

        .btn {
            display: inline-block;
            padding: 0.9rem 1.8rem;
            border-radius: 30px;
            font-weight: 500;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            text-align: center;
            border: none;
        }

        .btn-primary {
            background-color: #00acc1;
            color: white;
        }

        .btn-primary:hover {
            background-color: #00838f;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }

        .btn-secondary {
            background-color: #607d8b;
            color: white;
        }

        .btn-secondary:hover {
            background-color: #455a64;
            transform: translateY(-2px);
        }

        /* ===== Error Message ===== */
        .error {
            color: #d32f2f;
            margin-bottom: 1.8rem;
            padding: 1.2rem;
            background-color: rgba(211, 47, 47, 0.08);
            border-left: 4px solid #d32f2f;
            border-radius: 6px;
        }

        /* ===== Water Bubble Decorations ===== */
        .water-decoration {
            position: absolute;
            width: 100px;
            height: 100px;
            background: url('${pageContext.request.contextPath}/assets/images/water-drop.png') no-repeat;
            background-size: contain;
            opacity: 0.1;
            z-index: -1;
        }

        /* ===== Responsive Design ===== */
        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }
            
            .form-container {
                padding: 1.8rem;
            }
            
            .form-actions {
                flex-direction: column;
            }
            
            .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="water-decoration" style="top:20%; left:10%;"></div>
    <div class="water-decoration" style="bottom:15%; right:10%; transform:rotate(30deg);"></div>
    
    <jsp:include page="/views/header.jsp" />
    
    <main class="container">
        <div class="form-container">
            <h1>Add New User</h1>
            
            <c:if test="${not empty error}">
                <div class="error">${error}</div>
            </c:if>
            
            <form action="${pageContext.request.contextPath}/users/create" method="POST" id="userForm">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" required placeholder="Enter username">
                </div>
                
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" required placeholder="Enter email address">
                </div>
                
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required 
                           placeholder="Create password" onkeyup="checkPasswordStrength()">
                    <div id="passwordStrength" class="password-strength"></div>
                </div>
                
                <div class="form-group">
                    <label for="confirmPassword">Confirm Password</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" required 
                           placeholder="Confirm password">
                    <div id="passwordMatch" class="password-strength"></div>
                </div>
                
                <div class="form-group">
                    <label for="fullName">Full Name</label>
                    <input type="text" id="fullName" name="fullName" required placeholder="Enter full name">
                </div>
                
                <div class="form-group">
                    <label for="role">Role</label>
                    <select id="role" name="role" required>
                        <option value="">Select Role</option>
                        <option value="admin">Admin</option>
                        <option value="manager">Manager</option>
                        <option value="staff">Staff</option>
                    </select>
                </div>
                
                <div class="form-actions">
                    <button type="submit" class="btn btn-primary" id="submitBtn">Create User</button>
                    <a href="${pageContext.request.contextPath}/users" class="btn btn-secondary">Cancel</a>
                </div>
            </form>
        </div>
    </main>
    
    <jsp:include page="/views/footer.jsp" />
    
    <script>
        function checkPasswordStrength() {
            const password = document.getElementById('password').value;
            const strengthText = document.getElementById('passwordStrength');
            const submitBtn = document.getElementById('submitBtn');
            
            if (password.length === 0) {
                strengthText.textContent = '';
                strengthText.className = 'password-strength';
                return;
            }
            
            // Check password strength
            let strength = 0;
            if (password.length >= 8) strength++;
            if (password.match(/[a-z]/) && password.match(/[A-Z]/)) strength++;
            if (password.match(/[0-9]/)) strength++;
            if (password.match(/[^a-zA-Z0-9]/)) strength++;
            
            switch(strength) {
                case 0:
                case 1:
                    strengthText.textContent = 'Weak - Include more characters, numbers, and symbols';
                    strengthText.className = 'password-strength strength-weak';
                    break;
                case 2:
                    strengthText.textContent = 'Medium - Could be stronger with more variety';
                    strengthText.className = 'password-strength strength-medium';
                    break;
                case 3:
                case 4:
                    strengthText.textContent = 'Strong - Good password!';
                    strengthText.className = 'password-strength strength-strong';
                    break;
            }
            
            // Check password match
            const confirmPassword = document.getElementById('confirmPassword').value;
            const matchText = document.getElementById('passwordMatch');
            
            if (confirmPassword.length > 0) {
                if (password === confirmPassword) {
                    matchText.textContent = 'Passwords match';
                    matchText.className = 'password-strength strength-strong';
                    submitBtn.disabled = false;
                } else {
                    matchText.textContent = 'Passwords do not match';
                    matchText.className = 'password-strength strength-weak';
                    submitBtn.disabled = true;
                }
            } else {
                matchText.textContent = '';
                matchText.className = 'password-strength';
            }
        }
        
        document.getElementById('confirmPassword').addEventListener('keyup', checkPasswordStrength);
        
        document.getElementById('userForm').addEventListener('submit', function(e) {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            
            if (password !== confirmPassword) {
                e.preventDefault();
                alert('Passwords do not match! Please make sure both password fields match.');
                document.getElementById('password').focus();
            }
        });
    </script>
</body>
</html> 