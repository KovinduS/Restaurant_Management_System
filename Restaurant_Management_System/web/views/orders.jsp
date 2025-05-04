<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Management</title>
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
        .order-status-tabs {
            display: flex;
            margin-bottom: 1rem;
            border-bottom: 1px solid #ddd;
        }
        .tab {
            padding: 0.5rem 1rem;
            background: none;
            border: none;
            cursor: pointer;
            border-bottom: 3px solid transparent;
        }
        .tab.active {
            border-bottom-color: #4CAF50;
            font-weight: bold;
        }
        .order-table {
            width: 100%;
            border-collapse: collapse;
        }
        .order-table th, .order-table td {
            padding: 0.75rem;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        .order-table th {
            background-color: #f5f5f5;
        }
        .status-badge {
            display: inline-block;
            padding: 0.25rem 0.5rem;
            border-radius: 4px;
            font-size: 0.8rem;
            font-weight: bold;
        }  
        .status-badge.pending {
            background-color: #ff9800;
            color: white;
        }
        .status-badge.preparing {
            background-color: #2196F3;
            color: white;
        }
        .status-badge.ready {
            background-color: #4CAF50;
            color: white;
        }
        .status-badge.served {
            background-color: #607d8b;
            background-color: #607d8b;
        }
        .status-badge.paid {
            background-color: #9c27b0;
            color: white;
        }
        .btn-sm {
            padding: 0.25rem 0.5rem;
            font-size: 0.8rem;
            margin-right: 0.5rem;
        }
    </style>
</head>
<body>
    <jsp:include page="/views/header.jsp" />
    
    <main class="container">
        <h1>Order Management<h1>
                
        <div class="actions">
            <a href="${pageContext.request.contextPath}/orders/new" class="btn">Create New Order</a>
        </div>
                
        <div class="order-status-tabs">
            <button class="tab active" data-status="all">All Orders</button>
            <button class="tab" data-status="pending">Pending</button>
            <button class="tab" data-status="preparing">Preparing</button>
            <button class="tab" data-status="ready">Ready</button>
        </div>
        
        <table class="order-table">
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Table</th>
                    <th>Status</th>
                    <th>Total</th>
                    <th>Time</th>
                    <th>Actions</th>
                </tr> 
            </thead>
            <tbody>
                 <c:forEach var="order" items="${orders}">
                     <tr data-status="${order.status}">
                        <td>${order.orderId}</td>
                        <td>${order.tableNumber}</td>
                        <td><span class="status-badge ${order.status}">${order.status}</span></td>
                        <td>$${order.totalAmount}</td>
                        <td>${order.orderDate}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/orders/view?id=${order.orderId}" class="btn-sm">View</a>
                            <c:if test="${order.status == 'pending' || order.status == 'preparing'}">
                                <a href="${pageContext.request.contextPath}/orders/view?id=${order.orderId}#update-status" class="btn-sm">Update</a>
                            </c:if>
                        </td>
                     </tr>
               </c:forEach>      
            </tbody>
        </table>    
    </main>
                            
    <jsp:include page="/views/footer.jsp" />
    
    <script>
        document.querySelectorAll('.tab').forEach(tab => {
            tab.addEventListener('click', function() {
                const status = this.dataset.status;
                
                //Update active tab
                document.querySelectorAll('.tab').forEach(t => t.classList.remove('active')); 
                this.classList.add('active');
                
                // Filter orders
                document.querySelectorAll('.order-table tbody tr').forEach(row => {
                    if (status === 'all' || row.dataset.status === status) {
                        row.style.display = '';
                    } else {
                        row.style.display = 'none';   
                    }
                });
            });
        });
    </script>    
</body>
</html>
