/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.restaurant.model;

import java.sql.Timestamp;

/**
 *
 * @author Novaline
 */
public class User {
    private int userId;
    private String username;
    private String password;
    private String email;
    private String fullName;
    private String  role;
    private Timestamp createdAt;
    
    
    // Constructors
    public User() {}

     public User(int userId, String username, String password, String email, String fullName, String role, Timestamp createdAt) {
         this.userId = userId;
         this.username = username;
         this.password = password;
         this.email = email;
         this.fullName = fullName;
         this.role = role;
         this.createdAt = createdAt;
     }
     // Getters and Setters
    public int getUserId() {
        return userId;
    }
    
    public void setUserId(int userId) {
        this.userId = userId;
    }
    
     public String getUsername() {
        return username;
    }
     
      public void setUsername(String username) {
        this.username = username;
    }
      
      public String getPassword() {
        return password;
    }
      
      public void setPassword(String password) {
        this.password = password;
    }
      
       public String getEmail() {
        return email;
    }
       
       public void setEmail(String email) {
        this.email = email;
    }
       
       public String getFullName() {
        return fullName;
    }
       
       public void setFullName (String fullName) {
           this.fullName = fullName;
       }
       
       public String getRole(){
           return role;
       }
       
       public void setRole(String role){
           this.role = role;
       }
       
        public Timestamp getCreatedAt() {
        return createdAt;
    }
        
        public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    } 
}
