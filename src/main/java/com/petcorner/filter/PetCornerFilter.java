package com.petcorner.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.petcorner.model.User;

@WebFilter(urlPatterns = { "/*" })
public class PetCornerFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("PetCornerFilter initialized");
    }

    @Override
    public void destroy() {
        System.out.println("PetCornerFilter destroyed");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String uri = req.getRequestURI();

        HttpSession session = req.getSession(false);
        boolean loggedIn = session != null && session.getAttribute("userWithSession") != null;

        boolean isAdmin = false;

        if (uri.contains("Home.jsp")) {
            res.sendRedirect(req.getContextPath() + "/home");
            return;
        }

        if (loggedIn) {
            User user = (User) session.getAttribute("userWithSession");
            if ("admin".equals(user.getRole())) {
                isAdmin = true;
            }

            if (uri.endsWith("login") || uri.endsWith("register")) {
                res.sendRedirect(req.getContextPath() + "/home");
                return;
            }
        } else {
            if (uri.contains("/user/")) {
                res.sendRedirect(req.getContextPath() + "/login");
                return;
            }
        }

        if (uri.contains("/admin/")) {
            if (!loggedIn) {
                res.sendRedirect(req.getContextPath() + "/login");
                return;
            }

            if (!isAdmin) {
                res.sendRedirect(req.getContextPath() + "/home");
                return;
            }
        }

        chain.doFilter(request, response);
    }
}
