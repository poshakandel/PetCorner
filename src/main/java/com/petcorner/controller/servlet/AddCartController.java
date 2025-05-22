package com.petcorner.controller.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.petcorner.controller.dao.CartDAO;
import com.petcorner.controller.dao.CartItemDAO;
import com.petcorner.model.Cart;
import com.petcorner.model.CartItem;
import com.petcorner.model.User;


@WebServlet("/addToCart")
public class AddCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public AddCartController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userWithSession") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        User user = (User) session.getAttribute("userWithSession");
        String productIdParam = request.getParameter("productId");
        try {
            int productId = Integer.parseInt(productIdParam);
            CartDAO cartDAO = new CartDAO();
            Cart cart = cartDAO.getCartByUserId(user.getUserId());
            
            CartItemDAO cartItemDAO = new CartItemDAO();
            CartItem cartItem = new CartItem(cart.getCartId(), productId);
            
            if (cartItemDAO.addCartItem(cartItem)) {
                response.sendRedirect(request.getContextPath() + "/home?success=added");
            } else {
                response.sendRedirect(request.getContextPath() + "/home?error=invalid_product");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/home?error=invalid_id");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/home?error=system_error");
        }
    }

    

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
