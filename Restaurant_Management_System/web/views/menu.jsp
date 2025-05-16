<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MaYa BaY - Menu Management</title>
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
                max-width: 1200px;
                margin: 2rem auto;
                padding: 0 2rem;
            }
            h1 {
                color: #006064;
                margin-bottom: 1.5rem;
                font-size: 2.2rem;
                border-bottom: 2px solid #4dd0e1;
                padding-bottom: 0.5rem;
            }
            
            /* ===== Action Buttons ===== */
            .actions {
                display: flex;
                gap: 1rem;
                margin-bottom: 2rem;
                flex-wrap: wrap;
            }
            .btn {
                display: inline-block;
                padding: 0.7rem 1.5rem;
                background-color: #00acc1;
                color: white;
                text-decoration: none;
                border-radius: 30px;
                font-weight: 500;
                transition: all 0.3s ease;
                border: none;
                cursor: pointer;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            }
            .btn:hover {
                background-color: #00838f;
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            }
            .btn-secondary {
                background-color: #607d8b;
            }
            .btn-secondary:hover {
                background-color: #455a64;
            }
            
             /* ===== Menu Categories ===== */
             .menu-categories {
                 margin-bottom: 3rem;
             }
             .category {
                 margin-bottom: 2.5rem;
                 background: white;
                 padding: 1.5rem;
                 border-radius: 12px;
                 box-shadow: 0 4px 12px rgba(0, 150, 136, 0.1);
             }
             .category h3 {
                 color: #006064;
                 border-bottom: 2px solid #4dd0e1;
                 padding-bottom: 0.5rem;
                 margin-bottom: 1.5rem;
                 font-size: 1.5rem;
             }
             /* ===== Menu Items ===== */
             .menu-items {
                 display: grid;
                 grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
                 gap: 1.5rem;
             }
             .menu-item {
                 background: #f5fdff;
                 padding: 1.5rem;
                 border-radius: 10px;
                 box-shadow: 0 2px 8px rgba(0,0,0,0.05);
                 transition: all 0.3s ease;
                 border-left: 4px solid #4dd0e1;
                 position: relative;
                 overflow: hidden;
             }
             .menu-item.unavailable {
                 border-left-color: #f44336;
                 background-color: rgba(244, 67, 54, 0.05);
             }
             .menu-item:hover {
                 transform: translateY(-5px);
                 box-shadow: 0 5px 15px rgba(0,0,0,0.1);
             }
             .menu-item h4 {
                 margin-top: 0;
                 margin-bottom: 0.5rem;
                 color: #006064;
                 font-size: 1.2rem;
             }
             .menu-item .price {
                 font-weight: bold;
                 color: #00acc1;
                 margin: 0.5rem 0;
                 font-size: 1.1rem;
             }
             .menu-item .description {
                 color: #00838f;
                 margin: 0.5rem 0;
                 font-size: 0.95rem;
             }
             .menu-item-actions {
                 display: flex;
                 gap: 0.5rem;
                 margin-top: 1rem;
                 flex-wrap: wrap;
             }
             .status-badge {
                 display: inline-block;
                 padding: 0.4rem 0.8rem;
                 border-radius: 20px;
                 font-size: 0.8rem;
                 font-weight: 600;
             }
             .status-available {
                 background-color: #4CAF50;
                 color: white;
             }
             .status-unavailable {
                 background-color: #f44336;
                 color: white;
             }
             .toggle-btn {
                 padding: 0.5rem 1rem;
                 border-radius: 20px;
                 font-size: 0.8rem;
                 font-weight: 500;
                 cursor: pointer;
                 border: none;
                 transition: all 0.2s ease;
             }
             .toggle-available {
                 background-color: #4CAF50;
                 color: white;
             }
             .toggle-unavailable {
                 background-color: #f44336;
                 color: white;
             }
             .toggle-btn:hover {
                 opacity: 0.9;
                 transform: translateY(-1px);
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
                  .menu-items {
                      grid-template-columns: 1fr;
                  }
                  .actions {
                      flex-direction: column;
                  }
                  .btn {
                      width: 100%;
                      text-align: center;
                  }
             }
        
        </style>
    </head>
    <body>
        <div class="water-decoration" style="top:20%; left:10%;"></div>
        <div class="water-decoration" style="bottom:15%; right:10%; transform:rotate(30deg);"></div>
    
        <jsp:include page="/views/header.jsp"/>
        <main class="container">
           
        <h1>Menu Management</h1>   
                
        <div class="actions">
            <a href="${pageContext.request.contextPath}/menu/new" class="btn">Add New Menu Item</a>
            <a href="${pageContext.request.contextPath}/menu-categories" class="btn btn-secondary">Manage Categories</a>
            </div>
            
            <div class="menu-categories">
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
                                        
                                        <div class="menu-item-actions">
                                        <span class="availability ${item.availabile ? '' : 'unavailable'}">
                                            ${item.available ? 'Available' : 'Unavailable'}
                                        </span>
                                        <button class="toggle-btn ${item.available ? 'toggle-unavailable' : 'toggle-available'}" 
                                            onclick="toggleAvailability(${item.itemId}, ${!item.available})">
                                            Mark as ${item.available ? 'Unavailable' : 'Available'}
                                        </button>
                                        </div>
                                        
                                       
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
                function toggleAvailability(itemId, isAvailable) {
            if (confirm(Are you sure you want to mark this item as ${isAvailable ? 'Available' : 'Unavailable'}?)) {
                const form = document.createElement('form');
                form.method = 'POST';
                form.action = '${pageContext.request.contextPath}/menu/update-availability';
                
                const itemIdInput = document.createElement('input');
                itemIdInput.type = 'hidden';
                itemIdInput.name = 'itemId';
                itemIdInput.value = itemId;
                form.appendChild(itemIdInput);
                
                const isAvailableInput = document.createElement('input');
                isAvailableInput.type = 'hidden';
                isAvailableInput.name = 'isAvailable';
                isAvailableInput.value = isAvailable;
                form.appendChild(isAvailableInput);
                
                document.body.appendChild(form);
                form.submit();
            }
        }
                 </script>
                </body>
            </html>
