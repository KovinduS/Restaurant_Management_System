package com.restaurant.model;

import java.sql.Timestamp;

public class InventoryItem {
    private int inventoryId;
    private String itemName;
    private double quantity;
    private String unit;
    private Double reorderLevel;
    private Timestamp lastUpdated;
    
    //Constructors
    public InventoryItem() {}
    
    public InventoryItem(int inventoryId, String itemName, double quantity,
                        String unit,Double reorderLevel, Timestamp lastUpdated) {
        this.inventoryId = inventoryId;
        this.itemName = itemName;
        this.quantity = quantity;
        this.unit = unit;
        this.reorderLevel = reorderLevel;
        this.lastUpdated = lastUpdated;
    }
    
    //Getters and Setters
    public int getInventoryId() {
        return inventoryId;
    }
    
    public void setInventoryId(int inventoryId) {
        this.inventoryId = inventoryId;
    }
    
    public String getItemName() {
        return itemName;
    }
    
    public void setItemName(String itemName) {
        this.itemName = itemName;
    }
    
    public double getQuantity() {
        return quantity;
    }
    
    public void setQuantity(double quantity) {
        this.quantity = quantity;
    }
    
    public String getUnit() {
        return unit;
    }
    
    public void setUnit(String unit) {
        this.unit = unit;
    }
    
    public Double getReorderLevel() {
        return reorderLevel;
    }
    
    public void setReorderLevel(Double reorderLevel) {
        this.reorderLevel = reorderLevel;
    }
    
    public Timestamp getLastUpdated() {
        return lastUpdated;
    }
    
    public void setLastUpdated(Timestamp lastUpdated) {
        this.lastUpdated = lastUpdated;
    }
}            
