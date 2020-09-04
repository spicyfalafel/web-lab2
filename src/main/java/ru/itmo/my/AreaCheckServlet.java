package ru.itmo.my;


import ru.itmo.my.models.PointRequest;
import ru.itmo.my.models.ReqHolder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

/*
осуществляющий проверку попадания точки в область на координатной плоскости
и формирующий HTML-страницу с результатами проверки.
Должен обрабатывать все запросы, содержащие сведения о координатах точки и радиусе области.
 */
public class AreaCheckServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        double x = Double.parseDouble(req.getParameter("x"));
        double y = Double.parseDouble(req.getParameter("y"));
        double r = Double.parseDouble(req.getParameter("r"));


        HttpSession session = req.getSession();
        PointRequest request = getQuery(x, y, r);

        ReqHolder reqHolder = (ReqHolder) session.getAttribute("reqHolder");
        if (reqHolder==null){
            reqHolder = new ReqHolder();
        }
        reqHolder.addReq(request);
        session.setAttribute("reqHolder", reqHolder);

        resp.sendRedirect(req.getContextPath() + "/answer.jsp");
    }



    private PointRequest getQuery(double x, double y, double r) {
        Date current = new Date();
        PointRequest query = new PointRequest(x, y, r);
        boolean inArea = checkIfInArea(x, y, r);
        query.setInArea(inArea);
        query.setQueryTime(current);
        return query;
    }


    private boolean checkIfInArea(double x, double y, double r) {
        int part = getNumberOfPart(x, y);
        switch (part) {
            case 2:
                if (x * x + y * y <= r * r) {
                    return true;
                }
                break;
            case 3:
                // y = -x - r
                double minPossibleY = -x - r;
                if (y >= minPossibleY) {
                    return true;
                }
                break;
            case 4:
            case 0:
                if (x <= r && Math.abs(y) <= r) {
                    return true;
                }
        }
        return false;
    }

    private int getNumberOfPart(double x, double y) {
        /*     2 | 1
         *     3 | 4
         *
         */
        if (x == 0 || y == 0) return 0;
        if (x * y > 0) {
            if (x > 0) return 1;
            else return 3;
        } else {
            if (x > 0) return 4;
            else return 2;
        }
    }
}