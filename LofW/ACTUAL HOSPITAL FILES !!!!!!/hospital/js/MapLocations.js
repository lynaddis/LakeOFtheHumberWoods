var mapDisplay; 
var geocoder;
var map; // map 
var Lat_array = new Array(); // lat array
var Ling_array = new Array(); // long array

// initializez google map 
function initialize() {

    var mapOptions = {
        zoom: 13,
        center: new google.maps.LatLng(49.7671099, -94.5294107)
    };
     map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
}

// parses the location data sent from the asp code behind page from json into an array
function calc(h_loc)
{
    
    var j_string = JSON.stringify(h_loc);
    var j_parse = JSON.parse(j_string);
    var locations_array = eval('(' + j_parse + ')');

    for (var x = 0; x < locations_array.length; x++)
    {
        codeAddress(locations_array[x].toString());
    }
}

// gets the lat and log values of an address and uses it to set as a marker on the  map
function codeAddress(address)
{
   var geocoder = new google.maps.Geocoder();
        geocoder.geocode({ 'address': address }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                var marker = new google.maps.Marker({
                    map: map,
                    position: results[0].geometry.location
                });
               
            } else {
                alert("Geocode was not successful for the following reason: " + status);
            }
        });

}


// resize map on window resize 
function resizeMap() 
{
    google.maps.event.trigger(map, "resize");
}
// adds listener to window on load to initialize maps 
google.maps.event.addDomListener(window, 'load', initialize);

// adds listener to window on resize to resize map
google.maps.event.addDomListener(window, 'resize', resizeMap);

