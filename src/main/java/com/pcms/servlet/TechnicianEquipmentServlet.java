package com.pcms.servlet;

import com.pcms.dao.*;
import com.pcms.model.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.Date;

@WebServlet("/technician/equipment")
public class TechnicianEquipmentServlet extends HttpServlet {

    private PCDAO pcDAO = new PCDAO();
    private AccessoryDAO accessoryDAO = new AccessoryDAO();
    private NetworkDeviceDAO networkDeviceDAO = new NetworkDeviceDAO();
    private ReportingDAO reportingDAO = new ReportingDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "list";

        User tech = (User) req.getSession().getAttribute("loggedUser");

        if ("report".equals(action)) {
            req.setAttribute("categories", new String[]{"PC","Accessories","NetworkDevices"});
            req.getRequestDispatcher("/views/technician/report-form.jsp").forward(req, resp);
        } else {
            req.setAttribute("pcs", pcDAO.getByTechnician(tech.getId()));
            req.setAttribute("accessories", accessoryDAO.getByTechnician(tech.getId()));
            req.setAttribute("networkDevices", networkDeviceDAO.getByTechnician(tech.getId()));
            req.getRequestDispatcher("/views/technician/equipment.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        User tech = (User) req.getSession().getAttribute("loggedUser");

        if ("updateStatus".equals(action)) {
            String category = req.getParameter("category");
            int deviceId = Integer.parseInt(req.getParameter("deviceId"));
            String status = req.getParameter("status");

            if ("PC".equals(category)) {
                PC pc = pcDAO.getById(deviceId);
                pc.setStatus(PC.DeviceStatus.valueOf(status));
                pcDAO.update(pc);
            } else if ("Accessories".equals(category)) {
                Accessory a = accessoryDAO.getById(deviceId);
                a.setStatus(Accessory.DeviceStatus.valueOf(status));
                accessoryDAO.update(a);
            } else if ("NetworkDevices".equals(category)) {
                NetworkDevice nd = networkDeviceDAO.getById(deviceId);
                nd.setStatus(NetworkDevice.DeviceStatus.valueOf(status));
                networkDeviceDAO.update(nd);
            }
            resp.sendRedirect(req.getContextPath() + "/technician/equipment?success=Status+updated.");

        } else if ("report".equals(action)) {
            Reporting r = new Reporting();
            r.setDeviceCategory(Reporting.DeviceCategory.valueOf(req.getParameter("category")));
            r.setDeviceId(Integer.parseInt(req.getParameter("deviceId")));
            r.setStatus(Reporting.DeviceStatus.valueOf(req.getParameter("status")));
            r.setDeviceLocation(Reporting.Location.valueOf(req.getParameter("location")));
            r.setNotes(req.getParameter("notes"));
            r.setReportDate(new Date());
            r.setTechnician(tech);
            reportingDAO.save(r);
            resp.sendRedirect(req.getContextPath() + "/technician/equipment?success=Report+submitted.");
        }
    }
}
