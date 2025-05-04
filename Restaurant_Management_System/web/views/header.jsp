<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header>
    <h1>
        Restaurant Management System 
    </h1>
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
            <li><a href="${pageContext.request.contextPath}/auth/logout">
        </ul>
    </nav>
</header>
