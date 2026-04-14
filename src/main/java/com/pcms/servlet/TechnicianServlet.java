package com.pcms.servlet;

import com.pcms.dao.UserDAO;
import com.pcms.model.User;
import com.pcms.util.PasswordUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/technicians")
public class TechnicianServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "new":
                req.getRequestDispatcher("/views/admin/technician-form.jsp").forward(req, resp);
                break;
            case "edit":
                int id = Integer.parseInt(req.getParameter("id"));
                req.setAttribute("tech", userDAO.getById(id));
                req.getRequestDispatcher("/views/admin/technician-form.jsp").forward(req, resp);
                break;
            case "delete":
                int delId = Integer.parseInt(req.getParameter("id"));
                userDAO.delete(delId);
                resp.sendRedirect(req.getContextPath() + "/admin/technicians?success=Technician+deleted.");
                break;
            default:
                List<User> techs = userDAO.getAllTechnicians();
                req.setAttribute("technicians", techs);
                req.getRequestDispatcher("/views/admin/technicians.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        String idStr = req.getParameter("id");

        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");
        String status = req.getParameter("status");

        if ("update".equals(action) && idStr != null) {
            User tech = userDAO.getById(Integer.parseInt(idStr));
            tech.setFirstName(firstName);
            tech.setLastName(lastName);
            tech.setEmail(email);
            tech.setPhone(phone);
            tech.setStatus(User.Status.valueOf(status));
            if (password != null && !password.isEmpty()) {
                tech.setPassword(PasswordUtil.md5(password));
            }
            userDAO.update(tech);
            resp.sendRedirect(req.getContextPath() + "/admin/technicians?success=Technician+updated.");
        } else {
            if (userDAO.emailExists(email)) {
                req.setAttribute("error", "Email already exists.");
                req.getRequestDispatcher("/views/admin/technician-form.jsp").forward(req, resp);
                return;
            }
            User tech = new User();
            tech.setFirstName(firstName);
            tech.setLastName(lastName);
            tech.setEmail(email);
            tech.setPhone(phone);
            tech.setPassword(PasswordUtil.md5(password));
            tech.setRole(User.Role.TECHNICIAN);
            tech.setStatus(User.Status.valueOf(status));
            userDAO.save(tech);
            resp.sendRedirect(req.getContextPath() + "/admin/technicians?success=Technician+added.");
        }
    }
}
