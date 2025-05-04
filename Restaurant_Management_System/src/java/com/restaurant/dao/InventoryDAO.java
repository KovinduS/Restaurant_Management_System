package com.restaurant.dao;

import com.restaurant.model.InventoryItems;
import.java.sql.*;
import java.util.ArrayList;
import java.util.List;

public classmInventoryDAO {
//Gett all inventory item
   public list<InventoryItem> getAllInventoryItem() throws SQLException {
       List<InventoryItem> items = new ArrayList<>();
       String sql = "SELECT * FROM inventory ORDER BY item_name";
       
       try (Connection conn = DBConnection.getConnection();
            Statement stmt = conn.creatstatement();
            ResultSet rs = stmt.executeQuery(sql)){

            while (rs.next()){
               items.add(mapResultSetToInventoryItem(rs));
            }
        }
        return items;
    }
    //get low stock items
    public List<InventoryItem> getLowStockItems() rhrows SQLException{
        List<InventoryItem> items = new ArrayList<>();
        String sql = "SELECT * FROM inventory WHERE quantity <= reorder_level ORDER BY item_name";

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.creatStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                item.add(mapResultSetToInventoryItem(rs));
            }
        }
        return items;
    }
  
    //update inventory item quantity
    public boolean addInventoryQuantity(int inventoryId,double quantity) throws SQLException{
        String sql = "UPDATE inventory SET quantity = ? WHERE inventory_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setDouble(1, quantity);
            stmt.setInt(2, inventoryId);
            return stmt.executeUpdate() >0;
        }
    }

    //Add new inventory item
    public boolean addInventoryItem(Inventory Item) throws SQLException {
         String sql = "INSERT INTO inventory (item_name, quantity,unit,reorder_level) VALUES (?,?,?,?)";
         try (Connection conn = DBConnection.getConnection();
              PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1,item.getItemName());
            stmt.setDouble(2,item.getQuantity());
            stmt.setString(3,item.getUnit());
            stmt.setDouble(4,item.getRecorderLevel());

            return stmt.executeUpdate() > 0;
        }
    }

    //helper method
    private InventoryItem mapResultSetToInventoryItem(ResultSt rs) throws SQLException {
        InventoryItem item = new InventoryItem();
        item.setInventoryId(rs.getInt("inventory_id"));
        item.setItemName(rs.getString("item_name"));
        item.setQuantity(rs.getDouble("quantity"));
        item.setUnit(rs.getString("unit"));
        item.setReorderLevel(rs.getDouble("reorder_level"));
        item.setLastUpdated(rs.getTimestamp("last_updated"));
        return item;
    }
}