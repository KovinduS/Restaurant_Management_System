<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Edit Menu Category</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
        <style>
            .form-container{
                max-width: 500px;
                margin: 0 auto;
                background: white;
                padding: 2rem;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgda(0,0,0,0.1);
            }
            .form-grop{
                margin-bottom: lrem;
            }
            .form-group label{
                display: black;
                margin-bottom:0.5rem;
                font-weight: bold;
            }
            .form-group input, .form-group texarea{
                width: 100%;
                padding:0.5rem;
                border: 1px solid #ddd;
                border-radius: 4px;
                box-sizing:border-box;
            }
            .form-group texarea{
                min-height: 100px;
            }
            .btn{
                dispaly: inline-block;
                padding: 0.5rem lrem;
                background-color: #4CAF50;
                color: white;
                text-decoration: none;
                border-redius:4px;
                border: none;
                curson: pointer;
            }
            .error{
                color:#f44336;
                margin-bottom: lrem;
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
                            <lable for="categoryName">Category Name</lable>
                             <input type="text" id="categoryName" name="categoryName" value="${category.categoryName}" required>
                        </div>
                        <div class="form-group">
                            <lable for="description">Description</lable>
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
