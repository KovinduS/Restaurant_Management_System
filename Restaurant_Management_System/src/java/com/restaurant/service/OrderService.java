/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.restaurant.service;

import com.restaurant.dao.OrderDAO;
import com.restaurant.model.Order;
import com.restaurant.model.OrderItem;
import java.util.List;

/**
 *
 * @author Novaline
 */
public class OrderService {
     private OrderDAO orderDao;
     
     public OrderService(){
         this.orderDao = new OrderDAO();
     }
     
     public int createOrder (Order order,List<OrderItem> items){
         try{
             int orderId = orderDao.createOrder(order);
             if (orderId > 0){
                 boolean itemsAdded = orderDao.addOrderItems(orderId, items);
                 if (itemsAdded){
                     return orderId;
                 }
             }
             return -1;
         }catch (Exception e){
             e.printStackTrace();
                     return -1;
         }
     }
     
     public List<Order> getActiveOrders() {
         try{
             return orderDao.getActiveOrders();
         } catch (Exception e){
             e.printStackTrace();
             return null;
         }
     }
     
      public boolean updateOrderStatus(int orderId, String status) {
          try{
              return orderDao.updateOrderStatus(orderId, status) ;
          }catch (Exception e) {
              e.fillInStackTrace();
              return false;
          }
      }
      
      public Order getOrderById(int orderId) {
          try{
              return orderDao.getOrderById(orderId);
          }catch (Exception e){
              e.printStackTrace();
              return null;
          }
      }
}
