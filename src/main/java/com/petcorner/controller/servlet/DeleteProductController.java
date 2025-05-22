package com.petcorner.controller.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petcorner.controller.dao.ProductDAO;
import com.petcorner.model.Product;

@WebServlet("/admin/product/delete")
public class DeleteProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteProductController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			ProductDAO productDAO = new ProductDAO();
			ArrayList<Product> products = productDAO.getAllProducts();
			request.setAttribute("products", products);

			// Handle success or error messages from URL parameters
			String successMessage = request.getParameter("message");
			String errorMessage = request.getParameter("error");

			if (successMessage != null) {
				request.setAttribute("successMessage", successMessage);
			}
			if (errorMessage != null) {
				request.setAttribute("errorMessage", errorMessage);
			}

			request.getRequestDispatcher("/pages/DeleteProduct.jsp").forward(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error loading product list.");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int productId = Integer.parseInt(request.getParameter("productId"));

		try {
			ProductDAO productDAO = new ProductDAO();
			boolean isDeleted = productDAO.deleteProduct(productId);

			if (isDeleted) {
				response.sendRedirect(request.getContextPath()
						+ "/admin/product/delete?message=Product+deleted+successfully.");
			} else {
				response.sendRedirect(request.getContextPath()
						+ "/admin/product/delete?error=Failed+to+delete+product.");
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error deleting product.");
		}
	}
}
