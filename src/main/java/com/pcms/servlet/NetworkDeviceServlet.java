package com.pcms.servlet;

import com.pcms.dao.NetworkDeviceDAO;
import com.pcms.dao.UserDAO;
import com.pcms.model.NetworkDevice;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/network-devices")
public class NetworkDeviceServlet extends HttpServlet {

    private NetworkDeviceDAO networkDeviceDAO = new NetworkDeviceDAO();
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "new":
                req.setAttribute("technicians", userDAO.getAllTechnicians());
                req.getRequestDispatcher("/views/admin/network-form.jsp").forward(req, resp);
                break;
            case "edit":
                req.setAttribute("device", networkDeviceDAO.getById(Integer.parseInt(req.getParameter("id"))));
                req.setAttribute("technicians", userDAO.getAllTechnicians());
                req.getRequestDispatcher("/views/admin/network-form.jsp").forward(req, resp);
                break;
            case "delete":
                networkDeviceDAO.delete(Integer.parseInt(req.getParameter("id")));
                resp.sendRedirect(req.getContextPath() + "/admin/network-devices?success=Device+deleted.");
                break;
            default:
                String loc = req.getParameter("location");
                String st = req.getParameter("status");
                List<NetworkDevice> list;
                if (loc != null && !loc.isEmpty()) list = networkDeviceDAO.getByLocation(loc);
                else if (st != null && !st.isEmpty()) list = networkDeviceDAO.getByStatus(st);
                else list = networkDeviceDAO.getAll();
                req.setAttribute("devices", list);
                req.getRequestDispatcher("/views/admin/network-devices.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        String idStr = req.getParameter("id");
        String type = req.getParameter("deviceType");
        String brand = req.getParameter("brand");
        String location = req.getParameter("location");
        String status = req.getParameter("status");
        String techId = req.getParameter("technicianId");

        if ("update".equals(action) && idStr != null) {
            NetworkDevice nd = networkDeviceDAO.getById(Integer.parseInt(idStr));
            nd.setDeviceType(NetworkDevice.DeviceType.valueOf(type));
            nd.setBrand(brand);
            nd.setLocation(NetworkDevice.Location.valueOf(location));
            nd.setStatus(NetworkDevice.DeviceStatus.valueOf(status));
            nd.setTechnician(techId != null && !techId.isEmpty() ? userDAO.getById(Integer.parseInt(techId)) : null);
            networkDeviceDAO.update(nd);
            resp.sendRedirect(req.getContextPath() + "/admin/network-devices?success=Device+updated.");
        } else {
            NetworkDevice nd = new NetworkDevice();
            nd.setDeviceType(NetworkDevice.DeviceType.valueOf(type));
            nd.setBrand(brand);
            nd.setLocation(NetworkDevice.Location.valueOf(location));
            nd.setStatus(NetworkDevice.DeviceStatus.valueOf(status));
            nd.setTechnician(techId != null && !techId.isEmpty() ? userDAO.getById(Integer.parseInt(techId)) : null);
            networkDeviceDAO.save(nd);
            resp.sendRedirect(req.getContextPath() + "/admin/network-devices?success=Device+registered.");
        }
    }
}
