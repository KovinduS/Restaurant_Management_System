<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Restaurant Management</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }
        header {
            background-color: #333;
            color: white;
            padding: 1rem;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        header h1 {
            margin: 0;
            font-size: 1.5rem;
        }
        nav ul {
            list-style-type: none;
            padding: 0;
            margin: 1rem 0 0;
            display: flex;
        }
        nav ul li {
            margin-right: 1rem;
        }
        nav ul li a {
            color: white;
            text-decoration: none;
            padding: 0.5rem;
            border-radius: 4px;
        }
        nav ul li a:hover {
            background-color: #555;
        }
        .container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 1rem;
        }
        .dashboard-summary {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1rem;
            margin-bottom: 2rem;
        }
        .summary-card {
            background: white;
            padding: 1.5rem;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .summary-card h3 {
            margin-top: 0;
            color: #555;
        }
        .summary-card p {
            font-size: 2rem;
            margin: 0.5rem 0 0;
            color: #333;
            font-weight: bold;
        }
        footer {
            text-align: center;
            padding: 1rem;
            background-color: #333;
            color: white;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
    <header>
        <h1>Restaurant Management System</h1>
        <nav>
            <ul>
                <li><a href="${pageContext.request.contextPath}/dashboard">Dashboard</a></li>
                <li><a href="${pageContext.request.contextPath}/orders">Orders</a></li>
                <li><a href="${pageContext.request.contextPath}/tables">Tables</a></li>
                <li><a href="${pageContext.request.contextPath}/menu">Menu</a></li>
                <li><a href="${pageContext.request.contextPath}/inventory">Inventory</a></li>
                <c:if test="${userRole == 'admin'}">
                    <li><a href="${pageContext.request.contextPath}/users">Users</a></li>
                </c:if>
                <li><a href="${pageContext.request.contextPath}/auth/logout">Logout</a></li>
            </ul>
        </nav>
    </header>
    
    <main class="container">
        <h1>Dashboard</h1>
        
        <div class="dashboard-summary">
            <div class="summary-card">
                <h3>Active Orders</h3>
                <p>${activeOrders.size()}</p>
            </div>
            <div class="summary-card">
                <h3>Available Tables</h3>
                <p>${availableTables}</p>
            </div>
        </div>
        
        <section>
            <h2>Recent Orders</h2>
            <table class="data-table">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Table</th>
                        <th>Status</th>
                        <th>Total</th>
                        <th>Time</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${activeOrders}" end="4">
                        <tr>
                            <td>${order.orderId}</td>
                            <td>${order.tableNumber}</td>
                            <td><span class="status-badge ${order.status}">${order.status}</span></td>
                            <td>$${order.totalAmount}</td>
                            <td>${order.orderDate}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </section>
    </main>
    
    <footer>
        <p>&copy; 2023 Restaurant Management System</p>
    </footer>
</body>
</html>