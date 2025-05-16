<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MaYa BaY - User Management</title>
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
            margin: 2rem auto;
            padding: 0 2rem;
        }

        .container h1 {
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

        /* ===== Users Table ===== */
        .users-table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 0 20px rgba(0,0,0,0.05);
        }

        .users-table th, .users-table td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid #e0f7fa;
        }

        .users-table th {
            background-color: #00acc1;
            color: white;
            font-weight: 500;
        }

        .users-table tr:hover {
            background-color: #f5fdff;
        }

        /* ===== Role Badges ===== */
        .role-badge {
            display: inline-block;
            padding: 0.4rem 0.8rem;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
            margin-right: 0.5rem;
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

        /* ===== Role Selector ===== */
        .role-selector {
            padding: 0.4rem;
            border: 1px solid #b2ebf2;
            border-radius: 6px;
            background-color: #f5fdff;
            font-size: 0.9rem;
            transition: all 0.3s ease;
        }

        .role-selector:focus {
            outline: none;
            border-color: #00acc1;
            box-shadow: 0 0 0 3px rgba(0, 172, 193, 0.2);
        }

        /* ===== Action Buttons ===== */
        .action-buttons {
            display: flex;
            gap: 0.5rem;
        }

        .btn-sm {
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s ease;
            border: none;
        }

        .btn-delete {
            background-color: #f44336;
            color: white;
        }

        .btn-delete:hover {
            background-color: #d32f2f;
            transform: translateY(-1px);
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
            
            .users-table {
                display: block;
                overflow-x: auto;
            }
            
            .action-buttons {
                flex-direction: column;
            }
            
            .btn-sm {
                width: 100%;
                text-align: center;
            }
        }
    </style>
</head>
<body>
    <div class="water-decoration" style="top:20%; left:10%;"></div>
    <div class="water-decoration" style="bottom:15%; right:10%; transform:rotate(30deg);"></div>
    
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
                                <select name="role" class="role-selector" onchange="this.form.submit()">
                                    <option value="admin" ${user.role == 'admin' ? 'selected' : ''}>Admin</option>
                                    <option value="manager" ${user.role == 'manager' ? 'selected' : ''}>Manager</option>
                                    <option value="staff" ${user.role == 'staff' ? 'selected' : ''}>Staff</option>
                                </select>
                            </form>
                        </td>
                        <td>${user.createdAt}</td>
                        <td>
                            <div class="action-buttons">
                                <form method="POST" action="${pageContext.request.contextPath}/users/delete" style="display: inline;">
                                    <input type="hidden" name="userId" value="${user.userId}">
                                    <button type="submit" class="btn-sm btn-delete" 
                                        onclick="return confirm('Are you sure you want to delete this user?')">Delete</button>
                                </form>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </main>
    
    <jsp:include page="/views/footer.jsp" />
</body>
</html>