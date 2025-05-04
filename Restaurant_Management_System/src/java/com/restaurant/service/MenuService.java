/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.restaurant.service;

import com.restaurant.dao.MenuDAO;
import com.restaurant.model.MenuCategory;
import com.restaurant.model.MenuItem;
import java.util.List;

public class MenuService {
    private MenuDAO menuDao;
    
    public MenuService() {
        this.menuDao = new MenuDAO();
    }
    
    // Category operations
     public boolean addCategory(MenuCategory category) {
         try {
             return menuDao.addCategory(category);
             } catch (Exception e) {
                 e.printStackTrace();
                 return false;
         }
     }
    
     public MenuCategory getCategoryById(int categoryId) {
         try {
            return menuDao.getCategoryById(categoryId);
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
     }
     
     public boolean updateCategory(MenuCategory category) {
         try {
             return menuDao.updateCategory(category);
             } catch (Exception e) {
                 e.printStackTrace();
                 return false;
         }
     }
     
     public boolean deleteCategory(int categoryId) {
         try {
             return menuDao.deleteCategory(categoryId);
             } catch (Exception e) {
                 e.printStackTrace();
                 return false;
         }
     }
     
     public List<MenuCategory> getAllCategories() {
         try {
            return menuDao.getAllCategories();
            } catch (Exception e) {
            e.printStackTrace();
            return null;
            }
     }
     // Menu Item operations
     public List<MenuItem> getAllMenuItems() {
         try {
            return menuDao.getAllMenuItems();
            } catch (Exception e) {
            e.printStackTrace();
            return null;
            }
     }
     
     public boolean addMenuItem(MenuItem item) {
         try {
            return menuDao.addMenuItem(item);
             } catch (Exception e) {
            e.printStackTrace();
             return false;
        }
     }
     
     public boolean updateItemAvailability(int itemId, boolean isAvailable) {
        try {
            return menuDao.updateItemAvailability(itemId, isAvailable);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        }
}
