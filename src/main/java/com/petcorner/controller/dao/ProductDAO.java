package com.petcorner.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.petcorner.model.Product;
import com.petcorner.controller.database.DatabaseConnection;

public class ProductDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	public ProductDAO() throws SQLException, ClassNotFoundException {
		this.conn = DatabaseConnection.getConnection();
	}
	
	public boolean addProduct(Product product) {
		boolean isRowInserted = false;
		// SQL query to insert product data into the products table 
		String query = "INSERT INTO product (name, description, price, product_image) VALUES (?, ?, ?, ?)";

		if (conn != null) {
			try {
				ps = conn.prepareStatement(query);
				// Setting values from the product object into the SQL query
				ps.setString(1, product.getName());
				ps.setString(2, product.getDescription());
				ps.setDouble(3, product.getPrice());
				ps.setString(4, product.getProductImage());

				int affectedRows = ps.executeUpdate();// Execute the query and check if a row was inserted

				if (affectedRows > 0) {
					isRowInserted = true;// Product added successfully
				}
			} catch (SQLException e) {
				// TODO error details if any
				e.printStackTrace();
			}
		}
		return isRowInserted;
	}
	
	public boolean updateProduct(Product product) {
	    boolean isRowUpdated = false;
	    // SQL query to update product data in the product table
	    String query = "UPDATE product SET name = ?, description = ?, price = ?, product_image = ? WHERE product_id = ?";

	    if (conn != null) {
	        try {
	            ps = conn.prepareStatement(query);
	            // Setting values from the product object into the SQL query
	            ps.setString(1, product.getName());
	            ps.setString(2, product.getDescription());
	            ps.setDouble(3, product.getPrice());
	            ps.setString(4, product.getProductImage());
	            ps.setInt(5, product.getProductId()); // WHERE condition

	            int affectedRows = ps.executeUpdate(); // Execute the query and check if a row was updated

	            if (affectedRows > 0) {
	                isRowUpdated = true; // Product updated successfully
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    return isRowUpdated;
	}

	public ArrayList<Product> getAllProducts() {
	    ArrayList<Product> products = new ArrayList<>();
	    String sql = """
	        SELECT * FROM product
	        ORDER BY created_at DESC
	    """;

	    if (conn == null) { return products; }

	    try {
	        ps = conn.prepareStatement(sql);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            Product product = new Product(
	                rs.getInt("product_id"),
	                rs.getString("name"),
	                rs.getString("description"),
	                rs.getDouble("price"),
	                rs.getString("product_image"),
	                rs.getTimestamp("created_at")
	            );
	            products.add(product);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return products;
	}

	public int getTotalProducts(String date) throws SQLException {
	    String query = "";
	    if (date.isEmpty()) {
	        query = "SELECT COUNT(*) AS total FROM product";
	        ps = conn.prepareStatement(query);
	    } else {
	        query = "SELECT COUNT(*) AS total FROM product WHERE created_at > ?";
	        ps = conn.prepareStatement(query);
	        ps.setString(1, date);
	    }

	    if (conn != null) {
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            return rs.getInt("total");
	        }
	    }

	    return 0;
	}

	public boolean deleteProduct(int productId) throws SQLException {
		
		String sql2 = "DELETE FROM cart_item WHERE product_id = ?";
	    String sql = "DELETE FROM product WHERE product_id = ?";

	    if (conn != null) {
	    	ps = conn.prepareStatement(sql2);
	        ps.setInt(1, productId);
	        ps.executeUpdate();
	        ps = conn.prepareStatement(sql);
	        ps.setInt(1, productId);
	        int affectedRows = ps.executeUpdate();
	        return affectedRows > 0;
	    }

	    return false;
	}

	public Product getProductById(int productId) throws SQLException {
	    String query = "SELECT * FROM product WHERE product_id = ?";
	    try (PreparedStatement ps = conn.prepareStatement(query)) {
	        ps.setInt(1, productId);
	        try (ResultSet rs = ps.executeQuery()) {
	            if (rs.next()) {
	                return new Product(
	                    rs.getInt("product_id"),
	                    rs.getString("name"),
	                    rs.getString("description"),
	                    rs.getDouble("price"),
	                    rs.getString("product_image"),
	                    rs.getTimestamp("created_at")
	                );
	            }
	        }
	    }
	    return null;
	}
	public ArrayList<Product> searchProductsByName(String keyword) {
	    ArrayList<Product> products = new ArrayList<>();
	    String query = "SELECT * FROM product WHERE name LIKE ? ORDER BY created_at DESC";

	    try {
	        ps = conn.prepareStatement(query);
	        ps.setString(1, "%" + keyword + "%");
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            Product product = new Product(
	                rs.getInt("product_id"),
	                rs.getString("name"),
	                rs.getString("description"),
	                rs.getDouble("price"),
	                rs.getString("product_image"),
	                rs.getTimestamp("created_at")
	            );
	            products.add(product);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return products;
	}

	
}
