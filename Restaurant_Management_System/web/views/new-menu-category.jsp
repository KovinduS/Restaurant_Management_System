<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MaYa BaY - Add Menu Category</title>
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
            padding: 2rem;
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
            margin-bottom: 1.5rem;
        }
        
        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
            color: #00838f;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 0.8rem;
            border: 1px solid #b2ebf2;
            border-radius: 6px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background-color: #f5fdff;
        }

        input[type="text"]:focus,
        textarea:focus {
            outline: none;
            border-color: #00acc1;
            box-shadow: 0 0 0 3px rgba(0, 172, 193, 0.2);
            background-color: white;
        }
        
        textarea {
            min-height: 120px;
            resize: vertical;
        }

        /* ===== Buttons ===== */
        .action-buttons {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
        }
        
        .btn {
            display: inline-block;
            padding: 0.7rem 1.5rem;
            background-color: #00acc1;
            color: white;
            border: none;
            border-radius: 30px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 1rem;
            text-decoration: none;
            text-align: center;
        }

        .btn:hover {
            background-color: #00838f;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
        
        .btn-cancel {
            background-color: #607d8b;
        }

        .btn-cancel:hover {
            background-color: #455a64;
        }

        /* ===== Error Message ===== */
        .error {
            color: #d32f2f;
            margin-bottom: 1.5rem;
            padding: 1rem;
            background-color: rgba(211, 47, 47, 0.05);
            border-left: 4px solid #d32f2f;
            border-radius: 4px;
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
                padding: 1.5rem;
            }
            
            .action-buttons {
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
            <h1>Add New Menu Category</h1>
            
            <c:if test="${not empty error}">
                <div class="error">${error}</div>
            </c:if>
            
            <form method="POST" action="${pageContext.request.contextPath}/menu-categories/create">
                <div class="form-group">
                    <label for="categoryName">Category Name</label>
                    <input type="text" id="categoryName" name="categoryName" required 
                           placeholder="e.g., Appetizers, Main Courses">
                </div>
                
                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea id="description" name="description" 
                              placeholder="Brief description of this category"></textarea>
                </div>
                
                <div class="action-buttons">
                    <button type="submit" class="btn">Save Category</button>
                    <a href="${pageContext.request.contextPath}/menu-categories" class="btn btn-cancel">Cancel</a>
                </div>
            </form>
        </div>
    </main>
                
                <jsp:include page="/views/footer.jsp" />
</body>
</html>
