package ru.itmo.angry_beavers.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/controller")
public class ControllerServlet extends HttpServlet {
    private static final double R_MAX_VALUE = 5;
    private static final double R_MIN_VALUE = 2;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Double.parseDouble(req.getParameter("x-value"));
            Double.parseDouble(req.getParameter("y-value"));
            double r = Double.parseDouble(req.getParameter("r-value"));


            if (r < R_MIN_VALUE || r > R_MAX_VALUE) {
                getServletContext().getRequestDispatcher("/error.jsp").forward(req, resp);
            } else {
                getServletContext().getRequestDispatcher("/check_area").forward(req, resp);
            }

        } catch (NumberFormatException | NullPointerException e) {
            getServletContext().getRequestDispatcher("/error.jsp").forward(req, resp);
        }
    }

}
