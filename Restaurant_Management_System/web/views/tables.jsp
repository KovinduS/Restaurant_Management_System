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
<<<<<<< Updated upstream
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
        
=======
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

>>>>>>> Stashed changes
        .container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 2rem;
        }
<<<<<<< Updated upstream
        
=======

>>>>>>> Stashed changes
        h1 {
            color: #006064;
            margin-bottom: 1.5rem;
            font-size: 2.2rem;
<<<<<<< Updated upstream
            border-bottom:  2px solid #4dd0e1;
            padding-bottom: 0.5rem;
            font-weight: 600;
        }
        
=======
            border-bottom: 2px solid #4dd0e1;
            padding-bottom: 0.5rem;
            font-weight: 600;
        }

>>>>>>> Stashed changes
        /* ===== Action Buttons ===== */
        .actions {
            margin-bottom: 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
<<<<<<< Updated upstream
        
=======

>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
        
        .btn:hover {
             background-color: #00838f;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
        
=======

        .btn:hover {
            background-color: #00838f;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }

>>>>>>> Stashed changes
        /* ===== Table Grid ===== */
        .table-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
            gap: 1.5rem;
        }
<<<<<<< Updated upstream
        
=======

>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
        
        .table-card:hover {
            transform: translateY(-5px);
        }
        
=======

        .table-card:hover {
            transform: translateY(-5px);
        }

>>>>>>> Stashed changes
        .table-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
        }
<<<<<<< Updated upstream
        
        .table-card.available::before {
            background-color: #4CAF50;
        }
        
=======

        .table-card.available::before {
            background-color: #4CAF50;
        }

>>>>>>> Stashed changes
        .table-card.occupied::before {
            background-color: #f44336;
        }

        .table-card.reserved::before {
            background-color: #ff9800;
        }
<<<<<<< Updated upstream
        
        .table-card.out_of_service::before {
            background-color: #607d8b;
        }
        
        .table-number {
           font-size: 1.8rem;
           font-size: 1.8rem;
           margin: 0.5rem 0;
           color: #006064;
        }
        
=======

        .table-card.out_of_service::before {
            background-color: #607d8b;
        }

        .table-number {
            font-size: 1.8rem;
            font-size: 1.8rem;
            margin: 0.5rem 0;
            color: #006064;
        }

>>>>>>> Stashed changes
        .table-status {
            margin: 0.5rem 0;
            font-weight: 600;
            text-transform: capitalize;
            padding: 0.3rem 0.6rem;
            border-radius: 20px;
            display: inline-block;
            font-size: 0.9rem;
        }
<<<<<<< Updated upstream
        
=======

>>>>>>> Stashed changes
        .table-card.available .table-status {
            background-color: rgba(76, 175, 80, 0.1);
            color: #2E7D32;
        }
<<<<<<< Updated upstream
        
=======

>>>>>>> Stashed changes
        .table-card.occupied .table-status {
            background-color: rgba(244, 67, 54, 0.1);
            color: #C62828;
        }

        .table-card.reserved .table-status {
            background-color: rgba(255, 152, 0, 0.1);
            color: #EF6C00;
        }
<<<<<<< Updated upstream
        
=======

>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
        
=======

>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
        
=======

>>>>>>> Stashed changes
        .btn-edit {
            background-color: #00acc1;
            color: white;
        }
<<<<<<< Updated upstream
        
        .btn-edit:hover {
            background-color: #00838f;
        }
        
=======

        .btn-edit:hover {
            background-color: #00838f;
        }

>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
        
        .btn-free:hover {
            background-color: #388E3C;
        }
        
=======

        .btn-free:hover {
            background-color: #388E3C;
        }

>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
        
        @keyframes spin {
            to { transform: rotate(360deg); }
        }
        
=======

        @keyframes spin {
            to { transform: rotate(360deg); }
        }

>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
        
=======

>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
        
        /* ===== Responsive Design ===== */
         @media (max-width: 768px) {
=======

        /* ===== Responsive Design ===== */
        @media (max-width: 768px) {
>>>>>>> Stashed changes
            .container {
                padding: 1rem;
            }
            
            .table-grid {
                grid-template-columns: 1fr 1fr;
            }
        }
<<<<<<< Updated upstream
        
=======

>>>>>>> Stashed changes
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
        
<<<<<<< Updated upstream
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
                    <c:choose>
                        <c:when test="${table.status == 'occupied'}">
                            <button class="btn-sm btn-free" onclick="updateStatus(${table.tableId}, 'available', this)">
                              <i class="fas fa-check"></i> Free
                            </button> 
                        </c:when>
                        <c:otherwise>
                            <button class="btn-sm btn-occupy" onclick="updateStatus(${table.tableId}, 'occupied', this)">
                                <i class="fas fa-user-clock"></i> Occupy
                            </button>
                        </c:otherwise>
                    </c:choose>        
                </div>
            </div>
        </c:forEach>                    
      </div>
    </main>
                
    <jsp:include page="/views/footer.jsp" />
    
    <script>
        // CSRF token setup (if using Spring Security)
        const csrfToken = "${_csrf.token}";
        const csrfHeader = "${_csrf.headerName}";
        
        // Show toast notification
        function showToast(message, isSuccess = true) {
            const toast = document.getElementById('toast');
            toast.textContent = message;
            toast.style.backgroundColor = isSuccess ? '#4CAF50' : '#f44336';
            toast.style.display = 'block';
            
            setTimeout(() => {
                toast.style.display = 'none';
            }, 3000);
        }
        
        // Update table status with modern fetch API
        async function updateStatus(tableId, status, buttonElement) {
            if (!confirm(`Are you sure you want to change this table's status to ${status}?`)) {
                return;
            }
            
            // Show loading state
            const originalText = buttonElement.innerHTML;
            buttonElement.innerHTML = `<span class="spinner"></span> Processing...`;
            buttonElement.disabled = true;
            
            try {
                const response = await fetch('${pageContext.request.contextPath}/tables/update-status', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                        [csrfHeader]: csrfToken
                    },
                    body: `tableId=${tableId}&status=${status}`
                });
                
=======
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
                        <c:choose>
                            <c:when test="${table.status == 'occupied'}">
                                <button class="btn-sm btn-free" onclick="updateStatus(${table.tableId}, 'available', this)">
                                    <i class="fas fa-check"></i> Free
                                </button>
                            </c:when>
                            <c:otherwise>
                                <button class="btn-sm btn-occupy" onclick="updateStatus(${table.tableId}, 'occupied', this)">
                                    <i class="fas fa-user-clock"></i> Occupy
                                </button>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </c:forEach>
        </div>
    </main>
    
    <jsp:include page="/views/footer.jsp" />
    
    <script>
        // CSRF token setup (if using Spring Security)
        const csrfToken = "${_csrf.token}";
        const csrfHeader = "${_csrf.headerName}";
        
        // Show toast notification
        function showToast(message, isSuccess = true) {
            const toast = document.getElementById('toast');
            toast.textContent = message;
            toast.style.backgroundColor = isSuccess ? '#4CAF50' : '#f44336';
            toast.style.display = 'block';
            
            setTimeout(() => {
                toast.style.display = 'none';
            }, 3000);
        }
        
        // Update table status with modern fetch API
        async function updateStatus(tableId, status, buttonElement) {
            if (!confirm(`Are you sure you want to change this table's status to ${status}?`)) {
                return;
            }
            
            // Show loading state
            const originalText = buttonElement.innerHTML;
            buttonElement.innerHTML = `<span class="spinner"></span> Processing...`;
            buttonElement.disabled = true;
            
            try {
                const response = await fetch('${pageContext.request.contextPath}/tables/update-status', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                        [csrfHeader]: csrfToken
                    },
                    body: `tableId=${tableId}&status=${status}`
                });
                
>>>>>>> Stashed changes
                if (response.ok) {
                    showToast('Table status updated successfully!');
                    setTimeout(() => {
                        window.location.reload();
                    }, 1000);
                } else {
                    const error = await response.text();
                    showToast(`Error: ${error || 'Failed to update table status'}`, false);
                    buttonElement.innerHTML = originalText;
                    buttonElement.disabled = false;
                }
            } catch (error) {
                console.error('Error:', error);
                showToast('An error occurred while updating the table', false);
                buttonElement.innerHTML = originalText;
                buttonElement.disabled = false;
            }
        }
        
        // Simple table search functionality
        document.getElementById('tableSearch').addEventListener('input', function(e) {
            const searchTerm = e.target.value.toLowerCase();
            const tableCards = document.querySelectorAll('.table-card');
            
            tableCards.forEach(card => {
                const tableNumber = card.querySelector('.table-number').textContent.toLowerCase();
                const location = card.querySelector('.table-location').textContent.toLowerCase();
                const status = card.querySelector('.table-status').textContent.toLowerCase();
                
                if (tableNumber.includes(searchTerm) || location.includes(searchTerm) || status.includes(searchTerm)) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
        });
<<<<<<< Updated upstream
    </script>    
=======
    </script>
>>>>>>> Stashed changes
</body>
</html>