package com.pcms.servlet;

import com.pcms.dao.ReportingDAO;
import com.pcms.model.Reporting;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/reports")
public class ReportingServlet extends HttpServlet {

    private ReportingDAO reportingDAO = new ReportingDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("delete".equals(action)) {
            reportingDAO.delete(Integer.parseInt(req.getParameter("id")));
            resp.sendRedirect(req.getContextPath() + "/admin/reports?success=Report+deleted.");
            return;
        }
        List<Reporting> reports = reportingDAO.getAll();
        req.setAttribute("reports", reports);
        req.getRequestDispatcher("/views/admin/reports.jsp").forward(req, resp);
    }
}
