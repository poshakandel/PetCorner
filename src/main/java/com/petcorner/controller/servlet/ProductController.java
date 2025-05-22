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

/**
 * Servlet implementation class ProductController
 */
@WebServlet("/products")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public ProductController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDAO productDAO;
		try {
			productDAO = new ProductDAO();
			ArrayList<Product> products= new ArrayList<Product>();
			String search = request.getParameter("search");
			if (search != null && !search.trim().isEmpty()) {
			    products = productDAO.searchProductsByName(search.trim());
			} else {
			    products = productDAO.getAllProducts();
			}

			request.setAttribute("products", products);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		request.getRequestDispatcher("/pages/Product.jsp").forward(request, response);
	}


}

