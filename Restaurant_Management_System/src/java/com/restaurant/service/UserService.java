/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.restaurant.service;

import com.restaurant.dao.UserDAO;
import com.restaurant.model.User;
import java.util.List;

/**
 *
 * @author Novaline
 */
public class UserService {
    private UserDAO userDao;
    
    public UserService(){
        this.userDao = new UserDAO();
    }
    
    public User authenticate (String username,String password){
        try{
            return userDao.authenticate(username, password);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
    
    public boolean registerUser (User user){
        try{
            return userDao.createUser(user);
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }
    
    public List<User>getAllUsers(){
        try{
            return userDao.getAllUsers();
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    
    public boolean updateUserRole(int userId,String role){
        try{
            return userDao.updateUserRole(userId, role);
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean deleteUser(int userId){
        try{
            return userDao.deleteUser(userId);
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }
}
