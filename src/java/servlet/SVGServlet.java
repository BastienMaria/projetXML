package servlet;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.xml.parsers.*;
import javax.xml.transform.*;
import javax.xml.transform.dom.*;
import javax.xml.transform.stream.*;
import org.w3c.dom.*;

@WebServlet(name = "SVG", urlPatterns = {"/svg"})
public class SVGServlet extends HttpServlet {

    public final static String /**
             * The path to the stylesheet.
             */
            XSLT_PATH = "SvgCharts/examples/barChartExample1.xsl";
    public final static String /**
             * The path to the xml.
             */
            XML_PATH = "SvgCharts/examples/sample1.xml";

    /**
     * Initializes the servlet.
     */
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

            // Get concrete implementation
            TransformerFactory tFactory = TransformerFactory.newInstance();
            // Create a reusable templates for a particular stylesheet
            Templates templates = tFactory.newTemplates(new StreamSource(webApp.getRealPath(XSLT_PATH)));
            // Create a transformer
            Transformer transformer = templates.newTransformer();
            // Get concrete implementation
            DocumentBuilderFactory dFactory = DocumentBuilderFactory.newInstance();
            // Need a parser that support namespaces
            dFactory.setNamespaceAware(true);
            // Create the parser
            DocumentBuilder parser = dFactory.newDocumentBuilder();
            // Parse the XML document
            Document doc = parser.parse(webApp.getRealPath(XML_PATH));
            // Get the XML source
            Source xmlSource = new DOMSource(doc);
            response.setContentType("image/svg+xml");
            //response.setContentType("text/html");
            // Transform input XML doc in HTML stream
            transformer.transform(xmlSource, new StreamResult(response.getWriter()));
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
