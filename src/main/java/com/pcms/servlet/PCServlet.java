package com.pcms.servlet;

import com.pcms.dao.PCDAO;
import com.pcms.dao.UserDAO;
import com.pcms.model.PC;
import com.pcms.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/pcs")
public class PCServlet extends HttpServlet {

    private PCDAO pcDAO = new PCDAO();
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "new":
                req.setAttribute("technicians", userDAO.getAllTechnicians());
                req.getRequestDispatcher("/views/admin/pc-form.jsp").forward(req, resp);
                break;
            case "edit":
                req.setAttribute("pc", pcDAO.getById(Integer.parseInt(req.getParameter("id"))));
                req.setAttribute("technicians", userDAO.getAllTechnicians());
                req.getRequestDispatcher("/views/admin/pc-form.jsp").forward(req, resp);
                break;
            case "delete":
                pcDAO.delete(Integer.parseInt(req.getParameter("id")));
                resp.sendRedirect(req.getContextPath() + "/admin/pcs?success=PC+deleted.");
                break;
            default:
                String loc = req.getParameter("location");
                String st = req.getParameter("status");
                List<PC> pcs;
                if (loc != null && !loc.isEmpty()) pcs = pcDAO.getByLocation(loc);
                else if (st != null && !st.isEmpty()) pcs = pcDAO.getByStatus(st);
                else pcs = pcDAO.getAll();
                req.setAttribute("pcs", pcs);
                req.getRequestDispatcher("/views/admin/pcs.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        String idStr = req.getParameter("id");

        String brand = req.getParameter("brand");
        String pcType = req.getParameter("pcType");
        String hdd = req.getParameter("hdd");
        String ram = req.getParameter("ram");
        String os = req.getParameter("os");
        String regYear = req.getParameter("registrationYear");
        String location = req.getParameter("location");
        String status = req.getParameter("status");
        String techId = req.getParameter("technicianId");

        if ("update".equals(action) && idStr != null) {
            PC pc = pcDAO.getById(Integer.parseInt(idStr));
            pc.setBrand(brand);
            pc.setPcType(PC.PCType.valueOf(pcType));
            pc.setHdd(hdd);
            pc.setRam(ram);
            pc.setOs(os);
            pc.setRegistrationYear(regYear != null && !regYear.isEmpty() ? Integer.parseInt(regYear) : 0);
            pc.setLocation(PC.Location.valueOf(location));
            pc.setStatus(PC.DeviceStatus.valueOf(status));
            pc.setTechnician(techId != null && !techId.isEmpty() ? userDAO.getById(Integer.parseInt(techId)) : null);
            pcDAO.update(pc);
            resp.sendRedirect(req.getContextPath() + "/admin/pcs?success=PC+updated.");
        } else {
            PC pc = new PC();
            pc.setBrand(brand);
            pc.setPcType(PC.PCType.valueOf(pcType));
            pc.setHdd(hdd);
            pc.setRam(ram);
            pc.setOs(os);
            pc.setRegistrationYear(regYear != null && !regYear.isEmpty() ? Integer.parseInt(regYear) : 0);
            pc.setLocation(PC.Location.valueOf(location));
            pc.setStatus(PC.DeviceStatus.valueOf(status));
            pc.setTechnician(techId != null && !techId.isEmpty() ? userDAO.getById(Integer.parseInt(techId)) : null);
            pcDAO.save(pc);
            resp.sendRedirect(req.getContextPath() + "/admin/pcs?success=PC+registered.");
        }
    }
}
