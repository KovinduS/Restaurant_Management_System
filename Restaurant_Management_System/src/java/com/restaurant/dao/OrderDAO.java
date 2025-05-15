package com.restaurant.dao;

import com.restaurant.model.Order;
import com.restaurant.model.OrderItem;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {
    // Create a new order and return the generated order ID
    public int createOrder(Order order) throws SQLException {
        String sql = "INSERT INTO orders (table_id, user_id, status, total_amount, notes) VALUES (?, ?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            stmt.setInt(1, order.getTableId());
            stmt.setInt(2, order.getUserId());
            stmt.setString(3, order.getStatus());
            stmt.setDouble(4, order.getTotalAmount());
            stmt.setString(5, order.getNotes());
            
            int affectedRows = stmt.executeUpdate();
            
            if (affectedRows == 0) {
                throw new SQLException("Creating order failed, no rows affected.");
            }
            
            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Creating order failed, no ID obtained.");
                }
            }
        }
    }
    
    // Add items to an order
    public boolean addOrderItems(int orderId, List<OrderItem> items) throws SQLException {
        String sql = "INSERT INTO order_items (order_id, item_id, quantity, special_requests, price_at_order) VALUES (?, ?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            // Set auto-commit to false to handle transaction
            conn.setAutoCommit(false);
            
            try {
                for (OrderItem item : items) {
                    stmt.setInt(1, orderId);
                    stmt.setInt(2, item.getItemId());
                    stmt.setInt(3, item.getQuantity());
                    stmt.setString(4, item.getSpecialRequests());
                    stmt.setDouble(5, item.getPriceAtOrder());
                    stmt.addBatch();
                }
                
                int[] results = stmt.executeBatch();
                conn.commit();
                
                // Check if all inserts were successful
                for (int result : results) {
                    if (result == Statement.EXECUTE_FAILED) {
                        return false;
                    }
                }
                return true;
            } catch (SQLException e) {
                conn.rollback();
                throw e;
            } finally {
                conn.setAutoCommit(true);
            }
        }
    }
    
    // Get order by ID with all details
    public Order getOrderById(int orderId) throws SQLException {
        String sql = "SELECT o.*, rt.table_number, u.username FROM orders o " +
                     "JOIN restaurant_tables rt ON o.table_id = rt.table_id " +
                     "JOIN users u ON o.user_id = u.user_id " +
                     "WHERE o.order_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, orderId);
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Order order = mapResultSetToOrder(rs);
                    order.setOrderItems(getOrderItems(conn, orderId));
                    return order;
                }
            }
        }
        return null;
    }
    
    // Get all active orders (pending, preparing, ready)
    public List<Order> getActiveOrders() throws SQLException {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT o.*, rt.table_number, u.username FROM orders o " +
                     "JOIN restaurant_tables rt ON o.table_id = rt.table_id " +
                     "JOIN users u ON o.user_id = u.user_id " +
                     "WHERE o.status IN ('pending', 'preparing', 'ready') " +
                     "ORDER BY o.order_date";
        
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                Order order = mapResultSetToOrder(rs);
                order.setOrderItems(getOrderItems(conn, order.getOrderId()));
                orders.add(order);
            }
        }
        return orders;
    }
    
    // Update order status
    public boolean updateOrderStatus(int orderId, String status) throws SQLException {
        String sql = "UPDATE orders SET status = ? WHERE order_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, status);
            stmt.setInt(2, orderId);
            
            return stmt.executeUpdate() > 0;
        }
    }
    
    // Get completed orders (served or paid) for a specific date
    public List<Order> getCompletedOrders(Date date) throws SQLException {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT o.*, rt.table_number, u.username FROM orders o " +
                     "JOIN restaurant_tables rt ON o.table_id = rt.table_id " +
                     "JOIN users u ON o.user_id = u.user_id " +
                     "WHERE o.status IN ('served', 'paid') AND DATE(o.order_date) = ? " +
                     "ORDER BY o.order_date";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setDate(1, date);
            
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Order order = mapResultSetToOrder(rs);
                    order.setOrderItems(getOrderItems(conn, order.getOrderId()));
                    orders.add(order);
                }
            }
        }
        return orders;
    }
    
    // Helper method to get order items (uses existing connection)
    private List<OrderItem> getOrderItems(Connection conn, int orderId) throws SQLException {
        List<OrderItem> items = new ArrayList<>();
        String sql = "SELECT oi.*, mi.item_name FROM order_items oi " +
                     "JOIN menu_items mi ON oi.item_id = mi.item_id " +
                     "WHERE oi.order_id = ?";
        
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, orderId);
            
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    OrderItem item = new OrderItem();
                    item.setOrderItemId(rs.getInt("order_item_id"));
                    item.setOrderId(rs.getInt("order_id"));
                    item.setItemId(rs.getInt("item_id"));
                    item.setQuantity(rs.getInt("quantity"));
                    item.setSpecialRequests(rs.getString("special_requests"));
                    item.setPriceAtOrder(rs.getDouble("price_at_order"));
                    item.setItemName(rs.getString("item_name"));
                    items.add(item);
                }
            }
        }
        return items;
    }
    
    // Helper method to map ResultSet to Order object
    private Order mapResultSetToOrder(ResultSet rs) throws SQLException {
        Order order = new Order();
        order.setOrderId(rs.getInt("order_id"));
        order.setTableId(rs.getInt("table_id"));
        order.setUserId(rs.getInt("user_id"));
        order.setOrderDate(rs.getTimestamp("order_date"));
        order.setStatus(rs.getString("status"));
        order.setTotalAmount(rs.getDouble("total_amount"));
        order.setNotes(rs.getString("notes"));
        order.setTableNumber(rs.getString("table_number"));
        order.setUserName(rs.getString("username"));
        return order;
    }
    
    // Get orders by table ID
    public List<Order> getOrdersByTable(int tableId) throws SQLException {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT o.*, rt.table_number, u.username FROM orders o " +
                     "JOIN restaurant_tables rt ON o.table_id = rt.table_id " +
                     "JOIN users u ON o.user_id = u.user_id " +
                     "WHERE o.table_id = ? AND o.status NOT IN ('paid', 'cancelled') " +
                     "ORDER BY o.order_date DESC";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, tableId);
            
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Order order = mapResultSetToOrder(rs);
                    order.setOrderItems(getOrderItems(conn, order.getOrderId()));
                    orders.add(order);
                }
            }
        }
        return orders;
    }
    
    // Get today's revenue
    public double getTodaysRevenue() throws SQLException {
        String sql = "SELECT COALESCE(SUM(total_amount), 0) AS revenue FROM orders " +
                     "WHERE status = 'paid' AND DATE(order_date) = CURRENT_DATE()";
        
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            if (rs.next()) {
                return rs.getDouble("revenue");
            }
        }
        return 0;
    }
}