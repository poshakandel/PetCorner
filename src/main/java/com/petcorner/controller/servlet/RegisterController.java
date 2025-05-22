package com.petcorner.controller.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petcorner.controller.dao.UserDAO;
import com.petcorner.model.User;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/register")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/pages/Register.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String name= request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		
		if (!password.equals(confirmPassword)){
			request.setAttribute("errorMessage", "Password and confirm password doesnt match!");
			request.getRequestDispatcher("/pages/Register.jsp").forward(request, response);			
			return;
		}
		
		try {
			UserDAO userdao = new UserDAO();
			User user = new User (name, email, password);
			boolean success = userdao.register(user);
			if (!success) {
				// If login fails, send an error message
				request.setAttribute("errorMessage", "User is already registered. Try Loggingin instead!");
				request.getRequestDispatcher("/pages/Register.jsp").forward(request, response);
			} else {
				// send to the loging page after success
				request.setAttribute("successMessage", "Registered Successfully! Login to continue.");
				request.getRequestDispatcher("/pages/Login.jsp").forward(request, response);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			request.getRequestDispatcher("/pages/Register.jsp").forward(request, response);
		}
	}

}
