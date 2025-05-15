package com.restaurant.controller;

import com.restaurant.service.OrderService;
import com.restaurant.service.TableService;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
    private OrderService orderService;
    private TableService tableService;
    
    @Override
    public void init() {
        this.orderService = new OrderService();
        this.tableService = new TableService();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Check if user is logged in
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        // Add dashboard data to request
        request.setAttribute("activeOrders", orderService.getActiveOrders());
        request.setAttribute("availableTables", tableService.getAllTables().stream()
                .filter(t -> "available".equals(t.getStatus()))
                .count());
        
        request.getRequestDispatcher("/views/dashboard.jsp").forward(request, response);
    }
}