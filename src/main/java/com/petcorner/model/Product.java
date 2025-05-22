package com.petcorner.model;

//Product.java

import java.sql.Timestamp;

public class Product {
 private int productId;
 private String name;
 private String description;
 private double price;
 private String productImage;
 private Timestamp createdAt;

 // Constructor (all fields)
 public Product(int productId, String name, String description, double price, String productImage, Timestamp createdAt) {
     this.productId = productId;
     this.name = name;
     this.description = description;
     this.price = price;
     this.productImage = productImage;
     this.createdAt = createdAt;
 }

 // Constructor (name, description, price, and product image only)
 public Product(String name, String description, double price, String productImage) {
     this.name = name;
     this.description = description;
     this.price = price;
     this.productImage = productImage;
     this.createdAt = new Timestamp(System.currentTimeMillis()); // current timestamp
 }

 // Getters and Setters
 public int getProductId() {
     return productId;
 }

 public void setProductId(int productId) {
     this.productId = productId;
 }

 public String getName() {
     return name;
 }

 public void setName(String name) {
     this.name = name;
 }

 public String getDescription() {
     return description;
 }

 public void setDescription(String description) {
     this.description = description;
 }

 public double getPrice() {
     return price;
 }

 public void setPrice(double price) {
     this.price = price;
 }

 public String getProductImage() {
     return productImage;
 }

 public void setProductImage(String productImage) {
     this.productImage = productImage;
 }

 public Timestamp getCreatedAt() {
     return createdAt;
 }

 public void setCreatedAt(Timestamp createdAt) {
     this.createdAt = createdAt;
 }
}
