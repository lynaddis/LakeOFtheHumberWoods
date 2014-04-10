var directionsDisplay;
var directionsService = new google.maps.DirectionsService();

function initialize() {
    directionsDisplay = new google.maps.DirectionsRenderer();
    var mapOptions = {
        zoom: 7,
        center: new google.maps.LatLng(49.7671099, -94.4994107)
    };
    var map = new google.maps.Map(document.getElementById('map-canvas'),
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


//function getDir(sLoc,eLoc) {
//    var start = document.getElementById('sLoc');
//    var end = document.getElementById('eLoc');
//    alert(start.value);
//    alert(end.value);
//}

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

//function insertD() {

//    var start = document.getElementById('Start').value;
//    var end = document.getElementById('End').value;

//    PageMethods.subRequest(start, end,OnGetMessageSuccess,OnGetMessageFailure);
//}

//function insertRD() {

//    var start = document.getElementById('Start').value;
//    var end = document.getElementById('End').value;

//    PageMethods.subRequest(end, start, OnGetMessageSuccess, OnGetMessageFailure);
//}



google.maps.event.addDomListener(window, 'load', initialize);



//google.maps.event.addDomListener(window, 'load', initialize);
//function loadMap()
//{
//    var script = document.createElement('script');
//    script.type = 'text/javascript';
//    script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&callback=initialize';
//    //script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&key={AIzaSyCcY4pz1xLd98V4TnPdAbgpTnB8GvhwQFY}&sensor=false&callback=initialize';
//    document.body.appendChild(script);
//}


//function codeAddress()
//{
//    var address = "21 Sylvan Street West, Kenora, ON P9N 3W7";
//    alert(address);
//    geocoder.geocode({ 'address': address }, function (results, status) {
//        if (status == google.maps.GeocoderStatus.OK) {
//          alert( (results[0].geometry.location));
//        } else {
//            alert("Geocode was not successful for the following reason: " + status);
//        }
//    });
//}


//window.onload = loadMap;


//function getDirections()
//{
//    alert("test");

//}