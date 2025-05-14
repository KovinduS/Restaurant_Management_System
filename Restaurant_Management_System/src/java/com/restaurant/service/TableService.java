package com.restaurant.service;

import com.restaurant.dao.TableDAO;
import com.restaurant.model.RestaurantTable;
import java.util.List;

public class TableService {
    private TableDAO tableDao;
    
    public TableService() {
        this.tableDao = new TableDAO();
    }
    
    public List<RestaurantTable> getAllTables() {
        try {
            return tableDao.getAllTables();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public RestaurantTable getTableById(int tableId) {
        try {
           return tableDao.getTableById(tableId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
       } 
    }
    
    public boolean updateTableStatus(int tableId, String status) {
        try {
            return tableDao.updateTableStatus(tableId, status);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean addTable(RestaurantTable table) {
        try {
            return tableDao.addTable(table);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}