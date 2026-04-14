package com.pcms.servlet;

import com.pcms.dao.*;
import com.pcms.model.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/technician/dashboard")
public class TechnicianDashboardServlet extends HttpServlet {

    private PCDAO pcDAO = new PCDAO();
    private AccessoryDAO accessoryDAO = new AccessoryDAO();
    private NetworkDeviceDAO networkDeviceDAO = new NetworkDeviceDAO();
    private RequestDAO requestDAO = new RequestDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        User tech = (User) req.getSession().getAttribute("loggedUser");
        int tid = tech.getId();

        req.setAttribute("myPCs", pcDAO.getByTechnician(tid));
        req.setAttribute("myAccessories", accessoryDAO.getByTechnician(tid));
        req.setAttribute("myNetworkDevices", networkDeviceDAO.getByTechnician(tid));
        req.setAttribute("myRequests", requestDAO.getByTechnician(tid));

        req.getRequestDispatcher("/views/technician/dashboard.jsp").forward(req, resp);
    }
}
