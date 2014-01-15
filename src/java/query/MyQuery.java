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
                + "return <Hotel> {($hotel /ID)} {($hotel /name_fr)}  {$hotel /longitude} {$hotel /latitude} {($hotel/images)} {($hotel /standings_levels/standings_level)}</Hotel>} </Hotels>";

        BaseXClient.Query query = session.query(input);

        // loop through all results
        while (query.more()) {
            xmlResult += query.next();
        }

        // close query instance
        query.close();

        return xmlResult;
    }

    public String getLive(String lang, String pay, String serv) throws IOException {
        String xmlResult = "";

//        String input = "<Hotels>{ for $hotel in doc('data/entries_hotels.xml') /entries/entry\n"
//                + "where $hotel/languages/language = \"" + lang + "\""
//                + "and $hotel/payments/payment = \"" + pay + "\""
//                + "and $hotel/amenities/amenity = \"" + serv + "\""
//                + "return <Hotel> Nom : {string($hotel /name_fr)} /br </Hotel>} </Hotels>";
        String input = "let $hotels := doc('data/entries_hotels.xml') /entries\n"
                + "return\n"
                + "    <table class=\"table table-hover\">\n"
                + "    <thead>\n"
                + "      <tr>\n"
                + "          <th>Nom</th> \n"
                + "          <th>Téléphone</th>\n"
                + "          <th>Prix</th>\n"
                + "      </tr>\n"
                + "    </thead>\n"
                + "    <tbody>{\n"
                + "         for $hotel in $hotels/entry\n"
                + "         where $hotel/languages/language = \"" + lang + "\"\n"
                + "         and $hotel/payments/payment = \"" + pay + "\"\n"
                + "         and $hotel/amenities/amenity = \"" + serv + "\"\n"
                + "         return            \n"
                + "         <tr>       \n"
                + "           <td>{$hotel/name_fr}</td>\n"
                + "           <td>{$hotel/phone}</td>\n"
                + "           <td>{$hotel/tariffs/tariff/min}</td>\n"
                + "         </tr>\n"
                + "       }</tbody>\n"
                + "     </table>\n";

        BaseXClient.Query query = session.query(input);

        // loop through all results
        while (query.more()) {
            xmlResult += query.next();
        }

        // close query instance
        query.close();

        return xmlResult;
    }

    public String getInfos(String parameter) throws IOException {

        String xmlResult = "";

        String input = "<Hotels>{ for $hotel in doc('data/entries_hotels.xml') /entries/entry\n"
                + "where $hotel /ID = '" + parameter + "'\n"
                + "return <Hotel> {($hotel /name_fr)} {($hotel /phone)}  {$hotel /email} {$hotel /website} {$hotel /images/image} {$hotel /standings_levels/standings_level} </Hotel>} </Hotels>";

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
