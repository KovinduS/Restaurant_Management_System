/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.restaurant.model;

/**
 *
 * @author Novaline
 */
public class RestaurantTable {
     private int tableId;
     private String tableNumber;
     private int capacity;
     private String status;
     private String location;
     
     // Constructors
    public RestaurantTable() {}
    
    public RestaurantTable(int tableId,String tableNumber, int capacity, String status,String location){
        this.tableId = tableId;
        this.tableNumber = tableNumber;
        this.capacity = capacity;
        this.status = status;
        this. location = location;
    }
    
    // Getters and Setters
    public int getTableId() {
        return tableId;
    }
    
    public void setTableId(int tableId) {
        this.tableId = tableId;
    }
    
     public String getTableNumber() {
        return tableNumber;
    }

     public void setTableNumber(String tableNumber) {
        this.tableNumber = tableNumber;
    }
    
    public int getCapacity() {
        return capacity;
        
    }
    
     public void setCapacity(int capacity) {
        this.capacity = capacity;
    }
    
     public String getStatus() {
        return status;
    }
     
      public void setStatus(String status) {
        this.status = status;
    }
      
      public String getLocation() {
        return location;
    }
      
      public void setLocation(String location) {
          this.location = location;
      }
}
