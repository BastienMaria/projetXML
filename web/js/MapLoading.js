var map;
function initialize() {
    var mapOptions = {
        center: new google.maps.LatLng(43.704, 7.2646),
        zoom: 1
    };
    map = new google.maps.Map(document.getElementById("map-canvas"),
            mapOptions);
}
google.maps.event.addDomListener(window, 'load', initialize);