package com.petcorner.controller.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.petcorner.controller.dao.CartDAO;
import com.petcorner.controller.dao.UserDAO;
import com.petcorner.model.Cart;
import com.petcorner.model.User;

/**
 * Servlet implementation class LogInController
 */
@WebServlet("/login")
public class LogInController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogInController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/pages/Login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		try {
			UserDAO userdao = new UserDAO();
			User user = userdao.login(username,password);
			if (user != null) {
				// Create a session for the logged-in user
				CartDAO cartDAO= new CartDAO();
				ArrayList<Cart> carts = cartDAO.getAllCarts();
				boolean idExist=false;
				for(Cart cart:carts) {
					if(cart.getUserId()==user.getUserId()) {
						idExist=true;
					}
				}
				if(idExist==false) {
				Cart cart= new Cart(user.getUserId());
				cartDAO.addCart(cart);
				}
				HttpSession session = request.getSession();
				session.setAttribute("userWithSession", user);
				session.setMaxInactiveInterval(60*60);
				// Redirect to the Dashboard or home page
				if (user.getRole().equals("admin")) {
					response.sendRedirect(request.getContextPath() + "/admin/dashboard");
				}else {
					response.sendRedirect(request.getContextPath() + "/home");
				}

			} else {
				// If login fails, send an error message to the log in page
				request.setAttribute("errorMessage", "Invalid username or password. Please try again.");
				request.getRequestDispatcher("/pages/Login.jsp").forward(request, response);
			}
		} catch (ClassNotFoundException | SQLException e) {
			request.setAttribute("errorMessage", "A system error occurred. Please try again later.");
			request.getRequestDispatcher("/pages/Login.jsp").forward(request, response);
		} 
	}

}
