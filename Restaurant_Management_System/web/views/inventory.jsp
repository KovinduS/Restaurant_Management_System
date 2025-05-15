<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
        <meta charset="UTF-8">
        <title>MaYa BaY - Inventory Management</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
        <style>
            /*===== base stylles ===== */
            body{
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
            
            h1{
               color: #006064;
               margin-bottom: 1.5rem;
               font-size: 2.2rem;
               border-bottom: 2px solid #4dd0e1;
               padding-bottom: 0.5rem;
            }
            
            /* ===== Action Buttons ===== */
            .actions {
                margin-bottom: 2rem;
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
            
            /* ===== Inventory Sections ===== */
            .inventory-section {
                margin-bottom: 3rem;
                background: white;
                padding: 1.5rem;
                border-radius: 12px;
                box-shadow: 0 4px 12px rgba(0, 150, 136, 0.1);
            }
            
            .inventory-section h2 {
                color: #006064;
                border-bottom: 2px solid #4dd0e1;
                padding-bottom: 0.5rem;
                margin-bottom: 1.5rem;
                font-size: 1.5rem;
            }
            
            /* ===== Inventory Tables ===== */
            .inventory-table {
                width: 100%;
                border-collapse: collapse;
                background-color: white;
                border-radius: 10px;
                overflow: hidden;
            }
            
            .inventory-table th, .inventory-table td {
                padding: 1rem;
                text-align: left;
                border-bottom: 1px solid #e0f7fa;
            }
            
            .inventory-table th {
                background-color: #00acc1;
                color: white;
                font-weight: 500;
            }
            
            .inventory-table tr:hover {
                background-color: #f5fdff;
            }
            
            /* ===== Stock Status Indicators ===== */
            .low-stock {
                background-color: rgba(255, 152, 0, 0.1);
            }
            
            .critical-stock {
                background-color: rgba(244, 67, 54, 0.1);
                font-weight: bold;
            }
            
            .stock-indicator {
                display: inline-block;
                width: 12px;
                height: 12px;
                border-radius: 50%;
                margin-right: 0.5rem;
            }
            
            .stock-normal {
                background-color: #4CAF50;
            }
                
            .stock-low {
                background-color: #FF9800;
            }
            
            .stock-critical {
                background-color: #F44336;
            }
            
            /* ===== Quantity Form ===== */
            .quantity-form {
                display: flex;
                align-items: center;
                gap:0.5rem;
            }
            
            .quantity-input {
                width: 80px;
                padding:0.5rem;
                border:1px solid #b2ebf2;
                border-radius:6px;
                text-align: center;
            }
            
            .update-btn {
                padding: 0.5rem 1rem;
                background-color: #00acc1;
                color: white;
                border: none;
                border-radius: 20px;
                font-size: 0.8rem;
                font-weight: 500;
                cursor: pointer;
                transition: all 0.2s ease;
            }
              
            .update-btn:hover {
                background-color: #00838f;
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
              
              .inventory-table {
                  display: block;
                  overflow-x: auto;
              }
              
              .quantity-form {
                  flex-direction: column;
                  align-items: flex-start;
              }   
              
              .update-btn {
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
            <h1>Inventory Management</h1>
            
            <div class="actions">
                <a href="${pageContext.request.contextPath}/inventory/new" class="btn">Add New Inventory Item</a>
            </div>
            
            <div class="inventory-section">
                <h2>⚠ Low Stock Alerts</h2>
                <table class="inventory-table">
                    <thead>
                        <tr>
                            <th>Item</th>
                            <th>Status</th>
                            <th>Quantity</th>
                            <th>Unit</th>
                            <th>Reorder Level</th>
                            <th>Last Updated</th>
                            <th>Update</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${lowStockItems}">
                            <tr class="${item.quantity <= item.reorderLevel * 0.5 ? 'critical-stock' : 'low-stock'}">
                            <td>${item.itemName}</td>
                            <td>
                                <span class="stock-indicator ${item.quantity <= item.reorderLevel * 0.5 ? 'stock-critical' : 'stock-low'}"></span>
                                ${item.quantity <= item.reorderLevel * 0.5 ? 'Critical' : 'Low'}
                            </td>
                            <td>${item.quantity}</td>
                            <td>${item.unit}</td>
                            <td>${item.reorderLevel}</td>
                            <td>${item.lastUpdated}</td>
                            <td>
                                <form class="quantity-form" method="POST" action="${pageContext.request.contextPath}/inventory/update-quantity">
                                <input type="hidden" name="inventoryId" value="${item.inventoryId}">
                                <input type="number" name="quantity" class="quantity-input" step="0.01" min="0" value="${item.quantity}">
                                <button type="submit" class="update-btn">Update</button>
                                </form>
                            </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            
            <div class="inventory-section">
                <h2>All Inventory Items</h2>
                <table class="inventory-table">
                    <thead>
                        <tr>
                            <th>Item</th>
                            <th>Status</th>
                            <th>Quantity</th>
                            <th>Unit</th>
                            <th>Reorder Level</th>
                            <th>Last Updated</th>
                            <th>Update</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${inventoryItems}">
                            <tr>
                                <td>${item.itemName}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${item.quantity <= item.reorderLevel * 0.5}">
                                            <span class="stock-indicator stock-critical"></span> Critical
                                        </c:when>
                                        <c:when test="${item.quantity <= item.reorderLevel}">
                                            <span class="stock-indicator stock-low"></span> Low
                                        </c:when>
                                        <c:otherwise>
                                            <span class="stock-indicator stock-normal"></span> Normal
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${item.quantity}</td>
                                <td>${item.unit}</td>
                                <td>${item.reorderLevel}</td>
                                <td>${item.lastUpdated}</td>
                                <td>
                                    <form class="quantity-form" method="POST" action="${pageContext.request.contextPath}/inventory/update-quantity">
                                    <input type="hidden" name="inventoryId" value="${item.inventoryId}">
                                    <input type="number" name="quantity" class="quantity-input" step="0.01" min="0" value="${item.quantity}">
                                    <button type="submit" class="update-btn">Update</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </main>
            
            <jsp:include page="/views/footer.jsp" />
    </body>
</html>