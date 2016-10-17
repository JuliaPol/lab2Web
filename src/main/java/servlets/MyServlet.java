package servlets;

/**
 * Created by Julia on 15.10.2016.
 */

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

public class MyServlet extends HttpServlet {

    //private String param;
    //private List<Animal> productList = new ArrayList();


    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        //param = config.getInitParameter("paramOne");
        //productList.add(new Animal("Cat", "Barsick", "Hui"));
        //productList.add(new Animal("Dog", "Sharick", "Hui"));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        processRequest(req, resp);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String lang = request.getParameter("lang");
        Locale locale;
        if ("en".equals(lang)) {
            locale = new Locale("en", "GB");
        } else if ("ru".equals(lang)) {
            locale = Locale.getDefault();
        } else if ("be".equals(lang)) {
            locale = new Locale("be", "BY");
        } else {
            locale = Locale.getDefault();
        }
        ResourceBundle res = ResourceBundle.getBundle("Shop", locale);
        request.getRequestDispatcher("jsp/list.jsp").forward(request, response);
    }

}
