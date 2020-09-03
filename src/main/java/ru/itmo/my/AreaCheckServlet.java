package ru.itmo.my;


import ru.itmo.my.models.PointQuery;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

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

        PointQuery query = new PointQuery(x, y, r);


    }


}
