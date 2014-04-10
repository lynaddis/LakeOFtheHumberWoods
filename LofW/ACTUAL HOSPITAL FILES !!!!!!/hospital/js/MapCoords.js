var geocoder;
var map;
function initialize() {
    geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(-34.397, 150.644);
    var mapOptions = {
        zoom: 8,
        center: latlng
    }
    map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
}

function getCoords()
{
    // alert("count: "+ loc.length);
    var address = document.getElementById('loc').value; 
    geocoder.geocode({ 'address': address }, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            var s_tring = (results[0].geometry.location).toString();
            var remove = s_tring.substr(1, (s_tring.length - 2));
            var lat = remove.split(",");
            Lat_array.push(lat[0]);
            Ling_array.push(lat[1]);

        } else {
            alert("Geocode was not successful for the following reason: " + status);
        }
        setMarker(lat[0].lat[1]);
    });

}