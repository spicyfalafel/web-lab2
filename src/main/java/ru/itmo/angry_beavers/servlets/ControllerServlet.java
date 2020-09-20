package ru.itmo.angry_beavers.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/controller")
public class ControllerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            double x = Double.parseDouble(req.getParameter("x-value"));
            double y = Double.parseDouble(req.getParameter("y-value"));
            double r = Double.parseDouble(req.getParameter("r-value"));
            // maybe some advanced checking

            getServletContext().getRequestDispatcher("/check_area").forward(req, resp);
        } catch (NumberFormatException | NullPointerException e) {
            getServletContext().getRequestDispatcher("/answer.jsp").forward(req, resp);
        }
    }

    private boolean checkData(double x, double y, double r) {
        //todo advanced checking
        return true;
    }
}
