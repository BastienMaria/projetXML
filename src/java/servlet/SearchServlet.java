package servlet;
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringReader;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import query.MyQuery;

/**
 *
 * @author Bastien
 */
@WebServlet(name = "Search", urlPatterns = {"/Search"})
public class SearchServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
//        response.setContentType("text/xml");
        PrintWriter out = response.getWriter();
        //Enumeration<String> parameterNames = request.getParameterNames();
        String pay = request.getParameter("pay");
        String ser = request.getParameter("serv");
        String lan = request.getParameter("lang");

        try {

            MyQuery mq = new MyQuery();

            //System.out.println(request.getParameter("hid"));
            StringReader s = new StringReader(mq.getLive(lan, pay, ser));
            StringBuilder builder = new StringBuilder();
            int charsRead = -1;
            char[] chars = new char[100];
            do {
                charsRead = s.read(chars, 0, chars.length);
                if (charsRead > 0) {
                    builder.append(chars, 0, charsRead);
                }
            } while (charsRead > 0);
            String stringReadFromReader = builder.toString();

            out.println(stringReadFromReader);

            out.close();
            out.flush();
//            while (parameterNames.hasMoreElements()) {
//                String paramName = parameterNames.nextElement();
//                out.write(paramName);
//                out.write("\n");
//                String[] paramValues = request.getParameterValues(paramName);
//                for (int i = 0; i < paramValues.length; i++) {
//                    String paramValue = paramValues[i];
//                    out.write("\t" + paramValue);
//                    out.write("\n");
//                }
//            }

        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
