var mapDisplay;
var geocoder;
var map;
var Lat_array = new Array();
var Ling_array = new Array();

function initialize() {

    var mapOptions = {
        zoom: 13,
        center: new google.maps.LatLng(49.7671099, -94.5294107)
    };
     map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
}

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

function setMarker(Lat,Ling)
{
    var myLat = new google.maps.LatLng(parseFloat(Lat[0].toString()),parseFloat(Ling_array[0].toString()))

        var marker = new google.maps.Marker({
            position: myLat,
            map: map,
            title:"Hospital"
        });
}


function getAddresses(h_loc)
{
    
    var j_string = JSON.stringify(h_loc);
    var j_parse = JSON.parse(j_string);
    locations_array = eval('(' + j_parse + ')');

    codeAddress(locations_array);
}


function resizeMap() 
{
    google.maps.event.trigger(map, "resize");
}

google.maps.event.addDomListener(window, 'load', initialize);

google.maps.event.addDomListener(window, 'resize', resizeMap);

