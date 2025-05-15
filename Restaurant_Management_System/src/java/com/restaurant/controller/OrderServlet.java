/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.restaurant.controller;

import com.restaurant.model.Order;
import com.restaurant.model.OrderItem;
import com.restaurant.service.OrderService;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import java.util.ArrayList;
import java.util.List;


@WebServlet("/orders/*")
public class OrderServlet extends HttpServlet {
        private OrderService orderService;
               @Override
    public void init() {
        this.orderService = new OrderService();
    }
    

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String action = request.getPathInfo();
         
         if (action == null || action.equals("/")) {
             // List all active orders
            request.setAttribute("orders", orderService.getActiveOrders());
             request.getRequestDispatcher("/views/orders.jsp").forward(request, response);
        } else if (action.equals("/view")) {
            // View single order
            int orderId = Integer.parseInt(request.getParameter("id"));
             request.setAttribute("order", orderService.getOrderById(orderId));
              Order order = orderService.getOrderById(orderId);
              
              if (order != null) {
                  // Set order details as attributes for the JSP
                  request.setAttribute("orderId", order.getOrderId());
                  request.setAttribute("customerName", order.getUserName());
                  request.setAttribute("orderDate", order.getOrderDate());
                  request.setAttribute("orderItems", order.getOrderItems());
              }else{
                  // Handle case where order is not found
                  request.setAttribute("error", "Order not found");
              }
              
              // Forward to the order details page
               request.getRequestDispatcher("/views/order-details.jsp").forward(request, response);
             } else if (action.equals("/new")) {
                    // Show new order form
                     request.getRequestDispatcher("/views/new-order.jsp").forward(request, response);
             }
    }  

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getPathInfo();
        
        if (action.equals("/create")) {
            // Create new order
            Order order = new Order();
            order.setTableId(Integer.parseInt(request.getParameter("tableId")));
            order.setUserId((Integer) request.getSession().getAttribute("userId"));
            order.setStatus("pending");
            order.setNotes(request.getParameter("notes"));
            
            
            // Process order items
            String[] itemIds = request.getParameterValues("itemId");
            String[] quantities = request.getParameterValues("quantity");
            String[] specialRequests = request.getParameterValues("specialRequests");
            
            List<OrderItem> items = new ArrayList<>();
            double totalAmount = 0;
            
            // In a real app, you'd get prices from the database
            for (int i = 0; i < itemIds.length; i++) {
                OrderItem item = new OrderItem();
                item.setItemId(Integer.parseInt(itemIds[i]));
                item.setQuantity(Integer.parseInt(quantities[i]));
                item.setSpecialRequests(specialRequests[i]);
                item.setPriceAtOrder(10.99); // This should come from menu items
                items.add(item);
                
                totalAmount += item.getQuantity() * item.getPriceAtOrder();
            }
            
            order.setTotalAmount(totalAmount);
            
            int orderId = orderService.createOrder(order, items);
            if (orderId > 0) {
                response.sendRedirect(request.getContextPath() + "/orders/view?id=" + orderId);
                 } else {
                request.setAttribute("error", "Failed to create order");
                request.getRequestDispatcher("/views/new-order.jsp").forward(request, response);
            }
            
        }
    }



}
