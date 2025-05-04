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
public class OrderItem {
    private int orderItemId;
    private int orderId;
    private int itemId;
    private int quantity;
    private String specialRequests;
    private double priceAtOrder;
    private String itemName;
    
    //constructors
    public OrderItem(){}
    
    public OrderItem(int orderItemId, int orderId, int itemId, int quantity,String specialRequests, double priceAtOrder,String itemName) {
        this.orderItemId = orderItemId;
        this.orderId = orderId;
        this.itemId = itemId;
        this.quantity = quantity;
        this.specialRequests = specialRequests;
        this.priceAtOrder = priceAtOrder;
        this.itemName = itemName;
    } 
    
    public int getOrderItemId(){
        return orderItemId;
    }
      
    public void setOrderItemId(int orderItemId) {
        this.orderItemId = orderItemId;
    }
    
     public int getOrderId() {
         return orderId;
     }
     
     public void setOrderId(int orderId) {
         this.orderId = orderId;
     }
     
     public int getItemId() {
         return itemId;
     }
     
      public void setItemId(int itemId) {
          this.itemId = itemId;
      }
      
       public int getQuantity() {
           return quantity;
       }
       
      public void setQuantity(int quantity) {
          this.quantity = quantity;
      } 
      
       public String getSpecialRequests() {
           return specialRequests;
       } 
       
       public void setSpecialRequests(String specialRequests) {
           this.specialRequests = specialRequests;
       }
       
        public double getPriceAtOrder() {
            return priceAtOrder;
        }
        
        public void setPriceAtOrder(double priceAtOrder) {
            this.priceAtOrder = priceAtOrder;
        }
        
        public String getItemName() {
            return  itemName;
        } 
        
        public void setItemName(String itemName) {
            this.itemName = itemName;
        }
        
}
