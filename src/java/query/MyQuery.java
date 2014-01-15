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

    public String chooseTabMethod(String method) throws IOException {
        if ("tabChambres".equals(method)) {
            return getTabChambres();
        } else if ("tabTotaux".equals(method)) {
            return getTabTotaux();
        }
        return null;
    }

    public String chooseChartMethod(String method) throws IOException {
        if ("pie".equals(method)) {
            return getStars();
        } else if ("bar".equals(method)) {
            return getPayments();
        }
        return null;
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

    private String getTabChambres() throws IOException {
        String xmlResult = "";
        String input = "let $Doc := doc('data/entries_hotels.xml')\n"
                + "return\n"
                + "let $totalChambres := sum($Doc//entries/entry/living/room_count)\n"
                + "return\n"
                + "let $totalSuites := sum($Doc//entries/entry/living/suite_count)\n"
                + "return \n"
                + "let $totalStudios := sum($Doc//entries/entry/living/studio_count)\n"
                + "return\n"
                + "let $totalChBain := sum($Doc//entries/entry/living/room_bath_count)\n"
                + "return\n"
                + "let $totalChDouche := sum($Doc//entries/entry/living/room_shower_count)\n"
                + "return\n"
                + "let $totalRoomAccessible := sum($Doc//entries/entry/living/room_accessible_coun)\n"
                + "return\n"
                + "<table class=\"table table-hover\">\n"
                + "<thead>\n"
                + "<tr>\n"
                + "<th>Type de chambre</th>\n"
                + "<th>Total</th>\n"
                + "</tr>\n"
                + "</thead>\n"
                + "<tbody>\n"
                + "<tr>\n"
                + "<th scope=\"row\">Suites</th>\n"
                + "<td>{$totalSuites}</td>\n"
                + "</tr>\n"
                + "<tr>\n"
                + "<th scope=\"row\">Studios</th>\n"
                + "<td>{$totalStudios}</td>\n"
                + "</tr>\n"
                + "<tr>\n"
                + "<th scope=\"row\">Chambres avec baignoire</th>\n"
                + "<td>{$totalChBain}</td>\n"
                + "</tr>\n"
                + "<tr>\n"
                + "<th scope=\"row\">Chambres avec douche</th>\n"
                + "<td>{$totalChDouche}</td>\n"
                + "</tr>\n"
                + "<tr>\n"
                + "<th scope=\"row\">Chambres accessibles</th>\n"
                + "<td>{$totalRoomAccessible}</td>\n"
                + "</tr>\n"
                + "</tbody>\n"
                + "</table>";
        BaseXClient.Query query = session.query(input);

        // loop through all results
        while (query.more()) {
            xmlResult += query.next();
        }

        // close query instance
        query.close();

        return xmlResult;

    }

    private String getTabTotaux() throws IOException {
        String xmlResult = "";
        String input = "   ";
        BaseXClient.Query query = session.query(input);

        // loop through all results
        while (query.more()) {
            xmlResult += query.next();
        }

        // close query instance
        query.close();

        return xmlResult;
    }

    public String getStars() throws IOException {
        String xmlResult = "";
        String input = "let $Doc := doc('data/entries_hotels.xml')\n"
                + "return\n"
                + "let $total := count($Doc//entry)\n"
                + "return\n"
                + "let $un := count($Doc/entries/entry/standings_levels/standings_level[text() eq '1 étoile'])div $total * 100\n"
                + "let $deux := count($Doc/entries/entry/standings_levels/standings_level[text() eq '2 étoiles'])div $total * 100\n"
                + "let $trois := count($Doc/entries/entry/standings_levels/standings_level[text() eq '3 étoiles'])div $total * 100\n"
                + "let $quatre := count($Doc/entries/entry/standings_levels/standings_level[text() eq '4 étoiles'])div $total * 100\n"
                + "let $cinq := count($Doc/entries/entry/standings_levels/standings_level[text() eq '5 étoiles'])div $total * 100\n"
                + "return \n"
                + "<data>\n"
                + "<datum><x>1 étoile</x><y>{round($un)}</y></datum>\n"
                + "<datum><x>2 étoiles</x><y>{round($deux)}</y></datum>\n"
                + "<datum><x>3 étoiles</x><y>{round($trois)}</y></datum>\n"
                + "<datum><x>4 étoiles</x><y>{round($quatre)}</y></datum>\n"
                + "<datum><x>5 étoiles</x><y>{round($cinq)}</y></datum>\n"
                + "</data>";
        BaseXClient.Query query = session.query(input);

        // loop through all results
        while (query.more()) {
            xmlResult += query.next();
        }

        // close query instance
        query.close();

        return xmlResult;
    }

    public String getStarsBis() throws IOException {
        String xmlResult = "";
        String input = "let $Doc := doc('data/entries_hotels.xml')\n"
                + "return\n"
                + "let $total := count($Doc//entry)\n"
                + "return\n"
                + "let $un := count($Doc/entries/entry/standings_levels/standings_level[text() eq '1 étoile'])div $total * 100\n"
                + "let $deux := count($Doc/entries/entry/standings_levels/standings_level[text() eq '2 étoiles'])div $total * 100\n"
                + "let $trois := count($Doc/entries/entry/standings_levels/standings_level[text() eq '3 étoiles'])div $total * 100\n"
                + "let $quatre := count($Doc/entries/entry/standings_levels/standings_level[text() eq '4 étoiles'])div $total * 100\n"
                + "let $cinq := count($Doc/entries/entry/standings_levels/standings_level[text() eq '5 étoiles'])div $total * 100\n"
                + "return \n"
                + "<data>\n"
                + "<x>1 étoile</x>\n"
                + "<x>2 étoiles</x>\n"
                + "<x>3 étoiles</x>\n"
                + "<x>4 étoiles</x>\n"
                + "<x>5 étoiles</x>\n"
                + "<y>{round($un)}</y>\n"
                + "<y>{round($deux)}</y>\n"
                + "<y>{round($trois)}</y>\n"
                + "<y>{round($quatre)}</y>\n"
                + "<y>{round($cinq)}</y>\n"
                + "</data>";
        BaseXClient.Query query = session.query(input);

        // loop through all results
        while (query.more()) {
            xmlResult += query.next();
        }

        // close query instance
        query.close();

        return xmlResult;
    }

    public String getPayments() throws IOException {
        String xmlResult = "";
        String input = "let $Doc := doc('data/entries_hotels.xml')\n"
                + "return\n"
                + "let $total := count($Doc//entry)\n"
                + "return\n"
                + "let $visa := count($Doc/entries/entry/payments/payment[text() eq 'Visa'])div $total * 100\n"
                + "let $espece :=count($Doc/entries/entry/payments/payment[text() eq 'Espèces'])div $total * 100\n"
                + "let $virement :=count($Doc/entries/entry/payments/payment[text() eq 'Virements'])div $total * 100\n"
                + "let $Master :=count($Doc/entries/entry/payments/payment[text() eq 'Master Card'])div $total * 100\n"
                + "let $AE :=count($Doc/entries/entry/payments/payment[text() eq 'American express'])div $total * 100\n"
                + "let $ch :=count($Doc/entries/entry/payments/payment[text() eq 'Chèques'])div $total * 100\n"
                + "let $chv :=count($Doc/entries/entry/payments/payment[text() eq 'Chèques Vacances'])div $total * 100\n"
                + "let $chvo :=count($Doc/entries/entry/payments/payment[text() eq 'Chèques de voyage'])div $total * 100\n"
                + "let $CC :=count($Doc/entries/entry/payments/payment[text() eq 'Carte de crédit'])div $total * 100\n"
                + "return\n"
                + "<data>\n"
                + "<x>Visa</x>\n"
                + "<x>Espèces</x>\n"
                + "<x>Virements</x>\n"
                + "<x>Master Card</x>\n"
                + "<x>American express</x>\n"
                + "<x>Chèques</x>\n"
                + "<x>Chèques vacances</x>\n"
                + "<x>Chèques voyage</x>\n"
                + "<x>Carte de crédit</x>\n"
                + "<y>{round($visa)}</y>\n"
                + "<y>{round($espece)}</y>\n"
                + "<y>{round($virement)}</y>\n"
                + "<y>{round($Master)}</y>\n"
                + "<y>{round($AE)}</y>\n"
                + "<y>{round($ch)}</y>\n"
                + "<y>{round($chv)}</y>\n"
                + "<y>{round($chvo)}</y>\n"
                + "<y>{round($CC)}</y>\n"
                + "</data>";
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
