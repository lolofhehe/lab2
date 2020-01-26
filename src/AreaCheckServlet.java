import history.HistoryBean;
import history.HistoryNode;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AreaCheckServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        handleRequest(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        handleRequest(req, resp);
    }

    private void handleRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html");

        String x = req.getParameter("X");
        String y = req.getParameter("Y");
        String r = req.getParameter("R");

        if (x == null || y == null || r == null) {
            req.getRequestDispatcher("/page.jsp").forward(req, resp);
            return;
        }

        Object history = req.getSession().getAttribute("history");
        HistoryBean bean;
        if (!(history instanceof HistoryBean)) {
            bean = new HistoryBean();
            req.getSession().setAttribute("history", bean);
        } else bean = (HistoryBean) history;

        RequestDispatcher dispatcher = req.getRequestDispatcher("/result.jsp");

        try {
            HistoryNode node = new HistoryNode(x, y, r);
            bean.getNodeList().add(node);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        dispatcher.forward(req, resp);
    }
}

