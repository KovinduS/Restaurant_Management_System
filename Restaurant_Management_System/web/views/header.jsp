<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <style>
          /* ===== Header ===== */
        header {
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

       header h1 {
           font-size: 2rem;
            font-weight: bold;
            color: #fff;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
               }


         header h1 .bay {
               color: #64dfdf;
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
            font-weight: 500;
            transition: all 0.3s ease;
        }

        nav ul li a:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }
        
    </style>
    <header>
        <div class="header-content">
           <div class="header-content">
           <h1><span class="maya">MaYa</span> <span class="bay">BaY</span></h1>  
        </div>
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