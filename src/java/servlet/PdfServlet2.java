/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.StringReader;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Templates;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;
import org.apache.commons.io.output.ByteArrayOutputStream;
import org.apache.fop.apps.Fop;
import org.apache.fop.apps.FopFactory;
import org.apache.fop.apps.MimeConstants;
import org.w3c.dom.Document;
import org.xml.sax.InputSource;
import query.MyQuery;
import static servlet.PdfServlet2.XSLT_PATH;

/**
 *
 * @author Bastien
 */
public class PdfServlet2 extends HttpServlet {

    public final static String /**
             * The path to the stylesheet.
             */
            XSLT_PATH = "SvgCharts/examples/xslfo2.xsl";

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MyQuery mq = new MyQuery();

        ServletContext webApp = this.getServletContext();

        try {
            TransformerFactory tFactory = TransformerFactory.newInstance();

            FopFactory fopFactory = FopFactory.newInstance();

            //Setup a buffer to obtain the content length
            ByteArrayOutputStream out = new ByteArrayOutputStream();

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
            InputSource is = new InputSource(new StringReader(mq.getPayments()));
            // Parse the XML document

            Document doc = parser.parse(is);

            //Setup FOP
            Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, out);

            //Make sure the XSL transformation's result is piped through to FOP
            Result res = new SAXResult(fop.getDefaultHandler());

            //Setup input
            Source src = new DOMSource(doc);

            //Start the transformation and rendering process
            transformer.transform(src, res);

            //Prepare response
            response.setContentType("application/pdf");
            response.setContentLength(out.size());

            //Send content to Browser
            response.getOutputStream().write(out.toByteArray());
            response.getOutputStream().flush();
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
