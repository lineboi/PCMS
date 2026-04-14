package com.pcms.servlet;

import com.pcms.dao.AccessoryDAO;
import com.pcms.dao.UserDAO;
import com.pcms.model.Accessory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/accessories")
public class AccessoryServlet extends HttpServlet {

    private AccessoryDAO accessoryDAO = new AccessoryDAO();
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "new":
                req.setAttribute("technicians", userDAO.getAllTechnicians());
                req.getRequestDispatcher("/views/admin/accessory-form.jsp").forward(req, resp);
                break;
            case "edit":
                req.setAttribute("accessory", accessoryDAO.getById(Integer.parseInt(req.getParameter("id"))));
                req.setAttribute("technicians", userDAO.getAllTechnicians());
                req.getRequestDispatcher("/views/admin/accessory-form.jsp").forward(req, resp);
                break;
            case "delete":
                accessoryDAO.delete(Integer.parseInt(req.getParameter("id")));
                resp.sendRedirect(req.getContextPath() + "/admin/accessories?success=Accessory+deleted.");
                break;
            default:
                String loc = req.getParameter("location");
                String st = req.getParameter("status");
                List<Accessory> list;
                if (loc != null && !loc.isEmpty()) list = accessoryDAO.getByLocation(loc);
                else if (st != null && !st.isEmpty()) list = accessoryDAO.getByStatus(st);
                else list = accessoryDAO.getAll();
                req.setAttribute("accessories", list);
                req.getRequestDispatcher("/views/admin/accessories.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        String idStr = req.getParameter("id");
        String type = req.getParameter("accessoryType");
        String brand = req.getParameter("brand");
        String location = req.getParameter("location");
        String status = req.getParameter("status");
        String techId = req.getParameter("technicianId");

        if ("update".equals(action) && idStr != null) {
            Accessory a = accessoryDAO.getById(Integer.parseInt(idStr));
            a.setAccessoryType(Accessory.AccessoryType.valueOf(type));
            a.setBrand(brand);
            a.setLocation(Accessory.Location.valueOf(location));
            a.setStatus(Accessory.DeviceStatus.valueOf(status));
            a.setTechnician(techId != null && !techId.isEmpty() ? userDAO.getById(Integer.parseInt(techId)) : null);
            accessoryDAO.update(a);
            resp.sendRedirect(req.getContextPath() + "/admin/accessories?success=Accessory+updated.");
        } else {
            Accessory a = new Accessory();
            a.setAccessoryType(Accessory.AccessoryType.valueOf(type));
            a.setBrand(brand);
            a.setLocation(Accessory.Location.valueOf(location));
            a.setStatus(Accessory.DeviceStatus.valueOf(status));
            a.setTechnician(techId != null && !techId.isEmpty() ? userDAO.getById(Integer.parseInt(techId)) : null);
            accessoryDAO.save(a);
            resp.sendRedirect(req.getContextPath() + "/admin/accessories?success=Accessory+registered.");
        }
    }
}
