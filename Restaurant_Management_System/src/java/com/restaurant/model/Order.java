/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.restaurant.model;

import java.sql.Timestamp;
import java.util.List;

/**
 *
 * @author Novaline
 */
public class Order {
    private int orderId;
    private int tableId;
    private int userId;
    private Timestamp orderDate;
    private String status;
    private double totalAmount;
    private String notes;
    private List<OrderItem> orderItems;
    private String tableNumber;
    private String userName;
    
    public Order() {}
    
    public Order(int orderId, int tableId, int userId, Timestamp orderDate,String status, double totalAmount, String notes) {
        this.orderId = orderId;
        this.tableId = tableId;
        this.userId = userId;
        this.orderDate = orderDate;
        this.status = status;
        this.totalAmount = totalAmount;
        this.notes = notes;
    }
    
    public int getOrderId() {
        return orderId;
    }
    
    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }
    
    public int getTableId() {
        return tableId;
    } 
    
     public void setTableId(int tableId) {
         this.tableId = tableId;
     }
     
     public int getUserId() {
         return userId;
     } 

    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    public Timestamp getOrderDate() {
        return orderDate;
    }
    
    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }
    
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status =  status;
    }
    
     public double getTotalAmount() {
         return totalAmount;
     }
     
     public void setTotalAmount(double totalAmount) {
         this.totalAmount = totalAmount;
     }
     
     public String getNotes() {
         return notes;
     }
     
     public void setNotes(String notes){
         this.notes = notes;
     }
     
     public List<OrderItem> getOrderItems() {
         return orderItems;
     }
     
     public void setOrderItems(List<OrderItem> orderItems) {
         this.orderItems = orderItems;
     }
   
     public String getTableNumber() {
         return tableNumber;
     }
     
     public void setTableNumber(String tableNumber) {
         this.tableNumber = tableNumber;
     }
    
      public String getUserName() {
          return userName;
      }
      
      public void setUserName(String userName) {
          this.userName = userName;
      }
}

