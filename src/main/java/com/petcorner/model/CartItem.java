package com.petcorner.model;

//CartItem.java

public class CartItem {
 private int cartItemId;
 private int cartId;
 private int productId;

 
 // Constructor (all fields)
 public CartItem(int cartItemId, int cartId, int productId) {
     this.cartItemId = cartItemId;
     this.cartId = cartId;
     this.productId = productId;
 }

 // Constructor (cartId, productId, and quantity only)
 public CartItem(int cartId, int productId) {
     this.cartId = cartId;
     this.productId = productId;
 }

 // Getters and Setters
 public int getCartItemId() {
     return cartItemId;
 }

 public void setCartItemId(int cartItemId) {
     this.cartItemId = cartItemId;
 }

 public int getCartId() {
     return cartId;
 }

 public void setCartId(int cartId) {
     this.cartId = cartId;
 }

 public int getProductId() {
     return productId;
 }

 public void setProductId(int productId) {
     this.productId = productId;
 }

}
