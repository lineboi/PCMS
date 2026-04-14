package com.pcms.filter;

import com.pcms.model.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter("/*")
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);

        String uri = request.getRequestURI();
        String ctx = request.getContextPath();

        boolean isPublic = uri.equals(ctx + "/") ||
                uri.equals(ctx + "/login") ||
                uri.equals(ctx + "/submit-request") ||
                uri.startsWith(ctx + "/views/common/") ||
                uri.endsWith(".css") || uri.endsWith(".js") ||
                uri.endsWith(".png") || uri.endsWith(".jpg") ||
                uri.endsWith(".ico") || uri.endsWith(".woff") ||
                uri.endsWith(".woff2");

        if (isPublic) {
            chain.doFilter(req, res);
            return;
        }

        User loggedUser = (session != null) ? (User) session.getAttribute("loggedUser") : null;

        if (loggedUser == null) {
            response.sendRedirect(ctx + "/login");
            return;
        }

        // Role-based access control
        if (uri.startsWith(ctx + "/admin") && loggedUser.getRole() != User.Role.ADMIN) {
            response.sendRedirect(ctx + "/technician/dashboard");
            return;
        }

        if (uri.startsWith(ctx + "/technician") && loggedUser.getRole() != User.Role.TECHNICIAN) {
            response.sendRedirect(ctx + "/admin/dashboard");
            return;
        }

        chain.doFilter(req, res);
    }
}
