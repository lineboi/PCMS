package com.pcms.servlet;

import com.pcms.dao.RequestDAO;
import com.pcms.dao.UserDAO;
import com.pcms.model.Request;
import com.pcms.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet({"/admin/requests", "/submit-request"})
public class RequestServlet extends HttpServlet {

    private RequestDAO requestDAO = new RequestDAO();
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String uri = req.getRequestURI();

        if (uri.contains("submit-request")) {
            req.getRequestDispatcher("/views/common/submit-request.jsp").forward(req, resp);
            return;
        }

        String action = req.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "assign":
                int rid = Integer.parseInt(req.getParameter("id"));
                req.setAttribute("request", requestDAO.getById(rid));
                req.setAttribute("technicians", userDAO.getAllTechnicians());
                req.getRequestDispatcher("/views/admin/assign-technician.jsp").forward(req, resp);
                break;
            case "delete":
                requestDAO.delete(Integer.parseInt(req.getParameter("id")));
                resp.sendRedirect(req.getContextPath() + "/admin/requests?success=Request+deleted.");
                break;
            default:
                String st = req.getParameter("status");
                List<Request> list = (st != null && !st.isEmpty()) ?
                        requestDAO.getByStatus(st) : requestDAO.getAll();
                req.setAttribute("requests", list);
                req.getRequestDispatcher("/views/admin/requests.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String uri = req.getRequestURI();
        String action = req.getParameter("action");

        if (uri.contains("submit-request")) {
            // Public request submission
            Request r = new Request();
            r.setFirstName(req.getParameter("firstName"));
            r.setLastName(req.getParameter("lastName"));
            r.setEmail(req.getParameter("email"));
            r.setTelephone(req.getParameter("telephone"));
            r.setUnit(req.getParameter("unit"));
            r.setRequestType(req.getParameter("requestType"));
            r.setStatus(Request.RequestStatus.Pending);
            requestDAO.save(r);
            req.setAttribute("success", "Your request has been submitted successfully!");
            req.getRequestDispatcher("/views/common/submit-request.jsp").forward(req, resp);
            return;
        }

        if ("assign".equals(action)) {
            int rid = Integer.parseInt(req.getParameter("requestId"));
            int tid = Integer.parseInt(req.getParameter("technicianId"));
            Request r = requestDAO.getById(rid);
            r.setTechnician(userDAO.getById(tid));
            r.setStatus(Request.RequestStatus.Technician_Assigned);
            requestDAO.update(r);
            // Update technician status to Busy
            User tech = userDAO.getById(tid);
            tech.setStatus(User.Status.Busy);
            userDAO.update(tech);
            resp.sendRedirect(req.getContextPath() + "/admin/requests?success=Technician+assigned.");
        } else if ("updateStatus".equals(action)) {
            int rid = Integer.parseInt(req.getParameter("requestId"));
            String status = req.getParameter("status");
            Request r = requestDAO.getById(rid);
            r.setStatus(Request.RequestStatus.valueOf(status));
            requestDAO.update(r);
            resp.sendRedirect(req.getContextPath() + "/admin/requests?success=Status+updated.");
        }
    }
}
