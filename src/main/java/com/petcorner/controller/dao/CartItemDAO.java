package com.petcorner.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.petcorner.controller.database.DatabaseConnection;
import com.petcorner.model.CartItem;

public class CartItemDAO {
    private final Connection conn;

    public CartItemDAO() throws SQLException, ClassNotFoundException {
        this.conn = DatabaseConnection.getConnection();
    }

    // Check if product exists before adding to cart
    public boolean productExists(int productId) throws SQLException {
        String query = "SELECT COUNT(*) FROM product WHERE product_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, productId);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next() && rs.getInt(1) > 0;
            }
        }
    }

    // Add a product to the cart with validation
    public boolean addCartItem(CartItem cartItem) {
        String query = "INSERT INTO cart_item (cart_id, product_id) VALUES (?, ?)";
        
        try {
            // First validate the product exists
            if (!productExists(cartItem.getProductId())) {
                System.err.println("Product ID " + cartItem.getProductId() + " does not exist");
                return false;
            }

            try (PreparedStatement ps = conn.prepareStatement(query)) {
                ps.setInt(1, cartItem.getCartId());
                ps.setInt(2, cartItem.getProductId());
                return ps.executeUpdate() > 0;
            }
        } catch (SQLException e) {
            System.err.println("Error adding cart item: " + e.getMessage());
            return false;
        }
    }

    public boolean deleteCartItem(int cartItemId) {
        String query = "DELETE FROM cart_item WHERE cart_item_id = ?";
        
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, cartItemId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error deleting cart item: " + e.getMessage());
            return false;
        }
    }

    public List<CartItem> getCartItemsByCartId(int cartId) {
        List<CartItem> cartItems = new ArrayList<>();
        String query = "SELECT * FROM cart_item WHERE cart_id = ?";
        
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, cartId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    cartItems.add(new CartItem(
                        rs.getInt("cart_item_id"),
                        rs.getInt("cart_id"),
                        rs.getInt("product_id")
                    ));
                }
            }
        } catch (SQLException e) {
            System.err.println("Error fetching cart items: " + e.getMessage());
        }
        return cartItems;
    }

    public int getTotalCartItemCount() {
        String query = "SELECT COUNT(*) FROM cart_item";
        try (PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.err.println("Error counting cart items: " + e.getMessage());
        }
        return 0;
    }
    
    public String getMostPopularProductName() {
        String query = """
            SELECT p.name, COUNT(*) AS count 
            FROM cart_item ci 
            JOIN product p ON ci.product_id = p.product_id 
            GROUP BY ci.product_id 
            ORDER BY count DESC 
            LIMIT 1
        """;

        try (PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getString("name");
            }
        } catch (SQLException e) {
            System.err.println("Error fetching most popular product: " + e.getMessage());
        }

        return "No data";
    }

}