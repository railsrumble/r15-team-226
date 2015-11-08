// This example adds a search box to a map, using the Google Place Autocomplete
// feature. People can enter geographical searches. The search box will return a
// pick list containing a mix of places and predicted search terms.
var center;
var zoom_level = 8;
var markers = [];
//var map = new google.maps.Map(document.getElementById('map'));
var lat;
var lng;
var center;
function initAutocomplete() {

$.ajax({
type: 'get',
url: '/get_current_user_location/',
dataType: 'json',
success: function(data) {
  if (data != false) {
    lat = data["lattitude"];
    lng = data["longitude"];
    address = data["address"]
    center = new google.maps.LatLng(lat, lng);
    $("#pac-input").val(address);
    //displayMarkers();

    var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 8,
                center: center
              });
    marker = new google.maps.Marker({
      //position: position,
      map: map,
      //icon: icon,
      zoom: zoom_level,
      //data_id: object.id,
    });
  } else {
  }
}
});
// var map = new google.maps.Map(document.getElementById('map'), {
//   center: center,
//   zoom: zoom_level,
//   mapTypeId: google.maps.MapTypeId.ROADMAP
// });
// map_display();
}

function displayMarkers(){
//getPets()

}
function getPets(){

$.ajax({
  type: 'get',
  url: '/get_pets',
  data: {},
  dataType: 'json',
  success: function(result) {
    if (result.lat) center = new google.maps.LatLng(result.latitude, result.longitude);
    var latlng  = [];
    var doggies = JSON.parse(result.pets);
    $.each(doggies, function(index, object) {
      if (object.area) {
        //latlng.push(new google.maps.LatLng(object.location.latitude, object.location.longitude));
       }
    });
    latlng.push(new google.maps.LatLng(result.lat, result.lng));

    var latlngbounds = new google.maps.LatLngBounds();
    for (var i = 0; i < latlng.length; i++) {
      latlngbounds.extend(latlng[i]);
    }

    //map.fitBounds(latlngbounds);
    //map.setCenter(new google.maps.LatLng(result.lat, result.lng));
    //map.setZoom(map.getZoom()-1);

    $.each(doggies, function(index, object) {

      if (object.area) {

        //var position = new google.maps.LatLng(object.location.latitude, object.location.longitude);
        marker = new google.maps.Marker({
          position: position,
          map: map,
          //icon: icon,
          data_id: object.id,
        });
        distanceBetweenCenterAndMarker = distanceBetweenTwoMarkers(position, distanceWidget.get('position'));
        marker.setVisible(true);
        markers.push(marker);

        google.maps.event.addListener(marker, 'click', function(event) {
          //user_data =  HandlebarsTemplates['search/user'](object);
          infoWindow.setContent(object);
        });
        } // End of if(object.location)
    });// End of each loop
  } // End of success function
}); // End of Ajax call
}

//Remove all markers to set new one
function deleteAllMarkers() {

for (var i = 0; i < markers.length; i++) {
markers[i].setMap(null);
}
markers = [];
}


//Distance between marker and map center
function distanceBetweenTwoMarkers(p1, p2) {
if (!p1 || !p2) {
return 0;
}

var R = 6371; // Radius of the Earth in km
var dLat = (p2.lat() - p1.lat()) * Math.PI / 180;
var dLon = (p2.lng() - p1.lng()) * Math.PI / 180;
var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
Math.cos(p1.lat() * Math.PI / 180) * Math.cos(p2.lat() * Math.PI / 180) *
Math.sin(dLon / 2) * Math.sin(dLon / 2);
var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
var d = R * c;
return d;
}//End of distanceBetweenTwoPoints function


function map_display(){

// Create the search box and link it to the UI element.
var input = document.getElementById('pac-input');
var searchBox = new google.maps.places.SearchBox(input);
map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

// Bias the SearchBox results towards current map's viewport.
map.addListener('bounds_changed', function() {
  searchBox.setBounds(map.getBounds());
});

var markers = [];
// [START region_getplaces]
// Listen for the event fired when the user selects a prediction and retrieve
// more details for that place.
searchBox.addListener('places_changed', function() {
  var places = searchBox.getPlaces();

  if (places.length == 0) {
    return;
  }

  // Clear out the old markers.
  markers.forEach(function(marker) {
    marker.setMap(null);
  });
  markers = [];

  // For each place, get the icon, name and location.
  var bounds = new google.maps.LatLngBounds();
  places.forEach(function(place) {
    var icon = {
      url: place.icon,
      size: new google.maps.Size(71, 71),
      origin: new google.maps.Point(0, 0),
      anchor: new google.maps.Point(17, 34),
      scaledSize: new google.maps.Size(25, 25)
    };

    // Create a marker for each place.
    markers.push(new google.maps.Marker({
      map: map,
      icon: icon,
      title: place.name,
      position: place.geometry.location
    }));

    if (place.geometry.viewport) {
      // Only geocodes have viewport.
      bounds.union(place.geometry.viewport);
    } else {
      bounds.extend(place.geometry.location);
    }
  });
  map.fitBounds(bounds);
});
// [END region_getplaces]
}
