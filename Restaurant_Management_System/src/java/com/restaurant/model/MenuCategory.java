package com.restaurant.model;

public class MenuCategory {
    private int categoryId;
    private String categoryName;
    private String description;
    
    //Constructors
    public MenuCategory() {}
    
    public MenuCategory(int categoryId, String categoryName, String description) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.description = description;
    }
    
    //Getters and Setters 
    public int getCategoryId() {
        return categoryId;
    }
    
    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }
    
    public String getCategoryName() {
        return categoryName;
    }
    
    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
    
    public String getDesciption() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    @Override
    public String toString() {
        return "MenuCategory{" +
                "categoryId=" + categoryId +
                ", categoryName'" + categoryName + '\'' +
                ",description='" + description + '\''+
                '}';
    }
}
