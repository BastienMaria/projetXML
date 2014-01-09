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

    public String getMarkers() throws IOException {
        String xmlResult = "";

        String input = "<Hotels>{ for $hotel in doc('data/entries_hotels.xml') /entries/entry where not(empty($hotel/longitude)) and  not(empty($hotel/latitude)) and  not(empty($hotel/images/image))"
                + "return <Hotel> {($hotel /name_fr)}  {$hotel /longitude} {$hotel /latitude} {($hotel/images)} {($hotel /standings_levels/standings_level)}</Hotel>} </Hotels>";

        BaseXClient.Query query = session.query(input);

        // loop through all results
        while (query.more()) {
            xmlResult += query.next();
        }


        // close query instance
        query.close();

        return xmlResult;
    }

    public String execute(String input) throws IOException {
        String xmlResult = "";

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
