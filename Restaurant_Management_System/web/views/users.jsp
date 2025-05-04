<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Management</title>
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
        .users-table {
            width: 100%;
            border-collapse: collapse;
        }
        .users-table th, .users-table td {
            padding: 0.75rem;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        .users-table th {
            background-color: #f5f5f5;
        }
        .role-badge {
            display: inline-block;
            padding: 0.25rem 0.5rem;
            border-radius: 4px;
            font-size: 0.8rem;
            font-weight: bold;
        }
        .role-badge.admin {
            background-color: #9c27b0;
            color: white;
        }
        .role-badge.manager {
            background-color: #2196F3;
            color: white;
        }
        .role-badge.staff {
            background-color: #4CAF50;
            color: white;
        }
        .btn-sm {
            padding: 0.25rem 0.5rem;
            font-size: 0.8rem;
            margin-right: 0.5rem;
        }
        .btn-sm.delete {
            background-color: #f44336;
        }
    </style>
</head>
<body>
    <jsp:include page="/views/header.jsp" />
    
    <main class="container">
        <h1>User Management</h1>
        
        <div class="actions">
            <a href="${pageContext.request.contextPath}/users/new" class="btn">Add New User</a>
        </div>
        
        <table class="users-table">
            <thead>
                <tr>
                    <th>Username</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Created At</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td>${user.username}</td>
                        <td>${user.fullName}</td>
                        <td>${user.email}</td>
                        <td>
                            <span class="role-badge ${user.role}">${user.role}</span>
                            <form method="POST" action="${pageContext.request.contextPath}/users/update-role" style="display: inline;">
                                <input type="hidden" name="userId" value="${user.userId}">
                                <select name="role" onchange="this.form.submit()">
                                    <option value="admin" ${user.role == 'admin' ? 'selected' : ''}>Admin</option>
                                    <option value="manager" ${user.role == 'manager' ? 'selected' : ''}>Manager</option>
                                    <option value="staff" ${user.role == 'staff' ? 'selected' : ''}>Staff</option>
                                </select>
                            </form>
                        </td>
                        <td>${user.createdAt}</td>
                        <td>
                            <form method="POST" action="${pageContext.request.contextPath}/users/delete" style="display: inline;">
                                <input type="hidden" name="userId" value="${user.userId}">
                                <button type="submit" class="btn-sm delete">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </main>
    
    <jsp:include page="/views/footer.jsp" />
</body>
</html>