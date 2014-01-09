package servlet;

import java.io.PrintWriter;
import java.io.StringReader;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import query.MyQuery;

@WebServlet(name = "QueryServlet", urlPatterns = {"/query"})
public class QueryServlet extends HttpServlet {

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        ServletContext webApp = this.getServletContext();

        try {
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        ServletContext webApp = this.getServletContext();

        try {

            MyQuery mq = new MyQuery();
            //   String result = mq.execute("coucou");

            response.setContentType("text/xml");

            PrintWriter out = response.getWriter();

            StringReader s = new StringReader(mq.getMarkers());
            // StringReader s = new StringReader(result);

            StringBuilder builder = new StringBuilder();
            int charsRead = -1;
            char[] chars = new char[100];
            do {
                charsRead = s.read(chars, 0, chars.length);
                //if we have valid chars, append them to end of string.
                if (charsRead > 0) {
                    builder.append(chars, 0, charsRead);
                }
            } while (charsRead > 0);
            String stringReadFromReader = builder.toString();


            out.println(stringReadFromReader);

            out.close();
            out.flush();

        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, java.io.IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, java.io.IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "XSLT";
    }
}
