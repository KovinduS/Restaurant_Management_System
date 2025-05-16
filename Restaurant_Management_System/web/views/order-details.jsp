<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.restaurant.model.OrderItem" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MaYa BaY - Order Details</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <style>
        /* ===== Base Styles ===== */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #e0f7fa;
            color: #003f5c;
            padding: 0;
        }
        
        .container {
            max-width: 1000px;
            margin: 0 auto;
            background-color: white;
            border-radius: 10px;
            padding: 2rem;
            box-shadow: 0 0 20px rgba(0,0,0,0.05);
        }
        
        h2 {
            color: #006064;
            margin-bottom: 1.5rem;
            font-size: 1.8rem;
            border-bottom: 2px solid #4dd0e1;
            padding-bottom: 0.5rem;
        }
        
        /* ===== Order Info ===== */
        .order-info {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 1rem;
            margin-bottom: 2rem;
            padding: 1.5rem;
            background-color: #f5fdff;
            border-radius: 8px;
        } 
        
        .order-info p {
            margin: 0.5rem 0;
        }
        
        .order-info strong {
            color: #006064;
            font-weight: 500;
            display: inline-block;
            min-width: 120px;
        }
        
        /* ===== Status Badge ===== */
        .status-badge {
            display: inline-block;
            padding: 0.4rem 0.8rem;
            border-radius: 20px;
            font-size: 0.9rem;
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

        .status-badge.paid {
            background-color: #9c27b0;
            color: white;
        }
        
        .status-badge.cancelled {
            background-color: #f44336;
            color: white;
        }
        
        /* ===== Items Table ===== */
        .items-table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 0 20px rgba(0,0,0,0.05);
            margin-bottom: 2rem;
        }
        
        .items-table th, .items-table td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid #e0f7fa;
        }
        
        .items-table th {
            background-color: #00acc1;
            color: white;
            font-weight: 500;
            text-transform: uppercase;
            font-size: 0.9rem;
        }
        
        .items-table tr:hover {
            background-color: #f5fdff;
        }
        
        .items-table tr:last-child td {
            border-bottom: none;
        }
        
        .grand-total {
            font-weight: 600;
            background-color: #e0f7fa !important;
        }
        
        /* ===== Action Buttons ===== */
        .action-buttons {
            display: flex;
            gap: 1rem;
            justify-content: center;
            margin-top: 2rem;
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
        
        .btn-print {
            background-color: #607d8b;
        }
        
        .btn-print:hover {
            background-color: #455a64;
        }
        
        /* ===== Responsive Design ===== */
        @media (max-width: 768px) {
            body {
                padding: 1rem;
            }
            
            .container {
                padding: 1.5rem;
            }
            
            .order-info {
                grid-template-columns: 1fr;
                padding: 1rem;
            }
            
            .action-buttons {
                flex-direction: column;
                align-items: center;
            }
            
            .btn {
                width: 100%;
                text-align: center;
            }
        }
        
        @media print {
            body {
                background: white;
                padding: 0;
                font-size: 12pt;
            }
            
            .container {
                box-shadow: none;
                padding: 0;
            }
            
            .action-buttons {
                display: none;
            }
            
            .items-table th {
                background-color: #ddd !important;
                color: black !important;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>MaYa BaY - Order Details</h2>
        
        <div class="order-info">
            <p><strong>Order ID:</strong> ${orderId}</p>
            <p><strong>Customer Name:</strong> ${customerName}</p>
            <p><strong>Order Date:</strong> ${orderDate}</p>
            <p><strong>Status:</strong> <span class="status-badge ${status}">${status}</span></p>
            <p><strong>Table Number:</strong> ${tableNumber}</p>
            <p><strong>Waiter:</strong> ${waiterName}</p>
        </div>
        
        <table class="items-table">
            <thead>
                <tr>
                    <th>Item Name</th>
                    <th>Quantity</th>
                    <th>Price (per item)</th>
                    <th>Total</th>
                </tr>
            </thead>
            </tbody>
                <%
                    List<OrderItem> items = (List<OrderItem>) request.getAttribute("orderItems");
                    double grandTotal = 0;
                    if (items != null) {
                        for (OrderItem item : items) {
                            double total = item.getQuantity() * item.getPriceAtOrder();
                            grandTotal += total;
                %>
                <tr>
                    <td><%= item.getItemName() %></td>
                    <td><%= item.getQuantity() %></td>
                    <td>$<%= String.format("%.2f", item.getPriceAtOrder()) %></td>
                    <td>$<%= String.format("%.2f", total) %></td>
                </tr>
                <%
                        }
                    }
                %>
                <tr class="grand-total">
                    <td colspan="3"><strong>Grand Total</strong></td>
                    <td><strong>$<%= String.format("%.2f", grandTotal) %></strong></td>
                </tr>
            </tbody>
        </table>
                
        <div class="action-buttons">
            <button onclick="window.print()" class="btn btn-print">Print Bill</button>
            <a href="${pageContext.request.contextPath}/orders" class="btn">Back to Orders</a>
        </div>
    </div>
        
        
         <jsp:include page="/views/footer.jsp" />

</body>
</html>