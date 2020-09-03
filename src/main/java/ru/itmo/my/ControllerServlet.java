package ru.itmo.my;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/*
определяющий тип запроса, и, в зависимости от того,
 содержит ли запрос информацию о координатах точки и радиусе,
  делегирующий его обработку одному из перечисленных ниже компонентов.
  Все запросы внутри приложения должны передаваться этому сервлету
  (по методу GET или POST в зависимости от варианта задания),
 остальные сервлеты с веб-страниц напрямую вызываться не должны.
 */
@WebServlet(urlPatterns = {"/controller"})
public class ControllerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String x = req.getParameter("x");
        String y = req.getParameter("y");
        String r = req.getParameter("r");
        if(x==null || y == null || r == null){
           return;
        }
        try{
            Double.parseDouble(x);
            Double.parseDouble(y);
            Double.parseDouble(r);
        }catch (NumberFormatException e){
            return;
        }
        req.getRequestDispatcher("/area").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
