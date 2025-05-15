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
public class MenuItem {
    private int itemId;
    private int categoryId;
    private String itemName;
    private String description;
    private double price;
    private String imagePath;
    private boolean isAvailable;
    private String categoryName;//for display purposes
    
    public MenuItem(){}
    
    public MenuItem(int itemId, int categoryId, String itemName, String description,double price, String imagePath, boolean isAvailable){
        this.itemId = itemId;
        this.categoryId = categoryId;
        this.itemName = itemName;
        this.description = description;
        this.price = price;
        this.imagePath = imagePath;
        this.isAvailable = isAvailable;
    }
    
    public int getItemId(){
        return itemId;
    }
    
    public void setItemId(int itemId) {
        this.itemId = itemId;
    }
    
    public int getCategoryId() {
        return categoryId;
    } 
    
    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }
    
    public String getItemName() {
        return itemName;
    }
    
    public void setItemName(String itemName) {
        this.itemName = itemName;
    }
    
     public String getDescription() {
         return description;
     }
     
     public void setDescription(String description) {
         this.description = description;
     }
     
     public double getPrice() {
         return price;
     }
     
      public void setPrice(double price) {
          this.price = price;
      }
     
      public String getImagePath() {
          return imagePath;
      }
      
      public void setImagePath(String imagePath) {
          this.imagePath = imagePath;
      }
      
      public boolean isAvailable() {
          return isAvailable;
      }
      
      public void setAvailable(boolean available) {
         isAvailable = available;
      }
      
      public String getCategoryName() {
          return categoryName;
      }
      
      public void setCategoryName(String categoryName) {
          this.categoryName = categoryName;
      }
    
    
}
