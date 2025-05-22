package com.petcorner.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.petcorner.controller.database.DatabaseConnection;
import com.petcorner.model.Cart;

public class CartDAO {
	private Connection conn;
    private PreparedStatement ps;

    public CartDAO() {
        try {
        	conn = DatabaseConnection.getConnection();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    
    public void addCart(Cart cart) {
        String sql = "INSERT INTO cart (user_id) VALUES (?)";
        try {
        	ps = conn.prepareStatement(sql);
            ps.setInt(1, cart.getUserId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public ArrayList<Cart> getAllCarts() {
        ArrayList<Cart> cartList = new ArrayList<>();
        String sql = "SELECT * FROM cart";
        
        try {
            ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                int cartId = rs.getInt("cart_id");
                int userId = rs.getInt("user_id");
                Timestamp createdAt = rs.getTimestamp("created_at");
                
                Cart cart = new Cart(cartId, userId, createdAt);
                cartList.add(cart);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return cartList;
    }
    
    public Cart getCartByUserId(int userId) {
        String sql = "SELECT * FROM cart WHERE user_id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int cartId = rs.getInt("cart_id");
                Timestamp createdAt = rs.getTimestamp("created_at");
                return new Cart(cartId, userId, createdAt);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

}
