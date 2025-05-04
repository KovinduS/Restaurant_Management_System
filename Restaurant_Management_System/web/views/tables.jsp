<%-- 
    Document   : tables
    Created on : May 3, 2025, 10:21:15 PM
    Author     : Kavindi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Table Management</title>
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
             .table-grid {
              display: grid;
              grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
              gap: 1rem;
             }
             .table-card {
                background: white;
                padding: 1rem;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                text-align: center;
                border: 2px solid transparent;
             }
             .table-card.available {
                 border-color: #4CAF50;
             }
             .table-card.occupied {
                 border-color: #f44336;
             }
             .table-card.reserved {
                 border-color: #ff9800;
             }
             .table-card.out_of_service {
                 border-color: #607d8b;
             }
             .table-number {
                 font-size: 1.5rem;
                 font-weight: bold;
                 margin: 0;
             }
             .table-status {
                 margin: 0.5rem 0;
                 font-weight: bold;
             }
              .table-capacity {
                 margin: 0.5rem 0;
                 color: #555; 
              }
              .table-actions {
                  margin-top: 1rem;
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
             <h1>Table Management</h1>
             
             <div class="actions">
                 <a href="${pageContext.request.contextPath}/tables/new" class="btn">Add New Table</a> 
             </div>
             
             <div class="table-grid">
                 <c:forEach var="table" items="${tables}">
                     <div class="table-card ${table.status}">
                        <h3 class="table-number">${table.tableNumber}</h3>
                        <p class="table-status">${table.status}</p>
                        <p class="table-capacity">Capacity: ${table.capacity}</p>
                        <p>${table.location}</p>
                        <div class="table-actions">
                            <a href="${pageContext.request.contextPath}/tables/edit?id=${table.tableId}" class="btn-sm">Edit</a>
                            <c:if test="${table.status != 'occupied'}">
                                <a href="#" class="btn-sm" onclick="updateStatus(${table.tableId}, 'occupied')">Occupy</a>
                            </c:if>
                             <c:if test="${table.status == 'occupied'}">
                            <a href="#" class="btn-sm" onclick="updateStatus(${table.tableId}, 'available')">Free</a>
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
