/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.restaurant.servlet;

import com.restaurant.model.InventoryItems;
import com.restaurant.service.InventoryService;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;

/**
 *
 * @author Novaline
 */
@WebServlet("/inventory/*")
public class InventoryServlet extends HttpServlet {

    private InventoryService inventoryService;
    
     @Override
      public void init() {
          this.inventoryService = new InventoryService();
      }
      
      @Override
      protected void doGet(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
          String action = request.getPathInfo();
          
          if (action == null || action.equals("/")) {
              // List all inventory items
              request.setAttribute("inventoryItems", inventoryService.getAllInventoryItems());
              request.setAttribute("lowStockItems", inventoryService.getLowStockItems());
              request.getRequestDispatcher("/views/inventory.jsp").forward(request, response);
              } else if (action.equals("/new")) {
                  // Show new inventory item form
                  request.getRequestDispatcher("/views/new-inventory-item.jsp").forward(request, response);
          }
      }
   
   

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getPathInfo();
        
        if (action.equals("/create")) {
            // Create new inventory item
            InventoryItem item = new InventoryItem();
            item.setItemName(request.getParameter("itemName"));
            item.setQuantity(Double.parseDouble(request.getParameter("quantity")));
            item.setUnit(request.getParameter("unit"));
            item.setReorderLevel(Double.parseDouble(request.getParameter("reorderLevel")));
            
            boolean success = inventoryService.addInventoryItem(item);
            if (success) {
                response.sendRedirect(request.getContextPath() + "/inventory");
                } else {
                request.setAttribute("error", "Failed to add inventory item");
                request.getRequestDispatcher("/views/new-inventory-item.jsp").forward(request, response);        
            }
        } else if (action.equals("/update-quantity")) {
            // Update inventory quantity
            int inventoryId = Integer.parseInt(request.getParameter("inventoryId"));
            double quantity = Double.parseDouble(request.getParameter("quantity"));
            
            boolean success = inventoryService.updateInventoryQuantity(inventoryId, quantity);
            response.sendRedirect(request.getContextPath() + "/inventory");
        }
    }

}
