package com.petcorner.controller.servlet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Part;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petcorner.controller.dao.ProductDAO;
import com.petcorner.model.Product;

@WebServlet("/admin/product/add")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
                 maxFileSize = 1024 * 1024 * 10,       // 10MB
                 maxRequestSize = 1024 * 1024 * 50)    // 50MB
public class AddProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Folder relative to deployment root (webapp)
    private static final String UPLOAD_DIR = "uploads";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/pages/AddProduct.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 1️⃣ Get form values
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        Part imagePart = request.getPart("image");
        String imageUrl = null;
        if (imagePart != null && imagePart.getSize() > 0) {
            // Create uploads directory if it doesn't exist
            String uploadPath = getServletContext().getRealPath("/uploads");
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();

            // Generate unique filename
            String fileName = UUID.randomUUID().toString() + imagePart.getSubmittedFileName();
            String filePath = uploadPath + File.separator + fileName;

            // Save file
            imagePart.write(filePath);
            imageUrl = "/uploads/" + fileName;
        }

        // 3️⃣ Create Product object (store absolute path in DB)
        Product product = new Product(name, description, price, imageUrl);

        // 4️⃣ Save product to DB
        try {
            ProductDAO productDAO = new ProductDAO();
            boolean isInserted = productDAO.addProduct(product);

            if (isInserted) {
            	request.setAttribute("successMessage", "Product Added Sucessfully.");
                response.sendRedirect(request.getContextPath() + "/admin/product/add?success=Product added Successfully");
            } else {
            	request.setAttribute("errorMessage", "Fail to add Product.");
                response.sendRedirect(request.getContextPath() + "/admin/product/add?error=Failed to add product");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/product/add?error=Database error");
        }
    }
}
