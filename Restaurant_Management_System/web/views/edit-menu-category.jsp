<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Menu Category</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <style>
        .form-container {
            max-width: 500px;
            margin: 0 auto;
            background: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 1rem;
        }
        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: bold;
        }
        .form-group input, .form-group textarea {
            width: 100%;
            padding: 0.5rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .form-group textarea {
            min-height: 100px;
        }
        .btn {
            display: inline-block;
            padding: 0.5rem 1rem;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            border: none;
            cursor: pointer;
        }
        .error {
            color: #f44336;
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>
    <jsp:include page="/views/header.jsp" />
    
    <main class="container">
        <div class="form-container">
            <h1>Edit Menu Category</h1>
            
            <c:if test="${not empty error}">
                <p class="error">${error}</p>
            </c:if>
            
            <form method="POST" action="${pageContext.request.contextPath}/menu-categories/update">
                <input type="hidden" name="categoryId" value="${category.categoryId}">
                <div class="form-group">
                    <label for="categoryName">Category Name</label>
                    <input type="text" id="categoryName" name="categoryName" value="${category.categoryName}" required>
                </div>
                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea id="description" name="description">${category.description}</textarea>
                </div>
                <button type="submit" class="btn">Update Category</button>
                <a href="${pageContext.request.contextPath}/menu-categories" class="btn" style="background-color: #607d8b;">Cancel</a>
            </form>
        </div>
    </main>
    
    <jsp:include page="/views/footer.jsp" />
</body>
</html>