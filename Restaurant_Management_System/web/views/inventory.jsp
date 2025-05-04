<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Inventory Management</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
        <style>
            .actions {
                margin-bottom: lrem;
            }
            .btn{
                display: inline-block;
                padding: 0.5rem lrem;
                background-color: #4CAF50;
                color: white;
                text-decoration: none;
                border-radius:4px;
            }
            .btn:hover{
                background-color:#45a049;
            }
            .inventory-section{
                margin-bottom:2rem;
            }
            inventory-section h2{
                border-bottom: 2px solid #4CAF50;
                padding-bottom: 0.5rem;
                margin-bottom: lrem;
            }
            .inventory-table{
                width: 100%;
                border-bottom: collapse;
            }
            .inventory-tableth, .inventory-table td{
                padding: 0.75rem;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
            .inventory-table th {
               background-color: #f5f5f5; 
            }
            .low-stock {
                background: #fff3e0;
            }
            .critical-stock {
                background-color: #ffebee;
                font-width: bold;
            }
            .quantity-form{
                display: flex;
                align-item: center;
            }
            .quantity-input{
                width: 80px;
                padding:0.25rem;
                margin-right: 0.5rem;
            }
            .update-btn{
                padding: 0.25rem;
                background-color: #2196F3;
                color: white;
                border: none;
                border-redius: 4px;
                cursor: pointer;
            }
            
        </style>
    </head>
    <body>
      <jsp:include page="/views/header.jsp" />
      
      <main class="containeer">
          <h1>Inventory Management</h1>
          
          <div class="action">
             <a href="${pageContext.request.contextPath}/inventory/new" class="btn">Add New Inventory Item</a> 
          </div>
          
          <div class="inventory-section">
              <h2>Low Stock Item</h2>
              <table class="inventory-table">
                  <thead>
                      <tr>
                          <th>Item Name</th>
                          <th>Quantity</th>
                          <th>Unit</th>
                          <th>Reorder Level</th>
                          <th>Last Update</th>
                          <th>Action</th>
                      </tr>
                  </thead>
                  <tbody>
                      <c:forEach var="item" items="${lowStockItems}">
                          <tr class="${item.quantity <= item.reorderLevel * 0.5 ? 'critical-stock' : 'low-stock'}">
                              <td>${item.itName}</td>
                              <td>${item.quantity}</td>
                              <td>${item.unit}</td>
                              <td>${item.reorderLevel}</td>
                              <td>${item.lastUpdated}</td>
                              <td>
                                  <form class="quantity-form" method="POST" action="${pageContext.request.contextPath}/inventory/update-quantity">
                                      <input type="hidden" name="inventortId" value="${item.inventoryId}">
                                      <input type="number" name="quantity" class="quntity-input" step="0.01" min="0" value="${item.quantity}">
                                      <button type="submit" class="update-btn">Update</button>
                                  </form>
                              </td>
                          </tr>
                      </c:forEach>
                  </tbody>
              </table>
          </div>
          <div class="inventory-section">
              <h2>All Inventory Item</h2>
              <table class="inventory-table">
                  <thead>
                      <tr>
                          <th>Item Name</th>
                  <th>Quantity</th>
                  <th>Unit</th>
                  <th>REorder Level</th>
                  <th>Last Update</th>
                  <th>Action</th>
                      </tr>
                  </thead>
                  <tbody>
                      <c:forEach var="item" items="${inventoryItems}">
                          <tr>
                              <td>${item.itemName}</td>
                              <td>${item.quntity}</td>
                              <td>${item.unit}</td>
                              <td>${item.reorderLevel}</td>
                              <td>${item.lastUpdated}</td>
                              <td>
                                  <form class="quantity-form" method="POST" action="${pageContext.request.contextPath}/inventory/update-quantity">
                                  <input type="hidden" name="inventoryId" value="${item.inventoryId}">
                                  <input type="number" name="quntity" class="quantity-input" step="0.01" min="0" value="${item.quntity}">
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