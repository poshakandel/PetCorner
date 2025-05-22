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


@WebServlet("/admin/products")
public class ViewProductsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public ViewProductsController() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDAO productDAO;
		try {
			productDAO = new ProductDAO();
			ArrayList<Product> products= new ArrayList<Product>();
			products= productDAO.getAllProducts();
			request.setAttribute("products", products);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("/pages/ViewProducts.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
