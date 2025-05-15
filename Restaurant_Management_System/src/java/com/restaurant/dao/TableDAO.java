package com.restaurant.dao;

import com.restaurant.model.RestaurantTable;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TableDAO {
    // Get all tables
    public List<RestaurantTable> getAllTables() throws SQLException {
        List<RestaurantTable> tables = new ArrayList<>();
        String sql = "SELECT * FROM restaurant_tables ORDER BY table_number";
        
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                tables.add(mapResultSetToTable(rs));
            }
        }
        return tables;
    }
    
    // Get table by ID
    public RestaurantTable getTableById(int tableId) throws SQLException {
        String sql = "SELECT * FROM restaurant_tables WHERE table_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, tableId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToTable(rs);
                }
            }
        }
        return null;
    }
    
    // Update table status
    public boolean updateTableStatus(int tableId, String status) throws SQLException {
        String sql = "UPDATE restaurant_tables SET status = ? WHERE table_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, status);
            stmt.setInt(2, tableId);
            return stmt.executeUpdate() > 0;
        }
    }
    
    // Add new table
    public boolean addTable(RestaurantTable table) throws SQLException {
        String sql = "INSERT INTO restaurant_tables (table_number, capacity, status, location) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, table.getTableNumber());
            stmt.setInt(2, table.getCapacity());
            stmt.setString(3, table.getStatus());
            stmt.setString(4, table.getLocation());
            
            return stmt.executeUpdate() > 0;
        }
    }
    
    // Helper method
    private RestaurantTable mapResultSetToTable(ResultSet rs) throws SQLException {
        RestaurantTable table = new RestaurantTable();
        table.setTableId(rs.getInt("table_id"));
        table.setTableNumber(rs.getString("table_number"));
        table.setCapacity(rs.getInt("capacity"));
        table.setStatus(rs.getString("status"));
        table.setLocation(rs.getString("location"));
        return table;
    }
}