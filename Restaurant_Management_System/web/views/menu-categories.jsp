<%@page language ="java" contentType="text/html; charset=UTF" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>MaYa BaY - Menu Categories</title>
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
            
            .container{
                max-width:1200px;
                margin:2rem auto;
                padding:0 2rem;
            }
            
            h1{
                color: #006064;
                margin-bottom: 1.5rem;
                font-size: 2.2rem;
                border-bottom: 2px solid #4dd0e1;
                padding-bottom: 0.5rem;
            }
            
            /* ===== Action Buttons ===== */
            .actions{
                margin-bottom:2rem;
            }
            
            .btn{
                display: inline-block;
                padding: 0.7rem 1.5rem;
                background-color: #00acc1;
                color:white;
                text-decoration:none;
                border-radius:30px;
                font-weight:500;
                transition: all 0.3s esse;
                border: none;
                cusor: pointer;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);   
            }
            
            .btn:hover{
                background-color: #00838f;
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            }
            
            /* ===== Categories Grid ===== */
            .categories-grid {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
                gap: 1.5rem;
            }
            
            .category-card {
                background: white;
                padding: 1.5rem;
                border-radius: 12px;
                box-shadow: 0 4px 12px rgba(0, 150, 136, 0.1);
                transition: all 0.3s ease;
                border-left: 4px solid #00acc1;
                position: relative;
                overflow: hidden;
            }
            
            .category-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 6px 15px rgba(0,0,0,0.1);
            }
            
            .category-card h3 {
                margin-top: 0;
                margin-bottom: 0.5rem;
                color: #006064;
            }
            
            .category-card p {
                color: #00838f;
                margin: 0.5rem 0;
            }
            
            .category-actions {
                margin-top: 1.5rem;
                display: flex;
                gap: 0.5rem;
            }
            
            .btn-sm {
                padding: 0.5rem 1rem;
                font-size: 0.8rem;
                border-radius: 20px;
                text-decoration: none;
                transition: all 0.2s ease;
            }
            
            .btn-edit {
                background-color: #00acc1;
                color: white;
            }
            
            .btn-edit:hover {
                background-color: #00838f;
            }
            
            .btn-delete {
                background-color: #f44336;
                color: white;
            }
            
            .btn-delete:hover {
                background-color: #d32f2f;
            }
            
            /* ===== Empty State ===== */
            .empty-state {
                text-align: center;
                padding: 2rem;
                background-color: white;
                border-radius: 12px;
                box-shadow: 0 4px 12px rgba(0, 150, 136, 0.1);
            }
            
            .empty-state p {
                color: #00838f;
                font-size: 1.1rem;
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
                
                .categories-grid {
                    grid-template-columns: 1fr;
                }
            }
    </style>
    </head>
    <body>
        <div class="water-decoration" style="top:20%; left:10%;"></div>
        <div class="water-decoration" style="bottom:15%; right:10%; transform:rotate(30deg);"></div>
        
        <jsp:include page="/views/header.jsp" />
        
        <main class="container">
            <h1>Menu Categories</h1>
            
            <div class="actions">
                <a href="${pageContext.request.contextPath}/views/menu-categories.jsp" class="btn">Add New Category</a>
            </div>
            
                <c:choose>
                    <c:when test="${not empty categories}">
                        <div class="categories-grid">
                            <c:forEach var="category" items="${categories}">
                                <div class="category-card">
                                    <h3>${category.categoryName}</h3>
                                    <p>${category.description}</p>
                                    
                                    <div class="category-actions">
                                        <a href="${pageContext.request.contextPath}/menu-categories/edit?id=${category.categoryId}"
                                           class="btn-sm btn-edit">Edit</a>
                                           <a href="${pageContext.request.contextPath}/menu-categories/delete?id=${category.categoryId}"
                                              class="btn-sm btn-delete"
                                              onclick="return confirm('Are you sure you want to delete this category?')">Delete</a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="empty-state">
                            <h3>No Categories Found</h3>
                            <p>Start by adding your first menu category</p>
                            <a href="${pageContext.request.contextPath}/menu-categories/new" class="btn">Add Category</a>
                        </div>
                    </c:otherwise>
                </c:choose>
        </main>
            <jsp:include page="/views/footer.jsp" />
            
    </body>
</html>
            