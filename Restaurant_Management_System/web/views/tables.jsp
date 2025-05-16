<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MaYa BaY - Table Management</title>
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        /* ===== Base Styles ===== */
        body {
            font-family: 'Poppins', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #e0f7fa;
            color: #003f5c;
            margin: 0;
            padding: 0;
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 2rem;
        }

        .container h1 {
            color: #006064;
            margin-bottom: 1.5rem;
            font-size: 2.2rem;
            border-bottom: 2px solid #4dd0e1;
            padding-bottom: 0.5rem;
            font-weight: 600;
        }

        /* ===== Action Buttons ===== */
        .actions {
            margin-bottom: 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
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

        /* ===== Table Grid ===== */
        .table-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
            gap: 1.5rem;
        }

        .table-card {
            background: white;
            padding: 1.5rem;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 150, 136, 0.1);
            text-align: center;
            transition: transform 0.3s ease;
            border: 3px solid transparent;
            position: relative;
            overflow: hidden;
        }

        .table-card:hover {
            transform: translateY(-5px);
        }

        .table-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
        }

        .table-card.available::before {
            background-color: #4CAF50;
        }

        .table-card.occupied::before {
            background-color: #f44336;
        }

        .table-card.reserved::before {
            background-color: #ff9800;
        }

        .table-card.out_of_service::before {
            background-color: #607d8b;
        }

        .table-number {
            font-size: 1.8rem;
            font-size: 1.8rem;
            margin: 0.5rem 0;
            color: #006064;
        }

        .table-status {
            margin: 0.5rem 0;
            font-weight: 600;
            text-transform: capitalize;
            padding: 0.3rem 0.6rem;
            border-radius: 20px;
            display: inline-block;
            font-size: 0.9rem;
        }

        .table-card.available .table-status {
            background-color: rgba(76, 175, 80, 0.1);
            color: #2E7D32;
        }

        .table-card.occupied .table-status {
            background-color: rgba(244, 67, 54, 0.1);
            color: #C62828;
        }

        .table-card.reserved .table-status {
            background-color: rgba(255, 152, 0, 0.1);
            color: #EF6C00;
        }

        .table-card.out_of_service .table-status {
            background-color: rgba(96, 125, 139, 0.1);
            color: #37474F;
        }

        .table-capacity {
            margin: 0.5rem 0;
            color: #00838f;
            font-weight: 500;
        }

        .table-location {
            color: #666;
            font-size: 0.9rem;
            margin-bottom: 1rem;
        }

        .table-actions {
            margin-top: 1.5rem;
            display: flex;
            justify-content: center;
            gap: 0.5rem;
        }

        .btn-sm {
            padding: 0.5rem 1rem;
            font-size: 0.8rem;
            border-radius: 20px;
            text-decoration: none;
            transition: all 0.2s ease;
            border: none;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 0.3rem;
        }

        .btn-edit {
            background-color: #00acc1;
            color: white;
        }

        .btn-edit:hover {
            background-color: #00838f;
        }

        .btn-occupy {
            background-color: #f44336;
            color: white;
        }

        .btn-occupy:hover {
            background-color: #d32f2f;
        }

        .btn-free {
            background-color: #4CAF50;
            color: white;
        }

        .btn-free:hover {
            background-color: #388E3C;
        }

        /* Loading spinner */
        .spinner {
            display: none;
            width: 20px;
            height: 20px;
            border: 3px solid rgba(255,255,255,0.3);
            border-radius: 50%;
            border-top-color: #fff;
            animation: spin 1s ease-in-out infinite;
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }

        /* Notification toast */
        .toast {
            position: fixed;
            top: 20px;
            right: 20px;
            padding: 15px 20px;
            background: #4CAF50;
            color: white;
            border-radius: 5px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            display: none;
            z-index: 1000;
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
            
            .table-grid {
                grid-template-columns: 1fr 1fr;
            }
        }

        @media (max-width: 480px) {
            .table-grid {
                grid-template-columns: 1fr;
            }
            
            .table-actions {
                flex-direction: column;
                gap: 0.5rem;
            }
            
            .btn-sm {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <div class="water-decoration" style="top:20%; left:5%;"></div>
    <div class="water-decoration" style="bottom:15%; right:5%; transform:rotate(30deg);"></div>
    
    <!-- Notification Toast -->
    <div id="toast" class="toast"></div>
    
    <jsp:include page="/views/header.jsp" />
    
    <main class="container">
        <h1><i class="fas fa-utensils"></i> Table Management</h1>
        
        <div class="actions">
            <a href="${pageContext.request.contextPath}/tables/new" class="btn">
                <i class="fas fa-plus"></i> Add New Table
            </a>
            <div class="search-filter">
                <input type="text" id="tableSearch" placeholder="Search tables..." style="padding: 0.5rem; border-radius: 20px; border: 1px solid #ddd;">
            </div>
        </div>
        
        <div class="table-grid">
            <c:forEach var="table" items="${tables}">
                <div class="table-card ${table.status}" data-table-id="${table.tableId}">
                    <h3 class="table-number">Table ${table.tableNumber}</h3>
                    <p class="table-status">${table.status}</p>
                    <p class="table-capacity"><i class="fas fa-chair"></i> Seats: ${table.capacity}</p>
                    <p class="table-location"><i class="fas fa-map-marker-alt"></i> ${table.location}</p>
                    
                    <div class="table-actions">
                        <a href="${pageContext.request.contextPath}/tables/edit?id=${table.tableId}" class="btn-sm btn-edit">
                            <i class="fas fa-edit"></i> Edit
                        </a>
                        <c:if test="${table.status != 'occupied'}">
                                <button class="btn-sm btn-free" onclick="updateStatus(${table.tableId}, 'occupied', this)">
                                    <i class="fas fa-check"></i> Occupy
                                </button>
                            </c:if>
                            <c:if test="${table.status == 'occupied'}">
                                <button class="btn-sm btn-occupy" onclick="updateStatus(${table.tableId}, 'available', this)">
                                    <i class="fas fa-user-clock"></i> Free
                                </button>
                            </c:if>
                    </div>
                </div>
            </c:forEach>
        </div>
    </main>
    
    <jsp:include page="/views/footer.jsp" />
    
    <script>
       
        function updateStatus(tableId, status) {
            const form = document.createElement('form');
            form.method = 'POST';
            form.action = '${pageContext.request.contextPath}/tables/update-status';
            
            const tableIdInput = document.createElement('input');
            tableIdInput.type = 'hidden';
            tableIdInput.name = 'tableId';
            tableIdInput.value = tableId;
            form.appendChild(tableIdInput);
            
            const statusInput = document.createElement('input');
            statusInput.type = 'hidden';
            statusInput.name = 'status';
            statusInput.value = status;
            form.appendChild(statusInput);
            
            document.body.appendChild(form);
            form.submit();
        }
    
    </script>
</body>
</html>