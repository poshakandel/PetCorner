package com.petcorner.controller.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.petcorner.controller.dao.CartDAO;
import com.petcorner.controller.dao.CartItemDAO;
import com.petcorner.controller.dao.ProductDAO;
import com.petcorner.model.Cart;
import com.petcorner.model.CartItem;
import com.petcorner.model.Product;
import com.petcorner.model.User;

/**
 * Servlet implementation class ViewCartController
 */
@WebServlet("/cart")
public class ViewCartController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ViewCartController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userWithSession") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        User user = (User) session.getAttribute("userWithSession");

        try {
            CartDAO cartDAO = new CartDAO();
            Cart cart = cartDAO.getCartByUserId(user.getUserId());

            if (cart != null) {
                CartItemDAO cartItemDAO = new CartItemDAO();
                List<CartItem> cartItems = cartItemDAO.getCartItemsByCartId(cart.getCartId());

                // Get the product details for each cart item
                List<Product> productsInCart = new ArrayList<>();
                ProductDAO productDAO = new ProductDAO();

                // Total price initialization
                double totalPrice = 0;

                for (CartItem cartItem : cartItems) {
                    Product product = productDAO.getProductById(cartItem.getProductId());
                    if (product != null) {
                        productsInCart.add(product);
                        // Add the product price to the total
                        totalPrice += product.getPrice();
                    }
                }
            
             request.setAttribute("cartItems", cartItems);
             request.setAttribute("productsInCart", productsInCart);

                request.setAttribute("totalPrice", totalPrice); // Total price

            }

            // Forward to Cart.jsp (use forward, NOT redirect, to pass attributes)
            request.getRequestDispatcher("/pages/Cart.jsp").forward(request, response);

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/home?error=cart_error");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}