package ru.itmo.angry_beavers.servlets;

import ru.itmo.angry_beavers.models.Query;
import ru.itmo.angry_beavers.models.QueryStorageService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;

@WebServlet("/check_area")
public class AreaCheckServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        double x = Double.parseDouble(req.getParameter("x-value"));
        double y = Double.parseDouble(req.getParameter("y-value"));
        double r = Double.parseDouble(req.getParameter("r-value"));
        boolean result = getResult(x, y, r);
        Date currentTime = new Date();

        Query query = new Query(x, y, r);
        query.setResult(result);
        query.setQueryTime(currentTime);

        HttpSession session = req.getSession();

        QueryStorageService qss = (QueryStorageService) session.getAttribute("qss");
        qss = qss == null ? new QueryStorageService() : qss;

        qss.addQuery(query);
        session.setAttribute("qss", qss);

        resp.sendRedirect("/answer.jsp");
    }

    private boolean getResult(double x, double y, double r) {
        // 1 quarter

        boolean qOne = x >= 0 && y >= 0;
        if (qOne && y * y + x * x <= r * r) {
            return true;
        }

        // 2 quarter
        boolean qTwo = x <= 0 && y >= 0;
        if (qTwo && x >= -r / 2 && y <= 2 * x + r) {
            return true;
        }

        // 4 quarter
        boolean qFour = x >= 0 && y <= 0;
        return qFour && x <= r / 2 && y >= -r;
    }
}
