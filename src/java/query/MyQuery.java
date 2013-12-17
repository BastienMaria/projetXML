package query;

import java.io.*;

/**
 * This example shows how queries can be executed in an iterative manner.
 * Iterative evaluation will be slower, as more server requests are performed.
 *
 * This example required a running database server instance. Documentation:
 * http://docs.basex.org/wiki/Clients
 *
 * @author BaseX Team 2005-12, BSD License
 */
public class MyQuery {

    private final BaseXClient session;

    public MyQuery() throws IOException {
        //initialise la connexion
        session = new BaseXClient("localhost", 1984, "admin", "admin");
    }

    public String getAllXML() throws IOException {

        String xmlResult = "";
        String input = "for $data in doc('data/entries_hotels.xml') return $data";
        BaseXClient.Query query = session.query(input);

        // loop through all results
        while (query.more()) {
            xmlResult += query.next();
        }


        // close query instance
        query.close();

        return xmlResult;

    }
}
