<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MaYa BaY - Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <style>
        /* ===== Base Styles ===== */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #e0f7fa;
            color: #003f5c;
            min-height: 100vh;
            position: relative;
        }

        /* ===== Header ===== */
       header {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #006064, #00838f);
            color: white;
            padding: 1rem 2rem;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 100;
        }
        .header-content {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        /* Logo styling with left positioning */
        .logo {
            margin-right: auto; /* Pushes the logo to the left */
        }
        header h1 {
            font-size: 2rem;
            font-weight: bold;
            color: #fff;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
            margin: 0; /* Remove default margin */
        }
        header h1 .bay {
            color: #64dfdf;
        }
        header h1 .maya {
            color: #ffffff;
        }
        /* ===== Navigation ===== */
        nav ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
            display: flex;
            gap: 1rem;
        }
        nav ul li a {
            color: white;
            text-decoration: none;
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-size: 1.5rem;
            font-weight: 725;
            transition: all 0.3s ease;
        }
        nav ul li a:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }

        /* ===== Main Content ===== */
        .container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 2rem 4rem;
        }

        .page-title {
            color: #006064;
            margin-bottom: 1.5rem;
            font-size: 2rem;
            border-bottom: 2px solid #4dd0e1;
            padding-bottom: 0.5rem;
        }

        /* ===== Dashboard Summary ===== */
        .dashboard-summary {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 1.5rem;
            margin-bottom: 3rem;
        }

        .summary-card {
            background: white;
            padding: 1.5rem;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 150, 136, 0.1);
            text-align: center;
            transition: transform 0.3s ease;
            border-left: 4px solid #00acc1;
        }

        .summary-card:hover {
            transform: translateY(-5px);
        }

        .summary-card h3 {
            margin-top: 0;
            color: #00838f;
            font-size: 1.1rem;
        }

        .summary-card p {
            font-size: 2.5rem;
            margin: 0.5rem 0 0;
            color: #006064;
            font-weight: bold;
        }

        /* ===== Recent Orders Table ===== */
        .data-table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 0 20px rgba(0,0,0,0.05);
        }

        .data-table th, .data-table td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid #e0f7fa;
        }

        .data-table th {
            background-color: #00acc1;
            color: white;
            font-weight: 500;
        }

        .data-table tr:hover {
            background-color: #f5fdff;
        }

        .status-badge {
            display: inline-block;
            padding: 0.4rem 0.8rem;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
            text-transform: capitalize;
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
            color: white;
        }

        /* ===== Footer ===== */
        footer {
            text-align: center;
            padding: 1.5rem;
            background-color: #006064;
            color: white;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        /* ===== Water Bubble Decorations ===== */
        .bubble {
            position: absolute;
            background-color: rgba(0, 172, 193, 0.1);
            border-radius: 50%;
            z-index: -1;
        }

        /* ===== Responsive Design ===== */
        @media (max-width: 768px) {
            .header-content {
                flex-direction: column;
                gap: 1rem;
            }
            
            nav ul {
                flex-wrap: wrap;
                justify-content: center;
            }
            
            .container {
                padding: 1rem;
            }
            
            .dashboard-summary {
                grid-template-columns: 1fr;
            }
        
        
        
    </style>
</head>
<body>
    <!-- Water bubble decorations -->
    <div class="bubble" style="width: 150px; height: 150px; top: 20%; left: 5%;"></div>
    <div class="bubble" style="width: 80px; height: 80px; bottom: 15%; right: 10%;"></div>
    
    <header>
        <div class="header-content">
           <h1><span class="maya">MaYa</span> <span class="bay">BaY</span></h1>     
       
       
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
        </div>
    </header>
    
    <main class="container">
        <h1 class="page-title">Dashboard Overview</h1>
        
        <div class="dashboard-summary">
            <div class="summary-card">
                <h3>Active Orders</h3>
                <p>${activeOrders.size()}</p>
            </div>
            <div class="summary-card">
                <h3>Available Tables</h3>
                <p>${availableTables}</p>
            </div>
            <div class="summary-card">
                <h3>Today's Revenue</h3>
                <p>$${dailyRevenue}</p>
            </div>
        </div>
        
        <section>
            <h2 style="color: #006064; margin-bottom: 1rem;">Recent Orders</h2>
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
                            <td>#${order.orderId}</td>
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
    
    <jsp:include page="/views/footer.jsp" />

    <script>
        // Add bubble animation
        document.addEventListener('DOMContentLoaded', function() {
            const bubbles = document.querySelectorAll('.bubble');
            bubbles.forEach(bubble => {
                const size = Math.random() * 100 + 50;
                bubble.style.width = ${size}px;
                bubble.style.height = ${size}px;
                bubble.style.left = ${Math.random() * 100}%;
                bubble.style.top = ${Math.random() * 100}%;
                
                // Animate bubbles
                setInterval(() => {
                    bubble.style.transform = translateY(${Math.random() * 20 - 10}px) translateX(${Math.random() * 20 - 10}px);
                }, 2000);
            });
        });
        
    </script>

</body>

</html>               