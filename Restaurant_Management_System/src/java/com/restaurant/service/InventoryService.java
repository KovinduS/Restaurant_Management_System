package com.restaurant.service;

import com.restaurant.dao.InventoryDAO;
import com.restaurant.model.InventoryItem;
import java.util.List;

    public class InventoryService {
        private InventoryDAO inventoryDao;
    
        public InventoryService() {
           this.inventoryDao = new InventoryDAO();
        }

        public List<InventoryItem> getAllInventoryItems(){
           try {
               return inventoryDao.getAllInventoryItems();
           } catch (Exception e) {
                e.printStackTrace();
               return null;
        }  
    }
        public List<InventoryItem> getLowStockItems() { 
            try {
               return inventoryDao.getLowStockItems();
            } catch (Exception e) {
                e.printStackTrace();
            return null;
            }
        }

        public boolean updateInventoryQuantity(int inventoryId, double quantity) {
            try {
                return inventoryDao.updateInventoryQuantity(inventoryId, quantity);
            } catch (Exception e) {
                 e.printStackTrace();
                return false;
            }
        }

        public boolean addInventoryItem(InventoryItem item) {
            try {
                return inventoryDao.addInventoryItem(item);
            } catch (Exception e) {
                 e.printStackTrace();
                 return false;
            }
        }
}


    


