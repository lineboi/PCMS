package com.pcms.servlet;

import com.pcms.dao.*;
import com.pcms.model.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {

    private PCDAO pcDAO = new PCDAO();
    private AccessoryDAO accessoryDAO = new AccessoryDAO();
    private NetworkDeviceDAO networkDeviceDAO = new NetworkDeviceDAO();
    private UserDAO userDAO = new UserDAO();
    private RequestDAO requestDAO = new RequestDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // PC stats
        req.setAttribute("pcWorking", pcDAO.countByStatus(PC.DeviceStatus.Working));
        req.setAttribute("pcNotWorking", pcDAO.countByStatus(PC.DeviceStatus.Not_working));
        req.setAttribute("pcDamaged", pcDAO.countByStatus(PC.DeviceStatus.Damaged));
        req.setAttribute("pcOld", pcDAO.countByStatus(PC.DeviceStatus.Old));
        req.setAttribute("pcTotal", pcDAO.getAll().size());

        // Accessory stats
        req.setAttribute("accWorking", accessoryDAO.countByStatus(Accessory.DeviceStatus.Working));
        req.setAttribute("accNotWorking", accessoryDAO.countByStatus(Accessory.DeviceStatus.Not_working));
        req.setAttribute("accDamaged", accessoryDAO.countByStatus(Accessory.DeviceStatus.Damaged));
        req.setAttribute("accOld", accessoryDAO.countByStatus(Accessory.DeviceStatus.Old));
        req.setAttribute("accTotal", accessoryDAO.getAll().size());

        // Network stats
        req.setAttribute("netWorking", networkDeviceDAO.countByStatus(NetworkDevice.DeviceStatus.Working));
        req.setAttribute("netNotWorking", networkDeviceDAO.countByStatus(NetworkDevice.DeviceStatus.Not_working));
        req.setAttribute("netDamaged", networkDeviceDAO.countByStatus(NetworkDevice.DeviceStatus.Damaged));
        req.setAttribute("netOld", networkDeviceDAO.countByStatus(NetworkDevice.DeviceStatus.Old));
        req.setAttribute("netTotal", networkDeviceDAO.getAll().size());

        // Technician stats
        java.util.List<User> techs = userDAO.getAllTechnicians();
        long available = techs.stream().filter(t -> t.getStatus() == User.Status.Available).count();
        long busy = techs.stream().filter(t -> t.getStatus() == User.Status.Busy).count();
        long notAvailable = techs.stream().filter(t -> t.getStatus() == User.Status.Not_available).count();
        req.setAttribute("techAvailable", available);
        req.setAttribute("techBusy", busy);
        req.setAttribute("techNotAvailable", notAvailable);
        req.setAttribute("techTotal", techs.size());

        // Request stats
        req.setAttribute("reqPending", requestDAO.countByStatus(Request.RequestStatus.Pending));
        req.setAttribute("reqAssigned", requestDAO.countByStatus(Request.RequestStatus.Technician_Assigned));
        req.setAttribute("reqFixed", requestDAO.countByStatus(Request.RequestStatus.Fixed));
        req.setAttribute("reqNotFixed", requestDAO.countByStatus(Request.RequestStatus.Not_fixed));

        req.getRequestDispatcher("/views/admin/dashboard.jsp").forward(req, resp);
    }
}
