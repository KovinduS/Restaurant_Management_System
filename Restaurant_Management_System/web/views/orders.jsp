<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c"%>

<DOCTYPE html>
    <html>
        <head>
            <meta charset="UTF-8">
            <title>MaYa BaY - Order Management </title>
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
            margin: 0 auto;
            padding: 2rem;
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

        /* ===== Status Tabs ===== */
        .order-status-tabs {
            display: flex;
            margin-bottom: 1.5rem;
            border-bottom: 2px solid #b2ebf2;
            overflow-x: auto;
        }

        .tab {
            padding: 0.8rem 1.5rem;
            background: none;
            border: none;
            cursor: pointer;
            border-bottom: 3px solid transparent;
            font-weight: 500;
            color: #006064;
            white-space: nowrap;
            transition: all 0.3s ease;
        }

        .tab:hover {
            color: #00838f;
            background-color: rgba(0, 172, 193, 0.1);
        }

        .tab.active {
            border-bottom-color: #00acc1;
            color: #00acc1;
            font-weight: 600;
        }

        /* ===== Order Table ===== */
        .order-table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 0 20px rgba(0,0,0,0.05);
        }

        .order-table th, .order-table td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid #e0f7fa;
        }

        .order-table th {
            background-color: #00acc1;
            color: white;
            font-weight: 500;
        }

        .order-table tr:hover {
            background-color: #f5fdff;
        }

        /* ===== Status Badges ===== */
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

        .status-badge.paid {
            background-color: #9c27b0;
            color: white;
        }

        .status-badge.cancelled {
            background-color: #f44336;
            color: white;
        }

        /* ===== Action Buttons ===== */
        .btn-sm {
            padding: 0.4rem 0.8rem;
            font-size: 0.8rem;
            margin-right: 0.5rem;
            border-radius: 20px;
            text-decoration: none;
            transition: all 0.2s ease;
        }

        .btn-view {
            background-color: #00acc1;
            color: white;
        }

        .btn-update {
            background-color: #ff9800;
            color: white;
        }

        .btn-view:hover {
            background-color: #00838f;
        }

        .btn-update:hover {
            background-color: #f57c00;
        }

        /* ===== Responsive Design ===== */
        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }
            
            .order-table {
                display: block;
                overflow-x: auto;
            }
            
            .order-status-tabs {
                flex-wrap: wrap;
            }
            
            .tab {
                padding: 0.6rem 1rem;
                font-size: 0.9rem;
            }
        }
                
            </style>
        </head>
        <body>
            <jsp:include page="/views/header.jsp"/>
            
            <main class="container">
                <h1>Order Management</h1>
                
                <div class="action">
                    <a href="${pageContext.request.contextPath}/oreders/new" class="btn">
                        <i class="fas fa-plus"></i>Create New Order
                    </a>
                </div>
                        
                        <div class="order-status-tabs">
                            <button class="tab active"  data-status="all">All Orders</button>
                            <button class="tab" data-ststus="pending">Pending</button>
                            <button class="tab" data-status="preparing">Preparing</button>
                            <button class="tab" data-ststus="ready">Ready></button>
                            <button class="tab" data-status="served">Served</button>
                            <button class="tab" data-ststus="paid">Paid</button>
                            <button class="tab" data-ststus="canselled">Cancelled</button>
                            
                        </div>
                        <table class="oredr-table">
                            <thead>
                                <tr>
                                    <th>Order Id</th>
                                    <th>Table</th>
                                    <th>Status</th>
                                    <th>Total</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="oredr" items="${orders}">
                                    <tr data-status="${order.ststus}">
                                        <td>#${order.order.Id}</td>
                                        <td>${order.tableNumber}</td>
                                        <td><span class="ststus-badge ${order.ststus}">${order.ststus}</span></td>
                                        <td>$${order.totalAmount}</td>
                                        <td>${order.orderDate}</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/orders/view?id=${order.orderId}" class="btn-sm btn-view">View</a>
                                            <c:if test="${order.status == 'pading'|| order.ststus == 'preparing'}">
                                                <a href="${pageContext.request.contextPath}/orders/update?id=${order.orderId}" class="btn-sm btn-update"Update</a>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
            </main>
                    <jsp:include page="/views/footer.jsp"/>
                    
                    <script>
                        //Tab filering funtionality
                        document.querySelectorAll('.tab').forEach(tab =>){
                            tab.addEventListner('click',function() {
                                const status = this.dataset.status;
                                
                                //Update active tab
                                document.querySelectorAll('.order-table tbody tr').forEach(row =>){
                                    if (status === 'all' || row.dataset.status === status){
                                        row.style.display ='';
                                    }else{
                                        row.style.display = '';
                                    }else{
                                        row.style.display = 'none';
                                    }
                                });
                            });
                        });
                        
                        //Add some visual effects
                        document.querySelectorAll('.order-table tbody tr').forEach(row =>){
                            row.addEventListener('mouseenter',function(){
                                this.style.transform = 'translateX(5px)';
                                this.style.transition = 'transform 0.2s ease';
                            });
                            row.addEventListener('mouseleave',function(){
                                this.style.transform = '';
                            });
                        });
                    </script>
        </body>
    </html>
                    