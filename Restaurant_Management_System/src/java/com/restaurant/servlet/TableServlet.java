package com.restaurant.controller;

import com.restaurant.model.RestaurantTable;
import com.restaurant.service.TableService;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/tables/*")
public class TableServlet extends HttpServlet {
    private TableService tableService;
    
    @Override
    public void init() {
        this.tableService = new TableService();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getPathInfo();
        
        if (action == null || action.equals("/")) {
            // List all tables
            request.setAttribute("tables", tableService.getAllTables());
            request.getRequestDispatcher("/views/tables.jsp").forward(request, response);
        } else if (action.equals("/new")) {
            // Show new table form
            request.getRequestDispatcher("/views/new-table.jsp").forward(request, response);
        } else if (action.equals("/edit")) {
            // Show edit table form
            int tableId = Integer.parseInt(request.getParameter("id"));
            request.setAttribute("table", tableService.getTableById(tableId));
            request.getRequestDispatcher("/views/edit-table.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getPathInfo();
        
        if (action.equals("/create")) {
            // Create new table
            RestaurantTable table = new RestaurantTable();
            table.setTableNumber(request.getParameter("tableNumber"));
            table.setCapacity(Integer.parseInt(request.getParameter("capacity")));
            table.setStatus(request.getParameter("status"));
            table.setLocation(request.getParameter("location"));
            
            boolean success = tableService.addTable(table);
            if (success) {
                response.sendRedirect(request.getContextPath() + "/tables");
            } else {
                request.setAttribute("error", "Failed to add table");
                request.getRequestDispatcher("/views/new-table.jsp").forward(request, response);
            }
        }else if (action.equals("/update-status")) {
            // Update table status
            int tableId = Integer.parseInt(request.getParameter("tableId"));
            String status = request.getParameter("status");
            
            boolean success = tableService.updateTableStatus(tableId, status);
            response.sendRedirect(request.getContextPath() + "/tables");
        }
    }
}