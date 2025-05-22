package com.petcorner.controller.servlet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.petcorner.controller.dao.ProductDAO;
import com.petcorner.model.Product;

@WebServlet("/admin/product/update")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class UpdateProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateProductController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ProductDAO productDAO = new ProductDAO();
            ArrayList<Product> products = productDAO.getAllProducts();
            request.setAttribute("products", products);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("/pages/UpdateProduct.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        boolean isUpdated = false;

        Part imagePart = request.getPart("image");
        String imageUrl = null;

        if (imagePart != null && imagePart.getSize() > 0) {
            String uploadPath = getServletContext().getRealPath("/uploads");
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();

            String fileName = UUID.randomUUID().toString() + imagePart.getSubmittedFileName();
            String filePath = uploadPath + File.separator + fileName;

            imagePart.write(filePath);
            imageUrl = "/uploads/" + fileName;
        }

        try {
            ProductDAO productDAO = new ProductDAO();
            ArrayList<Product> products = productDAO.getAllProducts();
            Timestamp createdDate = null;
            String oldImageUrl = null;

            for (Product product : products) {
                if (product.getProductId() == productId) {
                    createdDate = product.getCreatedAt();
                    oldImageUrl = product.getProductImage();
                }
            }

            Product productToUpdate = new Product(productId, name, description, price,
                    (imageUrl != null ? imageUrl : oldImageUrl), createdDate);

            isUpdated = productDAO.updateProduct(productToUpdate);

            if (isUpdated) {
                response.sendRedirect(request.getContextPath() + "/admin/product/update?success=Product updated successfully");
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/product/update?error=Failed to update product");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/product/update?error=Database error occurred");
        }
    }
}
