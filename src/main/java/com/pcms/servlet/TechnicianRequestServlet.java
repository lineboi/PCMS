package com.pcms.servlet;

import com.pcms.dao.RequestDAO;
import com.pcms.model.Request;
import com.pcms.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/technician/requests")
public class TechnicianRequestServlet extends HttpServlet {

    private RequestDAO requestDAO = new RequestDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        User tech = (User) req.getSession().getAttribute("loggedUser");
        List<Request> requests = requestDAO.getByTechnician(tech.getId());
        req.setAttribute("requests", requests);
        req.getRequestDispatcher("/views/technician/requests.jsp").forward(req, resp);
    }
}
