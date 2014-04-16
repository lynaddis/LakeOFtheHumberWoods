var directionsDisplay;
var directionsService = new google.maps.DirectionsService();
var map;

function initialize() {
    directionsDisplay = new google.maps.DirectionsRenderer();
    var mapOptions = {
        zoom: 7,
        center: new google.maps.LatLng(49.7671099, -94.4994107)
    };
     map = new google.maps.Map(document.getElementById('map-canvas'),
        mapOptions);
    directionsDisplay.setMap(map);
    directionsDisplay.setPanel(document.getElementById('directions-panel'));


}

function getDirections() {
    var start = document.getElementById('Start').value;
    var end = document.getElementById('End').value;
    var toll = false;
    var highway = false;

    if (document.getElementById('Toll').value == 'True')
    {
        toll = true;
    }

    if (document.getElementById('Highway').value == 'True')
    {
        highway = true;
    }

    var request = {
        origin: start,
        destination: end,
        avoidHighways: toll,
        avoidTolls: highway,
        travelMode: google.maps.TravelMode.DRIVING
    };
    directionsService.route(request, function (response, status) {
        if (status == google.maps.DirectionsStatus.OK) {
            directionsDisplay.setDirections(response);
        }
    });
}

// Reverses the directions the user currently has on screen
function revDirections() {

    var end = document.getElementById('Start').value; // stores values of start to end 
    var start = document.getElementById('End').value; // stores value of end to start
    var toll = false;
    var highway = false;

    if (document.getElementById('Toll').value == 'True')
    {
        toll = true;
    }

    if (document.getElementById('Highway').value == 'True')
    {
        highway = true;
    }

    var request = {
        origin: start,
        destination: end,
        avoidHighways: toll,
        avoidTolls: highway,
        travelMode: google.maps.TravelMode.DRIVING
    };
    directionsService.route(request, function (response, status) {
        if (status == google.maps.DirectionsStatus.OK) {
            directionsDisplay.setDirections(response);
        }
    });
}


function checkDirection()
{
    if (Page_ClientValidate("Directions")) {
        getDirections();
    }
    else {
        return false;
    }
}

function checkReverse() {
    if (Page_ClientValidate("Directions")) {
        revDirections();
    }
    else
    {
        return false;
    }
}


function resizeMap() {
    google.maps.event.trigger(map, "resize");
}

google.maps.event.addDomListener(window, 'load', initialize);
google.maps.event.addDomListener(window, 'resize', resizeMap);
