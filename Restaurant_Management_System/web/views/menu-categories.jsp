<%@page language ="java" contentType="text/html; charset=UTF" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu Categories</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
        <style>
            .actions {
            margin-bottom: 1rem;
        }
        .btn {
            display: inline-block;
            padding: 0.5rem 1rem;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
             }
        .categories-table {
             width: 100%;
              border-collapse: collapse;
        }
         .categories-table th, .categories-table td {
               padding: 0.75rem;
               text-align: left;
               border-bottom: 1px solid #ddd;
               }
        .categories-table th {
              background-color: #f5f5f5;
        }
        .btn-sm {
             padding: 0.25rem 0.5rem;
             font-size: 0.8rem;
             margin-right: 0.5rem;
        }
          .btn-sm.delete {
               background-color: #f44336;
        }
        </style>
    </head>
    <body>
        <jsp:include page="/views/header.jsp"/>
        
        <main class="container">
            <h1>Menu Categories</h1>
            
            <div class="actions">
                <a href="${pageContext.request.contextPath}/menu-categories/new" class="btn">Add New Category</a>
            </div>
            
            <table class="categories-table">
                <thead>
                    <tr>
                        <th>Category Name</th>
                        <th>Description</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="category" items="${categorise}">
                        <tr>
                            <td>${category.categoryName}</td>
                            <td>${category.description}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/menu-categories/edit?id=${category.categoryId}"class="btn-sm">Edit</a>
                                <form method="POST" action="${pageC0ntext.request.contextPath}/menu-categories/delete" style="display: inline;">
                                    <input type="hidden" name="categoriId" value="${category.categoryId}">
                                    <button type="submit" class="btn-sm delete">Delete </button>
                                </form>
                            
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
                
            </table>
        </main>
                <jsp:include page="/views/footer.jsp"/>
    </body>
</html>
