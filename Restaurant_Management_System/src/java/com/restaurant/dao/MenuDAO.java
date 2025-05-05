package com.restaurant.dao;

import com.restaurant.model.MenuCategory;
import com.restaurant.model.MenuItem;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MenuDAO {
    //category CRUD operations
    
    //create new category
    public boolean addCategory(MenuCategory category) throws SQLException {
        String sql ="INSERT INTO menu_categories (category_name, description) VALUES (?,?,)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            
            stmt.setSrting(1, category.getCategoryName());
            stmt.setString(2, category.getDescription());
            
            return stmt.executeUpdate () > 0;
        }         
    }
        
        //get category by ID
         public MenuCategory getCategoryById(int categoryId) throws SQLException {
            String sql ="SELECT * FROM menu_categories WHERE category_id = ?";
            try (Connection conn = DBConnection.getConnection();
                    PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, categoryId);
                try(ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        return mapResultSetToCategory(rs);
                    }
                }
            }
            return null;
        }
         //update category
         public boolean updateCategory(MenuCategory category) throws SQLException {
             String sql = "UPDATE menu_categories SET category_name = ?, description = ? WHERE category_id ?";
             try (Connection conn = DBConnection.getConnection();
                 PreparedStatement stmt = conn.prepareStatement(sql)) {
                 
                 stmt.setString(1, category.getCategoryName());
                 stmt.setString(2, category.getDescription());
                 stmt.setInt(3, category.getCategoryId());
                 
                 return stmt.executeUpdate() > 0;
             }
             
         //delete category
         public boolean deleteCategory(int categoryId) throws SQLException {
                 String sql = "DELETE FROM menu_categories WHERE category_id = ?";
                 try (Connection conn = DBConnection.getConnection();
                         PreparedStatement stmt = conn.prepareStatement(sql)) {
                     
                     stmt.setInt(1, categoryId);
                     return stmt.executeUpdate() > 0;
                 }
             }
             
             
             //get all menu category
            public List<MenuCategory> getAllCategories() throws SQLException {
                 List<MenuCategory> categories = new ArrayList<>();
                 String sql = "SELECT * FROM menu_categories ORDER BY category_name";
                 
                 try (Connection conn = DBConnection.getConnection();
                   Statement stmt = conn.createStatement();   
                   ResultSet rs = stmt.executeQuery(sql)) {
                     
                while (rs.next()) {
                    categories.add(mapResultSetToCategory(rs));
                }
            }
            return categories;
            
        }
             
    // Menu Item operations (existing)
             public List<MenuItem> getAllMenuItems() throws SQLException {
               List<MenuItem> items = new ArrayList<>(); 
               String sql = "SELECT mi.*, mc.category_name FROM menu_items mi " +
                       "JOIN menu_categories mc ON mi.category_id = mc.category_id " +
                       "ORDER BY mc.category_name, mi.item_name";
               
               try (Connection conn = DBConnection.getConnection();
                       Statement stmt = conn.createStatement();
                       ResultSet rs = stmt.executeQuery(sql)) {
                   
                while (rs.next()) {
                      items.add(mapResultSetToMenuItem(rs));
                } 
            }
            return items;
            
        }
         public boolean addMenuItem(MenuItem item) throws SQLException {
             String sql = "INSERT INTO menu_items (category_id, item_name, description, price, image_path, is_available) " +
                     "VALUES (?, ?, ?, ?, ?, ?)";
             try (Connection conn = DBConnection.getConnection();
                     PreparedStatement stmt = conn.prepareStatement(sql)) {
                 
                 stmt.setInt(1, item.getCategoryId());
                 stmt.setString(2, item.getItemName());
                 stmt.setString(3, item.getDescription());
                 stmt.setDouble(4, item.getPrice());
                 stmt.setString(5, item.getImagePath());
                 stmt.setBoolean(6, item.isAvailable());
                 
                 return stmt.executeUpdate() > 0;
            }
        }  
         
         public boolean updateItemAvailability(int itemId, boolean isAvailable) throws SQLException {
             String sql = "UPDATE menu_items SET is_available = ? WHERE item_id = ?";
             try (Connection conn = DBConnection.getConnection();
                     PreparedStatement stmt = conn.prepareStatement(sql)) {
                 
                 stmt.setBoolean(1, isAvailable);
                 stmt.setInt(2, itemId);
                 stmt.setInt(2, itemId);
             }
         }
         
         //helper methods
         private MenuCategory mapResultSetToCategory(ResultSet rs) throws SQLException {
             MenuCategory category = new MenuCategory();
             category.setCategoryId(rs.getInt("category_id"));
             category.setCategoryName(rs.getString("category_name"));
             category.setDescription(rs.getString("description"));
             return category;
         }
         
         private MenuItem mapResultSetToMenuItem(ResultSet rs) throws SQLException {
             MenuItem item = new MenuItem();
             item.setItemId(rs.getInt("item_id"));
             item.setCategoryId(rs.getInt("category_id"));
             item.setItemName(rs.getString("item_name"));
             item.setDescription(rs.getString("description"));
             item.setPrice(rs.getDouble("price"));
             item.setImagePath(rs.getString("image_path"));
             item.setAvailable(rs.getBoolean("is_available"));
             item.setCategoryName(rs.getString("category_name"));
             return item;
         }
}
