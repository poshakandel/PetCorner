package com.petcorner.controller.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petcorner.controller.dao.CartItemDAO;
import com.petcorner.controller.dao.ProductDAO;
import com.petcorner.controller.dao.UserDAO;
import com.petcorner.model.Product;

@WebServlet("/admin/dashboard")
public class DashBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DashBoard() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String oneMonthAgo = LocalDate.now().minusDays(30).toString();
			UserDAO userdao = new UserDAO();
			ProductDAO productDAO = new ProductDAO();
			CartItemDAO cartItemDAO = new CartItemDAO();
			request.setAttribute("mostPopularProduct", cartItemDAO.getMostPopularProductName());
			request.setAttribute("totalCartItems", cartItemDAO.getTotalCartItemCount());
			request.setAttribute("totalUsers", userdao.getTotalUsers(""));
			request.setAttribute("totalUsersLastMonth", userdao.getTotalUsers(oneMonthAgo));
			request.setAttribute("totalProducts", productDAO.getTotalProducts(""));
			request.setAttribute("totalProductsLastMonth", productDAO.getTotalProducts(oneMonthAgo));
			
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("/pages/Dashboard.jsp").forward(request, response);
	}

}
