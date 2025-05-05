package com.restaurant.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/restaurant_db";
    private static final String USER = "root";
    private static final String PASSWORD = "";
    
    public static Connection getConnection() throws SQLException {
        try {
             Class.forName("com.mysql.cj.jdbc.Driver");
             return DriverManager.getConnection(URL, USER, PASSWORD);
         } catch (ClassNotFoundException e) {
             throw new SQLException("MySQL JDBC Driver not found", e);
        }
    }
}
