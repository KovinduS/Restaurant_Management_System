<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu Management</title>
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
        .btn:hover {
            background-color: #45a049;
        }
        .menu-categories {
            margin-bottom: 2rem;
        }
        .category {
            margin-bottom: 1.5rem;
        }
        .category h3 {
            border-bottom: 2px solid #4CAF50;
            padding-bottom: 0.5rem;
            margin-bottom: 1rem;
        }
         .menu-items {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 1rem;
        }
        .menu-item {
            background: white;
            padding: 1rem;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-left: 4px solid #4CAF50;
        }
        .menu-item.unavailable {
            opacity: 0.7;
            border-left-color: #f44336;
        }
        .menu-item h4 {
            margin-top: 0;
            margin-bottom: 0.5rem;
        }
        .menu-item .price {
            font-weight: bold;
            color: #4CAF50;
            margin: 0.5rem 0;
        }
        .menu-item .description {
            color: #555;
            margin: 0.5rem 0;
        }
        .menu-item .availability {
            display: inline-block;
            padding: 0.25rem 0.5rem;
            border-radius: 4px;
            font-size: 0.8rem;
            font-weight: bold;
            margin-top: 0.5rem;
        }
        .available {
            background-color: #4CAF50;
            color: white;
        }
        .unavailable {
            background-color: #f44336;
            color: white;
        }
        .toggle-availability {
            margin-top: 0.5rem;
            display: inline-block;
            padding: 0.25rem 0.5rem;
            background-color: #2196F3;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-size: 0.8rem;
        }
        
        </style>
    </head>
    <body>
        <jsp:include page="/views/header.jsp"/>
        <main class="container">
           
        <h1>Menu Management</h1>   
                
        <div class="action">
            <a href="${pageContext.request.contextPath}/menu/new" class="btn">Add New Menu Item</a>
            </div>
            
            <div class="menu-category">
                <c:forEach var = "category" items="${categories}">
                    <div class="category">
                        <h3>${category.categoryName}</h3>
                        <div class="menu-items">
                            <c:forEach var = "item" items="${menuItems}">
                                <c:if test="${item.categoryId == category.categoryId}">
                                    <div class="menu-item ${item.available ? '' : 'unavailabale'}">
                                        <h4>${item.itemName}</h4>
                                        <p class="price">$${item.price}</p>
                                        <p class="description">${item.description}</p>
                                        <span class="availability ${item.availabile ? '' : 'unavailable'}">
                                            ${item.available ? 'Available' : 'Unavailable'}
                                        </span>
                                        <a href="#" class="toggle-availability"
                                                onclick=toggleAvailability(${item.itemId}, ${!item.available})">
                                             Mark as ${item.available ? 'unavailable' : 'Available'}
                                        </a>
                                               </div>
                                                 </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </c:forEach>    
            </div>
            </main>
            
            <jsp:include page="views/fotter.jsp"/>
            
            <script>
                <function toggleAvailability(itemId, isAvailable>
                const form = document.createElement('form');
                form.method = 'POST';
                form.action= '${pageContext.request.contextPath}/menu/update-availability';
                
                const itemIdInput = document.createElement('input');
                itemIdInput.type = 'hidden';
                itemIdInput.name = 'itemId';
                itemIdInput.value = 'itemId';
                form.appendChild(itemIdInput);
                
                const is AvailableInput = document.createElement('inout');
                isAvailableInput.type = 'hidden';
                isAvailableInputName.name = 'isAvailable';
                isAvailableInput.value = isAvailable;
                form.appendChild(isAvailableInput);
                
                document.body.appendChild(form);
                form.submit();
                 
                 </script>
                </body>
            </html>
