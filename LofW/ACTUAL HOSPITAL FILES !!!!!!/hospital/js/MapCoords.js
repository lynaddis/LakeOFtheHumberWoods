var geocoder; // geo coder 
var map;  // map

// initializez google map 
function initialize() {
    geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(-34.397, 150.644);
    var mapOptions = {
        zoom: 8,
        center: latlng
    }
    map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

}

// gets the corrdinates of each hospital location and puts a marker at its location
function getCoords()
{
    var address = document.getElementById('loc').value; 
    geocoder.geocode({ 'address': address }, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            var s_tring = (results[0].geometry.location).toString(); // stoes google lat and log values
            var remove = s_tring.substr(1, (s_tring.length - 2)); // remove brackets from coordinates 
            var lat = remove.split(","); // splits coordinates in two, [0] = the lat, [1] = long
            Lat_array.push(lat[0]); // stores value to array
            Ling_array.push(lat[1]); // stores value to array

        } else {
            alert("Geocode was not successful for the following reason: " + status);
        }
        setMarker(lat[0].lat[1]); // sets marker at lat and long location 
    });

}

// resize map on window resize 
function resizeMap() {
    google.maps.event.trigger(map, "resize");
}

// adds listener to window on resize to resize map
google.maps.event.addDomListener(window, 'resize', resizeMap);


