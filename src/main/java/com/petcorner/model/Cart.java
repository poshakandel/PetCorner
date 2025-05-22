package com.petcorner.model;

//Cart.java

import java.sql.Timestamp;

public class Cart {
 private int cartId;
 private int userId;
 private Timestamp createdAt;

 // Constructor (all fields)
 public Cart(int cartId, int userId, Timestamp createdAt) {
     this.cartId = cartId;
     this.userId = userId;
     this.createdAt = createdAt;
 }

 // Constructor (userId only)
 public Cart(int userId) {
     this.userId = userId;
     this.createdAt = new Timestamp(System.currentTimeMillis()); // current timestamp
 }

 // Getters and Setters
 public int getCartId() {
     return cartId;
 }

 public void setCartId(int cartId) {
     this.cartId = cartId;
 }

 public int getUserId() {
     return userId;
 }

 public void setUserId(int userId) {
     this.userId = userId;
 }

 public Timestamp getCreatedAt() {
     return createdAt;
 }

 public void setCreatedAt(Timestamp createdAt) {
     this.createdAt = createdAt;
 }
}
